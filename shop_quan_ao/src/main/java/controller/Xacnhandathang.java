package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.KhuyenMai;
import Reponsitory.Laydulieuchonguoidung;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/Xacnhandathang")
public class Xacnhandathang extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();

	public Xacnhandathang() {
		super();	
	}

	// Được dùng chung bởi cả doGet và doPost
	private void xuLyXacNhan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idSanPham"));
		String maKhuyenMai = request.getParameter("maKhuyenMai");
		float gia = Float.parseFloat(request.getParameter("giaSanPham"));
		String tenSanPham = request.getParameter("tenSanPham");
		String mauSac = request.getParameter("mauSac");
		String kichThuoc = request.getParameter("kichThuoc");
		String soLuong = request.getParameter("soLuong");
		String hoTen = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienThoai");
		String diaChi = request.getParameter("diaChiGiaoHang");
		String maTaiKhoanUser = request.getParameter("maTaiKhoanUser");

		LocalDate currentDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		String formattedDate = currentDate.format(formatter);

		int soLuongInt = Integer.parseInt(soLuong);
		float tongGia = gia*soLuongInt;
		float giaSauKhiGiam = 0; // Mặc định là 0
		
		

		if (maKhuyenMai != null && !maKhuyenMai.trim().isEmpty()) {
			List<KhuyenMai> listKhuyenMai = lgn.LayThongTinKhuyenMai();
			for (KhuyenMai km : listKhuyenMai) {
				if (km.getMaKhuyenMai().equals(maKhuyenMai) && km.getMaSanpham() == id) {
					float phanTramKhuyenMai = km.getPhanTramKhuyenMai();
					
					giaSauKhiGiam = tongGia * (1 - (phanTramKhuyenMai / 100));
					break;
				}
			}
		}

		request.setAttribute("maTaiKhoanUser", maTaiKhoanUser);
		request.setAttribute("mauSac", mauSac);
		request.setAttribute("hoTen", hoTen);
		request.setAttribute("soDienThoai", soDienThoai);
		request.setAttribute("diaChi", diaChi);
		request.setAttribute("kichThuoc", kichThuoc);
		request.setAttribute("soLuong", soLuong);
		request.setAttribute("giaSauKhiGiam", giaSauKhiGiam);
		request.setAttribute("idSanPham", id);
		request.setAttribute("maKhuyenMai", maKhuyenMai);
		request.setAttribute("gia", tongGia);
		request.setAttribute("tenSanPham", tenSanPham);
		request.setAttribute("thoiGian", formattedDate);

		request.getRequestDispatcher("Xacnhandonhang.jsp").forward(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		xuLyXacNhan(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		xuLyXacNhan(request, response);
	}
}
