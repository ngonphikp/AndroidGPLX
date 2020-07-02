package com.ngonphikp.gplx.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class HLT {

    @SerializedName("HinhAnh")
    @Expose
    private String hinhAnh;
    @SerializedName("Loai")
    @Expose
    private String loai;
    @SerializedName("Size")
    @Expose
    private String size;

    private int current = 0;

    public String getHinhAnh() {
    return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
    this.hinhAnh = hinhAnh;
    }

    public String getLoai() {
    return loai;
    }

    public void setLoai(String loai) {
    this.loai = loai;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public HLT(String loai, String hinhAnh, String size) {
        this.hinhAnh = hinhAnh;
        this.loai = loai;
        this.size = size;
        this.current = 0;
    }
}