package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.LoginService;

import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class SuachitietsanphamproductQT
 */
@WebServlet("/SuachitietsanphamproductQT")
public class SuachitietsanphamproductQT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private LoginService lg = new LoginService();
       private LaydulieuReponsitory dl = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuachitietsanphamproductQT() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
//		String mausac = request.getParameter("mausac");
//		String size = request.getParameter("size");
		String soluong = request.getParameter("soluong");
		
		if(Integer.parseInt(soluong) == 0) {
			boolean ktraa = dl.xoaChiTietProductQuanTri(Integer.parseInt(id));
			response.sendRedirect("Chitietproductquantri.jsp");
		}else if(Integer.parseInt(soluong) > 0) {
			boolean ktra = lg.Suasanphamchitiet(Integer.parseInt(id), Integer.parseInt(soluong));
			if(ktra) {
				response.sendRedirect("Chitietproductquantri.jsp");
			}
				else {
			}
			 response.getWriter().write("xóa không thành công");
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
