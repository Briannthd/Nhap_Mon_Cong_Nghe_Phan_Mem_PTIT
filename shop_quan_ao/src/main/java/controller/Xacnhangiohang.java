package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ChiTietSanPham;
import model.DonHang;
import model.GioHang;
import model.SanPham;
import model.User;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Xacnhangiohang
 */
@WebServlet("/Xacnhangiohang")
public class Xacnhangiohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xacnhangiohang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String huy = request.getParameter("Huy");
		String datHang = request.getParameter("Dathang");
		String ten = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienThoai");
		String diaChi = request.getParameter("diaChi");
		System.out.println("Nút là "+ datHang);
		if(datHang != null && datHang.equals("Dathang")) {
			HttpSession s = request.getSession(false);
			List<User> u = (List<User>) s.getAttribute("Ghinhotaikhoan");
			List<GioHang> listGioHang = lgn.LayHetThongTinGioHang();
			System.out.println("u lỏ cat "+ u);
			System.out.println("Ghinhotaikhoan: " + request.getAttribute("Ghinhotaikhoan"));
			if (u != null) {
			    int idNguoiDung = 0;
			    for (User user : u) {
			        idNguoiDung = user.getMaTaiKhoan();
			        ten = user.getHoTen();
			        soDienThoai = user.getSoDienThoai();
			    }

			    List<GioHang> l = new ArrayList<GioHang>();
			    for (GioHang g : listGioHang) {
			        if (g.getMaNguoiDung() == idNguoiDung) {
			            int soLuong = lgn.CheckDonHangTonTaiChua(idNguoiDung, g.getMaChiTietSanPham(), ten,
			                    Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng", g.getGia());

			            if (soLuong > 0) {
			                int soLuongMoi = soLuong + g.getSoLuong();
			                int idDonHang = lgn.LayidDonHang(idNguoiDung, g.getMaChiTietSanPham(), ten,
			                        Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng", g.getGia());
			                lgn.updateDonHang(idDonHang, soLuongMoi, g.getGia());
			            } else {
			                LocalDate currentDate = LocalDate.now();
			                String formattedDate = currentDate.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
			                lgn.CapNhatDonHangNguoiDung(idNguoiDung, g.getMaChiTietSanPham(), ten,
			                        Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng",
			                        g.getSoLuong(), g.getGia(), formattedDate);
			            }

			            int soLuongChiTiet = lgn.LaySoLuongChiTiet(g.getMaChiTietSanPham());
			            if (soLuongChiTiet > 0) {
			                int soLuongConLai = soLuongChiTiet - g.getSoLuong();
			                lgn.UpdateBangChiTiet(g.getMaChiTietSanPham(), soLuongConLai);
			            }
			        }
			    }

			    // ✅ XÓA GIỎ HÀNG DÙ LÀ UPDATE HAY INSERT
			    boolean daXoa = lgn.XoaTatCaGioHangCuaNguoiDung(idNguoiDung);
			    if (daXoa) {
			        System.out.println("✅ Đã xóa giỏ hàng.");
			    } else {
			        System.out.println("❌ Không thể xóa giỏ hàng.");
			    }
			}

			System.out.println("đã vào qua đây chơi");
			response.sendRedirect("Giohang");
		}else {
			request.getRequestDispatcher("Giohang").forward(request, response);;
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}