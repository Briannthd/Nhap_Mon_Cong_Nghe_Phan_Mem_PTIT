package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.LoginService;

import java.io.IOException;

import Reponsitory.LoginReponsitory;

/**
 * Servlet implementation class Xoanguoidung
 */
@WebServlet("/xoamaphanquyen")
public class Xoanguoidung extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService lg = new LoginService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Xoanguoidung() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String categoryId = request.getParameter("id");
		System.out.println("id cua phan quyen là"+categoryId);
		boolean result = false;
//        boolean result = lg.deleteCategory(Integer.parseInt(categoryId));  // Giả sử có phương thức deleteCategory trong LoginReponsitory
		if (categoryId != null) {
			result = lg.xoaTaiKhoanQuanTri(Integer.parseInt(categoryId));
//			System.out.println(result);
		}

		  if (result) {
	            // Nếu xóa thành công, chuyển hướng về trang danh sách sản phẩm
	            response.sendRedirect("group.jsp");
	        } else {
	            // Nếu xóa không thành công, bạn có thể gửi thông báo lỗi
	            response.getWriter().write("xóa không thành công");
	        }
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
