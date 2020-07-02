package com.ngonphikp.gplx.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class CauTraLoi {
    @SerializedName("Id")
    @Expose
    private String id;
    @SerializedName("NoiDung")
    @Expose
    private String noiDung;
    @SerializedName("KiemTra")
    @Expose
    private String kiemTra;
    @SerializedName("IdCH")
    @Expose
    private String idCH;

    public CauTraLoi(String id, String noiDung, String kiemTra, String idCH) {
        this.id = id;
        this.noiDung = noiDung;
        this.kiemTra = kiemTra;
        this.idCH = idCH;
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

    public String getKiemTra() {
        return kiemTra;
    }

    public void setKiemTra(String kiemTra) {
        this.kiemTra = kiemTra;
    }

    public String getIdCH() {
        return idCH;
    }

    public void setIdCH(String idCH) {
        this.idCH = idCH;
    }

}
