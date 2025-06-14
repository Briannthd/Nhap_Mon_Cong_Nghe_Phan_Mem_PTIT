package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class XoanguoidungAcoout
 */
@WebServlet("/xoaIdNguoiDungAccount")
public class XoanguoidungAcoout extends HttpServlet {
	private LaydulieuReponsitory lg = new LaydulieuReponsitory();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoanguoidungAcoout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String xoaIdNguoiDung = request.getParameter("id");
		System.out.println(xoaIdNguoiDung);
		boolean ktra = false;
		if(xoaIdNguoiDung != null) {
			ktra = lg.DeleteUser(Integer.parseInt(xoaIdNguoiDung));
			if(ktra) {
				response.sendRedirect("account.jsp");
			}
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
