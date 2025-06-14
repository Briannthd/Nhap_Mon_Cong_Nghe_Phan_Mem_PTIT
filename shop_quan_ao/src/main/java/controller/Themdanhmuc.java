package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Themdanhmuc
 */
@WebServlet("/Themdanhmuc")
public class Themdanhmuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LaydulieuReponsitory lg = new LaydulieuReponsitory();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Themdanhmuc() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tenDanhMuc = request.getParameter("addThemSanPham");

		if (tenDanhMuc == null || tenDanhMuc.trim().isEmpty()) {
			response.getWriter().write("empty"); // Lỗi: trống
			return;
		}

		/*
		 * if (lg.kiemTraTrungTenDanhMuc(tenDanhMuc.trim())) {
		 * response.getWriter().write("duplicate"); //Lỗi: trùng return; }
		 * 
		 * 
		 * boolean kq = lg.addThemDanhMuc(tenDanhMuc.trim());
		 * 
		 * if (kq) { response.getWriter().write("success"); //Thành công } else {
		 * response.getWriter().write("fail"); //Lỗi: thêm thất bại }
		 */
		
		
		LaydulieuReponsitory l = new LaydulieuReponsitory();

		if (tenDanhMuc == null || tenDanhMuc.trim().equals("")) {
			response.getWriter().write("empty");
		} else if (l.daTonTaiTenDanhMuc(tenDanhMuc)) {
			response.getWriter().write("duplicate");
		} else if (l.addThemDanhMuc(tenDanhMuc)) {
			response.getWriter().write("success");
		} else {
			response.getWriter().write("fail");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
