package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Phanhoidanhgia
 */
@WebServlet("/Phanhoidanhgia")
public class Phanhoidanhgia extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Phanhoidanhgia() {
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
		String idDanhGia = request.getParameter("idDanhGia");
		String phanHoiQuanTri = request.getParameter("phanHoi");
		System.out.println("id đánh giá là "+ idDanhGia);
		System.out.println("Phản hồi đánh giá là:  "+ phanHoiQuanTri);
		if(phanHoiQuanTri == null) {
			request.setAttribute("Loi", "Vui lòng nhập đầy đủ thông tin");
			request.getRequestDispatcher("Quanlidanhgia.jsp").forward(request, response);
		}else {
			boolean ktra = lgn.UpdateDanhGia(Integer.parseInt(idDanhGia), phanHoiQuanTri);
			if(ktra) {
				request.setAttribute("Thongbao", "Cập nhật thành công");
				request.getRequestDispatcher("Quanlidanhgia.jsp").forward(request, response);
			}else {
				response.getWriter().append("Lỗi").append(request.getContextPath());
			}
		}
	}

}
