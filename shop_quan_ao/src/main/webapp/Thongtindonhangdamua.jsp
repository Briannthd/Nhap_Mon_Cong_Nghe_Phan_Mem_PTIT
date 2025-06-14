<%@page import="model.SanPham"%>
<%@page import="model.ChiTietSanPham"%>
<%@page import="model.DonHang"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="icon" type="image/png" href="images/icons/LOGOTHE5IVE.jpg"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Đơn Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
        }
        .order-container {
            max-width: 1200px;
            margin: 20px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .order-header {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .order-header h2 {
            margin: 0;
            font-size: 1.8rem;
        }
        .order-header .btn-back {
            background: #ffc107;
            border: none;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9rem;
        }
        .order-header .btn-back:hover {
            background: #e0a800;
        }
        .table-responsive {
            padding: 20px;
        }
        .table {
            margin: 0;
            border-collapse: collapse;
        }
        .table th {
            background-color: #eaf4ff;
            text-align: center;
            color: #495057;
            font-weight: bold;
            border: 1px solid #dee2e6;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
            border: 1px solid #dee2e6;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f9fcff;
        }
        .date {
            font-size: 0.9em;
            color: #6c757d;
        }
        .btn-back {
            margin-left: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #6c757d;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn-back:hover {
            background-color: #5a6268;
        }
        @media (max-width: 768px) {
            .order-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .order-header h2 {
                margin-bottom: 10px;
                font-size: 1.4rem;
            }
            .table-responsive {
                padding: 10px;
            }
            .table {
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>
<div class="order-container">
    <div class="order-header">
    <a href="Laydulieusanpham">
     <button class="btn-back">⟵ Quay Lại</button>
    </a>
       
        <h2>Thông Tin Đơn Hàng</h2>
    </div>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="thead-light">
                <tr>
                    <th>#</th>
                    <th>Tên Khách Hàng</th>
                    <th>Số Điện Thoại</th>
                    <th>Địa Chỉ Giao Hàng</th>
                    <th>Tên Sản Phẩm</th>
                    <th>Kích Thước</th>
                    <th>Màu Sắc</th>
                    <th>Số Lượng</th>
                    <th>Giá</th>
                    <th>Trạng Thái</th>
                    <th>Ngày Đặt Hàng</th>
                    
                </tr>
            </thead>
            <tbody>
            <%
            HttpSession ss = request.getSession(false);
            List<User> user = (List<User>) ss.getAttribute("Ghinhotaikhoan");
            if(user != null){
            	Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
            	LaydulieuReponsitory lg = new LaydulieuReponsitory();
            	List<DonHang> dh = lgn.LayThongTinDonHang();
            	List<ChiTietSanPham> c = lg.Laythongtinchitietsanpham();
            	List<SanPham> sp = lg.Laythongtinsanpham();
            	int i = 1;
            	for(User u : user){
            	for(DonHang d : dh){
            		if(d.getMaNguoiDung()==u.getMaTaiKhoan()){
            %>
                <tr>
                    <td><%=i %></td>
                    <%i = i+1; %>
                    <td><%=d.getTenKhachHang() %></td>
                    <td><%=d.getSoDienThoai() %></td>
                    <td><%=d.getDiaChiGiaoHang() %></td>
                    <%
                    for(ChiTietSanPham chiTiet : c){
                    if(chiTiet.getIdChiTietSanPham()==d.getMaChiTietSanPham()){
                    	for(SanPham s : sp){
                    		if(s.getMaSanpham()==chiTiet.getMaSanPham()){
                    
                    
                    %>
                    <td><%=s.getTenSanPham() %></td>
                    <%} }%>
                    <td><%=chiTiet.getKichCo() %></td>
                    <td><%=chiTiet.getMauSac() %></td>
                    <%}} %>
                    <td><%=d.getSoLuong() %></td>
                    <td><%=d.getGia() %></td>
                    <td><%=d.getTrangThai() %></td>
                    <td class="date"><%=d.getNgayDatHang() %></td>
                    <%if(d.getTrangThai().equalsIgnoreCase("đang chuẩn bị hàng")) {%>
                    <td>
                    <form action="Huydonhangdadat" method="post">
                    <input name="idDonHang" value="<%=d.getMaDonHang()%>" type="hidden">
                    <button class="btn btn-danger btn-lg" onclick="thongbao()">Hủy</button>
                    </form>
                     </td>
                     <%} %>
                </tr>
                <%} }}}else{%>
                <script >
                alert("Vui lòng đăng nhập để xem thông tin"); // Hiển thị thông báo
                window.location.href = "login.jsp";
              </script>
                <%} %>
                <!-- Add more rows dynamically -->
            </tbody>
        </table>
    </div>
</div>
<script>
thongbao(){
	alert("Bạn có chắc xóa đơn hàng này chứ");
}

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
