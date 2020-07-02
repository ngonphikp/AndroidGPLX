package com.ngonphikp.gplx.Fragment;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.ngonphikp.gplx.Activity.CTHocActivity;
import com.ngonphikp.gplx.Adapter.AnswerAdapter;
import com.ngonphikp.gplx.Model.CauHoi;
import com.ngonphikp.gplx.Model.CauTraLoi;
import com.ngonphikp.gplx.R;
import com.ngonphikp.gplx.Service.APIService;
import com.ngonphikp.gplx.Service.Dataservice;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class Fragment_hoc extends Fragment {

    View view;
    TextView txtQuestion;
    ImageView imgQuestion;
    ListView lvAnswer;
    AnswerAdapter adapter;
    CauHoi cauHoi;
    ArrayList<CauTraLoi> arrCTL;
    ArrayList<Boolean> check;
    ProgressBar progressBar;

    private static final String KEY = "key";
    private int id;

    public Fragment_hoc() {
    }

    public static Fragment_hoc newInstance(int id){
        Fragment_hoc Fragment_hoc = new Fragment_hoc();
        Bundle bundle = new Bundle();
        bundle.putInt(KEY, id);
        Fragment_hoc.setArguments(bundle);
        return Fragment_hoc;
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        id = getArguments().getInt(KEY);
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_thi, container, false);

        AnhXa();
        GetData();
        return view;
    }

    private void GetData() {
        // Lấy câu hỏi với id
        Dataservice dataservice = APIService.getService();
        Call<CauHoi> callback = dataservice.GetCauHoiById(id);
        cauHoi = new CauHoi();
        callback.enqueue(new Callback<CauHoi>() {
            @Override
            public void onResponse(Call<CauHoi> call, Response<CauHoi> response) {
                cauHoi = (CauHoi) response.body();
                txtQuestion.setText("ID " + cauHoi.getId() + ": " + cauHoi.getNoiDung());
                if(cauHoi.getHinhAnh() != null){
                    Picasso.with(getContext()).load(cauHoi.getHinhAnh().toString()).into(imgQuestion);
                }
                else {
                    imgQuestion.setVisibility(View.INVISIBLE);
                }
            }

            @Override
            public void onFailure(Call<CauHoi> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });

        arrCTL = new ArrayList<>();
        Call<List<CauTraLoi>> call = dataservice.GetCTLByIdCH(id);
        call.enqueue(new Callback<List<CauTraLoi>>() {
            @Override
            public void onResponse(Call<List<CauTraLoi>> call, Response<List<CauTraLoi>> response) {
                arrCTL = (ArrayList<CauTraLoi>) response.body();

                adapter = new AnswerAdapter(getContext(), R.layout.dong_answer, arrCTL);

//                ArrayList<Integer> SelectList = new ArrayList<>();
//                SelectList.add(1);
//                SelectList.add(0);
//                SelectList.add(2);
//                SelectList.add(0);
//
//                adapter = new AnswerAdapter(getContext(), R.layout.dong_answer, arrCTL, SelectList);
                lvAnswer.setAdapter(adapter);
                check = new ArrayList<>();
                for (int i = 0; i < arrCTL.size(); i++)check.add(false);
//                for (int i = 0; i < arrCTL.size(); i++)
//                    if(SelectList.get(i) != 0)check.set(i, true);

                lvAnswer.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        adapter.toggleCheck(view, check.get(position));

                        if (!check.get(position)){
                            if(arrCTL.get(position).getKiemTra().equals("true"))adapter.checkTrue(view);
                            else adapter.checkFalse(view);
                        }
                        check.set(position, !check.get(position));
                    }
                });
                progressBar.setVisibility(View.GONE);
            }

            @Override
            public void onFailure(Call<List<CauTraLoi>> call, Throwable t) {
                Log.d("Tag", t.getMessage());
                t.printStackTrace();
            }
        });
    }

    private void AnhXa() {
        txtQuestion = (TextView) view.findViewById(R.id.textViewQuestion);
        imgQuestion = (ImageView) view.findViewById(R.id.imageViewQuestion);
        lvAnswer = (ListView) view.findViewById(R.id.listViewAnswer);
        progressBar = view.findViewById(R.id.progressBar);
    }
}
