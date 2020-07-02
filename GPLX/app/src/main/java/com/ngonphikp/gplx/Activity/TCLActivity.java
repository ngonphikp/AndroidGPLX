package com.ngonphikp.gplx.Activity;

import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.constraint.ConstraintLayout;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.ngonphikp.gplx.R;

public class TCLActivity extends AppCompatActivity {
    ImageView imgLXM, imgLOT, imgLXK, imgLXT;
    android.support.v7.widget.Toolbar toolbar;
    ViewFlipper viewFlipper;
    CardView qtxp;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tcl);

        AnhXa();
        ClickItem();
        SetUPQC();
        SetUpToolbar();
    }

    private void ClickItem() {
        imgLXK.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ToLuatAcitivity("Xe Khách");
            }
        });
        imgLXT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ToLuatAcitivity("Xe Tải");
            }
        });
        imgLOT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ToLuatAcitivity("Ô Tô");
            }
        });
        imgLXM.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ToLuatAcitivity("Xe Máy");
            }
        });
        qtxp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Toast.makeText(TCLActivity.this, "QTXP", Toast.LENGTH_SHORT).show();
            }
        });
    }
    private void ToLuatAcitivity(String str){
        Intent intent = new Intent(TCLActivity.this, LuatActivity.class);
        intent.putExtra("loai", str);
        startActivity(intent);
        overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
    }
    private void AnhXa() {
        imgLXM = findViewById(R.id.imageViewLXM);
        imgLOT = findViewById(R.id.imageViewLOT);
        imgLXT = findViewById(R.id.imageViewLXT);
        imgLXK = findViewById(R.id.imageViewLXK);
        toolbar = findViewById(R.id.toolbar);
        viewFlipper =(ViewFlipper)findViewById(R.id.viewFlipper);
        qtxp = findViewById(R.id.quyTrinhXuPhat);
    }

    private void SetUpToolbar() {
        //Set lại title
        toolbar.setTitle("Luật giao thông");
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
                // Tắt màn hình hiện thời --> mở lên màn hình trước nó
                finish();
                // Gọi hiệu ứng animation khi chuyển màn -- > sang bên trái
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
    }

    private void SetUPQC() {
        // set thời gian chuyển sang image khác --> 3000ms
        viewFlipper.setFlipInterval(3000);
        // tự động chuyển --> true
        viewFlipper.setAutoStart(true);
    }
}
