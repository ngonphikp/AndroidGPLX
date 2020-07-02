package com.ngonphikp.gplx.Fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.ngonphikp.gplx.Adapter.BBDBAdapter;
import com.ngonphikp.gplx.Model.BBDB;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Fragment_bbdb extends Fragment {

    View view;
    ListView lvBienBaoDuongBo;
    ArrayList<BBDB> data;
    BBDBAdapter adapter;
    ProgressBar progressBar;

    private static final String KEY = "key";
    private String type;

    public Fragment_bbdb() {
    }

    //Hàm tạo 1 thực thể fragment mới
    public static Fragment_bbdb newInstance(String type){
        Fragment_bbdb fragment_bbdb = new Fragment_bbdb();
        Bundle bundle = new Bundle();
        bundle.putString(KEY, type);
        fragment_bbdb.setArguments(bundle);
        //tự động gọi hàm onCreate , on CreateView
        return fragment_bbdb;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        type = getArguments().getString(KEY);
    }

    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_bbdb, container, false);
        AnhXa();
        GetData();
        return view;
    }

    private void GetData(){
        // kết nối dataservice --> gọi hàm lấy dữ liệu cho fragment --> mảng các BBDB
        Dataservice dataservice = APIService.getService();
        Call<List<BBDB>> callback = dataservice.GetBBDBbyType(type);
        data = new ArrayList<>();
        callback.enqueue(new Callback<List<BBDB>>() {
            @Override
            public void onResponse(Call<List<BBDB>> call, Response<List<BBDB>> response) {
                // Dữ liệu trả về response.body() --> Gán vào list data
                data = (ArrayList<BBDB>) response.body();
                // hiển thị vào list thông qua adapter
                adapter = new BBDBAdapter(getActivity(), R.layout.dong_bien_bao, data);
                lvBienBaoDuongBo.setAdapter(adapter);
                // Ẩn progress bar
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onFailure(Call<List<BBDB>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });
    }

    private void AnhXa() {
        lvBienBaoDuongBo = (ListView) view.findViewById(R.id.listViewBienBaoDuongBo);
        progressBar = view.findViewById(R.id.progressBar);
    }

    public void filter(String s){
        adapter.filter(s);
    }
}
