package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GioHang;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Xoasanphamtrongdonhang
 */
@WebServlet("/Xoasanphamtrongdonhang")
public class Xoasanphamtrongdonhang extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xoasanphamtrongdonhang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = request.getParameter("idGioHang");
//		boolean ktra = lgn.DeleteSanPhamGioHang(Integer.parseInt(id));
//		if(ktra) {
//			List<GioHang> gioHang = lgn.LayHetThongTinGioHang();
//			HttpSession s = request.getSession(false);
//			List<User> listUser = (List<User>) s.getAttribute("Ghinhotaikhoan");
//
//			// Tìm những giỏ hàng của khách hàng
//			List<GioHang> gioHangCoIdKhachHang = new ArrayList<GioHang>();
//			System.out.println("giỏ hàng "+ gioHang);
//			System.out.println("Người dùng: "+listUser);
//			if (listUser != null && gioHang != null) {
//				System.out.println("đã vào đây chơi");
//			    for (User user : listUser) {
//			    	System.out.println("maid là: "+ user.getMaTaiKhoan());
//			        for (GioHang g : gioHang) {
//			            if (g.getMaNguoiDung() == user.getMaTaiKhoan()) { 
//			                gioHangCoIdKhachHang.add(g);
//			                
//			                System.out.println("List gior hàng là : "+ g);
//			                break; 
//			            }
//			        }
//			    }
//			}
//
//			// Truyền danh sách giỏ hàng đã lọc đến JSP
//			request.setAttribute("gioHang", gioHangCoIdKhachHang);
//			request.getRequestDispatcher("shopping-card.jsp").forward(request, response);
//		}else {
//			request.setAttribute("loi", "xóa không thành công");
//		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("idGioHang");
		boolean ktra = lgn.DeleteSanPhamGioHang(Integer.parseInt(id));
		if(ktra) {
			List<GioHang> gioHang = lgn.LayHetThongTinGioHang();
			HttpSession s = request.getSession(false);
			List<User> listUser = (List<User>) s.getAttribute("Ghinhotaikhoan");

			// Tìm những giỏ hàng của khách hàng
			List<GioHang> gioHangCoIdKhachHang = new ArrayList<GioHang>();
			System.out.println("giỏ hàng "+ gioHang);
			System.out.println("Người dùng: "+listUser);
			if (listUser != null && gioHang != null) {
				System.out.println("đã vào đây chơi");
			    for (User user : listUser) {
			    	System.out.println("maid là: "+ user.getMaTaiKhoan());
			        for (GioHang g : gioHang) {
			            if (g.getMaNguoiDung() == user.getMaTaiKhoan()) { 
			                gioHangCoIdKhachHang.add(g);
			                
			                System.out.println("List gior hàng là : "+ g);
			                break; 
			            }
			        }
			    }
			}

			// Truyền danh sách giỏ hàng đã lọc đến JSP
			request.setAttribute("gioHang", gioHangCoIdKhachHang);
			request.getRequestDispatcher("shopping-card.jsp").forward(request, response);
		}else {
			request.setAttribute("loi", "xóa không thành công");
		}
		
	}

}
