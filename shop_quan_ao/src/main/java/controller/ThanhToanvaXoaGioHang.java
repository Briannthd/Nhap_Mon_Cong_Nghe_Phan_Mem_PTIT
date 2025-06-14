package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.GioHang;

import java.io.IOException;
import java.util.List;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class ThanhToanvaXoaGioHang
 */
@WebServlet("/ThanhToanvaXoaGioHang")
public class ThanhToanvaXoaGioHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanvaXoaGioHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String xoa = request.getParameter("Xoa");
		String thanhToan = request.getParameter("ThanhToan");
		String id  = request.getParameter("idGioHang");
		if(xoa != null & xoa.equals("Xoa")) {
			System.out.println("id của giỏ hàng là: "+ id);
			boolean ktra = lgn.DeleteDonHang(Integer.parseInt(id));
			System.out.println("Ktra: "+ ktra);
			if(ktra) {
				List<GioHang> gioHang = lgn.LayHetThongTinGioHang();
				request.setAttribute("gioHang", gioHang);
				request.getRequestDispatcher("shopping-card.jsp").forward(request, response);
			}else {
				request.setAttribute("loi", "1");
			}
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
