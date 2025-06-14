<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<link rel="icon" type="image/png" href="images/icons/LOGOTHE5IVE.jpg"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Đơn Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 1200px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 36px;
            color: #333;
        }

        .order-date {
            background-color: #e7f4e4;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .order-date p {
            font-size: 20px;
            font-weight: bold;
            color: #2ecc71;
            margin: 0;
        }

        .order-summary {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .order-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #fafafa;
            border-radius: 8px;
        }

        .order-item span {
            font-size: 18px;
        }

        .order-item .price {
            font-weight: bold;
            color: #333;
        }

        .order-item .original-price {
            text-decoration: line-through;
            color: #999;
        }

        .total {
            display: flex;
            justify-content: space-between;
            font-size: 20px;
            margin-top: 30px;
            font-weight: bold;
        }

        .total .final-price {
            color: #e74c3c;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 30px;
        }

        .button {
            flex: 1;
            padding: 15px;
            color: white;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .confirm-button {
            background-color: #2ecc71;
        }

        .confirm-button:hover {
            background-color: #27ae60;
        }

        .cancel-button {
            background-color: #e74c3c;
        }

        .cancel-button:hover {
            background-color: #c0392b;
        }

        .footer {
            text-align: center;
            margin-top: 50px;
            font-size: 14px;
            color: #777;
        }

        .footer a {
            color: #2ecc71;
            text-decoration: none;
        }

        dialog {
            border: none;
            border-radius: 12px;
            padding: 20px 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            text-align: center;
            font-size: 18px;
            animation: fadeIn 0.3s ease;
        }

        dialog::backdrop {
            background: rgba(0, 0, 0, 0.4);
        }

        dialog button {
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        dialog button:hover {
            opacity: 0.9;
        }

        #successDialog button {
            background-color: #2ecc71;
            color: white;
        }

        #cancelDialog form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 15px;
        }

        #cancelDialog button[type="submit"] {
            background-color: #e74c3c;
            color: white;
        }

        #cancelDialog button[type="button"] {
            background-color: #bdc3c7;
            color: #2c3e50;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
<div class="container">
    <form action="XacNhanandHuyDonHang" method="post">
        <div class="header">
            <h1>Xác Nhận Đơn Hàng</h1>
        </div>

        <%
        String hoTen = (String) request.getAttribute("hoTen");
        String soDienThoai = (String) request.getAttribute("soDienThoai");
        String diaChi = (String) request.getAttribute("diaChi");
        String maTaiKhoanUser = (String) request.getAttribute("maTaiKhoanUser");
        String kichThuoc = (String) request.getAttribute("kichThuoc");
        String mauSac = (String) request.getAttribute("mauSac");
        String soLuong = (String) request.getAttribute("soLuong");
        int id = (int) request.getAttribute("idSanPham");
        float giaCU = (float) request.getAttribute("gia");
        String tenSanPham = (String) request.getAttribute("tenSanPham");
        String time = (String) request.getAttribute("thoiGian");
        float giaSauKhiGiam = (float) request.getAttribute("giaSauKhiGiam");
        %>

        <div class="order-date">
            <p><strong>Ngày Đặt Hàng: <%=time %></strong></p>
        </div>

        <!-- Hidden input fields -->
        <input type="hidden" name="hoTen" value="<%=hoTen %>">
        <input type="hidden" name="soDienThoai" value="<%=soDienThoai %>">
        <input type="hidden" name="diaChi" value="<%=diaChi %>">
        <input type="hidden" name="maTaiKhoanUser" value="<%=maTaiKhoanUser %>">
        <input type="hidden" name="mauSac" value="<%=mauSac %>">
        <input type="hidden" name="kichThuoc" value="<%=kichThuoc %>">
        <input type="hidden" name="soLuong" value="<%=soLuong %>">
        <input type="hidden" name="id" value="<%=id %>">
        <input type="hidden" name="time" value="<%=time %>">
        <input type="hidden" name="tenSanPham" value="<%=tenSanPham %>">
        <input type="hidden" name="gia" value="<%= giaSauKhiGiam != 0 ? giaSauKhiGiam : giaCU %>">

        <div class="order-summary">
            <div class="order-item">
                <span><%=tenSanPham %></span>
                <% if(giaSauKhiGiam != 0) { %>
                    <span class="price original-price"><%=String.format("%.2f", giaCU)%>₫</span>
                <% } else { %>
                    <span class="price"><%=String.format("%.2f", giaCU)%>₫</span>
                <% } %>
            </div>
            <% if(giaSauKhiGiam != 0) { %>
                <div class="order-item">
                    <span>Giảm giá (<%=String.format("%.0f", (1 - giaSauKhiGiam/giaCU)*100)%>%)</span>
                    <span class="price"><%=String.format("%.2f", (giaCU - giaSauKhiGiam))%>₫</span>
                </div>
            <% } %>
        </div>

        <div class="total">
            <span>Tổng cộng</span>
            <span class="final-price"><%= giaSauKhiGiam != 0 ? giaSauKhiGiam : giaCU %></span>
        </div>

        <div class="button-group">
            <button class="button confirm-button" onclick="confirmOrder(event)" name="Xacnhandonhang" value="Xacnhandonhang">Xác Nhận Đơn Hàng</button>
            <button class="button cancel-button" onclick="cancelOrder(event)" name="Huydonhang" value="Huydonhang">Hủy</button>
        </div>
    </form>
</div>

<div class="footer">
    <p>© 2024 <a href="#">Cửa Hàng Online</a>. Tất cả các quyền được bảo lưu.</p>
</div>

<!-- Success Dialog -->
<dialog id="successDialog">
    <p>🎉 Đơn hàng của bạn đã được xác nhận thành công!</p>
    <button onclick="submitForm()">OK</button>
</dialog>

<!-- Cancel Dialog -->
<dialog id="cancelDialog">
    <p>❗ Bạn có chắc chắn muốn hủy đơn hàng không?</p>
    <form method="post" action="XacNhanandHuyDonHang">
        <!-- Hidden fields -->
        <input type="hidden" name="hoTen" value="<%=hoTen %>">
        <input type="hidden" name="soDienThoai" value="<%=soDienThoai %>">
        <input type="hidden" name="diaChi" value="<%=diaChi %>">
        <input type="hidden" name="maTaiKhoanUser" value="<%=maTaiKhoanUser %>">
        <input type="hidden" name="mauSac" value="<%=mauSac %>">
        <input type="hidden" name="kichThuoc" value="<%=kichThuoc %>">
        <input type="hidden" name="soLuong" value="<%=soLuong %>">
        <input type="hidden" name="id" value="<%=id %>">
        <input type="hidden" name="time" value="<%=time %>">
        <input type="hidden" name="tenSanPham" value="<%=tenSanPham %>">
        <input type="hidden" name="gia" value="<%= giaSauKhiGiam != 0 ? giaSauKhiGiam : giaCU %>">
        <input type="hidden" name="Huydonhang" value="Huydonhang">

        <button type="submit">Có, hủy đơn</button>
        <button type="button" onclick="document.getElementById('cancelDialog').close()">Không</button>
    </form>
</dialog>

<script>
    function confirmOrder(event) {
        event.preventDefault();
        document.getElementById("successDialog").showModal();
    }

    function submitForm() {
        document.querySelector("form").submit();
    }

    function cancelOrder(event) {
        event.preventDefault();
        document.getElementById("cancelDialog").showModal();
    }
</script>
</body>
</html>
