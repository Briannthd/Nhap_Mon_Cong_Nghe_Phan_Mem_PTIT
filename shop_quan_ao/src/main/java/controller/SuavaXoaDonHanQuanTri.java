package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class SuavaXoaDonHanQuanTri
 */
@WebServlet("/SuavaXoaDonHanQuanTri")
public class SuavaXoaDonHanQuanTri extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuavaXoaDonHanQuanTri() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String xoa = request.getParameter("Xoa");
		System.out.println("Xoa: " + xoa);
		String idDonHang = request.getParameter("idDonHang");
		System.out.println("idDonHang: " + idDonHang);
		String luu = request.getParameter("Luu");
		System.out.println("Luu: " + luu);
		String idDonHangCanSua = request.getParameter("idDonHangCanSua");
		System.out.println("idDonHangCanSua: " + idDonHangCanSua);
		String trangThai = request.getParameter("trangThai");
		
	
		
		
		System.out.println("trangThai: " + trangThai);
		
		if(xoa != null && xoa.equals("Xoa")) {
			System.out.println("ép kiểu là: "+ Integer.parseInt(idDonHang));
			boolean ktra = lgn.DeleteDonHang(Integer.parseInt(idDonHang));
			if(ktra) {
				response.sendRedirect("Donhangquantri.jsp");
			}
		}else if(luu != null && luu.equals("Luu")) {
			boolean ktraUpdate = lgn.updateDonHang(Integer.parseInt(idDonHangCanSua), trangThai);
			if(ktraUpdate) {
				response.sendRedirect("Donhangquantri.jsp");
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
