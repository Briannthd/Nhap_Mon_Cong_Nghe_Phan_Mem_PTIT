package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Huydonhangdadat
 */
@WebServlet("/Huydonhangdadat")
public class Huydonhangdadat extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Huydonhangdadat() {
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
		String idDonHang = request.getParameter("idDonHang");
		boolean ktra = lgn.DeleteDonHang(Integer.parseInt(idDonHang));
		if(ktra) {
			response.sendRedirect("Thongtindonhangdamua.jsp");
		}
	}

}
