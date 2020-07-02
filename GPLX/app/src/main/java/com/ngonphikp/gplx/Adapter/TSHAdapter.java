package com.ngonphikp.gplx.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.ngonphikp.gplx.Model.ThiSatHach;
import com.ngonphikp.gplx.R;

import java.util.ArrayList;

public class TSHAdapter extends BaseAdapter {

    private Context context;
    private int layout;
    private ArrayList<ThiSatHach> TSHList;

    public TSHAdapter(Context context, int layout, ArrayList<ThiSatHach> TSHList) {
        this.context = context;
        this.layout = layout;
        this.TSHList = TSHList;
    }

    @Override
    public int getCount() {
        return TSHList.size();
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
        TextView textViewNumber = (TextView) convertView.findViewById(R.id.textViewNumber);
        TextView textViewtitle = (TextView) convertView.findViewById(R.id.textViewTitle);

        //gán giá trị
        ThiSatHach thiSatHach = TSHList.get(position);
        textViewtitle.setText("Đề số " + (position + 1));

        int current = thiSatHach.getCurrent();
        int size = thiSatHach.getSize();

        textViewNumber.setText(current + "/" + size + " Câu");

        return convertView;
    }
}
