package com.ngonphikp.gplx.Model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Bang {

    @SerializedName("TenBang")
    @Expose
    private String tenBang;
    @SerializedName("NoiDung")
    @Expose
    private String noiDung;

    public Bang(String tenBang, String noiDung) {
        this.tenBang = tenBang;
        this.noiDung = noiDung;
    }

    public String getTenBang() {
    return tenBang;
    }

    public void setTenBang(String tenBang) {
    this.tenBang = tenBang;
    }

    public String getNoiDung() {
    return noiDung;
    }

    public void setNoiDung(String noiDung) {
    this.noiDung = noiDung;
    }

}