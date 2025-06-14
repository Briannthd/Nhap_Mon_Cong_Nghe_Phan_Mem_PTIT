<%@page import="model.Quyen"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
	<link rel="icon" type="image/png" href="images/icons/LOGOTHE5IVE.jpg"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Cá Nhân</title>
    <style>
        /* Thiết lập chung */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7; /* Nền trắng nhẹ */
            color: #333;
            line-height: 1.8;
            padding: 0;
            margin: 0;
            text-align: center;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header */
        header {
            background-color: #fff;
            color: #333;
            padding: 30px;
            border-radius: 15px;
            margin-top: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Bóng đổ nhẹ cho header */
        }

        header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* Card thông tin cá nhân */
        .profile-card {
            background-color: #ffffff;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
            padding: 30px;
            border-radius: 15px;
            transform: scale(1);
            transition: transform 0.3s ease-in-out;
        }

        .profile-card:hover {
            transform: scale(1.05);
        }

        .avatar {
            border-radius: 50%;
            width: 180px;
            height: 180px;
            margin-right: 20px;
            border: 5px solid #e0e0e0; /* Biên mờ */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .profile-info {
            max-width: 500px;
            color: #555; /* Chữ màu xám nhẹ */
            text-align: left;
        }

        .profile-info h2 {
            font-size: 2rem;
            color: #333;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 15px;
        }

        .profile-info p {
            font-size: 1.2rem;
            margin: 10px 0;
        }

        .profile-info strong {
            color: #ff7043; /* Màu cam nhẹ */
        }

        /* Footer */
        footer {
            background-color: #fff;
            color: #555;
            padding: 10px 0;
            text-align: center;
            margin-top: 40px;
            font-size: 1.2rem;
            border-top: 3px solid #f0f0f0;
        }

        /* Buttons */
        .btn {
            padding: 12px 25px;
            background-color: #ff7043; /* Màu cam dịu nhẹ */
            border: none;
            border-radius: 30px;
            color: #fff;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 10px 5px;
        }

        .btn:hover {
            background-color: #e64a19; /* Màu cam đậm khi hover */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-card {
                flex-direction: column;
                padding: 20px;
            }

            .avatar {
                margin-bottom: 20px;
            }

            .profile-info {
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            header h1 {
                font-size: 2rem;
            }

            .profile-info h2 {
                font-size: 1.5rem;
            }

            .profile-info p {
                font-size: 1rem;
            }

            footer {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <header>
        <div class="container">
            <h1>Thông Tin Cá Nhân</h1>
        </div>
    </header>
    <%
    LaydulieuReponsitory lg = new LaydulieuReponsitory();
    HttpSession s = request.getSession(false);
    List<User> l = (List<User>) session.getAttribute("Ghinhotaikhoan");
    %>

    <main>
        <div class="container profile-card">
            <img src="images/avatar-cute-1.jpg" alt="Avatar" class="avatar">
            <div class="profile-info">
            <%
            if(l != null){
            for(User u : l){ %>
                <h2><%=u.getHoTen() %></h2>
                <p><strong>Tuổi:</strong> 20</p>
                <p><strong>Số điện thoại:</strong> <%=u.getSoDienThoai() %></p>
                <p><strong>Email:</strong> <%=u.getEmail() %></p>
                <p><strong>Quê quán:</strong> <%=u.getDiaChi() %></p>
                <%if(u.getMaQuyen()==1){%>
                <p><strong>Quyền:</strong> Quản trị viên</p>
                <%}else{ %>
                <p><strong>Quyền:</strong> Khách hàng</p>
                <%} }}else{%>
                 <script >
                alert("Vui lòng đăng nhập để xem thông tin"); // Hiển thị thông báo
                window.location.href = "login.jsp";
              </script>
                <%} %>
                
                <a href="https://www.facebook.com/thanhhienitme?locale=vi_VN"> <button class="btn">Liên hệ</button></a>
                <button class="btn" onclick="goBack()">Quay lại</button>
                <a href="Doimatkhau.jsp"> <button class="btn">Đổi mật khẩu</button></a>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Thông Tin Cá Nhân | Designed by Group 6</p>
        </div>
    </footer>
<script>
    function goBack() {
        window.history.back(); // Quay lại trang trước
    }
</script>
</body>
</html>
    