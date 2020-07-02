package com.ngonphikp.gplx.Activity;

import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.app.FragmentManager;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Toast;

import com.ngonphikp.gplx.Adapter.PageAdapter;
import com.ngonphikp.gplx.Fragment.Fragment_ccs;
import com.ngonphikp.gplx.R;

import java.util.ArrayList;

public class CCSActivity extends AppCompatActivity {

    android.support.v7.widget.Toolbar toolbar;
    private ViewPager pager;
    private ArrayList<Integer> arrIdCH;
    private int current;
    private int size;
    MenuItem menuItem;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ccs);

        AnhXa();
        GetDataLocal();
        SetUpPage();
        SetToolbar();
    }

    private void SetUpPage() {
        FragmentManager manager = getSupportFragmentManager();
        PageAdapter adapter = new PageAdapter(manager);
        for (int i = 0; i < arrIdCH.size() ; i++){
            adapter.add(Fragment_ccs.newInstance(arrIdCH.get(i)));
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
        arrIdCH = new ArrayList<>();
        arrIdCH.add(1);
        arrIdCH.add(3);
        arrIdCH.add(2);
        arrIdCH.add(6);
        arrIdCH.add(40);
        arrIdCH.add(47);
        arrIdCH.add(11);
        arrIdCH.add(9);

        current = 1;
        size = arrIdCH.size();
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
                Toast.makeText(this, item.getTitle(), Toast.LENGTH_SHORT).show();
                break;
        }
        return true;
    }

    // Set toolbar thay cho actionbar
    private void SetToolbar() {
        //Set lại title
        toolbar.setTitle("Các câu hay sai");
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
