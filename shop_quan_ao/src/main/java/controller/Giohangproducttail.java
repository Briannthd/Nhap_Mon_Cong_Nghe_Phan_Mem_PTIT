package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ChiTietSanPham;
import model.SanPham;

import java.io.IOException;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Giohangproducttail
 */
@WebServlet("/Giohangproducttail")
public class Giohangproducttail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Giohangproducttail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		List<SanPham> listSP = lg.Laythongtinsanpham();
		List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
		request.setAttribute("listSanPham", listSP);
		request.setAttribute("listChiTietSanPham", listChiTietSanPham);
		request.setAttribute("idSanPham", id);
		request.getRequestDispatcher("product-detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		List<SanPham> listSP = lg.Laythongtinsanpham();
		List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
		request.setAttribute("listSanPham", listSP);
		request.setAttribute("listChiTietSanPham", listChiTietSanPham);
		request.setAttribute("idSanPham", id);
		request.getRequestDispatcher("product-detail.jsp").forward(request, response);
	}

}
