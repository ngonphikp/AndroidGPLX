package com.ngonphikp.gplx.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class CauHoi {

    @SerializedName("Id")
    @Expose
    private String id;
    @SerializedName("NoiDung")
    @Expose
    private String noiDung;
    @SerializedName("HinhAnh")
    @Expose
    private Object hinhAnh;

    public CauHoi(String id, String noiDung, Object hinhAnh) {
        this.id = id;
        this.noiDung = noiDung;
        this.hinhAnh = hinhAnh;
    }

    public CauHoi() {
    }

    public String getId() {
    return id;
    }

    public void setId(String id) {
    this.id = id;
    }

    public String getNoiDung() {
    return noiDung;
    }

    public void setNoiDung(String noiDung) {
    this.noiDung = noiDung;
    }

    public Object getHinhAnh() {
    return hinhAnh;
    }

    public void setHinhAnh(Object hinhAnh) {
    this.hinhAnh = hinhAnh;
    }

}