package Reponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import configg.ConnectionSql;

public class DangKiReponsitory {
public boolean Dangki(String tenTaiKhoan, String matKhau, String Email,String hoTen, String soDienThoai, String diaChi) {
	boolean ktra = false;
	 Connection conn = null;
     PreparedStatement ps = null;
     ResultSet rs = null;
	try {
		  ConnectionSql connectionSql = new ConnectionSql();
		     conn = connectionSql.getConnection();
		     String them = "INSERT INTO NguoiDung (TenDangNhap, MatKhau, HoTen, Email, SoDienThoai, MaQuyen, DiaChi) VALUES (?,?,?,?,?,?,?)";
	            ps = conn.prepareStatement(them);
		ps = conn.prepareStatement(them);
		ps.setString(1, tenTaiKhoan);  // TenDangNhap
        ps.setString(2, matKhau);  // MatKhau
        ps.setString(3, hoTen);  // HoTen
        ps.setString(4, Email);  // Email
        ps.setString(5, soDienThoai);  // SoDienThoai
        ps.setInt(6, 3);  // MaQuyen (Giả sử MaQuyen là 3)
        ps.setString(7, diaChi);  // DiaChi
		int row = ps.executeUpdate();
		if(row > 0) {
			ktra = true;
			conn.close();
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ktra;
}
}
