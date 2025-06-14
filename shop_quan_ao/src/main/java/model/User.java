package model;

public class User {
private String tenTaiKhoan, matKhau,hoTen, email, soDienThoai, diaChi,trangThai;
private int maQuyen, maTaiKhoan;
public String getTenTaiKhoan() {
	return tenTaiKhoan;
}
public void setTenTaiKhoan(String tenTaiKhoan) {
	this.tenTaiKhoan = tenTaiKhoan;
}
public String getMatKhau() {
	return matKhau;
}
public void setMatKhau(String matKhau) {
	this.matKhau = matKhau;
}
public String getHoTen() {
	return hoTen;
}
public void setHoTen(String hoTen) {
	this.hoTen = hoTen;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getSoDienThoai() {
	return soDienThoai;
}
public void setSoDienThoai(String soDienThoai) {
	this.soDienThoai = soDienThoai;
}
public String getDiaChi() {
	return diaChi;
}
public void setDiaChi(String diaChi) {
	this.diaChi = diaChi;
}
public String getTrangThai() {
	return trangThai;
}
public void setTrangThai(String trangThai) {
	this.trangThai = trangThai;
}
public int getMaQuyen() {
	return maQuyen;
}
public void setMaQuyen(int maQuyen) {
	this.maQuyen = maQuyen;
}
public int getMaTaiKhoan() {
	return maTaiKhoan;
}
public void setMaTaiKhoan(int maTaiKhoan) {
	this.maTaiKhoan = maTaiKhoan;
}
public User(String tenTaiKhoan, String matKhau, String hoTen, String email, String soDienThoai, String diaChi,
		String trangThai, int maQuyen, int maTaiKhoan) {
	super();
	this.tenTaiKhoan = tenTaiKhoan;
	this.matKhau = matKhau;
	this.hoTen = hoTen;
	this.email = email;
	this.soDienThoai = soDienThoai;
	this.diaChi = diaChi;
	this.trangThai = trangThai;
	this.maQuyen = maQuyen;
	this.maTaiKhoan = maTaiKhoan;
}
public User() {
	super();
}

}
