<%@page import="model.Danhgia"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>

	<link href="assetsquantri/img/LOGOTHE5IVE.png" rel="icon">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Đánh giá Sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .star-rating {
            color: gold;
        }
        #search {
            margin: 20px 0;
            padding: 10px;
            width: 200px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .back-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
        }
        .back-button:hover {
            background-color: #45a049;
        }
        .feedback-container {
            margin-top: 10px;
            display: none;
        }
        .feedback-button {
            background-color: #2196F3;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .feedback-button:hover {
            background-color: #0b7dda;
        }
        .feedback-textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .submit-feedback {
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .submit-feedback:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h2>Quản Lý Đánh Giá Sản Phẩm</h2>

    <!-- Tìm kiếm theo tên tài khoản và nội dung bài viết -->
    <input type="text" id="search" onkeyup="searchTable()" placeholder="Tìm kiếm theo tên tài khoản hoặc nội dung bài viết...">

    <table id="reviewsTable">
        <thead>
            <tr>
                <th>Mã Tài Khoản</th>
                <th>Tên Tài Khoản</th>
                <th>Mã Sản Phẩm</th>
                <th>Đánh Giá (Sao)</th>
                <th>Nội Dung Bài Viết</th>
                <th>Phản Hồi</th>
            </tr>
        </thead>
        <tbody>
        
        <%
        String loi = (String) request.getAttribute("Loi");
        String thongBao = (String) request.getAttribute("Thongbao");
        Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
        List<Danhgia> danhGia = lgn.LayThongTinDanhGia();
        for(Danhgia d : danhGia){
        	int i = 0;
        %>
            <tr>
                <td><%=d.getMaNguoiDung() %></td>
                <td><%=d.getTenNguoiDung() %></td>
                <td><%=d.getMaSanPham() %></td>
                <td>
                     (<%=d.getSoSao() %> sao)<span class="star-rating">
                    <%while(i < d.getSoSao()){ %>
                    ★
                    <%
                    i = i+1;
                    } 
                    %>
                    </span>
                </td>
                <td><%=d.getNoiDung() %></td>
                <td>
                    <!-- Form phản hồi -->
                    <!-- <form action="Phanhoidanhgia" method="post">
                        <button type="button" class="feedback-button" onclick="toggleFeedback(<%=d.getMaDanhGia()%>)">Phản hồi</button> -->
                        
                        <!-- Phản hồi container -->
                        <!-- <div class="feedback-container" id="feedback-<%=d.getMaDanhGia()%>">
                            <input type="text" name="idDanhGia" value="<%=d.getMaDanhGia()%>">
                            <textarea class="feedback-textarea" name="phanHoi" placeholder="Nhập phản hồi của bạn..."></textarea>
                            <button type="submit" class="submit-feedback">Gửi Phản Hồi</button>
                        </div>
                    </form> -->
                    <!-- Form phản hồi -->
<form action="Phanhoidanhgia" method="post" onsubmit="return kiemTraPhanHoi(this)">
    <button type="button" class="feedback-button" onclick="toggleFeedback(<%=d.getMaDanhGia()%>)">Phản hồi</button>
    
    <!-- Phản hồi container -->
    <div class="feedback-container" id="feedback-<%=d.getMaDanhGia()%>">
        <input type="text" name="idDanhGia" value="<%=d.getMaDanhGia()%>">
        <textarea class="feedback-textarea" name="phanHoi" placeholder="Nhập phản hồi của bạn..."></textarea>
        <button type="submit" class="submit-feedback">Gửi Phản Hồi</button>
    </div>
</form>
                </td>
            </tr>
            <%} if(loi != null){%>
            <script>
            alert("Vui lòng nhập thông tin đầy đủ!");
          </script>
            <%} if(thongBao != null){%>
          <script>
            alert("Phản hổi thành công!");
          </script>
          <%} %>
            <!-- Các đánh giá khác -->
        </tbody>
    </table>

    <a href="Bieudodoanhthu" class="back-button">Quay lại</a>

    <script>
        function searchTable() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("search");
            filter = input.value.toUpperCase();  // Lấy giá trị tìm kiếm và chuyển thành chữ hoa
            table = document.getElementById("reviewsTable");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                tr[i].style.display = "none";  // Ẩn tất cả các hàng
                td = tr[i].getElementsByTagName("td");
                for (var j = 1; j < td.length; j++) {  // Kiểm tra tất cả các cột
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {  // Tìm kiếm trong tất cả các cột
                            tr[i].style.display = "";  // Hiển thị hàng nếu tìm thấy
                            break;
                        }
                    }
                }
            }
        }

        function toggleFeedback(id) {
            var feedbackContainer = document.getElementById('feedback-' + id);
            if (feedbackContainer.style.display === "none" || feedbackContainer.style.display === "") {
                feedbackContainer.style.display = "block";
            } else {
                feedbackContainer.style.display = "none";
            }
        }

    function kiemTraPhanHoi(form) {
        const phanHoi = form.phanHoi.value.trim();

        if (phanHoi === "") {
            alert("Bạn chưa nhập phản hồi!");
            return false; // chặn submit
        }

        return confirm("Bạn có chắc chắn muốn gửi phản hồi?");
    }        
    </script>

</body>
</html>
    