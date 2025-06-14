package Reponsitory;

import java.util.List;

import controller.Donhang;
import model.Danhgia;
import model.DonHang;
import model.GioHang;
import model.KhuyenMai;
import model.SanPham;

public interface Thaotacvoigiaodiennguoidung {
public boolean CheckSanPhamTonTai(int idSanPham, String mauSac, String kichThuoc);
public boolean Laythongtinsanpham(int id, String maKhuyemMai);
public List<KhuyenMai> LayThongTinKhuyenMai();
public int LayChiTietSanPham(int maSanPham, String mauSac, String kichCo);
public boolean CapNhatDonHangNguoiDung(int MaNguoiDung, int id, String tenKhachHang, int soDienThoai, String diaChiGiaoHang, String trangThai, int soLuong, float gia, String time);
public boolean UpdateBangChiTiet(int idChiTiet, int soLuong);
public int LaySoLuongChiTiet(int idChiTiet);
public int CheckDonHangTonTaiChua(int MaNguoiDung, int id, String tenKhachHang, int soDienThoai, String diaChiGiaoHang, String trangThai, float gia);
public boolean updateDonHang(int id,int soLuong,float gia);
public int LayidDonHang(int MaNguoiDung, int id, String tenKhachHang, int soDienThoai, String diaChiGiaoHang, String trangThai, float gia);
public boolean ThemSanPhamVaoGioHang(int maNguoiDung, int maChiTietSanPham, String mauSac, String kichThuoc, String trangThai,
		float gia, int soLuong, String duongDanAnh, String tenSanpham);
public List<GioHang> LayHetThongTinGioHang();
public boolean updateSoLuongGioHang(int maGioHang, int soLuong, float gia);
public List<DonHang> LayThongTinDonHang();
public boolean DeleteDonHang(int idDonHang);
public boolean updateDonHang(int idDonHang, String trangThai);
public boolean DeleteSanPhamGioHang(int id);
public List<SanPham> LayMaGiamGiaoIdUser(int MaNguoiDung);
public List<GioHang> IdChiTietSanPham(int MaNguoiDung);
public List<SanPham> TimKiemSanPham(String timKiem);
public boolean ThemDanhGia(int MaNguoiDung, String tenNguoiDung, int maSanPham, int soLuongSao, String noiDung, String thoiGian);
public List<Danhgia> LayThongTinDanhGia();
public boolean UpdateDanhGia(int maDanhGia, String noiDungPhanHoi);
public boolean ThemMaKhuyenMai(String maKhuyenMai, String noiDung, Float khuyenMai, int sanPham);
public boolean XoaMaKhuyenMai(String maKhuyenMai);
}
