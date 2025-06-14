package Reponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import configg.ConnectionSql;
import controller.Donhang;
import model.Danhgia;
import model.DonHang;
import model.GioHang;
import model.KhuyenMai;
import model.SanPham;
import model.User;

public class Laydulieuchonguoidung implements Thaotacvoigiaodiennguoidung {

	@Override
	public boolean CheckSanPhamTonTai(int idSanPham, String mauSac, String kichThuoc) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM chitietsanpham WHERE MaSanPham = ? AND mauSac = ? AND kichCo =?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);
			ps.setInt(1, idSanPham);
			ps.setString(2, mauSac);
			ps.setString(3, kichThuoc);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			if (rs.next()) {
				ktra = true;
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu người dùng kiểm tra sản phầm có tồn tại hay không");
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
	public boolean Laythongtinsanpham(int id, String maKhuyenMai) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM sanpham where MaSanPham = ? and maKhuyeMai = ? ";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			ps.setInt(1, id);
			ps.setString(2, maKhuyenMai);
			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			if (rs.next()) {
				ktra = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng phần kiểm tra tồn tại mã khuyến mãi");
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
	public List<KhuyenMai> LayThongTinKhuyenMai() {
		
		List<KhuyenMai> list = new ArrayList<KhuyenMai>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM khuyenmai";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			while (rs.next()) {
				KhuyenMai k = new KhuyenMai(rs.getString("maKhuyeMai"), rs.getString("noiDungKhuyenMai"),
						rs.getFloat("phanTramKhuyenMai"),rs.getInt("MaSanPham"));
				list.add(k);
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng lấy dữ liệu khuyến mãi");
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
	public int LayChiTietSanPham(int maSanPham, String mauSac, String kichCo) {

		List<KhuyenMai> list = new ArrayList<KhuyenMai>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		int maSP = 0;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM chitietsanpham where MaSanPham = ? and mauSac=? and kichCo=?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			ps.setInt(1, maSanPham);
			ps.setString(2, mauSac);
			ps.setString(3, kichCo);
			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			while (rs.next()) {
				maSP = rs.getInt("id");
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng chi tiết sản phẩm");
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

		return maSP;
	}

	@Override
	public boolean CapNhatDonHangNguoiDung(int MaNguoiDung, int id, String tenKhachHang, int soDienThoai,
			String diaChiGiaoHang, String trangThai, int soLuong, float gia, String time) {

		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "INSERT INTO donhang (MaNguoiDung, id, TenKhachHang,SoDienThoai, DiaChiGiaoHang, TrangThai, SoLuong, Gia,ngaydatHang) VALUES (?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(them);
			ps = conn.prepareStatement(them);
			ps.setInt(1, MaNguoiDung);
			ps.setInt(2, id);
			ps.setString(3, tenKhachHang);
			ps.setInt(4, soDienThoai);
			ps.setString(5, diaChiGiaoHang);
			ps.setString(6, trangThai);
			ps.setInt(7, soLuong);
			ps.setFloat(8, gia);
			ps.setString(9, time);
			int row = ps.executeUpdate();
			if (row > 0) {
				ktra = true;
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng thêm đơn hàng");
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
	public boolean UpdateBangChiTiet(int idChiTiet, int soLuong) {
		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "update chitietsanpham set soLuong=? where id=? ";

			// Chuẩn bị câu lệnh SQL

			ps = conn.prepareStatement(query);

			ps.setInt(1, soLuong);
			ps.setInt(2, idChiTiet);
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
	public int LaySoLuongChiTiet(int idChiTiet) {
		int soLuong = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "select*from chitietsanpham where id=?";
			ps = conn.prepareStatement(them);
			ps = conn.prepareStatement(them);
			ps.setInt(1, idChiTiet);
			rs = ps.executeQuery();
			while (rs.next()) {
				soLuong = rs.getInt("soLuong");
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng thêm đơn hàng");
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
		return soLuong;
	}

	@Override
	public int CheckDonHangTonTaiChua(int MaNguoiDung, int id, String tenKhachHang, int soDienThoai,
			String diaChiGiaoHang, String trangThai, float gia) {
		int soLuongDonHang = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		int maSP = 0;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM donhang where MaNguoiDung=? and id=? and TenKhachHang=? and SoDienThoai=? and DiaChiGiaoHang=? and TrangThai=? and Gia=?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			ps.setInt(1, MaNguoiDung);
			ps.setInt(2, id);
			ps.setString(3, tenKhachHang);
			ps.setInt(4, soDienThoai);
			ps.setString(5, diaChiGiaoHang);
			ps.setString(6, trangThai);
			ps.setFloat(7, gia);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			while (rs.next()) {
				soLuongDonHang = rs.getInt("SoLuong");
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng CheckDonHangTonTaiChua");
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

		return soLuongDonHang;
	}

	@Override
	public boolean updateDonHang(int id, int soLuong, float gia) {

		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "update donhang set soLuong=?, Gia=? where idDonHang=?";

			// Chuẩn bị câu lệnh SQL

			ps = conn.prepareStatement(query);

			ps.setInt(1, soLuong);
			ps.setFloat(2, gia);
			ps.setInt(3, id);
			// Thực thi câu lệnh SQL

			if (ps.executeUpdate() > 0) {
				System.out.println("đã cập nhật thành công huhuu");
				bs = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng update");
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
	public int LayidDonHang(int MaNguoiDung, int id, String tenKhachHang, int soDienThoai, String diaChiGiaoHang,
			String trangThai, float gia) {
		int soLuongDonHang = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		int maSP = 0;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM donhang where MaNguoiDung=? and id=? and TenKhachHang=? and SoDienThoai=? and DiaChiGiaoHang=? and TrangThai=? and Gia=?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			ps.setInt(1, MaNguoiDung);
			ps.setInt(2, id);
			ps.setString(3, tenKhachHang);
			ps.setInt(4, soDienThoai);
			ps.setString(5, diaChiGiaoHang);
			ps.setString(6, trangThai);
			ps.setFloat(7, gia);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			while (rs.next()) {
				soLuongDonHang = rs.getInt("idDonHang");
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng CheckDonHangTonTaiChua");
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

		return soLuongDonHang;
	}

	@Override
	public boolean ThemSanPhamVaoGioHang(int maNguoiDung, int maChiTietSanPham, String mauSac, String kichThuoc,
			String trangThai, float gia, int soLuong, String duongDanAnh, String tenSanpham) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "INSERT INTO giohang (MaNguoiDung, id, soLuong,mauSac, kichCo, giaTien, trangThai,duongdananh,tensanpham) VALUES (?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(them);
			ps.setInt(1, maNguoiDung);
			ps.setInt(2, maChiTietSanPham);
			ps.setInt(3, soLuong);
			ps.setString(4, mauSac);
			ps.setString(5, kichThuoc);
			ps.setFloat(6, gia);
			ps.setString(7, trangThai);
			ps.setString(8, duongDanAnh);
			ps.setString(9, tenSanpham);
			int row = ps.executeUpdate();
			if (row > 0) {
				ktra = true;
				System.out.println("thêm thành công pùn");
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dung thêm vào giỏ hàng");
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
	public List<GioHang> LayHetThongTinGioHang() {
	    List<GioHang> list = new ArrayList<GioHang>();
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    ConnectionSql connectionSql = null;

	    try {
	        connectionSql = new ConnectionSql();
	        conn = connectionSql.getConnection();
	        String query = "SELECT * FROM giohang";
	        ps = conn.prepareStatement(query);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            GioHang gh = new GioHang(
	                rs.getInt("idGioHang"),
	                rs.getInt("MaNguoiDung"),
	                rs.getInt("id"),
	                rs.getString("mauSac"),
	                rs.getString("kichCo"), // Lưu ý sửa từ kichThuoc thành kichCo
	                rs.getString("trangThai"),
	                rs.getFloat("giaTien"),
	                rs.getInt("soLuong"),
	                rs.getString("duongdananh"),
	                rs.getString("tensanpham")
	            );
	            list.add(gh);
	        }
	    } catch (SQLException e) {
	        System.out.println("Lỗi trong phần lấy dữ liệu người dùng lấy hết giỏ hàng");
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

	    return list;
	}


	@Override
	public boolean updateSoLuongGioHang(int maGioHang, int soLuong, float gia) {
		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "update giohang set soLuong=?,giaTien=? where idGioHang=?";

			// Chuẩn bị câu lệnh SQL

			ps = conn.prepareStatement(query);

			ps.setInt(1, soLuong);
			ps.setFloat(2, gia);
			ps.setInt(3, maGioHang);
			// Thực thi câu lệnh SQL

			if (ps.executeUpdate() > 0) {
				System.out.println("đã cập nhật thành công huhuu");
				bs = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng update giỏ hàng");
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
	public List<DonHang> LayThongTinDonHang() {
		 List<DonHang> list = new ArrayList<DonHang>();
		    Connection conn = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    ConnectionSql connectionSql = null;

		    try {
		        connectionSql = new ConnectionSql();
		        conn = connectionSql.getConnection();
		        String query = "SELECT * FROM donhang";
		        ps = conn.prepareStatement(query);
		        rs = ps.executeQuery();

		        while (rs.next()) {
		         DonHang dh = new DonHang(rs.getInt("idDonHang"), rs.getInt("MaNguoiDung"), rs.getInt("id"), rs.getString("TenKhachHang"), rs.getString("DiaChiGiaoHang"), rs.getString("TrangThai"), rs.getInt("SoDienThoai"), rs.getInt("SoLuong"), rs.getFloat("Gia"),rs.getString("ngaydathang"));
		         list.add(dh);
		        }
		    } catch (SQLException e) {
		        System.out.println("Lỗi trong phần lấy dữ liệu người dùng lấy hết đơn hàng");
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

		    return list;
	}

	@Override
	public boolean DeleteDonHang(int idDonHang) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "delete from donhang where idDonHang=?";
			ps = conn.prepareStatement(them);
			ps = conn.prepareStatement(them);
			ps.setInt(1, idDonHang);
			
			int row = ps.executeUpdate();
			if (row > 0) {
				ktra = true;
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng xóa đơn hàng");
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
	public boolean updateDonHang(int idDonHang, String trangThai) {
		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "update donhang set TrangThai=? where idDonHang=? ";

			// Chuẩn bị câu lệnh SQL

			ps = conn.prepareStatement(query);

			ps.setString(1, trangThai);
			ps.setInt(2, idDonHang);
			// Thực thi câu lệnh SQL

			if (ps.executeUpdate() > 0) {
				bs = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần xóa phân quyền  update dơn hang");
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
	public boolean DeleteSanPhamGioHang(int id) {
		
		boolean bs = false;
		Connection conn = null;
		PreparedStatement ps = null;

		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {

			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool
			System.out.println("id trong cơ sở dữ liệu xóa giỏ hàng là: "+id);
			// Câu truy vấn SQL
			String query = "delete from giohang where idGioHang=?";

			// Chuẩn bị câu lệnh SQL

			ps = conn.prepareStatement(query);

			ps.setInt(1, id);
			// Thực thi câu lệnh SQL

			if (ps.executeUpdate() > 0) {
				bs = true;
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu người dùng xóa giỏ hàng");
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
	public List<SanPham> LayMaGiamGiaoIdUser(int MaNguoiDung) {
		List<SanPham> list = new ArrayList<SanPham>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT \r\n"
					+ "    g.MaNguoiDung,        \r\n"
					+ "    p.TenSanPham,         \r\n"
					+ "    p.maKhuyeMai           \r\n"
					+ "FROM \r\n"
					+ "    giohang g\r\n"
					+ "JOIN \r\n"
					+ "    chitietsanpham cts ON g.id = cts.id  \r\n"
					+ "JOIN \r\n"
					+ "    sanpham p ON cts.MaSanPham = p.MaSanPham   \r\n"
					+ "WHERE \r\n"
					+ "    g.MaNguoiDung = ?;   ";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			ps.setInt(1, MaNguoiDung);
			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			while (rs.next()) {
				SanPham s = new SanPham();
				s.setTenSanPham(rs.getString("TenSanPham"));
				s.setMaKhuyeMai(rs.getString("maKhuyeMai"));
				list.add(s);
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng lấy tên sản phẩm và mã khuyến mãi dựa vào id người dùng");
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
	public List<GioHang> IdChiTietSanPham(int MaNguoiDung) {
		List<GioHang> list = new ArrayList<GioHang>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM giohang WHERE MaNguoiDung = ?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);
			ps.setInt(1, MaNguoiDung);
			

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();

			while (rs.next()) {
				GioHang g = new GioHang();
				g.setMaChiTietSanPham(rs.getInt("id"));
				list.add(g);
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu người dùng lấy id người dùng thông qua bảng giỏ hàng");
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
	public List<SanPham> TimKiemSanPham(String timKiem) {
		List<SanPham> listSanPham = new ArrayList<SanPham>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM sanpham where TenSanPham like ? ";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			ps.setString(1, "%" + timKiem + "%");
			
			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			while(rs.next()) {
				int masp = rs.getInt("MaSanPham");
//              int sl = rs.getInt("SoLuong");
				int madanhmuc = rs.getInt("MaDanhMuc");
				String tenSp = rs.getString("TenSanPham");
				String mota = rs.getString("MoTa");
				String duongdananh = rs.getString("DuongDanAnh");
				float g = rs.getFloat("Gia");
				String daXoa = rs.getString("daxoa");
				SanPham us = new SanPham(masp, madanhmuc, tenSp, mota, duongdananh, g,daXoa);
				listSanPham.add(us);
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng phần tìm kiếm sản phẩm");
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

		return listSanPham;
	}

	@Override
	public boolean ThemDanhGia(int MaNguoiDung, String tenNguoiDung, int maSanPham, int soLuongSao, String noiDung,
			String thoiGian) {
		 System.out.println("MaNguoiDung: " + MaNguoiDung);
		    System.out.println("tenNguoiDung: " + tenNguoiDung);
		    System.out.println("maSanPham: " + maSanPham);
		    System.out.println("soLuongSao: " + soLuongSao);
		    System.out.println("noiDung: " + noiDung);
		    System.out.println("thoiGian: " + thoiGian);
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "INSERT INTO danhgia (MaNguoiDung, tenNguoiDung, MaSanPham, soLuongSao, noiDung, thoiGian) VALUES (?, ?, ?, ?, ?, ?)";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);
			ps.setInt(1, MaNguoiDung);
			ps.setString(2, tenNguoiDung);
			ps.setInt(3, maSanPham);
			ps.setInt(4, soLuongSao);
			ps.setString(5, noiDung);
			ps.setString(6, thoiGian);

			// Thực thi câu lệnh SQL
			 int rowsAffected = ps.executeUpdate();
		        if (rowsAffected > 0) {
		            ktra = true;
		        }
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu người dùng thêm đánh giá");
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
	public List<Danhgia> LayThongTinDanhGia() {
		List<Danhgia> danhGia = new ArrayList<Danhgia>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "SELECT * FROM danhgia";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);

			// Thực thi câu lệnh SQL
			rs = ps.executeQuery();
			while(rs.next()) {
				System.out.println("idDanhGia: " + rs.getInt("idDanhGia"));
			    System.out.println("MaNguoiDung: " + rs.getInt("MaNguoiDung"));
			    System.out.println("MaSanPham: " + rs.getInt("MaSanPham"));
			    System.out.println("soLuongSao: " + rs.getInt("soLuongSao"));
			    System.out.println("tenNguoiDung: " + rs.getString("tenNguoiDung"));
			    System.out.println("noiDung: " + rs.getString("noiDung"));
			    System.out.println("thoiGian: " + rs.getString("thoiGian"));
			    System.out.println("phanHoiQuantrivien: " + rs.getString("phanHoiQuantrivien"));
				Danhgia dh = new Danhgia(rs.getInt("idDanhGia"),rs.getInt("MaNguoiDung"),rs.getInt("MaSanPham"),rs.getInt("soLuongSao"),rs.getString("tenNguoiDung"),rs.getString("noiDung"),rs.getString("thoiGian"),rs.getString("phanHoiQuantrivien"));
				danhGia.add(dh);
			}

		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng lấy hết thông tin đánh giá");
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

		return danhGia;
	}

	@Override
	public boolean UpdateDanhGia(int maDanhGia, String noiDungPhanHoi) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			// Tạo đối tượng ConnectionSql để lấy kết nối
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection(); // Lấy kết nối từ pool

			// Câu truy vấn SQL
			String query = "update danhgia set phanHoiQuantrivien=? where idDanhGia=?";

			// Chuẩn bị câu lệnh SQL
			ps = conn.prepareStatement(query);
			ps.setString(1, noiDungPhanHoi);
			ps.setInt(2, maDanhGia);
			

			// Thực thi câu lệnh SQL
			 int rowsAffected = ps.executeUpdate();
		        if (rowsAffected > 0) {
		            ktra = true;
		        }
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu người dùng update  đánh giá của quản trị");
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
	public boolean ThemMaKhuyenMai(String maKhuyenMai, String noiDung, Float khuyenMai, int sanPham) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "INSERT INTO khuyenmai (maKhuyeMai, noiDungKhuyenMai, phanTramKhuyenMai,MaSanPham) VALUES (?,?,?,?)";
			ps = conn.prepareStatement(them);
			ps.setString(1, maKhuyenMai);
			ps.setString(2, noiDung);
			ps.setFloat(3, khuyenMai);
			ps.setInt(4, sanPham);
			
			int row = ps.executeUpdate();
			if (row > 0) {
				ktra = true;
				System.out.println("thêm thành công pùn");
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dung thêm khuyến mãi");
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
	public boolean XoaMaKhuyenMai(String maKhuyenMai) {
		boolean ktra = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ConnectionSql connectionSql = null;
		try {
			connectionSql = new ConnectionSql();
			conn = connectionSql.getConnection();
			String them = "delete from khuyenmai where maKhuyeMai=?";
			ps = conn.prepareStatement(them);
			ps = conn.prepareStatement(them);
			ps.setString(1, maKhuyenMai);
			
			int row = ps.executeUpdate();
			if (row > 0) {
				ktra = true;
			}
		} catch (SQLException e) {
			System.out.println("Lỗi trong phần lấy dữ liệu cho người dùng xóa khuyến mãi");
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
	
	public boolean XoaTatCaGioHangCuaNguoiDung(int maNguoiDung) {
		ConnectionSql connectionSql = null;
		Connection conn = null;
	    try {
	    	connectionSql = new ConnectionSql();
	    	conn = connectionSql.getConnection();
	        String sql = "DELETE FROM GioHang WHERE maNguoiDung = ?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, maNguoiDung);
	        int rows = stmt.executeUpdate();
	        return rows > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
