package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import Reponsitory.LaydulieuReponsitory;

/**
 * Servlet implementation class Layapi
 */
@WebServlet("/Layapi")
public class Layapi extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();
    private LaydulieuReponsitory lg = new LaydulieuReponsitory();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách sản phẩm
        List<SanPham> listSanPham = lg.Laythongtinsanphamtheodanhmuc();

        // Chuyển dữ liệu thành JSON
        String jsonData = gson.toJson(listSanPham);

        // Đặt dữ liệu vào request attribute để gửi sang JSP
        request.setAttribute(" ", jsonData);
        request.getRequestDispatcher("/chart.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
