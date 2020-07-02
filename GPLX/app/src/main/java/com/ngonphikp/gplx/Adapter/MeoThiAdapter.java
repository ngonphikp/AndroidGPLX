package com.ngonphikp.gplx.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.ngonphikp.gplx.Model.MeoThi;
import com.ngonphikp.gplx.R;

import java.util.ArrayList;
import java.util.List;

public class MeoThiAdapter extends BaseAdapter {
    private Context context;
    private int layout;
    private ArrayList<MeoThi> MeoThiList;

    public MeoThiAdapter(Context context, int layout, ArrayList<MeoThi> MeoThiList) {
        this.context = context;
        this.layout = layout;
        this.MeoThiList = MeoThiList;
    }

    @Override
    public int getCount() {
        return MeoThiList.size();
    }

    @Override
    public Object getItem(int position) {
        return null;
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        //tạo dòng trả về view
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        convertView = inflater.inflate(layout, null);
        //ánh xạ view
        ImageView img = (ImageView)convertView.findViewById(R.id.imageViewBackGround);
        TextView txt = (TextView)convertView.findViewById(R.id.textViewContent);

        //gán giá trị
        img.setImageResource(MeoThiList.get(position).getHinhAnh());
        txt.setText(MeoThiList.get(position).getTieuDe());

        return convertView;
    }
}
