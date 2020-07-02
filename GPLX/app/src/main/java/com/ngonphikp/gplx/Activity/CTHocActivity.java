package com.ngonphikp.gplx.Activity;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.app.FragmentManager;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.TextView;
import android.widget.Toast;

import com.ngonphikp.gplx.Adapter.PageAdapter;
import com.ngonphikp.gplx.Adapter.QuestionAdapter;
import com.ngonphikp.gplx.Fragment.Fragment_hoc;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CTHocActivity extends AppCompatActivity {

    android.support.v7.widget.Toolbar toolbar;
    private ViewPager pager;
    private ArrayList<Integer> arrIdCH;
    private int current;
    private int size;
    MenuItem menuItem;

    SharedPreferences sharedPreferences;
    String level;
    String loai;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cthoc);
        AnhXa();
        GetDataLocal();
        GetData();
        SetToolbar();
    }

    private void SetUpPage() {
        FragmentManager manager = getSupportFragmentManager();
        PageAdapter adapter = new PageAdapter(manager);
        for (int i = 0; i < arrIdCH.size() ; i++){
            adapter.add(Fragment_hoc.newInstance(arrIdCH.get(i)));
        }
        pager.setAdapter(adapter);
        pager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int i, float v, int i1) {

            }

            @Override
            public void onPageSelected(int i) {
                current = i + 1;
                changeItem(current, size);
            }

            @Override
            public void onPageScrollStateChanged(int i) {

            }
        });
    }

    private void GetDataLocal() {
        sharedPreferences = getSharedPreferences("LocalData", Context.MODE_PRIVATE);
        level = sharedPreferences.getString("Level", "A1");

        Intent intent = getIntent();
        loai = intent.getStringExtra("Loai");
    }

    private void GetData() {
        Dataservice dataservice = APIService.getService();
        Call<List<Integer>> callback = dataservice.GetIdCHOnThi(level, loai);
        arrIdCH = new ArrayList<>();
        callback.enqueue(new Callback<List<Integer>>() {
            @Override
            public void onResponse(Call<List<Integer>> call, Response<List<Integer>> response) {
                arrIdCH = (ArrayList<Integer>) response.body();
                current = 1;
                size = arrIdCH.size();
                SetUpPage();
                changeItem(current, size);
            }

            @Override
            public void onFailure(Call<List<Integer>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });
    }

    private void AnhXa() {
        toolbar = findViewById(R.id.toolbar);
        pager = (ViewPager) findViewById(R.id.view_pager);
    }

    // Liên kết menu tạo bên res
    @Override
    public boolean onCreateOptionsMenu(final Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.menu_question, menu);
        menuItem = menu.findItem(R.id.menuQuestion);
        changeItem(current, size);
        return true;
    }

    // Thay đổi title item menu question
    private void changeItem(int cur, int size){
        menuItem.setTitle("Câu " + cur + " / " + size);
    }

    // Bắt sự kiện click item trong menu
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menuQuestion:
                ShowDialogQuestion();
                break;
        }
        return true;
    }

    private void ShowDialogQuestion() {
        ArrayList<Integer> arrInt = new ArrayList<>();
        for(int i = 1; i <= size ; i++)arrInt.add(i);
        final Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog.setContentView(R.layout.dialog_question);
        TextView txtTitle = (TextView) dialog.findViewById(R.id.textViewTitle);
        txtTitle.setText("Danh sách câu hỏi: ");
        GridView gvDSCH = (GridView) dialog.findViewById(R.id.GridViewDSCH);
        QuestionAdapter qAdpater = new QuestionAdapter(this, R.layout.item_question, arrInt);
        gvDSCH.setAdapter(qAdpater);
        gvDSCH.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                pager.setCurrentItem(position);
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    // Set toolbar thay cho actionbar
    private void SetToolbar() {
        toolbar.setTitle(loai);
        setSupportActionBar(toolbar);
        //Thêm nút navigation và thay đổi icon
        //Lấy chiều cao của ActionBar
        TypedArray styledAttributes =
                getTheme().obtainStyledAttributes(new int[] { android.R.attr.actionBarSize });
        int actionBarSize = (int) styledAttributes.getDimension(0, 0);
        styledAttributes.recycle();
        //Tạo Drawable mới bằng cách thu/phóng
        Drawable drawable= ContextCompat.getDrawable(this, R.drawable.back);
        Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
        Drawable newdrawable = new BitmapDrawable(getResources(),
                Bitmap.createScaledBitmap(bitmap, actionBarSize,  actionBarSize, true));
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setHomeAsUpIndicator(newdrawable);

        //Bắt sự kiện click nút home
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
    }
}
