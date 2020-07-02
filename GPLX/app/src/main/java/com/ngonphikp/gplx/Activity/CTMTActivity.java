package com.ngonphikp.gplx.Activity;

import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;

import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CTMTActivity extends AppCompatActivity {

    Toolbar toolbar;
    ListView listViewKNQT;
    ArrayList<String> arrayCourse;
    ImageView imgMeoThi;
    ProgressBar progressBar;

    String loai = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ctmt);

        AnhXa();
        getData();
        setToolbar();
    }

    private void getData() {
        Intent intent = getIntent();
        loai = intent.getStringExtra("loai");
        int hinhAnh = intent.getIntExtra("hinhAnh", 0);
        imgMeoThi.setImageResource(hinhAnh);

        Dataservice dataservice = APIService.getService();
        Call<List<String>> callback = dataservice.GetCTMTbyType(loai);
        callback.enqueue(new Callback<List<String>>() {
            @Override
            public void onResponse(Call<List<String>> call, Response<List<String>> response) {
                // Lưu trữ các string có stt
                arrayCourse = new ArrayList<>();
                ArrayList<String> data = (ArrayList<String>) response.body();
                for (int i = 0; i < data.size(); i++){
                    arrayCourse.add((i + 1) + ".   " + data.get(i));
                }
                ArrayAdapter adapter = new ArrayAdapter(CTMTActivity.this,android.R.layout.simple_list_item_1, arrayCourse);
                listViewKNQT.setAdapter(adapter);
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onFailure(Call<List<String>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });
    }

    private void setToolbar() {
        //Set lại title
        toolbar.setTitle(loai);
        setSupportActionBar(toolbar);
        //Thêm nút Navigation và Thay đổi icon
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
        toolbar=findViewById(R.id.toolbar);
        imgMeoThi = (ImageView) findViewById(R.id.imageViewMeoThi);
        listViewKNQT = (ListView) findViewById(R.id.listViewKNQT);
        progressBar = findViewById(R.id.progressBar);
    }
}
