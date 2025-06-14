package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Mahoa;

import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
      private Mahoa mh = new Mahoa();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("old-password");
		String newPassword = request.getParameter("new-password");
		String confirmNewPassWord = request.getParameter("confirm-password");
		String mkiemtra = mh.hashPassword(password);
		boolean ktra = lg.soSanhEmailandMK(email, mkiemtra);
		if(ktra) {
			String matKhaumoi = mh.hashPassword(confirmNewPassWord);
			boolean ktraUpDate = lg.updateUser(email, matKhaumoi);
			if(ktraUpDate) {
				response.sendRedirect("category.jsp");
			}else {
				response.sendRedirect("Doimatkhau.jsp");
			}
		}else {
			response.sendRedirect("Doimatkhau.jsp");
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
