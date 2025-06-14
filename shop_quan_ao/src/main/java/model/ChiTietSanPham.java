package model;

public class ChiTietSanPham {
private int idChiTietSanPham, MaSanPham, soLuong;
private String mauSac, kichCo;
private String daXoa;
public ChiTietSanPham(int idChiTietSanPham, int maSanPham, int soLuong, String mauSac, String kichCo,String daXoa) {
	super();
	this.idChiTietSanPham = idChiTietSanPham;
	MaSanPham = maSanPham;
	this.soLuong = soLuong;
	this.mauSac = mauSac;
	this.kichCo = kichCo;
	this.daXoa = daXoa;
}

public String getDaXoa() {
	return daXoa;
}

public void setDaXoa(String daXoa) {
	this.daXoa = daXoa;
}

public ChiTietSanPham() {
	super();
}
public int getIdChiTietSanPham() {
	return idChiTietSanPham;
}
public void setIdChiTietSanPham(int idChiTietSanPham) {
	this.idChiTietSanPham = idChiTietSanPham;
}
public int getMaSanPham() {
	return MaSanPham;
}
public void setMaSanPham(int maSanPham) {
	MaSanPham = maSanPham;
}
public int getSoLuong() {
	return soLuong;
}
public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
}
public String getMauSac() {
	return mauSac;
}
public void setMauSac(String mauSac) {
	this.mauSac = mauSac;
}
public String getKichCo() {
	return kichCo;
}
public void setKichCo(String kichCo) {
	this.kichCo = kichCo;
}

}
