package com.ngonphikp.gplx.Activity;

import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import com.ngonphikp.gplx.Adapter.MeoThiAdapter;
import com.ngonphikp.gplx.Model.MeoThi;
import com.ngonphikp.gplx.R;

import java.util.ArrayList;

public class MTActivity extends AppCompatActivity {

    ListView lvMeoThi;
    ArrayList<MeoThi> arrayMeoThi;
    MeoThiAdapter adapter;

    android.support.v7.widget.Toolbar toolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mt);

        AnhXa();
        GetData();
        ClickItem();
        SetToolbar();
    }

    private void GetData() {
        arrayMeoThi = new ArrayList<>();

        arrayMeoThi.add(new MeoThi(R.drawable.knqt, "Khái niệm quy tắc"));
        arrayMeoThi.add(new MeoThi(R.drawable.htbb, "Hệ thống biển báo"));
        arrayMeoThi.add(new MeoThi(R.drawable.sh, "Sa hình"));
        arrayMeoThi.add(new MeoThi(R.drawable.nvvt, "Nghiệp vụ vận tải"));
        arrayMeoThi.add(new MeoThi(R.drawable.ctsc, "Cấu tạo sửa chữa"));
        arrayMeoThi.add(new MeoThi(R.drawable.ktlx, "Kỹ thuật lái xe"));

        adapter = new MeoThiAdapter(this, R.layout.dong_meo_thi, arrayMeoThi);
        lvMeoThi.setAdapter(adapter);
    }

    //Bắt sự kiện click vào dòng mẹo thi
    private void ClickItem() {
        lvMeoThi.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(MTActivity.this, CTMTActivity.class);
                intent.putExtra("hinhAnh", arrayMeoThi.get(position).getHinhAnh());
                intent.putExtra("loai", arrayMeoThi.get(position).getTieuDe());
                startActivity(intent);
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
    }

    // Set toolbar thay cho actionbar
    private void SetToolbar() {
        //Set lại title
        toolbar.setTitle("Mẹo thi lý thuyết");
        setSupportActionBar(toolbar);

        //Thêm nút navigation và Thay đổi icon
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

        //Bắt sự kiện click
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
    }

    private void AnhXa() {
        lvMeoThi = (ListView) findViewById(R.id.listViewMeoThi);
        toolbar = findViewById(R.id.toolbar);
    }
}
