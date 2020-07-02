package com.ngonphikp.gplx.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Luat {

    @SerializedName("Id")
    @Expose
    private String id;
    @SerializedName("TieuDe")
    @Expose
    private String tieuDe;
    @SerializedName("HinhAnh")
    @Expose
    private String hinhAnh;
    @SerializedName("NoiDung")
    @Expose
    private String noiDung;
    @SerializedName("Loai")
    @Expose
    private String loai;
    @SerializedName("TienPhat")
    @Expose
    private String tienPhat;

    public String getId() {
    return id;
    }

    public void setId(String id) {
    this.id = id;
    }

    public String getTieuDe() {
    return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
    this.tieuDe = tieuDe;
    }

    public String getHinhAnh() {
    return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
    this.hinhAnh = hinhAnh;
    }

    public String getNoiDung() {
    return noiDung;
    }

    public void setNoiDung(String noiDung) {
    this.noiDung = noiDung;
    }

    public String getLoai() {
    return loai;
    }

    public void setLoai(String loai) {
    this.loai = loai;
    }

    public String getTienPhat() {
    return tienPhat;
    }

    public void setTienPhat(String tienPhat) {
    this.tienPhat = tienPhat;
    }

}