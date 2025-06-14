package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.DanhMuc;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;

//@MultipartConfig
//@WebServlet("/Suasanphamproductquantri")
public class Test extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    public Test() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Các tham số khác như sản phẩm ID, tên, giá cả, mô tả...
        String productId = request.getParameter("product-id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String imagePath = "";
        // Lấy ảnh từ form (tên trường input là "image")
        Part imagePart = request.getPart("image");

        // Lấy đường dẫn tuyệt đối tới thư mục images trong dự án
        String uploadDirPath = getServletContext().getRealPath("images/");

        // Kiểm tra và tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadDirPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Tạo thư mục nếu chưa có
        }

        // Kiểm tra nếu có ảnh tải lên
        if (imagePart != null) {
            String fileName = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
            System.out.println("Đã tải lên ảnh: " + fileName);

            // Lưu ảnh vào thư mục images trong dự án
            String filePath = uploadDirPath + File.separator + fileName;
            imagePart.write(filePath);
            System.out.println("Ảnh đã được lưu vào: " + filePath);

            // Trả về đường dẫn ảnh để sử dụng trong database hoặc hiển thị trong ứng dụng
            imagePath = "/images/" + fileName;  // Đường dẫn ảnh từ thư mục images

            System.out.println("Đường dẫn ảnh là: " + imagePath);

            // Lưu thông tin vào cơ sở dữ liệu hoặc các thao tác khác

            // Chuyển hướng người dùng trở lại trang quản lý sản phẩm
            request.setAttribute("imagePath", imagePath);
        }
//        int idDanhMuc = 0;
//        List<DanhMuc> danhmuc = lg.Laythongtidanhmuc();
//        for(DanhMuc d : danhmuc) {
//        	if(d.getTenDanhMuc().equals(category)) {
//        		idDanhMuc = d.getMaDanhmuc();
//        	}
//        }
        System.out.println("Ma sửa sản phẩm là: "+Integer.parseInt(productId));
        System.out.println("Tên sửa sản phẩm là: "+ name);
  
        System.out.println("Giá sửa là: "+ Float.parseFloat(price));
       
//        System.out.println("Mô tả sửa là: "+ description);
        boolean ktra = lg.updateSanPham(Integer.parseInt(productId), name, Integer.parseInt(category), Float.parseFloat(price), imagePath, description);
        if(ktra) {
        	 RequestDispatcher rd = request.getRequestDispatcher("productquantri.jsp");
             rd.forward(request, response);
        }else {
        	 RequestDispatcher rd = request.getRequestDispatcher("productquantri.jsp");
             rd.forward(request, response);
        }
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý giống như doGet, chỉ cần thay đổi phương thức HTTP thành POST
        doGet(request, response);
    }
}
