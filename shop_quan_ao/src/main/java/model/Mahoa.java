package model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Mahoa {
	public static String hashPassword(String password) {
        try {
            // Tạo instance của MessageDigest với thuật toán mong muốn (MD5, SHA-256, ...)
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            
            // Cập nhật dữ liệu cần mã hóa
            messageDigest.update(password.getBytes());

            // Lấy mảng byte đã mã hóa
            byte[] hashedBytes = messageDigest.digest();

            // Chuyển byte[] thành chuỗi dạng hex
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b)); // Định dạng mỗi byte thành 2 chữ số hex
            }

            return sb.toString(); // Chuỗi mã hóa
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Thuật toán mã hóa không được hỗ trợ", e);
        }
    }
}
