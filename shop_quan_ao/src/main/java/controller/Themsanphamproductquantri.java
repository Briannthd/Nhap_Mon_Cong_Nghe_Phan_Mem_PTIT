package controller;

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

/**
 * Servlet implementation class Themsanphamproductquantri
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 100, // Tăng giới hạn kích thước tệp lên 100MB
		maxRequestSize = 1024 * 1024 * 200, // Giới hạn yêu cầu (bao gồm cả ảnh và dữ liệu khác) lên 200MB
		fileSizeThreshold = 1024 * 1024 // Giới hạn bộ nhớ đệm khi tải lên (1MB)
)
@WebServlet("/Themsanphamproductquantri")
public class Themsanphamproductquantri extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// private static final String IMAGE_DIRECTORY = "D:/webjava/webbanquanao/src/main/webapp/images/"; // Đường dẫn lưu
	// 																									// ảnh
	private static final String IMAGE_DIRECTORY = "C:/Users/Thuyen/git/Team_6_Nhap_Mon_Cong_Nghe_Phan_Mem/shop_quan_ao/src/main/webapp/images/";
	private LaydulieuReponsitory lg = new LaydulieuReponsitory();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Themsanphamproductquantri() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tenSanPham = request.getParameter("addTensanpham");
//		int idDanhMuc = Integer.parseInt(request.getParameter("addDanhmucsanpham"));
//		float giaSP = Float.parseFloat(request.getParameter("idGiasanpham"));
		String idDanhMuc = request.getParameter("addDanhmucsanpham");
		String giaSP = request.getParameter("idGiasanpham");
		String moTa = request.getParameter("addMota");

		String imagePath = "";
		
		if (idDanhMuc == null || idDanhMuc.isEmpty() ||
			    giaSP == null || giaSP.isEmpty() ||
			    moTa == null || moTa.isEmpty() ||
			    tenSanPham == null || tenSanPham.isEmpty()) {
			request.setAttribute("loi","khong duoc de trong");
			request.getRequestDispatcher("productquantri.jsp").forward(request, response);
		}
		// Lấy ảnh từ form (tên trường input là "image")
		Part imagePart = request.getPart("image");

		// Kiểm tra nếu có ảnh tải lên
		if (imagePart != null) {
			String fileName = Path.of(imagePart.getSubmittedFileName()).getFileName().toString();
			System.out.println("Đã tải lên ảnh: " + fileName);

			// Kiểm tra kích thước tệp, nếu quá lớn thì không tải
			long fileSize = imagePart.getSize();
			if (fileSize > 1024 * 1024 * 100) { // 100MB
				response.sendError(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE, "Ảnh quá lớn, không thể tải lên.");
				return;
			}

			// Tạo thư mục lưu ảnh nếu chưa có
			File uploadDir = new File(IMAGE_DIRECTORY);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs(); // Tạo thư mục nếu chưa có
			}

			// Kiểm tra nếu ảnh có đuôi .png và chuyển đổi sang .jpg
			if (fileName.endsWith(".png")) {
				// Đọc ảnh PNG
				BufferedImage bufferedImage = ImageIO.read(imagePart.getInputStream());

				// Chuyển đổi tên file thành .jpg
				fileName = fileName.replace(".png", ".jpg");

				// Giảm kích thước ảnh nếu cần thiết (chỉ là ví dụ, có thể điều chỉnh theo yêu
				// cầu)
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

			// Đường dẫn ảnh trong thư mục webapp

			System.out.println("Tên sản phẩm: " + tenSanPham);
			System.out.println("ID danh mục: " + idDanhMuc);
			System.out.println("Giá sản phẩm: " + giaSP);
			System.out.println("Mô tả: " + moTa);
			System.out.println("Đường dẫn ảnh: " + imagePath);
			if(tenSanPham == null || idDanhMuc == null || giaSP == null || moTa == null) {
				request.getRequestDispatcher("productquantri.jsp").forward(request, response);
			}
			boolean ktra = lg.addSanPham(tenSanPham, Integer.parseInt(idDanhMuc), Float.parseFloat(giaSP), moTa,
					imagePath);

			if (ktra) {
				request.getRequestDispatcher("productquantri.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("productquantri.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
