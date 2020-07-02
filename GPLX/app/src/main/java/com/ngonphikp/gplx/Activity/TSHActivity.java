package com.ngonphikp.gplx.Activity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.constraint.ConstraintLayout;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.ProgressBar;
import android.support.v7.app.AlertDialog;
import android.widget.Toast;

import com.ngonphikp.gplx.Adapter.TSHAdapter;
import com.ngonphikp.gplx.Model.ThiSatHach;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class TSHActivity extends AppCompatActivity {

    android.support.v7.widget.Toolbar toolbar;
    GridView gvDanhSachThi;
    ArrayList<ThiSatHach> arrayThiSatHach;
    TSHAdapter adapter;
    ConstraintLayout itemThiNgauNhien;
    ProgressBar progressBar;

    SharedPreferences sharedPreferences;
    String level;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tsh);

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

    // Bắt sự kiện Click Item Thi
    private void ClickItem() {
        gvDanhSachThi.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                int time = arrayThiSatHach.get(position).getTime();
                int condition = arrayThiSatHach.get(position).getCondition();
                Thi(position, time, condition);
            }
        });
        itemThiNgauNhien.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int time = arrayThiSatHach.get(0).getTime();
                int condition = arrayThiSatHach.get(0).getCondition();
                Thi(-1, time, condition);
            }
        });
    }

    private void Thi(final int postion, final int time, final int condition){
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Ôn thi giấy phép lái xe");
        builder.setMessage("Bạn đã sẵn sàng thi?");
        builder.setCancelable(true);
        builder.setPositiveButton("Sẵn sàng", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                Intent intent = new Intent(TSHActivity.this, CTThiAcivity.class);
                intent.putExtra("stt", postion);
                intent.putExtra("time", time);
                intent.putExtra("condition", condition);
                startActivity(intent);
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
        builder.setNegativeButton("Thoát", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        });
        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }

    private void GetData() {
        Dataservice dataservice = APIService.getService();
        Call<List<ThiSatHach>> callback = dataservice.GetTSHbyGPLX(level);
        arrayThiSatHach = new ArrayList<>();
        callback.enqueue(new Callback<List<ThiSatHach>>() {
            @Override
            public void onResponse(Call<List<ThiSatHach>> call, Response<List<ThiSatHach>> response) {
                arrayThiSatHach = (ArrayList<ThiSatHach>) response.body();
                adapter = new TSHAdapter(TSHActivity.this, R.layout.item_thi, arrayThiSatHach);
                gvDanhSachThi.setAdapter(adapter);
                progressBar.setVisibility(View.GONE);
                itemThiNgauNhien.setVisibility(View.VISIBLE);
            }

            @Override
            public void onFailure(Call<List<ThiSatHach>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });
    }

    // Set toolbar thay cho actionbar
    private void SetToolbar() {
        //Set lại title
        toolbar.setTitle("Thi sát hạch " + level);
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

    private void AnhXa(){
        toolbar = findViewById(R.id.toolbar);
        gvDanhSachThi = findViewById(R.id.GridViewDanhSachThi);
        itemThiNgauNhien = (ConstraintLayout) findViewById(R.id.itemThiNgauNhien);
        progressBar = findViewById(R.id.progressBar);
    }
}
