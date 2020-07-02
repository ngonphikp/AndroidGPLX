package com.ngonphikp.gplx.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.TextView;

import com.ngonphikp.gplx.R;

import java.util.ArrayList;

public class QuestionAdapter extends BaseAdapter {

    private Context context;
    private int layout;
    private ArrayList<Integer> CHList;

    public QuestionAdapter(Context context, int layout, ArrayList<Integer> cHList) {
        this.context = context;
        this.layout = layout;
        this.CHList = cHList;
    }

    @Override
    public int getCount() {
        return CHList.size();
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
        TextView txtNumber = (TextView) convertView.findViewById(R.id.txtNumber);
        //gán giá trị
        txtNumber.setText(CHList.get(position) + "");
        return convertView;
    }
}
