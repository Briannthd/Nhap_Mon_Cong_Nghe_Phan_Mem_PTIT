<%@page import="model.SanPham"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Đơn Hàng</title>

    <!-- Thêm CSS -->
    <style>
        /* Tổng thể giao diện */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f4f8;
            color: #444;
            transition: all 0.3s ease;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .order-details {
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 40px;
            background-color: #ffffff;
            transform: translateY(20px);
            animation: slideIn 0.5s ease-out;
        }

        .order-details h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #007bff;
            font-weight: 500;
        }

        .customer-info {
            margin-bottom: 30px;
        }

        .customer-info input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            font-size: 16px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        .customer-info input:focus {
            border-color: #007bff;
            background-color: #e6f0ff;
        }

        .product-info {
            margin-bottom: 20px;
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .product-item {
            display: flex;
            flex: 1;
            max-width: 45%;
            background-color: #fafafa;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            align-items: center;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease;
        }

        .product-item:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
        }

        .product-img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 15px;
            transition: transform 0.3s ease;
        }

        .product-img:hover {
            transform: scale(1.1);
        }

        .product-details {
            flex: 1;
        }

        .product-details p {
            margin: 8px 0;
            color: #555;
        }

        .promo-code input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            background-color: #f9f9f9;
        }

        .promo-code input:focus {
            border-color: #007bff;
            background-color: #e6f0ff;
        }

        .buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
        }

        .button {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .button:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }

        .button-secondary {
            background-color: #28a745;
        }

        .button-secondary:hover {
            background-color: #218838;
            transform: translateY(-3px);
        }

        /* Hiệu ứng load trang */
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            0% {
                transform: translateY(50px);
                opacity: 0;
            }

            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .product-item {
                max-width: 100%;
            }

            .product-list {
                flex-direction: column;
            }

            .buttons {
                flex-direction: column;
            }

            .button {
                width: 100%;
                margin-bottom: 15px;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Xác Nhận Đơn Hàng</h1>
        <form action="Xacnhandathang" method="post"> 
            <div class="order-details">
                <!-- Thông tin khách hàng -->
                <div class="customer-info">
                    <h3>Thông Tin Khách Hàng</h3>
                    <%
                        LaydulieuReponsitory lg = new LaydulieuReponsitory();
                        HttpSession s = request.getSession(false);
                        List<User> listUser = (List<User>) session.getAttribute("Ghinhotaikhoan");
                        User user = null;
                        if (listUser != null && !listUser.isEmpty()) {
                            user = listUser.get(0); // Lấy người dùng đầu tiên (giả định chỉ có 1 người dùng trong danh sách)
                    %>
                    <input type="text" placeholder="Họ và tên" value="<%=user.getHoTen()%>" name="hoTen" required>
                    <input type="text" placeholder="Số điện thoại" value="<%=user.getSoDienThoai()%>" name="soDienThoai" required>
                    <input type="text" placeholder="Địa chỉ giao hàng" value="<%=user.getDiaChi()%>" name="diaChiGiaoHang" required>
                    <input type="hidden" name="maTaiKhoanUser" value="<%=user.getMaTaiKhoan()%>" required>
                    <%
                        } else {
                            out.println("<p style='color: red;'>Không tìm thấy thông tin người dùng. Vui lòng đăng nhập lại.</p>");
                            return;
                        }
                    %>
                </div>

                <!-- Thông tin sản phẩm -->
                <div class="product-info">
                    <h3>Thông Tin Sản Phẩm</h3>
                    <div class="product-list">
                        <div class="product-item">
                            <%
                                int idSanPham = (int) request.getAttribute("idSanPham");
                                String kichThuoc = (String) request.getAttribute("kichCo");
                                String mauSac = (String) request.getAttribute("mauSac");
                                int soLuong = (int) request.getAttribute("soLuong");
                                List<SanPham> ss = lg.Laythongtinsanpham();
                                SanPham sanPham = null;
                                for (SanPham sp : ss) {
                                    if (sp.getMaSanpham() == idSanPham) {
                                        sanPham = sp;
                                        break;
                                    }
                                }
                                if (sanPham != null) {
                            %>
                            <img src="<%=sanPham.getDuongDanAnh()%>" alt="Sản phẩm" class="product-img">
                            <div class="product-details">
                                <p><strong>Tên sản phẩm:</strong> <%=sanPham.getTenSanPham()%></p>
                                <p><strong>Kích cỡ:</strong> <%=kichThuoc%></p>
                                <p><strong>Màu sắc:</strong> <%=mauSac%></p>
                                <p><strong>Số lượng:</strong> <%=soLuong%></p>
                                <p><strong>Giá sản phẩm:</strong> $<%=String.format("%.2f", sanPham.getGia())%></p>
                                <p><strong>Tổng giá:</strong> $<%=String.format("%.2f", sanPham.getGia() * soLuong)%></p>
                                <input type="hidden" name="giaSanPham" value="<%=sanPham.getGia()%>">
                                <input type="hidden" name="tongGia" value="<%=sanPham.getGia() * soLuong%>">
                                <input type="hidden" name="tenSanPham" value="<%=sanPham.getTenSanPham()%>">
                                <input type="hidden" name="idSanPham" value="<%=idSanPham%>">
                                <input type="hidden" name="kichThuoc" value="<%=kichThuoc%>">
                                <input type="hidden" name="mauSac" value="<%=mauSac%>">
                                <input type="hidden" name="soLuong" value="<%=soLuong%>">
                            </div>
                            <%
                                } else {
                                    out.println("<p style='color: red;'>Không tìm thấy sản phẩm.</p>");
                                    return;
                                }
                            %>
                        </div>
                    </div>
                </div>

                <!-- Nhập mã khuyến mãi -->
                <div class="promo-code">
                    <h3>Mã Khuyến Mãi</h3>
                    <input type="text" placeholder="Nhập mã khuyến mãi (nếu có)" name="maKhuyenMai">
                </div>

                <!-- Nút Quay lại và Đặt hàng -->
                <div class="buttons">
                    <%
                        if (user != null && sanPham != null) {
                    %>
                    <a href="XacNhanandHuyDonHang?id=<%=idSanPham%>&mauSac=<%=mauSac%>&kichThuoc=<%=kichThuoc%>&soLuong=<%=soLuong%>&hoTen=<%=user.getHoTen()%>&soDienThoai=<%=user.getSoDienThoai()%>&diaChi=<%=user.getDiaChi()%>&maTaiKhoanUser=<%=user.getMaTaiKhoan()%>&gia=<%=sanPham.getGia()%>&time=<%=System.currentTimeMillis()%>&Huydonhang=HuyDonHang" class="button button-secondary">Quay lại</a>
                    <%
                        } else {
                            out.println("<a href='error.jsp?message=MissingUserOrProductInfo' class='button button-secondary'>Quay lại</a>");
                        }
                    %>
                    <button type="submit" class="button">Đặt hàng</button>
                </div>
            </div>
        </form>
    </div>
</body>

</html>
    