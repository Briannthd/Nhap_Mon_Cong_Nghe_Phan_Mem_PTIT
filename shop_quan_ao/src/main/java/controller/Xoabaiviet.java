package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Xoabaiviet
 */
@WebServlet("/Xoabaiviet")
public class Xoabaiviet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xoabaiviet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String xoaBaiViet = request.getParameter("xoaBaiViet");
		
		System.out.println("Mã của xóa bài viết là: "+ xoaBaiViet);
		boolean ktra = lg.DeleteBaiViet(xoaBaiViet);
		if(ktra) {
			response.sendRedirect("Quanlibaiviet.jsp");
		}else {
			response.getWriter().append("Lỗi: ").append(request.getContextPath());
		}
		
	}

}
