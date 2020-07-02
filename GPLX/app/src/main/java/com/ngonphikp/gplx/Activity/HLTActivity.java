package com.ngonphikp.gplx.Activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.ngonphikp.gplx.Adapter.HLTAdapter;
import com.ngonphikp.gplx.Model.HLT;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class HLTActivity extends AppCompatActivity {

    ListView lvHocLyThuyet;
    ArrayList<HLT> arrayHLT;
    HLTAdapter adapter;
    android.support.v7.widget.Toolbar toolbar;
    ProgressBar progressBar;

    SharedPreferences sharedPreferences;
    String level;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_hlt);

        AnhXa();
        GetDataLocal();
        GetData();
        ClickItem();
        SetToolbar();
    }

    private void GetDataLocal() {
        sharedPreferences = getSharedPreferences("LocalData", Context.MODE_PRIVATE);
        level = sharedPreferences.getString("Level", "A1");
    }

    //Bắt sự kiện click vào dòng học lý thuyết
    private void ClickItem() {
        lvHocLyThuyet.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(HLTActivity.this, CTHocActivity.class);
                intent.putExtra("Loai", arrayHLT.get(position).getLoai());
                startActivity(intent);
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
    }

    // Liên kết menu tạo bên res
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.menu_reset, menu);
        return true;
    }

    // Bắt sự kiện click item trong menu
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()){
            case R.id.menuReset:
                Toast.makeText(this, "Reset", Toast.LENGTH_SHORT).show();
                break;
        }
        return true;
    }

    // Set toolbar thay cho actionbar
    private void SetToolbar() {
        //Set lại title
        toolbar.setTitle("Học lý thuyết " + level);
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

    private void AnhXa() {
        lvHocLyThuyet = (ListView) findViewById(R.id.listViewHocLyThuyet);
        toolbar = findViewById(R.id.toolbar);
        progressBar = (ProgressBar) findViewById(R.id.progressBar);
    }

    private void GetData() {
        Dataservice dataservice = APIService.getService();
        Call<List<HLT>> callback = dataservice.GetHLTByGPLX(level);
        arrayHLT = new ArrayList<>();
        callback.enqueue(new ListCallback());
    }

    private class ListCallback implements Callback<List<HLT>> {
        @Override
        public void onResponse(Call<List<HLT>> call, Response<List<HLT>> response) {
            arrayHLT = (ArrayList<HLT>) response.body();
            for (int i = 0; i < arrayHLT.size(); i++){
                arrayHLT.get(i).setCurrent(5);
            }
            adapter = new HLTAdapter(HLTActivity.this, R.layout.dong_hoc_ly_thuyet, arrayHLT);
            lvHocLyThuyet.setAdapter(adapter);
            progressBar.setVisibility(View.GONE);
        }

        @Override
        public void onFailure(Call<List<HLT>> call, Throwable t) {
            Log.d("Tag", t.getMessage());
            t.printStackTrace();
        }
    }
}
