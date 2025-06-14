package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import Reponsitory.LaydulieuReponsitory;

@WebServlet("/Laydulieusanpham")
public class Laydulieusanpham extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LaydulieuReponsitory lg = new LaydulieuReponsitory();

    public Laydulieusanpham() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SanPham> fullList = lg.Laythongtinsanpham();
        List<DanhMuc> listDanhMuc = lg.Laythongtidanhmuc();

        List<SanPham> randomList = new ArrayList<>(fullList);
        Collections.shuffle(randomList);
        if (randomList.size() > 8) {
            randomList = randomList.subList(0, 8);
        }

        // Lọc ra phần còn lại (fullList - randomList)
        List<SanPham> restList = new ArrayList<>(fullList);
        restList.removeAll(randomList);

        request.setAttribute("listDanhMuc", listDanhMuc);
        request.setAttribute("listHome", randomList);     // 8 sản phẩm random
        request.setAttribute("listMore", restList);       // Các sản phẩm còn lại
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}