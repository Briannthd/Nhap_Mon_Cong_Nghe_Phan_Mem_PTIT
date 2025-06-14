package service;

import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.LoginReponsitory;
import model.User;

public class LoginService {
	private LaydulieuReponsitory lg = new LaydulieuReponsitory();
public boolean LoginSoSanh(String tentaikhoan, String tenMatKhau) {
	List<User> l = lg.getUser(tentaikhoan, tenMatKhau);
	return l.size()>0?true:false;
}
public int getUserRole(String tentaikhoan, String tenMatKhau) {
    List<User> l = lg.getUser(tentaikhoan, tenMatKhau);
    if (l.size() > 0) {
        if(l.get(0).getMaQuyen() == 1) {
        	return 1;
        }
        else {
        	return -1;
        }
    }
    return -1;  
}
public boolean xoaTaiKhoanQuanTri(int id) {
	System.out.println(id);
	return lg.Delete(id)>0?true:false;
}
public boolean Suasanphamchitiet(int id, int soLuong) {
	return lg.suaChiTietProductQuanTri(id, soLuong) ? true : false;
}
public boolean Xoachitietsanpham(int id) {
	if(lg.xoaHetChiTietSanPham(id)>0) {
		return true;
	}else {
		return false;
	}
}
public boolean Xoasanpham(int id) {
	return lg.xoaSanPhamID(id) > 0 ? true : false;
}
}