package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.GioHang;
import model.User;
import Reponsitory.Laydulieuchonguoidung;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ThanhToanGioHang")
public class ThanhToanGioHang extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();

    public ThanhToanGioHang() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        List<User> user = (List<User>) session.getAttribute("Ghinhotaikhoan");

        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
        if (session == null || user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<GioHang> danhSachGioHang = lgn.LayHetThongTinGioHang();
        List<GioHang> gioHangCuaUser = new ArrayList<>();

        for (User u : user) {
            for (GioHang g : danhSachGioHang) {
                if (g.getMaNguoiDung() == u.getMaTaiKhoan()) {
                    gioHangCuaUser.add(g);
                }
            }
        }

        // Truyền dữ liệu sang JSP
        request.setAttribute("user", user);
        request.setAttribute("gioHang", gioHangCuaUser);

        // Hiển thị trang xác nhận giỏ hàng
        request.getRequestDispatcher("Xacnhangioahang.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}


	


























	




