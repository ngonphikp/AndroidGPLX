package com.ngonphikp.gplx.Fragment;

import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.ngonphikp.gplx.Adapter.BannerAdapter;
import com.ngonphikp.gplx.Model.QuangCao;
import com.ngonphikp.gplx.R;

import java.util.ArrayList;

import me.relex.circleindicator.CircleIndicator;

public class Fragment_banner extends Fragment {

    View view;
    ViewPager viewPager;
    CircleIndicator circleIndicator;
    BannerAdapter bannerAdapter;
    Runnable runnable;
    Handler handler;
    int currentItem;

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_banner, container, false);
        AnhXa();
        GetData();
        Transition();
        return view;
    }

    private void GetData() {
        //Tạo list dữ liệu
        ArrayList<QuangCao> banners = new ArrayList<>();
        banners.add(new QuangCao(R.drawable.main1, "Thi thử giống đề thi thật"));
        banners.add(new QuangCao(R.drawable.knqt, "Ôn tập lý thuyết chắc chắn đỗ"));
        banners.add(new QuangCao(R.drawable.meothi, "Mẹo thi để được kết quả cao"));
        banners.add(new QuangCao(R.drawable.bgbb, "Hệ thống biển báo đường bộ"));
        banners.add(new QuangCao(R.drawable.bgtcl, "Tra cứu luật giao thông mới nhất"));

        //Liên kết viewPager và circleIndicator
        bannerAdapter = new BannerAdapter(getActivity(), banners);
        viewPager.setAdapter(bannerAdapter);
        circleIndicator.setViewPager(viewPager);
    }

    private void Transition(){
        //Tạo hiệu ứng chuyển tiếp theo time
        handler = new Handler();
        runnable = new Runnable() {
            @Override
            public void run() {
                currentItem = viewPager.getCurrentItem();
                currentItem++;
                if (currentItem >= viewPager.getAdapter().getCount()){
                    currentItem = 0;
                }
                viewPager.setCurrentItem(currentItem, true);
                handler.postDelayed(runnable, 3000);
            }
        };
        handler.postDelayed(runnable, 3000);
    }

    private void AnhXa() {
        viewPager = view.findViewById(R.id.viewPager);
        circleIndicator = view.findViewById(R.id.indicatorDefault);
    }
}
