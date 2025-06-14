package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ChiTietSanPham;
import model.DonHang;
import model.SanPham;
import model.User;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Danhgiasanpham
 */
@WebServlet("/Danhgiasanpham")
public class Danhgiasanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Danhgiasanpham() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String soSao = request.getParameter("soSao");
		String noiDungDanhGia = request.getParameter("noiDungDanhGia");
		String idSanPham = request.getParameter("idSanPham");
		List<DonHang> listDonHang = lgn.LayThongTinDonHang();
		HttpSession s = request.getSession(false);
		List<User> listUser = (List<User>) s.getAttribute("Ghinhotaikhoan");
		if(listUser != null) {
			int id = listUser.get(0).getMaTaiKhoan();
			String tenNguoiDung = listUser.get(0).getHoTen();
			List<ChiTietSanPham> listChiTiet = lg.Laythongtinchitietsanpham();
			List<SanPham> listSanPham = lg.Laythongtinsanpham();
			boolean ktra = false;
			for(DonHang dh : listDonHang) {
				if(dh.getMaNguoiDung()==id && dh.getTrangThai().equalsIgnoreCase("Hoàn thành")) {
					System.out.println("đã vào đầy chơi nguoi dung");
					for(ChiTietSanPham c : listChiTiet) {
						if(dh.getMaChiTietSanPham()==c.getIdChiTietSanPham()) {
							System.out.println("đã vào đầy chơi get ma chi tiet");
							if(c.getMaSanPham()==Integer.parseInt(idSanPham)) {
								ktra = true;
								System.out.println("đã vào đầy chơi");
							}
						}
					}
				}
			}
			if(ktra) {
				LocalDate currentDate = LocalDate.now();
				 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
				 String formattedDate = currentDate.format(formatter);
				boolean ktraThemDanhGia = lgn.ThemDanhGia(id, tenNguoiDung, Integer.parseInt(idSanPham), Integer.parseInt(soSao), noiDungDanhGia, formattedDate);
				if(ktraThemDanhGia) {
					/*
					 * System.out.println("vô đánh giá choie"); List<SanPham> listSP =
					 * lg.Laythongtinsanpham(); List<ChiTietSanPham> listChiTietSanPham =
					 * lg.Laythongtinchitietsanpham(); request.setAttribute("listSanPham", listSP);
					 * request.setAttribute("listChiTietSanPham", listChiTietSanPham);
					 * request.setAttribute("idSanPham", Integer.parseInt(idSanPham));
					 * request.getRequestDispatcher("product-detail.jsp").forward(request,
					 * response);
					 */
					response.sendRedirect("Giohangproducttail?id=" + idSanPham);
				}
				
			}else {
				/*
				 * List<SanPham> listSP = lg.Laythongtinsanpham(); List<ChiTietSanPham>
				 * listChiTietSanPham = lg.Laythongtinchitietsanpham();
				 * request.setAttribute("listSanPham", listSP);
				 * request.setAttribute("listChiTietSanPham", listChiTietSanPham);
				 * request.setAttribute("idSanPham", Integer.parseInt(idSanPham));
				 * request.setAttribute("Loidanhgia", "lỗi không thể đánh giá");
				 * request.getRequestDispatcher("product-detail.jsp").forward(request,
				 * response);
				 */
				
				HttpSession loi = request.getSession();
				loi.setAttribute("Loidanhgia", "lỗi không thể đánh giá");
				response.sendRedirect("Giohangproducttail?id=" + idSanPham);
			}
			
			
		}else {
			response.sendRedirect("login.jsp");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
