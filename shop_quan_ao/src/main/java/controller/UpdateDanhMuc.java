package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class UpdateDanhMuc
 */
@WebServlet("/UpdateDanhMuc")
public class UpdateDanhMuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDanhMuc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String tenMoi = request.getParameter("updateDanhMuc");
        String idStr = request.getParameter("product-id");

        if (tenMoi == null || tenMoi.trim().isEmpty()) {
            response.getWriter().write("empty");
            return;
        }

        int id = Integer.parseInt(idStr);
        LaydulieuReponsitory repo = new LaydulieuReponsitory();

        // check tên bị trùng với tên của danh mục khác
        if (repo.kiemTraTrungTenDanhMuc(tenMoi, id)) {
            response.getWriter().write("duplicate");
            return;
        }

        boolean thanhCong = repo.updateDanhMuc(id, tenMoi);
        if (thanhCong) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
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
