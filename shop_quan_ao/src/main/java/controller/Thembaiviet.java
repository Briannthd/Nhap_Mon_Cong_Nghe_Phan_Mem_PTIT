package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BaiViet;
import model.User;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Thembaiviet
 */
@WebServlet("/Thembaiviet")
public class Thembaiviet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LaydulieuReponsitory lg  = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Thembaiviet() {
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
		String tenBaiViet = request.getParameter("tenBai");
		String noiDung = request.getParameter("noiDung");
		
		HttpSession s = request.getSession(false);
		List<User> listUser = (List<User>) s.getAttribute("Ghinhotaikhoan");
		
		LocalDate currentDate = LocalDate.now();
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		 String formattedDate = currentDate.format(formatter);
		 // kiểm tra thêm bài viết
		 boolean ktraThemBaiViet = lg.ThemBaiViet(tenBaiViet, noiDung, listUser.get(0).getMaTaiKhoan(), formattedDate);
		if(ktraThemBaiViet) {
			request.setAttribute("thongbao", "thanhcong");
			response.sendRedirect("Quanlibaiviet.jsp");
		}
	}

}
