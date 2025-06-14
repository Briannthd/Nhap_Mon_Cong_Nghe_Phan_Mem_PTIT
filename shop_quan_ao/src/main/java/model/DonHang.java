package model;

public class DonHang {
private int maDonHang, maNguoiDung, maChiTietSanPham;
private String tenKhachHang, diaChiGiaoHang, trangThai;
private int soDienThoai, soLuong;
private float gia;
private String ngayDatHang;

public DonHang(int maDonHang, int maNguoiDung, int maChiTietSanPham, String tenKhachHang, String diaChiGiaoHang,
		String trangThai, int soDienThoai, int soLuong, float gia, String ngayDatHang) {
	super();
	this.maDonHang = maDonHang;
	this.maNguoiDung = maNguoiDung;
	this.maChiTietSanPham = maChiTietSanPham;
	this.tenKhachHang = tenKhachHang;
	this.diaChiGiaoHang = diaChiGiaoHang;
	this.trangThai = trangThai;
	this.soDienThoai = soDienThoai;
	this.soLuong = soLuong;
	this.gia = gia;
	this.ngayDatHang = ngayDatHang;
}

public String getNgayDatHang() {
	return ngayDatHang;
}

public void setNgayDatHang(String ngayDatHang) {
	this.ngayDatHang = ngayDatHang;
}

public DonHang() {
	super();
}
public int getMaDonHang() {
	return maDonHang;
}
public void setMaDonHang(int maDonHang) {
	this.maDonHang = maDonHang;
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
public String getTenKhachHang() {
	return tenKhachHang;
}
public void setTenKhachHang(String tenKhachHang) {
	this.tenKhachHang = tenKhachHang;
}
public String getDiaChiGiaoHang() {
	return diaChiGiaoHang;
}
public void setDiaChiGiaoHang(String diaChiGiaoHang) {
	this.diaChiGiaoHang = diaChiGiaoHang;
}
public String getTrangThai() {
	return trangThai;
}
public void setTrangThai(String trangThai) {
	this.trangThai = trangThai;
}
public int getSoDienThoai() {
	return soDienThoai;
}
public void setSoDienThoai(int soDienThoai) {
	this.soDienThoai = soDienThoai;
}
public int getSoLuong() {
	return soLuong;
}
public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
}
public float getGia() {
	return gia;
}
public void setGia(float gia) {
	this.gia = gia;
}

}
