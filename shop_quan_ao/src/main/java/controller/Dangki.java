package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Mahoa;
import service.LoginService;

import java.io.IOException;

import org.apache.coyote.Request;

import Reponsitory.DangKiReponsitory;
import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Dangki
 */
@WebServlet("/dang-ki")
public class Dangki extends HttpServlet {
	private static final long serialVersionUID = 1L;
private LoginService lg = new LoginService();
private LaydulieuReponsitory dk = new LaydulieuReponsitory();
private Mahoa mh = new Mahoa();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dangki() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String tenTaiKhoan = request.getParameter("tenDangKi").trim();
		String email = request.getParameter("emailDangKi").trim();
		String matKhau1 = request.getParameter("passDangKi").trim();
		String matKhau2 = request.getParameter("passDangKi2").trim();
		String hoTen = request.getParameter("hoTen").trim();
		String soDienThoai = request.getParameter("soDienThoai").trim();
		String diaChi = request.getParameter("diaChi").trim();
		String loiTenDangKi = "";
		String loiEmailDangKi = "";
		String loiMk = "";
		String tontai = "";
		
		System.out.println("Tên tài khoản: " + tenTaiKhoan);
		System.out.println("Email: " + email);
		System.out.println("Mật khẩu 1: " + matKhau1);
		System.out.println("Mật khẩu 2: " + matKhau2);
		System.out.println("Họ và tên: " + hoTen);
		System.out.println("Số điện thoại: " + soDienThoai);
		System.out.println("Địa chỉ: " + diaChi);

//		boolean isValid = true;
//
//		// Kiểm tra giá trị rỗng
//		if (tenTaiKhoan.isEmpty()) {
//			loiTenDangKi = "Tên tài khoản không được để trống.";
//			isValid = false;
//		} else if (tenTaiKhoan.length() < 5) {
//			loiTenDangKi = "Tên tài khoản phải có ít nhất 5 ký tự.";
//			isValid = false;
//		}
//
//		if (email.isEmpty()) {
//			loiEmailDangKi = "Email không được để trống.";
//			isValid = false;
//		}
//
//		if (matKhau1.isEmpty() || matKhau2.isEmpty()) {
//			loiMk = "Mật khẩu không được để trống.";
//			isValid = false;
//		} else if (!matKhau1.equals(matKhau2)) {
//			loiMk = "Mật khẩu không trùng khớp.";
//			isValid = false;
//		} else if (matKhau1.length() < 5) {
//			loiMk = "Mật khẩu phải có ít nhất 5 ký tự.";
//			isValid = false;
//		}

		// Kiểm tra nếu có lỗi
//		if (!isValid) {
//			request.setAttribute("loitaiKhoan", loiTenDangKi);
//			request.setAttribute("loiEmailDangKi", loiEmailDangKi);
//			request.setAttribute("loiMk", loiMk);
//			request.getRequestDispatcher("/register.jsp").forward(request, response);
//			return;
//		}
		String mahoa = mh.hashPassword(matKhau1);
		
		// Kiểm tra tài khoản đã tồn tại
		boolean kiemTra = lg.LoginSoSanh(tenTaiKhoan, mahoa);
		if (kiemTra) {
			tontai = "Tài khoản đã tồn tại";
			request.setAttribute("tontai", tontai);System.out.println("đã vào đến noiw dăng kí tồn tại");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		
		} else {
			boolean Dangki = dk.Dangki(tenTaiKhoan, mahoa, email, hoTen, soDienThoai, diaChi);
			System.out.println("đã vào đến noiw dăng kí thành công"+Dangki);
		    if (Dangki) {
		    	System.out.println("đã vào đến noiw dăng kí thành công111");
		        request.getRequestDispatcher("/login.jsp").forward(request, response);
		    } else {
		        request.setAttribute("error", "Có lỗi xảy ra khi đăng ký. Vui lòng thử lại.");
		        request.getRequestDispatcher("/register.jsp").forward(request, response);
		    }
		}
	}

}
