package model;

public class DanhMuc {
private int maDanhmuc, soluong;
private String tenDanhMuc;
private String daXoa;
public DanhMuc() {
	super();
}
public DanhMuc(int maDanhmuc, String tenDanhMuc,String daXoa) {
	super();
	this.maDanhmuc = maDanhmuc;
	this.tenDanhMuc = tenDanhMuc;
	this.daXoa = daXoa;
}

public String getDaXoa() {
	return daXoa;
}
public void setDaXoa(String daXoa) {
	this.daXoa = daXoa;
}
public int getMaDanhmuc() {
	return maDanhmuc;
}
public void setMaDanhmuc(int maDanhmuc) {
	this.maDanhmuc = maDanhmuc;
}
public String getTenDanhMuc() {
	return tenDanhMuc;
}
public void setTenDanhMuc(String tenDanhMuc) {
	this.tenDanhMuc = tenDanhMuc;
}
public int getSoluong() {
	return soluong;
}
public void setSoluong(int soluong) {
	this.soluong = soluong;
}

}
