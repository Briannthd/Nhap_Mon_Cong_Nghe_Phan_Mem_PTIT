package model;

public class SanPham {
	private int maSanpham, soLuong, maDanhMuc;
	private String tenSanPham, moTa, duongDanAnh, maKhuyeMai;
	private float gia;
	private String daXoa;
	public SanPham(int maSanpham, int maDanhMuc, String tenSanPham, String moTa, String duongDanAnh,
			float gia, String daXoa) {
		super();
		this.maSanpham = maSanpham;
		
		this.maDanhMuc = maDanhMuc;
		this.tenSanPham = tenSanPham;
		this.moTa = moTa;
		this.duongDanAnh = duongDanAnh;
		this.gia = gia;
		this.daXoa = daXoa;
	}
	
	public String getDaXoa() {
		return daXoa;
	}

	public void setDaXoa(String daXoa) {
		this.daXoa = daXoa;
	}

	public SanPham() {
		super();
	}
	public int getMaSanpham() {
		return maSanpham;
	}
	public void setMaSanpham(int maSanpham) {
		this.maSanpham = maSanpham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	public String getTenSanPham() {
		return tenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public String getDuongDanAnh() {
		return duongDanAnh;
	}
	public void setDuongDanAnh(String duongDanAnh) {
		this.duongDanAnh = duongDanAnh;
	}
	public float getGia() {
		return gia;
	}
	public void setGia(float gia) {
		this.gia = gia;
	}
	public String getMaKhuyeMai() {
		return maKhuyeMai;
	}
	public void setMaKhuyeMai(String maKhuyeMai) {
		this.maKhuyeMai = maKhuyeMai;
	}
	
	
}
