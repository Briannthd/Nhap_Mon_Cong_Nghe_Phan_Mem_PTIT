package model;

public class Danhgia {
private int maDanhGia, maNguoiDung, maSanPham, soSao;
private String tenNguoiDung, noiDung, ngayDang, noiDungPhanHoi;
public Danhgia() {
	super();
}
public Danhgia(int maDanhGia, int maNguoiDung, int maSanPham, int soSao, String tenNguoiDung, String noiDung,
		String ngayDang, String noiDungPhanHoi) {
	super();
	this.maDanhGia = maDanhGia;
	this.maNguoiDung = maNguoiDung;
	this.maSanPham = maSanPham;
	this.soSao = soSao;
	this.tenNguoiDung = tenNguoiDung;
	this.noiDung = noiDung;
	this.ngayDang = ngayDang;
	this.noiDungPhanHoi = noiDungPhanHoi;
}
public int getMaDanhGia() {
	return maDanhGia;
}

public String getNoiDungPhanHoi() {
	return noiDungPhanHoi;
}
public void setNoiDungPhanHoi(String noiDungPhanHoi) {
	this.noiDungPhanHoi = noiDungPhanHoi;
}
public void setMaDanhGia(int maDanhGia) {
	this.maDanhGia = maDanhGia;
}
public int getMaNguoiDung() {
	return maNguoiDung;
}
public void setMaNguoiDung(int maNguoiDung) {
	this.maNguoiDung = maNguoiDung;
}
public int getMaSanPham() {
	return maSanPham;
}
public void setMaSanPham(int maSanPham) {
	this.maSanPham = maSanPham;
}
public int getSoSao() {
	return soSao;
}
public void setSoSao(int soSao) {
	this.soSao = soSao;
}
public String getTenNguoiDung() {
	return tenNguoiDung;
}
public void setTenNguoiDung(String tenNguoiDung) {
	this.tenNguoiDung = tenNguoiDung;
}
public String getNoiDung() {
	return noiDung;
}
public void setNoiDung(String noiDung) {
	this.noiDung = noiDung;
}
public String getNgayDang() {
	return ngayDang;
}
public void setNgayDang(String ngayDang) {
	this.ngayDang = ngayDang;
}

}
