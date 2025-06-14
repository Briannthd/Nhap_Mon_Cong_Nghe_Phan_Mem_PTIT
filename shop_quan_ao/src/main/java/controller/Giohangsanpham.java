package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ChiTietSanPham;
import model.GioHang;
import model.SanPham;
import model.User;

import java.io.IOException;
import java.util.List;

import Reponsitory.LaydulieuReponsitory;
import Reponsitory.Laydulieuchonguoidung;

/**
 * Servlet implementation class Giohangsanpham
 */
@WebServlet("/Giohangsanpham")
public class Giohangsanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
	private LaydulieuReponsitory lg = new LaydulieuReponsitory();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Giohangsanpham() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nameButton = request.getParameter("datHang");
		int idSanPham = Integer.parseInt(request.getParameter("idSanPham"));
		String kichCo = request.getParameter("kichThuoc");
		String mauSac = request.getParameter("mauSac");
		int soLuong = Integer.parseInt(request.getParameter("soLuong"));
		if (nameButton.equals("datHang")) {
			boolean ktra = lgn.CheckSanPhamTonTai(idSanPham, mauSac, kichCo);
			if (ktra) {
				request.setAttribute("idSanPham", idSanPham);
				request.setAttribute("kichCo", kichCo);
				request.setAttribute("mauSac", mauSac);
				request.setAttribute("soLuong", soLuong);
				request.getRequestDispatcher("Donhang.jsp").forward(request, response);
			} else {
				List<SanPham> listSP = lg.Laythongtinsanpham();
				List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
				request.setAttribute("listSanPham", listSP);
				request.setAttribute("listChiTietSanPham", listChiTietSanPham);
				request.setAttribute("idSanPham", idSanPham);
				request.setAttribute("loiTonTai", "Sản phẩm đã hết hàng.");
				request.getRequestDispatcher("product-detail.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String datHang = request.getParameter("datHang");
		int idSanPham = Integer.parseInt(request.getParameter("idSanPham"));
		String kichCo = request.getParameter("kichThuoc");
		String mauSac = request.getParameter("mauSac");
		int soLuong = Integer.parseInt(request.getParameter("soLuong"));
		String gioHang = request.getParameter("gioHang");
		HttpSession s = request.getSession(false);
		List<User> listUser = (List<User>) s.getAttribute("Ghinhotaikhoan");
		if(listUser != null) {
			
			if (datHang != null && datHang.equals("datHang")) {
				boolean ktra = lgn.CheckSanPhamTonTai(idSanPham, mauSac, kichCo);
				if (ktra) {
					request.setAttribute("idSanPham", idSanPham);
					request.setAttribute("kichCo", kichCo);
					request.setAttribute("mauSac", mauSac);
					request.setAttribute("soLuong", soLuong);
					request.getRequestDispatcher("Donhang.jsp").forward(request, response);
				} else {
					List<SanPham> listSP = lg.Laythongtinsanpham();
					List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
					request.setAttribute("listSanPham", listSP);
					request.setAttribute("listChiTietSanPham", listChiTietSanPham);
					request.setAttribute("idSanPham", idSanPham);
					HttpSession session = request.getSession();
					session.setAttribute("loiTonTai", "Sản phẩm này đã hết hàng!");
					request.getRequestDispatcher("product-detail.jsp").forward(request, response);
				}
			} else if (gioHang != null && gioHang.equals("gioHang")) {
				boolean ktra = false;
				int idChiTietSanPham = 0;
				List<ChiTietSanPham> listChiTietSanPham = lg.Laythongtinchitietsanpham();
				for(ChiTietSanPham c : listChiTietSanPham) {
					if(c.getMaSanPham() == idSanPham && c.getMauSac().equalsIgnoreCase(mauSac) && c.getKichCo().equalsIgnoreCase(kichCo)) {
						ktra = true;
						idChiTietSanPham = c.getIdChiTietSanPham();
						break;
					}
				}
				System.out.println("Kiếm tra phần giỏ hàng: " + ktra);
				if (ktra) {
					
					
					int maTaiKhoan = 0;
					for (User u : listUser) {
						maTaiKhoan = u.getMaTaiKhoan();
					}
					List<SanPham> listSp = lg.Laythongtinsanpham();
					String duongDanAnh = "";
					String tenSanPham = "";
					float gia = 0;
					for (SanPham sp : listSp) {
						if (sp.getMaSanpham() == idSanPham) {
							duongDanAnh = sp.getDuongDanAnh();
							tenSanPham = sp.getTenSanPham();
							gia = sp.getGia();
						}
					}
					
					gia = soLuong * gia;
					
					List<GioHang> g = lgn.LayHetThongTinGioHang();
//					Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa nếu roài thì lấy sản phẩm ra và cộng thêm
					if(g.isEmpty()) {
						System.out.println("đã vào rỗng chơi");
						boolean ktraThemGioHang = lgn.ThemSanPhamVaoGioHang(maTaiKhoan, idChiTietSanPham, mauSac, kichCo,
								"True", gia, soLuong, duongDanAnh, tenSanPham);
					}else {
						boolean check = false;
						int soLuongTrongGioHang = 0;
						int maGiohang = 0;
						float giaMoi = 0;
						for (GioHang gh : g) {
							if (gh.getMaChiTietSanPham() == idChiTietSanPham && gh.getMauSac().equals(mauSac)
									&& gh.getKichThuoc().equals(kichCo) && gh.getDuongDan().equals(duongDanAnh)
									&& gh.getTenSanPham().equals(tenSanPham) && gh.getMaNguoiDung() == maTaiKhoan) {
								System.out.println("đã đi vào phần list rong chơi tùmlum");
								soLuongTrongGioHang = gh.getSoLuong() + soLuong;
								giaMoi = soLuongTrongGioHang * gia;
								maGiohang = gh.getMaGioHang();
								check = true;
								break;
							}
						}
						if(check) {
							
							boolean checkTonTaiGioHang = lgn.updateSoLuongGioHang(maGiohang, soLuongTrongGioHang,giaMoi);
						}else {
							boolean ktraThemGioHang = lgn.ThemSanPhamVaoGioHang(maTaiKhoan, idChiTietSanPham, mauSac, kichCo,
									"True", gia, soLuong, duongDanAnh, tenSanPham);
						}
						
					}
				
					
					List<SanPham> listSP = lg.Laythongtinsanpham();
					request.setAttribute("listSanPham", listSP);
					request.setAttribute("listChiTietSanPham", listChiTietSanPham);
					request.setAttribute("idSanPham", idSanPham);
					
					request.getRequestDispatcher("product-detail.jsp").forward(request, response);
				}else {
					List<SanPham> listSP = lg.Laythongtinsanpham();
					request.setAttribute("listSanPham", listSP);
					request.setAttribute("listChiTietSanPham", listChiTietSanPham);
					request.setAttribute("idSanPham", idSanPham);
					HttpSession session = request.getSession();
					session.setAttribute("loiTonTai", "Sản phẩm này đã hết hàng!");
					request.getRequestDispatcher("product-detail.jsp").forward(request, response);
				}
			}
			
			
		}else {
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	
	}

}
