package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.LoginService;

import java.io.IOException;

/**
 * Servlet implementation class Xoasanphamproductquantri
 */
@WebServlet("/Xoasanphamproductqt")
public class Xoasanphamproductquantri extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LoginService lg = new LoginService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xoasanphamproductquantri() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		boolean ktrachitietsanpham = lg.Xoachitietsanpham(id);
		System.out.println("id trong phần xóa sản phẩm là: "+ id);
		System.out.println("Kiểm tra là: "+ ktrachitietsanpham);
		if(ktrachitietsanpham) {
			boolean ktraSanPham = lg.Xoasanpham(id);
			if(ktraSanPham) {
				request.getRequestDispatcher("productquantri.jsp").forward(request, response);
			}
		}else {
			boolean ktraSanPham = lg.Xoasanpham(id);
			if(ktraSanPham) {
				request.getRequestDispatcher("productquantri.jsp").forward(request, response);
			}
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
