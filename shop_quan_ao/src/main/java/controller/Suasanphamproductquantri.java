package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import javax.imageio.ImageIO;

import Reponsitory.LaydulieuReponsitory;

@WebServlet("/Suasanphamproductquantri")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 100,  // Tăng giới hạn kích thước tệp lên 100MB
    maxRequestSize = 1024 * 1024 * 200,  // Giới hạn yêu cầu (bao gồm cả ảnh và dữ liệu khác) lên 200MB
    fileSizeThreshold = 1024 * 1024  // Giới hạn bộ nhớ đệm khi tải lên (1MB)
)
public class Suasanphamproductquantri extends HttpServlet {
    private static final long serialVersionUID = 1L;
//    private static final String IMAGE_DIRECTORY = "D:\\locec\\ceclo\\nono\\"; // Đường dẫn thư mục lưu ảnh
    // private static final String IMAGE_DIRECTORY = "D:\\webjava\\webbanquanao\\src\\main\\webapp\\images\\";
    private static final String IMAGE_DIRECTORY = "C:\\Users\\Thuyen\\git\\Team_6_Nhap_Mon_Cong_Nghe_Phan_Mem\\shop_quan_ao\\src\\main\\webapp\\images\\";

    private LaydulieuReponsitory lg = new LaydulieuReponsitory();

    public Suasanphamproductquantri() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng người dùng về trang quản trị sản phẩm
        response.sendRedirect("productquantri.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("product-id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String imagePath = "";
        int thuMuc = Integer.parseInt(category);
        float gia = Float.parseFloat(price);

        
        if (productId == null || productId.isEmpty() ||
        	    name == null || name.isEmpty() ||
        	    category == null || category.isEmpty() ||
        	    price == null || price.isEmpty() ||
        	    description == null || description.isEmpty()) {
        	    request.setAttribute("loi", "Vui lòng điền đầy đủ thông tin sản phẩm.");
        	    request.getRequestDispatcher("productquantri.jsp").forward(request, response);
        	    return; // Ngừng xử lý nếu dữ liệu không hợp lệ
        	}
        // Lấy ảnh từ form (tên trường input là "image")
        Part imagePart = request.getPart("image");

        // Kiểm tra nếu có ảnh tải lên
        if (imagePart != null) {
            String fileName = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
            System.out.println("Đã tải lên ảnh: " + fileName);

            // Kiểm tra kích thước tệp, nếu quá lớn thì không tải
            long fileSize = imagePart.getSize();
            if (fileSize > 1024 * 1024 * 100) {  // 100MB
                response.sendError(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE, "Ảnh quá lớn, không thể tải lên.");
                return;
            }

            // Tạo thư mục lưu ảnh nếu chưa có
            File uploadDir = new File(IMAGE_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // Tạo thư mục nếu chưa có
            }

            // Kiểm tra nếu ảnh có đuôi .png và chuyển đổi sang .jpg
            if (fileName.endsWith(".png")) {
                // Đọc ảnh PNG
                BufferedImage bufferedImage = ImageIO.read(imagePart.getInputStream());

                // Chuyển đổi tên file thành .jpg
                fileName = fileName.replace(".png", ".jpg");

                // Giảm kích thước ảnh nếu cần thiết (chỉ là ví dụ, có thể điều chỉnh theo yêu cầu)
                int width = bufferedImage.getWidth();
                int height = bufferedImage.getHeight();
                int newWidth = width / 2;
                int newHeight = height / 2;
                Image resizedImage = bufferedImage.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
                BufferedImage resizedBufferedImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
                resizedBufferedImage.getGraphics().drawImage(resizedImage, 0, 0, null);

                // Lưu ảnh dưới dạng JPG
                File outputFile = new File(IMAGE_DIRECTORY + fileName);
                ImageIO.write(resizedBufferedImage, "jpg", outputFile);
                System.out.println("Ảnh đã được chuyển đổi và lưu vào: " + outputFile.getAbsolutePath());
            } else {
                // Nếu không phải .png thì lưu trực tiếp
                String filePath = IMAGE_DIRECTORY + fileName;
                imagePart.write(filePath);
                System.out.println("Ảnh đã được lưu vào: " + filePath);
            }

            // Đường dẫn ảnh trong thư mục webapp
            imagePath = "images/" + fileName;

            // Kiểm tra và chuẩn hóa dữ liệu đầu vào
            if (price == null) {
                gia = 0.0f;  // Nếu không có giá thì gán giá trị mặc định
            }
            if (category == null) {
                thuMuc = 0;  // Nếu không có danh mục thì gán giá trị mặc định
            }
            if (name == "") {
                name = null;  // Nếu tên trống thì gán null
            }
System.out.println("Lỗi chõo dưới");
            // Cập nhật thông tin sản phẩm vào cơ sở dữ liệu
            boolean ktra = lg.updateSanPham(Integer.parseInt(productId), name, thuMuc, gia, imagePath, description);
            if (ktra) {
                RequestDispatcher rd = request.getRequestDispatcher("productquantri.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("productquantri.jsp");
                rd.forward(request, response);
            }
        }
    }
}
