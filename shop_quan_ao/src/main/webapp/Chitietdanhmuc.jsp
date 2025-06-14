 <%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .product {
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
        }

        .product-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }

        .product-info {
            display: flex;
            align-items: center;
            justify-content: center; /* Căn giữa */
            margin-bottom: 30px;
            flex-wrap: wrap; /* Cho phép các phần tử cuộn xuống nếu không đủ chỗ */
            padding: 20px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.8); /* Màu nền mờ */
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng nhẹ */
        }

        .product-image {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
            margin-bottom: 20px; /* Khoảng cách giữa ảnh và thông tin */
        }

        .product-details {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .product-id,
        .product-name,
        .product-quantity,
        .product-price {
            font-size: 1.4rem;
            margin-bottom: 10px;
            color: #555;
        }

        .product-id {
            font-weight: bold;
        }

        .product-quantity {
            color: #777;
        }

        .product-price {
            font-weight: bold;
            color: #333;
            font-size: 1.8rem;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            font-size: 1.4rem;
            font-weight: bold;
            color: #ffffff;
            background-color: #4CAF50;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.3s ease;
            margin-top: 30px;
            justify-content: center;
            text-align: center;
        }

        .back-button img {
            width: 20px;
            margin-right: 10px;
        }

        .back-button:hover {
            background-color: #45a049;
        }

        .cangiua {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="product">
        <!-- Nút quay lại -->
        <a href="javascript:history.back()" class="back-button">
            <img src="https://img.icons8.com/ios/452/left.png" alt="Quay lại"> Quay lại
        </a>
    
        <h1 class="product-title">Chi Tiết Sản Phẩm</h1>
        <%
        HttpSession ss = request.getSession(false);
        int id = (int) ss.getAttribute("idthamchieu");
        LaydulieuReponsitory lg = new LaydulieuReponsitory();
        List<SanPham> sp = lg.Laythongtinsanpham();
        for(SanPham s : sp){
        	if(s.getMaDanhMuc()==id){
        %>
        <div class="product-info">
            <img src="<%=s.getDuongDanAnh()%>" alt="Sản phẩm" class="product-image">
            <div class="product-details">
                <div class="product-id">Mã Sản Phẩm: <%=s.getMaSanpham() %></div>
                <div class="product-name">Tên Sản Phẩm: <%=s.getTenSanPham()%></div>
                <div class="product-price">Giá: $<%=s.getGia()%></div>
            </div>
        </div>
        <%}} %>
       <!--  <div class="cangiua">
            <button class="back-button" onclick="window.history.back()">Quay lại</button>
        </div> -->
    </div>
</body>
</html>
