package com.ngonphikp.gplx.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.ngonphikp.gplx.Model.BBDB;
import com.ngonphikp.gplx.Model.Luat;
import com.ngonphikp.gplx.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class BBDBAdapter extends BaseAdapter {

    private Context context;
    private int layout;

    //List data nhận về
    private List<BBDB> BBDBList;

    // List mới khi lọc
    private ArrayList<BBDB> arrayList;

    public BBDBAdapter(Context context, int layout, List<BBDB> BBDBList) {
        this.context = context;
        this.layout = layout;
        this.BBDBList = BBDBList;
        this.arrayList = new ArrayList<>();
        this.arrayList.addAll(BBDBList);
    }

    @Override
    public int getCount() {
        return BBDBList.size();
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
    public View getView(int position, View convertView, ViewGroup viewGroup) {
        //tạo dòng trả về view
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        convertView = inflater.inflate(layout, null);
        //ánh xạ view
        TextView txtTen = (TextView) convertView.findViewById(R.id.textviewTen);
        TextView txtMoTa = (TextView) convertView.findViewById(R.id.textviewMoTa);
        ImageView imgHinh = (ImageView) convertView.findViewById(R.id.imageviewHinh);

        //gán giá trị
        txtTen.setText(BBDBList.get(position).getTieuDe());
        txtMoTa.setText(BBDBList.get(position).getNoiDung());
        Picasso.with(context).load(BBDBList.get(position).getHinhAnh()).into(imgHinh);
        return convertView;
    }

    public void filter(String charText){
        // chuyển về dạng viết thường để so sánh
        charText = charText.toLowerCase(Locale.getDefault());
        // Xóa list hiện thời
        BBDBList.clear();
        // Nếu length = 0
        if (charText.length() == 0){
            // Thêm tất cả list data vào list hiện thời
            BBDBList.addAll(arrayList);
        }
        else{
            for (BBDB bbdb : arrayList) {
                // Những BBDB thỏa mãn điều kiện lọc sẽ được thêm lần lượt vào list hiện thời
                if (bbdb.getTieuDe().toLowerCase(Locale.getDefault()).contains(charText)) {
                    BBDBList.add(bbdb);
                }
                else if (bbdb.getNoiDung().toLowerCase(Locale.getDefault()).contains(charText)) {
                    BBDBList.add(bbdb);
                }
            }
        }
        // Thông báo cho adapter đã thay đổi
        notifyDataSetChanged();
    }
}
