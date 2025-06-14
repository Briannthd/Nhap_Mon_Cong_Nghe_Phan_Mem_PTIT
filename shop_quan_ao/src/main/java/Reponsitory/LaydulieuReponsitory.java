package Reponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import configg.ConnectionSql;
import model.BaiViet;
import model.ChiTietSanPham;
import model.DanhMuc;
import model.Quyen;
import model.SanPham;
import model.User;

public class LaydulieuReponsitory implements Thaotac {

	@Override
	public List<User> getUser(String tenTaiKhoan, String tenMatKhau) {
		List<User> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM nguoidung WHERE TenDangNhap = ? AND MatKhau = ? and trangThai = ?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);
			ps.setString(1, tenTaiKhoan);
			ps.setString(2, tenMatKhau);
			ps.setString(3, "True");
			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				User us = new User();
				us.setMaTaiKhoan(rs.getInt("MaNguoiDung"));
				us.setTenTaiKhoan(rs.getString("TenDangNhap"));
				us.setMatKhau(rs.getString("MatKhau"));
				us.setHoTen(rs.getString("HoTen"));
				us.setEmail(rs.getString("Email"));
				us.setSoDienThoai(rs.getString("SoDienThoai"));
				us.setDiaChi(rs.getString("DiaChi"));
				us.setMaQuyen(rs.getInt("MaQuyen"));
				us.setTrangThai(rs.getString("trangThai"));
				list.add(us);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory");
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

	@Override
	public List<Quyen> Laythongtin() {
		List<Quyen> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM quyen";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				Quyen q = new Quyen();
				q.setMaQuyen(rs.getInt("MaQuyen"));
				q.setTenQuyen(rs.getString("TenQuyen"));
				q.setMoTa(rs.getString("moTa"));
				list.add(q);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory");
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

	@Override
	public List<User> Laythongtinnguoidung() {
		List<User> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM nguoidung";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				String tenTaiKhoan = rs.getString("TenDangNhap");
				String matKhau = rs.getString("MatKhau");
				String hoTen = rs.getString("HoTen");
				String email = rs.getString("Email");
				String soDienThoai = rs.getString("SoDienThoai");
				int maQuyen = rs.getInt("MaQuyen");
				String diaChi = rs.getString("DiaChi");
				int maTaiKhoan = rs.getInt("MaNguoiDung");
				String trangThai = rs.getString("trangThai");
				// Tạo đối tượng User và truyền giá trị vào constructor
				User user = new User(tenTaiKhoan, matKhau, hoTen, email, soDienThoai, diaChi, trangThai, maQuyen,
						maTaiKhoan);

				// Thêm đối tượng User vào danh sách
				list.add(user);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory");
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

	@Override
	public boolean Dangki(String tenTaiKhoan, String matKhau, String Email, String hoTen, String soDienThoai,
			String diaChi) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, Email, SoDienThoai, MaQuyen, DiaChi,trangThai) VALUES (?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(them);
			ps = conn.prepareStatement(them);
			ps.setString(1, tenTaiKhoan);
			ps.setString(2, matKhau);
			ps.setString(3, hoTen);
			ps.setString(4, Email);
			ps.setString(5, soDienThoai);
			ps.setInt(6, 3);
			ps.setString(7, diaChi);
			ps.setString(8, "True");
			int row = ps.executeUpdate();
			if (row > 0) {
				ktra = true;
				conn.close();
			}
		} catch (SQLException e) {

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
		return ktra;
	}

	@Override
	public int Delete(int id) {
		int bs = 0;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			int xoaNguoiDung = DeteBangUser(id);
			if (xoaNguoiDung > 0) {

				String query = "delete from quyen where MaQuyen=?";

				ps = conn.prepareStatement(query);

				ps.setInt(1, id);

				bs = ps.executeUpdate();
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần xóa phân quyền  LoginReponsitory");
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

		return bs;
	}

	@Override
	public int DeteBangUser(int maQuyen) {
		int bs = 0;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "delete from nguoidung where MaQuyen=?";

			// Chuẩn bị câu lệnh SQL

			ps = conn.prepareStatement(query);

			ps.setInt(1, maQuyen);

			// Thực thi câu lệnh SQL

			bs = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần xóa phân quyền  LoginReponsitory");
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

		return bs;
	}

	@Override
	public boolean Update(int idNguoiDung, int idQuyen, String idTrangThaiMuonSua) {
		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "update nguoidung set MaQuyen=? ,trangThai=? where MaNguoiDung=? ";

			// Chuẩn bị câu lệnh SQL

			ps = conn.prepareStatement(query);

			ps.setInt(1, idQuyen);
			ps.setString(2, idTrangThaiMuonSua);
			ps.setInt(3, idNguoiDung);
			// Thực thi câu lệnh SQL

			if (ps.executeUpdate() > 0) {
				bs = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần xóa phân quyền  LoginReponsitory");
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

		return bs;
	}

	@Override
	public boolean DeleteUser(int id) {
		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Xóa đơn hàng của người dùng
			String deleteDonHang = "DELETE FROM donhang WHERE MaNguoiDung = ?";
			ps = conn.prepareStatement(deleteDonHang);
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();

			// Xóa đánh giá của người dùng
			String deleteDanhGia = "DELETE FROM danhgia WHERE MaNguoiDung = ?";
			ps = conn.prepareStatement(deleteDanhGia);
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();

			// Xóa giỏ hàng của người dùng
			String deleteGioHang = "DELETE FROM giohang WHERE MaNguoiDung = ?";
			ps = conn.prepareStatement(deleteGioHang);
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();

			// Cuối cùng xóa người dùng
			String deleteNguoiDung = "DELETE FROM nguoidung WHERE MaNguoiDung = ?";
			ps = conn.prepareStatement(deleteNguoiDung);
			ps.setInt(1, id);
			if (ps.executeUpdate() > 0) {
				bs = true;
			}

			// Commit transaction nếu mọi thứ thành công
			conn.commit();

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần xóa người dùng (LoginRepository)");
			e.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback(); // rollback nếu có lỗi
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return bs;
	}

	@Override
	public List<SanPham> Laythongtinsanpham() {
		List<SanPham> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM sanpham";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				int masp = rs.getInt("MaSanPham");

//                int sl = rs.getInt("SoLuong");
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
			System.out.println("Lỗi trong phần LoginReponsitory lấy thông tin sản phẩm");
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

	@Override
	public List<DanhMuc> Laythongtidanhmuc() {
		List<DanhMuc> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM danhmucsanpham";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				DanhMuc q = new DanhMuc();
				q.setMaDanhmuc(rs.getInt("MaDanhMuc"));
				q.setTenDanhMuc(rs.getString("TenDanhMuc"));
				q.setDaXoa(rs.getString("daxoa"));
				list.add(q);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory phần danh muc sản phẩm");
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

	@Override
	public List<ChiTietSanPham> Laythongtinchitietsanpham() {
		List<ChiTietSanPham> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM chitietsanpham";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				ChiTietSanPham chitiet = new ChiTietSanPham(rs.getInt("id"), rs.getInt("MaSanPham"),
						rs.getInt("soLuong"), rs.getString("mauSac"), rs.getString("kichCo"),rs.getString("daxoa"));
				list.add(chitiet);

			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory phần chi tiết sản phẩm");
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

	@Override
	public boolean xoaChiTietProductQuanTri(int id) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bs = false;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "UPDATE chitietsanpham SET daxoa = TRUE WHERE id = ?";

			ps = conn.prepareStatement(query);

			ps.setInt(1, id);
			// Thực thi câu lệnh SQL

			if (ps.executeUpdate() > 0) {
				bs = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory xóa phần chi tiết sản phẩm");
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

		return bs;
	}

	@Override
	public boolean suaChiTietProductQuanTri(int id, int soLuong) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bs = false;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "update chitietsanpham set  soLuong=? WHERE id = ?";

			ps = conn.prepareStatement(query);

			ps.setInt(1, soLuong);
			ps.setInt(2, id);
			// Thực thi câu lệnh SQL

			if (ps.executeUpdate() > 0) {
				bs = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory cập nhật thông tin chi tiết");
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

		return bs;

	}

	@Override
	public int xoaHetChiTietSanPham(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int bs = 0;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "delete from chitietsanpham where MaSanPham = ?";

			ps = conn.prepareStatement(query);

			ps.setInt(1, id);
			// Thực thi câu lệnh SQL
			bs = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory xóa hết thông tin chi tiết sản phẩm");
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

		return bs;
	}

	@Override
	public int xoaSanPhamID(int id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int bs = 0;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "UPDATE sanpham SET DaXoa = TRUE WHERE MaSanPham = ?";

			ps = conn.prepareStatement(query);

			ps.setInt(1, id);
			// Thực thi câu lệnh SQL

			bs = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory xóa hết thông tin chi tiết sản phẩm");
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

		return bs;
	}

	@Override
	public boolean updateSanPham(int id, String name, int danhMuc, float gia, String anh, String moTa) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bs = false;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL ban đầu
			StringBuilder query = new StringBuilder("UPDATE sanpham SET ");
			List<Object> params = new ArrayList<>();

			// Kiểm tra từng giá trị nếu khác null và bổ sung vào câu truy vấn
			boolean hasPreviousCondition = false;

			if (name != null) {
				if (hasPreviousCondition)
					query.append(", ");
				query.append("TenSanPham = ?");
				params.add(name);
				hasPreviousCondition = true;
			}

			if (danhMuc != 0) { // Kiểm tra danh mục khác 0 (hoặc dùng giá trị mặc định nếu cần)
				if (hasPreviousCondition)
					query.append(", ");
				query.append("MaDanhMuc = ?");
				params.add(danhMuc);
				hasPreviousCondition = true;
			}

			if (gia != 0) { // Kiểm tra giá khác 0
				if (hasPreviousCondition)
					query.append(", ");
				query.append("Gia = ?");
				params.add(gia);
				hasPreviousCondition = true;
			}

			if (anh != null) {
				if (hasPreviousCondition)
					query.append(", ");
				query.append("DuongDanAnh = ?");
				params.add(anh);
				hasPreviousCondition = true;
			}

			if (moTa != null) {
				if (hasPreviousCondition)
					query.append(", ");
				query.append("MoTa = ?");
				params.add(moTa);
				hasPreviousCondition = true;
			}

			// Điều kiện WHERE để xác định sản phẩm cần cập nhật
			query.append(" WHERE MaSanPham = ?");
			params.add(id);

			// Chuyển câu truy vấn thành một PreparedStatement
			ps = conn.prepareStatement(query.toString());

			// Gán giá trị vào PreparedStatement từ danh sách params
			for (int i = 0; i < params.size(); i++) {
				ps.setObject(i + 1, params.get(i));
			}

			// Thực thi câu lệnh SQL
			bs = ps.executeUpdate() > 0;

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory sửa sản phẩm");
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

		return bs;
	}

	@Override
	public boolean addChiTietSP(int id, String mau, String kichCo, int SoLuong) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bs = false;
		boolean ktra = false;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			/*
			 * String checkTonTai =
			 * "select*from chitietsanpham where MaSanPham=? and mauSac=? and kichCo=? and soLuong=?"
			 * ; ps = conn.prepareStatement(checkTonTai); ps.setInt(1, id); ps.setString(2,
			 * mau); ps.setString(3, kichCo); ps.setInt(4, SoLuong); rs = ps.executeQuery();
			 * if (rs.next()) { ktra = true; }
			 */

			String query = "INSERT INTO chitietsanpham (MaSanPham, mauSac, kichCo, soLuong)\r\n" + "VALUES (?,?,?,?)";

			ps = conn.prepareStatement(query);

			ps.setInt(1, id);
			ps.setString(2, mau);
			ps.setString(3, kichCo);
			ps.setInt(4, SoLuong);
			// Thực thi câu lệnh SQL

			bs = ps.executeUpdate() > 0 ? true : false;

			// Câu truy vấn SQL

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần thêm chi tiết sản phẩm");
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

		return bs;
	}

	@Override
	public boolean addSanPham(String tenSaPham, int idDanhMuc, float giaSP, String moTa, String duongDanAnh) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bs = false;
		boolean ktra = false;
		ConnectionSql connectionSql = null;
		System.out.println("Thông tin sản phẩm csdl:");
		System.out.println("Tên sản phẩm csdl: " + tenSaPham);
		System.out.println("ID danh mục csdl: " + idDanhMuc);
		System.out.println("Giá sản phẩm csdl: " + giaSP);
		System.out.println("Mô tả csdl: " + moTa);
		System.out.println("Đường dẫn ảnh csdl: " + duongDanAnh);

		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			String checkTonTai = "SELECT * FROM sanpham \r\n" + "WHERE TenSanPham = ? \r\n" + "  AND Gia = ?\r\n"
					+ "  AND MoTa = ? \r\n" + "  AND MaDanhMuc = ? \r\n" + "  AND DuongDanAnh = ?";
			ps = conn.prepareStatement(checkTonTai);
			ps.setString(1, tenSaPham);
			ps.setFloat(2, giaSP);
			ps.setString(3, moTa);
			ps.setInt(4, idDanhMuc);
			ps.setString(5, duongDanAnh);
			rs = ps.executeQuery();
			if (rs.next()) {
				ktra = true;
			}
			if (!ktra) {
				String query = "INSERT INTO sanpham (TenSanPham, Gia, MoTa, MaDanhMuc,DuongDanAnh)\r\n"
						+ "VALUES (?,?,?,?,?)";

				ps = conn.prepareStatement(query);

				ps.setString(1, tenSaPham);
				ps.setFloat(2, giaSP);
				ps.setString(3, moTa);
				ps.setInt(4, idDanhMuc);
				ps.setString(5, duongDanAnh);
				// Thực thi câu lệnh SQL

				bs = ps.executeUpdate() > 0 ? true : false;

			}
			// Câu truy vấn SQL

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần sản phẩm");
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

		return bs;
	}

	@Override
	public List<DanhMuc> SelectDanhMuc() {
		List<DanhMuc> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;

		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT dm.TenDanhMuc, dm.MaDanhMuc, COUNT(sp.MaSanPham) AS SoSanPham \r\n"
					+ "FROM danhmucsanpham dm \r\n"
					+ "LEFT JOIN sanpham sp ON dm.MaDanhMuc = sp.MaDanhMuc \r\n"
					+ "WHERE dm.DaXoa = FALSE\r\n"
					+ "GROUP BY dm.MaDanhMuc, dm.TenDanhMuc;";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực hiện truy vấn
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				DanhMuc d = new DanhMuc();
				d.setMaDanhmuc(rs.getInt("MaDanhMuc"));
				d.setTenDanhMuc(rs.getString("TenDanhMuc"));
				d.setSoluong(rs.getInt("SoSanPham"));
//				d.setDaXoa(rs.getString("daxoa"));
				list.add(d);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần SelectDanhMuc");
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public boolean deleteDanhMucID(int id) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			String xoaDanhMuc = "UPDATE danhmucsanpham SET DaXoa = TRUE WHERE MaDanhMuc = ?";
			ps = conn.prepareStatement(xoaDanhMuc);
			ps.setInt(1, id);
			ktra = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ktra;
	}

	@Override
	public boolean deleteSPIdDanhMuc(int id) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		boolean t = false;
		String xoaSanPham = "UPDATE sanpham SET DaXoa = TRUE WHERE MaDanhMuc = ?";
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			ps = conn.prepareStatement(xoaSanPham);
			ps.setInt(1, id);
			ktra = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ktra;
	}

	@Override
	public boolean deleteChiSPIdDanhMuc(int id) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			String xoaDanhMuc = "delete from chitietsanpham where MaSanPham = ?";
			ps = conn.prepareStatement(xoaDanhMuc);
			ps.setInt(1, id);
			ktra = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ktra;
	}

	@Override
	public boolean addThemDanhMuc(String tenDanhMuc) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			String xoaDanhMuc = "insert into danhmucsanpham(TenDanhMuc) values(?)";
			ps = conn.prepareStatement(xoaDanhMuc);
			ps.setString(1, tenDanhMuc);
			ktra = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ktra;
	}

	@Override
	public boolean updateDanhMuc(int idDanhMuc, String tenDanhMuc) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			String updateDanhMuc = "update danhmucsanpham set TenDanhMuc=? where MaDanhMuc=?";
			ps = conn.prepareStatement(updateDanhMuc);
			ps.setString(1, tenDanhMuc);
			ps.setInt(2, idDanhMuc);
			ktra = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ktra;
	}

	@Override
	public boolean soSanhEmailandMK(String email, String matKhau) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		boolean ktra = false;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM NguoiDung WHERE Email = ? AND MatKhau = ?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, matKhau);
			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				ktra = true;
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory");
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
		return ktra;
	}

	@Override
	public boolean updateUser(String email, String matKhau) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			String updateDanhMuc = "update nguoidung set MatKhau=? where Email=?";
			ps = conn.prepareStatement(updateDanhMuc);
			ps.setString(1, matKhau);
			ps.setString(2, email);
			ktra = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần update email mk người dùng");
			e.printStackTrace();
		} finally {
			// Đảm bảo tài nguyên được đóng đúng cách và trả kết nối vào pool
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn); // Trả kết nối về pool
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ktra;
	}

	@Override
	public List<SanPham> Laythongtinsanphamtheodanhmuc() {
		List<SanPham> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL để lấy số lượng sản phẩm theo danh mục
			String query = "SELECT MaDanhMuc, COUNT(*) AS SoLuong FROM sanpham GROUP BY MaDanhMuc";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				// Lưu thông tin vào một đối tượng SanPham hoặc một đối tượng khác nếu cần thiết
				SanPham sp = new SanPham();
				sp.setMaDanhMuc(rs.getInt("MaDanhMuc"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				System.out.println("mã danh muc là: " + rs.getInt("MaDanhMuc"));
				System.out.println("Sô lượng là: " + rs.getInt("SoLuong"));
				list.add(sp);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy số lượng theo mã sản phẩm");
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

	@Override
	public List<SanPham> SanPhamDuocBanChayNhat() {
		List<SanPham> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT sp.TenSanPham, SUM(dh.SoLuong) AS soLuongBan\r\n" + "FROM sanpham sp\r\n"
					+ "JOIN chitietsanpham ctsp ON sp.MaSanPham = ctsp.MaSanPham\r\n"
					+ "JOIN donhang dh ON ctsp.id = dh.id\r\n" + "WHERE dh.TrangThai = 'Hoàn Thành' \r\n"
					+ "GROUP BY sp.TenSanPham\r\n" + "ORDER BY soLuongBan DESC;";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				SanPham sp = new SanPham();
				sp.setTenSanPham(rs.getString("TenSanPham"));
				sp.setSoLuong(rs.getInt("soLuongBan"));
				list.add(sp);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory lấy sản phẩm bán chạy nhất");
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

	@Override
	public boolean ThemBaiViet(String tenBai, String noiDung, int maNguoiDung, String ngayThang) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "INSERT INTO baiviet (MaNguoiDung, tenBai, noiDung, thoiGian) VALUES (?,?,?,?)";
			ps = conn.prepareStatement(them);
			ps = conn.prepareStatement(them);
			ps.setInt(1, maNguoiDung);
			ps.setString(2, tenBai);
			ps.setString(3, noiDung);
			ps.setString(4, ngayThang);
			int row = ps.executeUpdate();
			if (row > 0) {
				ktra = true;
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong reponsitory bài viết");
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
		return ktra;
	}

	@Override
	public List<BaiViet> LayThongTinBaiViet() {
		List<BaiViet> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM baiviet";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			// Xử lý kết quả trả về
			while (rs.next()) {
				BaiViet bv = new BaiViet(rs.getInt("maBaiViet"), rs.getInt("MaNguoiDung"), rs.getString("tenBai"),
						rs.getString("noiDung"), rs.getString("thoiGian"));

				list.add(bv);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần LoginReponsitory lấy dữ liệu bài viết ");
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

	@Override
	public boolean DeleteBaiViet(String maBaiViet) {
		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			String query = "delete from baiviet where maBaiViet=?";

			ps = conn.prepareStatement(query);

			ps.setInt(1, Integer.parseInt(maBaiViet));

			bs = ps.executeUpdate() > 0 ? true : false;

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần xóa bài viết trong   LoginReponsitory");
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

		return bs;
	}
	
	// check trùng khi thêm mới

	public boolean daTonTaiTenDanhMuc(String tenDanhMuc) {
		boolean tonTai = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;

		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String query = "SELECT * FROM danhmucsanpham WHERE TenDanhMuc = ? ";
			ps = conn.prepareStatement(query);
			ps.setString(1, tenDanhMuc);
			rs = ps.executeQuery();
			tonTai = rs.next(); // true nếu có kết quả
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					connectionSql.releaseConnection(conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return tonTai;
	}

	public List<SanPham> LaythongtinsanphamTheoDanhMuc(int maDanhMuc) {
		List<SanPham> filteredList = new ArrayList<>();
		List<SanPham> allProducts = Laythongtinsanpham(); // Get all products
		for (SanPham sp : allProducts) {
			if (sp.getMaDanhMuc() == maDanhMuc) {
				filteredList.add(sp);
			}
		}
		return filteredList;
	}

	// check trùng khi sửa (sửa sẽ kiểm bỏ cái id đang check)
	public boolean kiemTraTrungTenDanhMuc(String tenDanhMucMoi, int maDangSua) {
	    boolean trung = false;
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    ConnectionSql connectionSql = null;

	    try {
	        connectionSql = new ConnectionSql();
	        conn = connectionSql.getConnection();
	        String sql = "SELECT * FROM danhmucsanpham WHERE TenDanhMuc = ? AND MaDanhMuc <> ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, tenDanhMucMoi);
	        ps.setInt(2, maDangSua);
	        rs = ps.executeQuery();
	        trung = rs.next();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) connectionSql.releaseConnection(conn);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return trung;
	}
	
	public List<SanPham> laySanPhamTheoMau(String mauSac) {
	    List<SanPham> danhSach = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    ConnectionSql connectionSql = null;

	    try {
	        connectionSql = new ConnectionSql();
	        conn = connectionSql.getConnection();
	        String sql = "SELECT DISTINCT s.* FROM sanpham s JOIN chitietsanpham ct ON s.MaSanpham = ct.MaSanPham WHERE ct.mauSac = ?";
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, mauSac);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            SanPham sp = new SanPham();
	            sp.setMaSanpham(rs.getInt("MaSanpham"));
	            sp.setTenSanPham(rs.getString("TenSanPham"));
	            sp.setGia(rs.getFloat("Gia"));
	            sp.setDuongDanAnh(rs.getString("DuongDanAnh"));
	            sp.setMoTa(rs.getString("MoTa"));
	            sp.setMaDanhMuc(rs.getInt("MaDanhMuc"));
	            danhSach.add(sp);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) connectionSql.releaseConnection(conn);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return danhSach;
	}




}