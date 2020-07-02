package com.ngonphikp.gplx.Adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.ngonphikp.gplx.Model.CauTraLoi;
import com.ngonphikp.gplx.R;

import java.util.ArrayList;

public class AnswerAdapter extends BaseAdapter {

    private Context context;
    private int layout;
    private ArrayList<CauTraLoi> AnswerList;
    private ArrayList<Integer> SelectList;

    public AnswerAdapter(Context context, int layout, ArrayList<CauTraLoi> answerList) {
        this.context = context;
        this.layout = layout;
        AnswerList = answerList;
        SelectList = null;
    }

    public AnswerAdapter(Context context, int layout, ArrayList<CauTraLoi> answerList, ArrayList<Integer> selectList) {
        this.context = context;
        this.layout = layout;
        AnswerList = answerList;
        SelectList = selectList;
    }

    @Override
    public int getCount() {
        return AnswerList.size();
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
        TextView txtCount = (TextView) convertView.findViewById(R.id.textViewCount);
        TextView txtContent = (TextView) convertView.findViewById(R.id.textViewContent);

        //gán giá trị
        txtCount.setText((position + 1) + "");
        txtContent.setText(AnswerList.get(position).getNoiDung());

        if (SelectList != null && SelectList.get(position) != null && SelectList.get(position) == 1){
            check(convertView);
            //checkTrue(convertView);
        }
        //else if (SelectList != null && SelectList.get(position) != null && SelectList.get(position) == 2)checkFalse(convertView);
        return convertView;
    }

    public void checkTrue(View view){
        ImageView imageViewCheck = (ImageView) view.findViewById(R.id.imageViewCheck);
        imageViewCheck.setImageResource(R.drawable.checked);
    }

    public void checkFalse(View view){
        ImageView imageViewBG = (ImageView) view.findViewById(R.id.imageViewBG);
        imageViewBG.setImageResource(R.drawable.ciclefalse);
        ImageView imageViewCheck = (ImageView) view.findViewById(R.id.imageViewCheck);
        imageViewCheck.setImageResource(R.drawable.cancel);
    }

    public void toggleCheck(View view, boolean check){
        if(check)unCheck(view);
        else check(view);
    }

    public void check(View view){
        ImageView imageViewBG = (ImageView) view.findViewById(R.id.imageViewBG);
        imageViewBG.setImageResource(R.drawable.cicletrue);
        ImageView imageViewCheck = (ImageView) view.findViewById(R.id.imageViewCheck);
        imageViewCheck.setVisibility(View.VISIBLE);
    }

    public void unCheck(View view){
        ImageView imageViewBG = (ImageView) view.findViewById(R.id.imageViewBG);
        imageViewBG.setImageResource(R.drawable.circle);
        ImageView imageViewCheck = (ImageView) view.findViewById(R.id.imageViewCheck);
        imageViewCheck.setVisibility(View.INVISIBLE);
    }
}
