package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ChiTietSanPham;
import model.SanPham;

import java.io.IOException;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class XacNhanandHuyDonHang
 */
@WebServlet("/XacNhanandHuyDonHang")
public class XacNhanandHuyDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private LaydulieuReponsitory lg = new LaydulieuReponsitory();
      private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
    public XacNhanandHuyDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String mauSac = request.getParameter("mauSac");
		String kichThuoc = request.getParameter("kichThuoc");
		String soLuong = request.getParameter("soLuong");
		String hoTen = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienThoai");
		String diaChi = request.getParameter("diaChi");
		String maTaiKhoanUser = request.getParameter("maTaiKhoanUser");
		float gia = Float.parseFloat(request.getParameter("gia"));
		String time = request.getParameter("time");
		String xacNhanDonHang = request.getParameter("Xacnhandonhang");
		String huyDonHang = request.getParameter("Huydonhang");
		
//		xuất nút hủy đơn hàng
		System.out.println("tên nút huỷ là: "+ huyDonHang);
//		xuất nút xác nhận đơn hàng
		System.out.println("nuts đơn hàng là: "+ xacNhanDonHang);
		if(huyDonHang==null) {
			int idChiTietSanPham = lgn.LayChiTietSanPham(id, mauSac, kichThuoc);
			boolean ktra = lgn.CapNhatDonHangNguoiDung(Integer.parseInt(maTaiKhoanUser), idChiTietSanPham, hoTen, Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng", Integer.parseInt(soLuong), gia,time);
			if(ktra) {
				int soLuongChiTiet = lgn.LaySoLuongChiTiet(idChiTietSanPham);
				
				if(soLuongChiTiet > 0) {
					int soLuongConLai = soLuongChiTiet -Integer.parseInt(soLuong);
					System.out.println("số lượng còn lại là "+soLuongConLai);
					boolean ktracapnhat = lgn.UpdateBangChiTiet(idChiTietSanPham, soLuongConLai);
				}
				
			}
			List<SanPham> listSP = lg.Laythongtinsanpham();
			List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
			request.setAttribute("listSanPham", listSP);
			request.setAttribute("listChiTietSanPham", listChiTietSanPham);
			request.setAttribute("idSanPham", id);
			request.getRequestDispatcher("product-detail.jsp").forward(request, response);
			
		}else if(xacNhanDonHang == null){
			List<SanPham> listSP = lg.Laythongtinsanpham();
			List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
			request.setAttribute("listSanPham", listSP);
			request.setAttribute("listChiTietSanPham", listChiTietSanPham);
			request.setAttribute("idSanPham", id);
			request.getRequestDispatcher("product-detail.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String mauSac = request.getParameter("mauSac");
		String kichThuoc = request.getParameter("kichThuoc");
		String soLuong = request.getParameter("soLuong");
		String hoTen = request.getParameter("hoTen");
		String soDienThoai = request.getParameter("soDienThoai");
		String diaChi = request.getParameter("diaChi");
		String maTaiKhoanUser = request.getParameter("maTaiKhoanUser");
		float gia = Float.parseFloat(request.getParameter("gia"));
		String time = request.getParameter("time");
		String xacNhanDonHang = request.getParameter("Xacnhandonhang");
		String huyDonHang = request.getParameter("Huydonhang");
		int soLuongDonHang = Integer.parseInt(soLuong);
//		xuất nút hủy đơn hàng
		System.out.println("tên nút huỷ là: "+ huyDonHang);
//		xuất nút xác nhận đơn hàng
		System.out.println("nuts đơn hàng là: "+ xacNhanDonHang);
		boolean ktra = false;
		int LaySoLuongTonTaiDonHang = 0;
		if(huyDonHang==null) {
			int idChiTietSanPham = lgn.LayChiTietSanPham(id, mauSac, kichThuoc);
			 LaySoLuongTonTaiDonHang = lgn.CheckDonHangTonTaiChua(Integer.parseInt(maTaiKhoanUser), idChiTietSanPham, hoTen, Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng",  gia);
			if(LaySoLuongTonTaiDonHang>0) {
				int soLuongDonHangMoi = LaySoLuongTonTaiDonHang + soLuongDonHang;
				float giaMoi = soLuongDonHangMoi *gia;
				int idDonHang = lgn.LayidDonHang(Integer.parseInt(maTaiKhoanUser), idChiTietSanPham, hoTen, Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng",  gia);
				boolean l = lgn.updateDonHang(idDonHang, soLuongDonHangMoi,giaMoi);
					int soLuongChiTiet = lgn.LaySoLuongChiTiet(idChiTietSanPham);
					
					if(soLuongChiTiet > 0) {
						int soLuongConLai = soLuongChiTiet - soLuongDonHang;
						boolean ktracapnhat = lgn.UpdateBangChiTiet(idChiTietSanPham, soLuongConLai);
					}
					
				
				List<SanPham> listSP = lg.Laythongtinsanpham();
				List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
				request.setAttribute("listSanPham", listSP);
				request.setAttribute("listChiTietSanPham", listChiTietSanPham);
				request.setAttribute("idSanPham", id);
				request.getRequestDispatcher("product-detail.jsp").forward(request, response);
			}else {
				 ktra = lgn.CapNhatDonHangNguoiDung(Integer.parseInt(maTaiKhoanUser), idChiTietSanPham, hoTen, Integer.parseInt(soDienThoai), diaChi, "đang chuẩn bị hàng", soLuongDonHang, gia,time);
				 if(ktra) {
						int soLuongChiTiet = lgn.LaySoLuongChiTiet(idChiTietSanPham);
						
						if(soLuongChiTiet > 0) {
							int soLuongConLai = soLuongChiTiet - soLuongDonHang;
							System.out.println("số lượng còn lại là "+soLuongConLai);
							boolean ktracapnhat = lgn.UpdateBangChiTiet(idChiTietSanPham, soLuongConLai);
						}
						
					}
					List<SanPham> listSP = lg.Laythongtinsanpham();
					List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
					request.setAttribute("listSanPham", listSP);
					request.setAttribute("listChiTietSanPham", listChiTietSanPham);
					request.setAttribute("idSanPham", id);
					request.getRequestDispatcher("product-detail.jsp").forward(request, response);
			}
			
			
			
		}else if(xacNhanDonHang == null){
			List<SanPham> listSP = lg.Laythongtinsanpham();
			List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
			request.setAttribute("listSanPham", listSP);
			request.setAttribute("listChiTietSanPham", listChiTietSanPham);
			request.setAttribute("idSanPham", id);
			request.getRequestDispatcher("product-detail.jsp").forward(request, response);
		}
	}

}
