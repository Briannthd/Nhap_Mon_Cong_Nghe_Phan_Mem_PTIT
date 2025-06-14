package Reponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import configg.ConnectionSql;
import model.Quyen;
import model.User;

public class LoginReponsitory {

    public List<User> getUser(String tenTaiKhoan, String tenMatKhau){
        List<User> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        System.out.println("Co bi loi dau");

        try {
            // Tạo đối tượng ConnectionSql để lấy kết nối
            ConnectionSql connectionSql = new ConnectionSql();
            conn = connectionSql.getConnection();  // Lấy kết nối từ pool
            
            // Câu truy vấn SQL
            String query = "SELECT * FROM NguoiDung WHERE TenDangNhap = ? AND MatKhau = ?";
            
            // Chuẩn bị câu lệnh SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, tenTaiKhoan);
            ps.setString(2, tenMatKhau);
            
            // Thực thi câu lệnh SQL
            rs = ps.executeQuery();
            
            // Xử lý kết quả trả về
            while (rs.next()) {
                User us = new User();
                us.setTenTaiKhoan(rs.getString("TenDangNhap"));
                us.setMatKhau(rs.getString("MatKhau"));
                us.setHoTen(rs.getString("HoTen"));
                us.setEmail(rs.getString("Email"));
                us.setSoDienThoai(rs.getString("SoDienThoai"));
                us.setDiaChi(rs.getString("DiaChi"));
                us.setMaQuyen(rs.getInt("MaQuyen"));
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
                    ConnectionSql connectionSql = new ConnectionSql();
                    connectionSql.releaseConnection(conn);  // Trả kết nối về pool
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }

    public List<Quyen> Laythongtin(){
        List<Quyen> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Tạo đối tượng ConnectionSql để lấy kết nối
            ConnectionSql connectionSql = new ConnectionSql();
            conn = connectionSql.getConnection();  // Lấy kết nối từ pool
            
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
                    ConnectionSql connectionSql = new ConnectionSql();
                    connectionSql.releaseConnection(conn);  // Trả kết nối về pool
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }

    public List<User> Laythongtinnguoidung(){
        List<User> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Tạo đối tượng ConnectionSql để lấy kết nối
            ConnectionSql connectionSql = new ConnectionSql();
            conn = connectionSql.getConnection();  // Lấy kết nối từ pool
            
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
                User user = new User(tenTaiKhoan, matKhau, hoTen, email, soDienThoai, diaChi,trangThai, maQuyen, maTaiKhoan);
                
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
                    ConnectionSql connectionSql = new ConnectionSql();
                    connectionSql.releaseConnection(conn);  // Trả kết nối về pool
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return list;
    }
    
    
}
