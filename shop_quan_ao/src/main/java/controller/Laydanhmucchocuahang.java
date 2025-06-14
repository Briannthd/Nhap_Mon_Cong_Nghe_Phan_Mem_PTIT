package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import configg.ConnectionSql;

/**
 * Servlet implementation class Laydanhmucchocuahang
 */
@WebServlet("/Laydanhmucchocuahang")
public class Laydanhmucchocuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private LaydulieuReponsitory lg  = new LaydulieuReponsitory();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Laydanhmucchocuahang() {
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
		int id = Integer.parseInt(request.getParameter("id"));
		List<SanPham> list = getUser(id);
		List<DanhMuc> listDanhMuc = lg.Laythongtidanhmuc();
		request.setAttribute("listDanhMuc", listDanhMuc);
		request.setAttribute("listHome", list);
		request.getRequestDispatcher("/product.jsp").forward(request, response);
	}
	public List<SanPham> getUser(int id) {
		List<SanPham> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); 

			
			String query = "SELECT * FROM sanpham WHERE MaDanhMuc=?";

		
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				int masp = rs.getInt("MaSanPham");

//              int sl = rs.getInt("SoLuong");
				int madanhmuc = rs.getInt("MaDanhMuc");
				String tenSp = rs.getString("TenSanPham");
				String mota = rs.getString("MoTa");
				String duongdananh = rs.getString("DuongDanAnh");
				float g = rs.getFloat("Gia");
				String daXoa = rs.getString("daxoa");
				SanPham us = new SanPham(masp, madanhmuc, tenSp, mota, duongdananh, g,daXoa);
				list.add(us);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy sản phẩm bằng mã danh mục");
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				// Trả kết nối lại vào pool
				if (conn != null) {
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
