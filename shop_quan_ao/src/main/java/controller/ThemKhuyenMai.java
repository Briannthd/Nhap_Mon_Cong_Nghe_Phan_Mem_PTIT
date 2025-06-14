package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class ThemKhuyenMai
 */
@WebServlet("/ThemKhuyenMai")
public class ThemKhuyenMai extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemKhuyenMai() {
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
		String tenKhuyenMai = request.getParameter("tenKhuyenMai");
		String moTa = request.getParameter("moTa");
		String phanTramKhuyenMai = request.getParameter("phanTramGiamGia");
		String idSanPham = request.getParameter("idchonSanPham");
		
		
		System.out.println("Tên Khuyến Mãi: " + tenKhuyenMai);
		System.out.println("Mô Tả: " + moTa);
		System.out.println("Phần Trăm Khuyến Mãi: " + phanTramKhuyenMai);
		System.out.println("ID Sản Phẩm: " + idSanPham);
		
		boolean  ktraThemKhuyenMai = lgn.ThemMaKhuyenMai(tenKhuyenMai, moTa, Float.parseFloat(phanTramKhuyenMai), Integer.parseInt(idSanPham));
		
		if(ktraThemKhuyenMai) {
			response.sendRedirect("Quantrikhuyenmai.jsp");
		}else {
			response.getWriter().append("Lỗi: ").append(request.getContextPath());
		}
	}

}
