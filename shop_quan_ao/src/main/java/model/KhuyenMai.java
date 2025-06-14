package model;

public class KhuyenMai {
private String maKhuyenMai, noiDungKhuyenMai;
private float phanTramKhuyenMai;
private int maSanpham;
public KhuyenMai(String maKhuyenMai, String noiDungKhuyenMai, float phanTramKhuyenMai,int maSanpham) {
	super();
	this.maKhuyenMai = maKhuyenMai;
	this.noiDungKhuyenMai = noiDungKhuyenMai;
	this.phanTramKhuyenMai = phanTramKhuyenMai;
	this.maSanpham = maSanpham;
}

public int getMaSanpham() {
	return maSanpham;
}

public void setMaSanpham(int maSanpham) {
	this.maSanpham = maSanpham;
}

public KhuyenMai() {
	super();
}
public String getMaKhuyenMai() {
	return maKhuyenMai;
}
public void setMaKhuyenMai(String maKhuyenMai) {
	this.maKhuyenMai = maKhuyenMai;
}
public String getNoiDungKhuyenMai() {
	return noiDungKhuyenMai;
}
public void setNoiDungKhuyenMai(String noiDungKhuyenMai) {
	this.noiDungKhuyenMai = noiDungKhuyenMai;
}
public float getPhanTramKhuyenMai() {
	return phanTramKhuyenMai;
}
public void setPhanTramKhuyenMai(float phanTramKhuyenMai) {
	this.phanTramKhuyenMai = phanTramKhuyenMai;
}

}
