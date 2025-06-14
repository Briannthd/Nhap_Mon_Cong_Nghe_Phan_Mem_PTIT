package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class SuaTaiKhoan
 */
@WebServlet(urlPatterns = {"/suaTaiKhoanAdmin"})
public class SuaTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaTaiKhoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idMaTaiKhoan = request.getParameter("idMaTaiKhoan");
		String idQuyenMuonSua = request.getParameter("idQuyenMuonSua");
		String idTrangThaiMuonSua = request.getParameter("idTrangThaiMuonSua");
		System.out.println("id quyền muốn sửa là: "+ idQuyenMuonSua);
		System.out.println("id trạng thái  muốn sửa là: "+ idTrangThaiMuonSua);
		int idSua = Integer.parseInt(idQuyenMuonSua);
		
		boolean result = false;
		if (idMaTaiKhoan == null || idQuyenMuonSua == null) {
		    response.getWriter().write("Tham số không hợp lệ");
		    return;
		}
//      boolean result = lg.deleteCategory(Integer.parseInt(categoryId));  // Giả sử có phương thức deleteCategory trong LoginReponsitory
			
			if(idSua >=1 && idSua <= 3) {
				result = lg.Update(Integer.parseInt(idMaTaiKhoan),Integer.parseInt(idQuyenMuonSua),idTrangThaiMuonSua);
			}else {
				request.setAttribute("Loisuaquyen", "Lỗi vui lòng nhập đúng 1-Admin 2-Nhân viên 3-Khách hàng");
				response.sendRedirect("account.jsp");
			}

		  if (result) {
	            
	            response.sendRedirect("account.jsp");
	        } else {
	            // Nếu xóa không thành công, bạn có thể gửi thông báo lỗi
	            response.getWriter().write("Sửa không thành công");
	        }
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
