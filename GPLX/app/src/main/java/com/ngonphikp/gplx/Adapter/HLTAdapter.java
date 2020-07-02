package com.ngonphikp.gplx.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.ngonphikp.gplx.Model.HLT;
import com.ngonphikp.gplx.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class HLTAdapter extends BaseAdapter {

    private Context context;
    private int layout;
    private ArrayList<HLT> HLTList;

    public HLTAdapter(Context context, int layout, ArrayList<HLT> hLTList) {
        this.context = context;
        this.layout = layout;
        this.HLTList = hLTList;
    }

    @Override
    public int getCount() {
        return HLTList.size();
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
        ImageView imgBackGround = (ImageView) convertView.findViewById(R.id.imageViewBackGround);
        TextView textViewNumber = (TextView) convertView.findViewById(R.id.textViewNumber);
        TextView textViewContent = (TextView) convertView.findViewById(R.id.textViewContent);

        //gán giá trị
        Picasso.with(context).load(HLTList.get(position).getHinhAnh()).into(imgBackGround);
        textViewContent.setText(HLTList.get(position).getLoai());

        int current = HLTList.get(position).getCurrent();
        int size = Integer.parseInt(HLTList.get(position).getSize());

        int number = (size == 0)? 0 : (int)current * 100/ size;
        textViewNumber.setText(number + "%");
        return convertView;
    }

}
