package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LayidSanPhamquantri
 */
@WebServlet("/LayidSanPhamquantri")
public class LayidSanPhamquantri extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LayidSanPhamquantri() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("idd"));
		System.out.println("id product quan tri trong phan lay id san pham la "+ id);
		HttpSession session = request.getSession(true);  // Tạo mới nếu chưa có
		session.setAttribute("idthamchieu", id);
//		request.getRequestDispatcher("Chitietproductquantri.jsp").forward(request, response);
		response.sendRedirect("Chitietproductquantri.jsp");
//		response.sendRedirect("test.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
