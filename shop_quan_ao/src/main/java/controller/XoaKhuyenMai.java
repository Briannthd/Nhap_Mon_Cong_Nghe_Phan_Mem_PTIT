package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class XoaKhuyenMai
 */
@WebServlet("/XoaKhuyenMai")
public class XoaKhuyenMai extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaKhuyenMai() {
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
		String idKhuyenMai = request.getParameter("idXoa");
		
		boolean ktraXoaKhuyenMai = lgn.XoaMaKhuyenMai(idKhuyenMai);
		if(ktraXoaKhuyenMai) {
			request.setAttribute("xoa","xóa thành công");
			
			request.getRequestDispatcher("Quantrikhuyenmai.jsp").forward(request, response);
		}else {
			request.setAttribute("loi","xóa thành công");
		}
	}

}
