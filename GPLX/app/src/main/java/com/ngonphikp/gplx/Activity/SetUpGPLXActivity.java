package com.ngonphikp.gplx.Activity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.ngonphikp.gplx.Adapter.SUGPLXAdapter;
import com.ngonphikp.gplx.Model.Bang;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SetUpGPLXActivity extends AppCompatActivity {

    SharedPreferences sharedPreferences;

    ListView lvSUGPLX;
    ArrayList<Bang> arraySUGPLX;
    SUGPLXAdapter adapter;

    String level;

    android.support.v7.widget.Toolbar toolbar;
    ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_set_up_gplx);

        AnhXa();
        GetData();
        SetToolbar();
    }

    //Lấy dữ liệu trong data local (sharedPrefences)
    private void GetDataLocal() {
        sharedPreferences = getSharedPreferences("LocalData", Context.MODE_PRIVATE);
        level = sharedPreferences.getString("Level", "A1");
        adapter.setSelectedPosition(level);
    }

    // Set toolbar thay cho actionbar
    private void SetToolbar() {
        //Set lại title
        toolbar.setTitle("Chọn hạng bằng thi");
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
        lvSUGPLX = (ListView) findViewById(R.id.listViewSUGPLX);
        toolbar = findViewById(R.id.toolbar);
        progressBar = findViewById(R.id.progressBar);
    }

    private void GetData() {
        Dataservice dataservice = APIService.getService();
        Call<List<Bang>> callback = dataservice.GetALLBang();
        arraySUGPLX = new ArrayList<>();
        callback.enqueue(new Callback<List<Bang>>() {
            @Override
            public void onResponse(Call<List<Bang>> call, Response<List<Bang>> response) {
                arraySUGPLX = (ArrayList<Bang>) response.body();
                adapter = new SUGPLXAdapter(SetUpGPLXActivity.this, R.layout.dong_set_up_gplx, arraySUGPLX);
                lvSUGPLX.setAdapter(adapter);
                GetDataLocal();
                progressBar.setVisibility(View.GONE);
            }
            @Override
            public void onFailure(Call<List<Bang>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });
    }

    //Adapter call function in activity - Sự kiện khi chọn radioButton
    public void CallMethod(int pos) {
        //Lưu lại vào data
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putString("Level", arraySUGPLX.get(pos).getTenBang());
        editor.commit();

        //Hiển thị toast
        Toast.makeText(this, "Chọn " + arraySUGPLX.get(pos).getTenBang(), Toast.LENGTH_SHORT).show();

        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Ôn thi giấy phép lái xe");
        builder.setMessage("Chuyển đến làm bài thi?");
        builder.setCancelable(true);
        builder.setPositiveButton("Thi sát hạch", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                Intent intent = new Intent(SetUpGPLXActivity.this, TSHActivity.class);
                startActivity(intent);
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
        builder.setNegativeButton("Ôn lý thuyết", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialogInterface, int i) {
                Intent intent = new Intent(SetUpGPLXActivity.this, HLTActivity.class);
                startActivity(intent);
                overridePendingTransition(R.anim.slide_out, R.anim.slide_in);
            }
        });
        AlertDialog alertDialog = builder.create();
        alertDialog.show();
    }
}
