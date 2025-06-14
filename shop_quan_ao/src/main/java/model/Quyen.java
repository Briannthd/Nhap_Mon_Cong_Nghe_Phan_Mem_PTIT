package model;

public class Quyen {
private int maQuyen;
private String tenQuyen, moTa;
public int getMaQuyen() {
	return maQuyen;
}
public void setMaQuyen(int maQuyen) {
	this.maQuyen = maQuyen;
}
public String getTenQuyen() {
	return tenQuyen;
}
public void setTenQuyen(String tenQuyen) {
	this.tenQuyen = tenQuyen;
}
public String getMoTa() {
	return moTa;
}
public void setMoTa(String moTa) {
	this.moTa = moTa;
}
public Quyen(int maQuyen, String tenQuyen, String moTa) {
	super();
	this.maQuyen = maQuyen;
	this.tenQuyen = tenQuyen;
	this.moTa = moTa;
}
public Quyen() {
	super();
}

}
