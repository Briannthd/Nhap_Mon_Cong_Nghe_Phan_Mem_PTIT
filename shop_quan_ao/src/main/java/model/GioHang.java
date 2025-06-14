package model;

public class GioHang {
private int maGioHang, maNguoiDung, maChiTietSanPham;
private String mauSac, kichThuoc, trangThai;
private float gia;
private int soLuong;
private String duongDan, tenSanPham;
public GioHang() {
	super();
}
public GioHang(int maGioHang, int maNguoiDung, int maChiTietSanPham, String mauSac, String kichThuoc, String trangThai,
		float gia, int soLuong, String duongDan, String tenSanPham) {
	super();
	this.maGioHang = maGioHang;
	this.maNguoiDung = maNguoiDung;
	this.maChiTietSanPham = maChiTietSanPham;
	this.mauSac = mauSac;
	this.kichThuoc = kichThuoc;
	this.trangThai = trangThai;
	this.gia = gia;
	this.soLuong = soLuong;
	this.duongDan = duongDan;
	this.tenSanPham = tenSanPham;
}
public int getMaGioHang() {
	return maGioHang;
}
public void setMaGioHang(int maGioHang) {
	this.maGioHang = maGioHang;
}
public int getMaNguoiDung() {
	return maNguoiDung;
}
public void setMaNguoiDung(int maNguoiDung) {
	this.maNguoiDung = maNguoiDung;
}
public int getMaChiTietSanPham() {
	return maChiTietSanPham;
}
public void setMaChiTietSanPham(int maChiTietSanPham) {
	this.maChiTietSanPham = maChiTietSanPham;
}
public String getMauSac() {
	return mauSac;
}
public void setMauSac(String mauSac) {
	this.mauSac = mauSac;
}
public String getKichThuoc() {
	return kichThuoc;
}
public void setKichThuoc(String kichThuoc) {
	this.kichThuoc = kichThuoc;
}
public String getTrangThai() {
	return trangThai;
}
public void setTrangThai(String trangThai) {
	this.trangThai = trangThai;
}
public float getGia() {
	return gia;
}
public void setGia(float gia) {
	this.gia = gia;
}
public int getSoLuong() {
	return soLuong;
}
public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
}
public String getDuongDan() {
	return duongDan;
}
public void setDuongDan(String duongDan) {
	this.duongDan = duongDan;
}
public String getTenSanPham() {
	return tenSanPham;
}
public void setTenSanPham(String tenSanPham) {
	this.tenSanPham = tenSanPham;
}


}
