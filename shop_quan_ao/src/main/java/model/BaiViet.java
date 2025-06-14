package model;



public class BaiViet {
private int maBaiViet, maNguoiDung;
private String tenBai, noiDung, thoiGian;
public BaiViet(int maBaiViet, int maNguoiDung, String tenBai, String noiDung, String thoiGian) {
	super();
	this.maBaiViet = maBaiViet;
	this.maNguoiDung = maNguoiDung;
	this.tenBai = tenBai;
	this.noiDung = noiDung;
	this.thoiGian = thoiGian;
}
public BaiViet() {
	super();
}
public int getMaBaiViet() {
	return maBaiViet;
}
public void setMaBaiViet(int maBaiViet) {
	this.maBaiViet = maBaiViet;
}
public int getMaNguoiDung() {
	return maNguoiDung;
}
public void setMaNguoiDung(int maNguoiDung) {
	this.maNguoiDung = maNguoiDung;
}
public String getTenBai() {
	return tenBai;
}
public void setTenBai(String tenBai) {
	this.tenBai = tenBai;
}
public String getNoiDung() {
	return noiDung;
}
public void setNoiDung(String noiDung) {
	this.noiDung = noiDung;
}
public String getThoiGian() {
	return thoiGian;
}
public void setThoiGian(String thoiGian) {
	this.thoiGian = thoiGian;
}

}
