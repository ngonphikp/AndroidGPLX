package com.ngonphikp.gplx.Model;

public class MeoThi {
    private int hinhAnh;
    private String tieuDe;

    public int getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(int hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public MeoThi(int hinhAnh, String tieuDe) {
        this.hinhAnh = hinhAnh;
        this.tieuDe = tieuDe;
    }
}
