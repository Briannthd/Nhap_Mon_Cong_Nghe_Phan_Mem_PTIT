package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DanhMuc;
import model.SanPham;
import Reponsitory.LaydulieuReponsitory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet("/Cuahang")
public class Cuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LaydulieuReponsitory lg = new LaydulieuReponsitory();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<DanhMuc> listDanhMuc = new ArrayList<DanhMuc>();
		List<DanhMuc> l = lg.Laythongtidanhmuc();
		for(DanhMuc danhMuc : l) {
			if(!danhMuc.getDaXoa().equals("1")) {
				listDanhMuc.add(danhMuc);
			}
		}
		request.setAttribute("listDanhMuc", listDanhMuc);

		// Nhận các tham số lọc
		String loai = request.getParameter("loai"); // VD: nu, nam, tui
		String gia = request.getParameter("gia");   // VD: 0-50, 100-200, 200+
		String mau = request.getParameter("mau");   // VD: Đen, Trắng, Xanh...

		List<SanPham> list;
		
		// 1. Lọc theo danh mục
		if (loai != null && !loai.isEmpty()) {
			

			int idDM = 0;
			for(DanhMuc d : listDanhMuc) {
				if(d.getTenDanhMuc().equalsIgnoreCase(loai)) {
					idDM = d.getMaDanhmuc();
				}
			}
			list = lg.LaythongtinsanphamTheoDanhMuc(idDM);
			
		} else {
			
			list = lg.Laythongtinsanpham();
			loai = "";
		}

		// 2. Lọc theo màu (nếu có)
		if (mau != null && !mau.isEmpty()) {
			List<SanPham> filteredByColor = lg.laySanPhamTheoMau(mau);
			List<SanPham> temp = new ArrayList<>();

			// Giữ lại sản phẩm vừa thuộc danh mục, vừa có màu
			for (SanPham sp : list) {
				for (SanPham spColor : filteredByColor) {
					if (sp.getMaSanpham() == spColor.getMaSanpham()) {
						temp.add(sp);
						break;
					}
				}
			}
			list = temp;
		}

		// 3. Lọc theo giá
//		if (gia != null && !gia.isEmpty()) {
//			List<SanPham> filteredByPrice = new ArrayList<>();
//			double min = 0;
//			double max = Double.MAX_VALUE;
//
//			try {
//				if (gia.contains("-")) {
//					String[] parts = gia.split("-");
//					min = Double.parseDouble(parts[0]);
//					max = Double.parseDouble(parts[1]);
//				} else if (gia.endsWith("+")) {
//					min = Double.parseDouble(gia.replace("+", ""));
//				}
//
//				for (SanPham sp : list) {
//					if (sp.getGia() >= min && sp.getGia() <= max) {
//						filteredByPrice.add(sp);
//					}
//				}
//
//				list = filteredByPrice;
//			} catch (NumberFormatException e) {
//				e.printStackTrace(); // log lỗi nếu giá không hợp lệ
//			}
//		}// 3. Lọc theo giá
		if (gia != null && !gia.isEmpty()) {
		    List<SanPham> filteredByPrice = new ArrayList<>();
		    double min = 0;
		    double max = Double.MAX_VALUE;

		    try {
		        if (gia.contains("-")) {
		            String[] parts = gia.split("-");
		            min = Double.parseDouble(parts[0]) * 1000;
		            max = Double.parseDouble(parts[1]) * 1000;
		        } else if (gia.endsWith("+")) {
		            min = Double.parseDouble(gia.replace("+", "")) * 1000;
		            max = Double.MAX_VALUE;
		        }

		        for (SanPham sp : list) {
		            if (sp.getGia() >= min && sp.getGia() <= max) {
		                filteredByPrice.add(sp);
		            }
		        }

		        list = filteredByPrice;
		    } catch (NumberFormatException e) {
		        e.printStackTrace(); // log lỗi nếu giá không hợp lệ
		    }
		}


		// 4. Gửi dữ liệu sang JSP
		request.setAttribute("listHome", list);
		request.setAttribute("currentLoai", loai);
		request.setAttribute("currentGia", gia);
		request.setAttribute("currentMau", mau);

		request.getRequestDispatcher("/product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
