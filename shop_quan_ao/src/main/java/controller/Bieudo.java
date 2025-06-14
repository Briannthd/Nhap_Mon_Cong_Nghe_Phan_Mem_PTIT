package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ChiTietSanPham;
import model.DonHang;
import model.SanPham;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

@WebServlet("/Bieudodoanhthu")
public class Bieudo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    private LaydulieuReponsitory lg = new LaydulieuReponsitory();
    public Bieudo() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("đã chạy vô servlet chơi");
    	  List<DonHang> donHangList = lgn.LayThongTinDonHang();
    	  System.out.println("Danh sách đơn hàng: " + donHangList);
    	    // Kiểm tra danh sách không bị null
    	    if (donHangList == null || donHangList.isEmpty()) {
    	        request.setAttribute("doanhThuMap", null); 
    	    } else {
    	        // Tạo map từ danh sách theo ngày huhu
    	    	Map<String, Double> doanhThuUnsortedMap = donHangList.stream()
    	    		    .filter(dh -> dh.getNgayDatHang() != null)
    	    		    .filter(dh -> "Hoàn thành".equalsIgnoreCase(dh.getTrangThai()))
    	    		    .collect(Collectors.groupingBy(
    	    		        DonHang::getNgayDatHang,
    	    		        Collectors.summingDouble(DonHang::getGia)
    	    		    ));

    	    		// Sắp xếp theo ngày (định dạng dd/MM/yyyy)
    	    		Map<String, Double> doanhThuMap = new TreeMap<>((d1, d2) -> {
    	    		    try {
    	    		        Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(d1);
    	    		        Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(d2);
    	    		        return date1.compareTo(date2);
    	    		    } catch (Exception e) {
    	    		        return d1.compareTo(d2); // fallback
    	    		    }
    	    		});
    	    		doanhThuMap.putAll(doanhThuUnsortedMap);

    	        System.out.println("doanh thu là: "+ doanhThuMap);
    	        // theo tháng
    	        Map<Integer, Double> doanhThuTheoThang = getDoanhThuTheoThang(doanhThuMap);

    	        // In ra doanh thu theo tháng
    	        for (Map.Entry<Integer, Double> entry : doanhThuTheoThang.entrySet()) {
    	            System.out.println("Tháng " + entry.getKey() + ": " + entry.getValue());
    	        }
    	        request.setAttribute("doanhthuthang", doanhThuTheoThang);
    	        request.setAttribute("doanhThuMap", doanhThuMap);
    	        
    	        
    	    }
    	    
//    	    Thống kê số lượng hàng bán chạy nhất theo thứ tự từ lớn đến nhỏ
    	    List<SanPham> listSanPham = lg.SanPhamDuocBanChayNhat();
    	    // thống kê số lượng sản phảm
    	    List<SanPham> sp = lg.Laythongtinsanpham();
    	     Map<String, Integer> soLuongsanpham = new HashMap<>(); // khởi tạo ánh xạ
    	     List<ChiTietSanPham> laySoLuongChiTiet = lg.Laythongtinchitietsanpham(); // lấy số lượng trong chi tiết
    	   
    	    for(SanPham s : sp) {
    	    	 int soLuong = 0;
    	    	for(ChiTietSanPham c : laySoLuongChiTiet) {
    	    		if(s.getMaSanpham()==c.getMaSanPham()) {
    	    			soLuong += c.getSoLuong();
    	    			soLuongsanpham.put(s.getTenSanPham(), soLuong);
    	    		}
    	    	}
    	    	
    	    }
    	    for (Map.Entry<String, Integer> entry : soLuongsanpham.entrySet()) {
                System.out.println("Sản phẩm ID: " + entry.getKey() + ", Số lượng: " + entry.getValue());
            }
    	    Gson gson = new Gson();
    	    String soLuongSanPhamJson = gson.toJson(soLuongsanpham);
    	    request.setAttribute("soLuongSanPham", soLuongSanPhamJson);
    	    request.setAttribute("soLuongHangBanChay", listSanPham);
    	    request.getRequestDispatcher("bieudo.jsp").forward(request, response);
    }
    public static Map<Integer, Double> getDoanhThuTheoThang(Map<String, Double> doanhThuTheoNgay) {
        // Tạo Map để lưu doanh thu theo tháng
        Map<Integer, Double> doanhThuTheoThang = new HashMap<>();

        // Lặp qua các mục trong doanhThuTheoNgay
        for (Map.Entry<String, Double> entry : doanhThuTheoNgay.entrySet()) {
            String date = entry.getKey(); // Ngày dạng dd/MM/yyyy
            double revenue = entry.getValue();
            
            // Lấy tháng từ ngày (định dạng dd/MM/yyyy)
            String[] dateParts = date.split("/"); // Tách theo dấu "/"
            int month = Integer.parseInt(dateParts[1]); // Lấy phần tháng từ mảng

            // Tính doanh thu theo tháng
            doanhThuTheoThang.put(month, doanhThuTheoThang.getOrDefault(month, 0.0) + revenue);
        }

        // Trả về doanh thu theo tháng
        return doanhThuTheoThang;
    
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
