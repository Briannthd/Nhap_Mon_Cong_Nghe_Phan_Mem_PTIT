<%@page import="model.GioHang"%>
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
    <title>Trang Thanh Toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .customer-info, .cart-container {
            margin-bottom: 20px;
        }

        .customer-info h3, .cart-container h3 {
            margin-bottom: 10px;
            color: #555;
        }

        .customer-info p {
            margin: 5px 0;
            color: #666;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .cart-item img {
            width: 80px;
            height: auto;
            border-radius: 5px;
        }

        .cart-item .product-info {
            flex: 1;
            margin-left: 15px;
        }

        .cart-item .product-info h4 {
            margin: 0;
            color: #333;
        }

        .cart-item .product-info p {
            margin: 5px 0;
            color: #666;
        }

        .cart-item .product-info label {
            font-size: 14px;
            color: #333;
        }

        .cart-item input[type="number"] {
            width: 60px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 48%;
        }

        .btn-cancel {
            background-color: #ff4d4d;
            color: white;
        }

        .btn-confirm {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Trang Thanh Toán</h1>
        
        <%
        List<User> user = (List<User>) request.getAttribute("user");
        List<GioHang> gioHang = (List<GioHang>) request.getAttribute("gioHang");
        for(User u : user){
        %>
        <!-- Thông tin khách hàng -->
        <div class="customer-info">
            <h3>Thông tin khách hàng</h3>
            <input value="<%=u.getHoTen()%>">
            <input value="<%=u.getSoDienThoai()%>">
            <input value="<%=u.getDiaChi()%>">
        </div>
        <%} %>

        <!-- Thông tin giỏ hàng -->
        <div class="cart-container">
            <h3>Sản phẩm</h3>
            <%
            for(GioHang g : gioHang){
            %>
            <div class="cart-item">
                <img src="<%=g.getDuongDan()%>" alt="Sản phẩm">
                <div class="product-info">
                    <h4><%=g.getTenSanPham()%></h4>
                    <p>Giá: <%=g.getGia() %></p>
                    <p>Số lượng: <%=g.getSoLuong()%></p>
                    <p>Màu sắc: <%=g.getMauSac() %></p>
                    <p>Số lượng: <%=g.getSoLuong() %></p>
                </div>
            </div>
            <%} %>
           
        </div>
        
        <form action="Xacnhangiohang">
         <div class="actions">
         <%
         for(User u : user){
         %>
         <input value="<%=u.getHoTen()%>" name="hoTen" type="hidden">
            <input value="<%=u.getSoDienThoai()%>" name="soDienThoai" type="hidden">
            <input value="<%=u.getDiaChi()%>" name="diaChi" type="hidden">
            <%} %>
            <button class="btn btn-cancel" name="Huy" value="Huy">Hủy</button>
            <button class="btn btn-confirm" onclick="confirmOrder()" name="Dathang" value="Dathang">Đặt hàng</button>
        </div>
        </form>
        
       
    </div>
     <script>
        
        function confirmOrder() {
            alert("Xác nhận đặt hàng");
        }
    </script>
</body>
</html>
    