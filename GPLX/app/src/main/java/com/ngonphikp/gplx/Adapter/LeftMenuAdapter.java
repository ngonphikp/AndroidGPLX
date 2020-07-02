package com.ngonphikp.gplx.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.ngonphikp.gplx.Model.ItemLeftMenu;
import com.ngonphikp.gplx.R;

import java.util.ArrayList;
import java.util.List;

public class LeftMenuAdapter extends BaseAdapter {
    private Context context;
    private int layout;
    private ArrayList<ItemLeftMenu> LeftMenuList;

    public LeftMenuAdapter(Context context, int layout, ArrayList<ItemLeftMenu> leftMenuList) {
        this.context = context;
        this.layout = layout;
        this.LeftMenuList = leftMenuList;
    }

    @Override
    public int getCount() {
        return LeftMenuList.size();
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
        TextView txtContent =(TextView) convertView.findViewById(R.id.textViewContent);
        ImageView imgImage = (ImageView) convertView.findViewById(R.id.imageViewImage);
        //gán giá trị
        txtContent.setText(LeftMenuList.get(position).getContent());
        imgImage.setImageResource(LeftMenuList.get(position).getImage());
        return convertView;
    }
}
