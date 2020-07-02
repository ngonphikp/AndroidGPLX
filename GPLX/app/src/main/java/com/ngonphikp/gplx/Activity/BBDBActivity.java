package com.ngonphikp.gplx.Activity;

import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.design.widget.TabLayout;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.SearchView;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;

import com.ngonphikp.gplx.Adapter.PageAdapter;
import com.ngonphikp.gplx.Fragment.Fragment_bbdb;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import dmax.dialog.SpotsDialog;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class BBDBActivity extends AppCompatActivity {

    android.support.v7.widget.Toolbar toolbar;
    ViewPager viewPager;
    PageAdapter pageAdapter;
    TabLayout tab;
    SpotsDialog progressDialog;
    int pos = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bbdb);

        progressDialog = new SpotsDialog(BBDBActivity.this, R.style.Custom);
        progressDialog.show();

        AnhXa();
        SetupViewPager();
        SetToolbar();
        ChangePos();
    }

    private void ChangePos() {
        viewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int i, float v, int i1) {

            }

            @Override
            public void onPageSelected(int i) {
                pos = i;
            }

            @Override
            public void onPageScrollStateChanged(int i) {

            }
        });
    }

    private void SetupViewPager() {
        pageAdapter = new PageAdapter(getSupportFragmentManager());
        // kết nối dataservice --> gọi hàm lấy dữ liệu cho tab --> mảng các loại BBDB (string)
        Dataservice dataservice = APIService.getService();
        Call<List<String>> callback = dataservice.GetTypeBBDB();
        callback.enqueue(new Callback<List<String>>() {
            @Override
            public void onResponse(Call<List<String>> call, Response<List<String>> response) {
                // Dữ liệu trả về response.body() --> Gán vào list DSTitle
                ArrayList<String> DSTitle = (ArrayList<String>) response.body();

                // Tạo các fragment tương ứng
                for (int i = 0; i < DSTitle.size(); i++)
                    // Thêm fragment vào adapter với title tương ứng
                    pageAdapter.add(Fragment_bbdb.newInstance(DSTitle.get(i)), DSTitle.get(i));

                // Cho viewPager quản lý các fragment thông qua pageAdapter
                viewPager.setAdapter(pageAdapter);

                // Liên kết tablayout với view pager
                tab.setupWithViewPager(viewPager);

                // Ẩn dialog
                progressDialog.dismiss();
            }
            @Override
            public void onFailure(Call<List<String>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });
    }

    // Set toolbar thay cho actionbar
    private void SetToolbar() {
        //Set lại title
        toolbar.setTitle("Biển báo giao thông");
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

    // Liên kết menu tạo bên res
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Ánh xạ tới menu trong R.menu
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.menu_search, menu);

        //Lấy search view
        MenuItem menuItem = menu.findItem(R.id.menuSearch);
        SearchView searchView = (SearchView) menuItem.getActionView();

        //Set search view
        searchView.setQueryHint("Tìm kiếm biển báo ...");
        searchView.setMaxWidth(Integer.MAX_VALUE);

        //Bắt sự kiện search view
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            // Khi ấn nút tìm kiếm
            @Override
            public boolean onQueryTextSubmit(String s) {
                Fragment_bbdb fragment_bbdb = (Fragment_bbdb) viewPager.getAdapter().instantiateItem(viewPager, pos);
                fragment_bbdb.filter(s.trim());
                return false;
            }
            // Khi dòng text thay đổi
            @Override
            public boolean onQueryTextChange(String s) {
                // Thay đổi dữ liệu trên viewPager dựa vào adpater gián tiếp thông qua fragment tại vị trí tương ứng
                Fragment_bbdb fragment_bbdb = (Fragment_bbdb) viewPager.getAdapter().instantiateItem(viewPager, pos);
                fragment_bbdb.filter(s.trim());
                return false;
            }
        });
        return true;
    }

    private void AnhXa() {
        toolbar = findViewById(R.id.toolbar);
        viewPager = findViewById(R.id.viewPager);
        tab = findViewById(R.id.tab);
    }

}
