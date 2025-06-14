package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Xoaproductquantri
 */
@WebServlet("/Xoachitietproductquantri")
public class Xoachitietproductquantri extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private LaydulieuReponsitory dl = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xoachitietproductquantri() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idcanxoa = request.getParameter("id");
		System.out.println("id xoa chi tiết là: "+ idcanxoa);
		boolean ktra = dl.xoaChiTietProductQuanTri(Integer.parseInt(idcanxoa));
		if(ktra) {
			System.out.println("đã vào phân kiểm tra thành công");
			  response.sendRedirect("Chitietproductquantri.jsp");
        } else {
            // Nếu xóa không thành công, bạn có thể gửi thông báo lỗi
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
