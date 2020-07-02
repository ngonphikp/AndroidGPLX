package com.ngonphikp.gplx.Activity;

import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.SearchView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ListView;
import android.widget.ProgressBar;

import com.ngonphikp.gplx.Adapter.LuatAdapter;
import com.ngonphikp.gplx.Model.Luat;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class LuatActivity extends AppCompatActivity {
    android.support.v7.widget.Toolbar toolbar;
    ProgressBar progressBar;
    ListView lvLuat;
    ArrayList<Luat> data;
    LuatAdapter adapter;

    String loai;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_luat);

        AnhXa();
        GetData();
        SetToolBar();
    }

    // Liên kết menu tạo bên res
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Lấy menu --> menu_search
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.menu_search, menu);

        //Lấy search view
        MenuItem menuItem = menu.findItem(R.id.menuSearch);
        SearchView searchView = (SearchView) menuItem.getActionView();

        //Set search view
        searchView.setQueryHint("Tra cứu luật nhanh ...");
        searchView.setMaxWidth(Integer.MAX_VALUE);

        //Bắt sự kiện search view
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            // Sự kiện khi mà ấn nút tìm kiếm
            @Override
            public boolean onQueryTextSubmit(String s) {
                return false;
            }
            // Khi gõ chữ --> thay đổi text
            @Override
            public boolean onQueryTextChange(String s) {
                adapter.filter(s.trim());
                return false;
            }
        });
        return true;
    }

    private void SetToolBar() {
        //Set lại title
        toolbar.setTitle(loai);
        setSupportActionBar(toolbar);
        //Thêm nút navigation
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
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

    private void GetData() {
        // lấy dữ liệu bên TCL chuyển sang
        loai = getIntent().getStringExtra("loai");
        // kết nối dataservice --> gọi hàm lấy dữ liệu cho listview --> trả về mảng Luat theo loai
        Dataservice dataservice = APIService.getService();
        Call<List<Luat>> callback = dataservice.GetLuatbyType(loai);
        data = new ArrayList<>();
        callback.enqueue(new Callback<List<Luat>>() {
            @Override
            public void onResponse(Call<List<Luat>> call, Response<List<Luat>> response) {
                // Dữ liệu trả về --> response.body() --> ép kiểu --> (ArrayList<Luat>) --> gán cho data
                data = (ArrayList<Luat>) response.body();
                // set adapter và listview tương ứng
                adapter = new LuatAdapter(LuatActivity.this, R.layout.dong_tra_cuu_luat, data);
                lvLuat.setAdapter(adapter);
                // ẩn progress bar
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onFailure(Call<List<Luat>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });

    }

    private void AnhXa() {
        //Ánh xạ listView và toolBar
        toolbar = findViewById(R.id.toolbar);
        lvLuat = (ListView) findViewById(R.id.listViewLuat);
        progressBar = (ProgressBar) findViewById(R.id.progressBar);
    }
}
