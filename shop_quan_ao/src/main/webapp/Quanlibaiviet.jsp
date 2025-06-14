<%@page import="model.User"%>
<%@page import="model.BaiViet"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin/Category</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assetsquantri/img/LOGOTHE5IVE.png" rel="icon">
<link href="assetsquantri/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assetsquantri/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assetsquantri/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assetsquantri/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assetsquantri/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assetsquantri/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link href="assetsquantri/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="assetsquantri/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assetsquantri/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style>
body {
	/* font-family: Arial, sans-serif; */
	/* background-color: #FFFFFF; /* Màu nền trắng */
	color: #FFFFFF; /* Màu chữ trắng */ */
	margin: 0;
	padding: 0;
}  

h1 {
	text-align: center;
	margin-top: 20px;
	color: #333;
}

.container {
	width: 100%;
	margin: 20px auto;
}

.form-container {
	background-color: #f9f9f9;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	margin-bottom: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.form-container input, .form-container textarea, .form-container button
	{
	width: 100%;
	padding: 12px;
	margin: 10px 0;
	font-size: 16px;
	border-radius: 10px;
	border: 2px solid #ddd;
	box-sizing: border-box;
	outline: none;
}

.form-container input:focus, .form-container textarea:focus {
	border-color: #4CAF50; /* Viền xanh khi focus */
}

.form-container textarea {
	height: 100px;
}

.form-actions {
	display: flex;
	justify-content: space-between;
}

.form-actions button {
	width: 48%;
	font-size: 16px;
	padding: 12px;
	border-radius: 10px;
	border: 2px solid #4CAF50;
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-actions button:hover {
	background-color: #45a049;
}

/* Nút Đóng */
.form-actions button.delete {
	background-color: #f44336;
	border-color: #f44336;
}

.form-actions button.delete:hover {
	background-color: #e53935;
}

.search-bar {
	margin-bottom: 20px;
	text-align: right;
}

.search-bar input {
	padding: 8px;
	font-size: 16px;
	width: 300px;
	border: 2px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

table {
	width: 100%;
	margin: 20px 0;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: center;
	border: 1px solid #ddd;
}

.mau {
	background-color: #4CAF50;
	color: white;
}
.mauduoi {
    background-color: #fff;
    color: #888;  /* Màu chữ nhạt */
    font-family: 'Arial', sans-serif;  /* Kiểu chữ thanh thoát */
    font-size: 16px;  /* Kích thước chữ hợp lý */
    line-height: 1.5;  /* Giãn cách dòng để văn bản dễ đọc hơn */
    letter-spacing: 0.5px;  /* Tăng khoảng cách giữa các ký tự */
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* Thêm bóng nhẹ cho chữ */
    padding: 10px;  /* Tăng khoảng cách bên trong để văn bản không sát viền */
    border-radius: 8px;  /* Bo góc cho phần tử */
    transition: color 0.3s ease, background-color 0.3s ease;  /* Hiệu ứng chuyển màu mượt mà */
}

.mauduoi:hover {
    color: #4CAF50;  /* Đổi màu chữ khi hover */
    background-color: #f1f1f1;  /* Đổi màu nền khi hover */
}


tr:nth-child(even) {
	background-color: #f2f2f2;
}

/* Nút Sửa và Xóa đẹp hơn */
.action-btn {
	padding: 8px 15px;
	font-size: 14px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border: none;
}

.edit-btn {
	background-color: #4CAF50;
	color: white;
}

.edit-btn:hover {
	background-color: #45a049;
}

.delete-btn {
	background-color: #f44336;
	color: white;
}

.delete-btn:hover {
	background-color: #e53935;
}

button.add {
	background-color: #4CAF50;
	color: white;
}

button.add:hover {
	background-color: #45a049;
}

/* Media Queries for responsive design */
@media ( max-width : 768px) {
	.container {
		width: 90%;
	}
	.form-container {
		padding: 15px;
	}
	.form-container input, .form-container textarea, .form-container button
		{
		font-size: 14px;
		padding: 10px;
	}
	.search-bar input {
		width: 100%;
	}
	table {
		font-size: 14px;
	}
	.form-actions {
		flex-direction: column;
	}
	.form-actions button {
		width: 100%;
		margin-bottom: 10px;
	}
}

@media ( max-width : 480px) {
	h1 {
		font-size: 20px;
	}
	.search-bar input {
		width: 100%;
	}
	table {
		font-size: 12px;
	}
	.form-container input, .form-container textarea {
		font-size: 12px;
		padding: 8px;
	}
}
</style>
</head>

<body>

	<!-- ======= Header ======= -->
	<%
	String projectName = request.getContextPath(); // Lấy tên dự án
	HttpSession s = request.getSession(false);
	List<User> listt = (List<User>) session.getAttribute("Ghinhotaikhoan");
	if(listt == null){
	%>
	 <script >
                alert("Vui lòng đăng nhập để xem thông tin"); // Hiển thị thông báo
                window.location.href = "login.jsp";
              </script>
	
	<%} else{
	for(User u : listt){
		if(u.getMaQuyen()==3){
	
	%>
	 <script >
                alert("Bạn không phải là admin vui lòng truy cập tài khoản admin."); // Hiển thị thông báo
                window.location.href = "login.jsp";
              </script>
	<%}}} %>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="assetsquantri/img/LOGOTHE5IVE-removebg.png" alt=""> <span
				class="d-none d-lg-block">Admin</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->



	<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item dropdown pe-3">
					
			<a class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-person-circle"></i> <span
						<%if(listt != null){
						for(User u : listt) {%>
						class="d-none d-md-block dropdown-toggle ps-2"><%=u.getHoTen()%>
							</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6><%=u.getTenTaiKhoan()%></h6>
							<%if(u.getMaQuyen() == 1) {%>
							<span>Quản trị viên</span>
							<%} else{%>
							<span>Khách hàng</span>
							<%} %>
						</li>
						
						<li>
							<hr class="dropdown-divider">
						</li>

							<li><a class="dropdown-item d-flex align-items-center"
							href="Thongtincanhan.jsp"> <i class="bi bi-person"></i> <span>Thông tin cá nhân
									</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item d-flex align-items-center"
							href="Dangxuat"> <i class="bi bi-box-arrow-right"></i> <span>Đăng
									xuất</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items -->
				</li>
				<%} }%>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-heading">Tổng quan dữ liệu</li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Bieudodoanhthu"> <i class="fas fa-tachometer-alt"></i> <span>Biểu đồ
						thống kê</span>
			</a></li>

			<li class="nav-heading">Quản lý bán hàng</li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/category.jsp"> <i
					class="bi bi-layout-text-window-reverse"></i> <span>Danh mục</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="<%=projectName%>/Donhangquantri.jsp">
					<i class="bi bi-cart"></i> <span>Đơn hàng</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/productquantri.jsp"> <i
					class="bi bi-grid"></i> <span>Sản phẩm</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Quanlidanhgia.jsp"> <i
					class="fa fa-star"></i> <span>Đánh giá</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Quantrikhuyenmai.jsp"> <i
					class="fas fa-gift"></i> <span>Khuyến mãi</span>
			</a></li>
			<li class="nav-item"><a class="nav-link "
				href="<%=projectName%>/Quanlibaiviet.jsp"> <i
					class="fa fa-newspaper"></i> <span>Bài viết</span>
			</a></li>
			<li class="nav-heading">Quản lý tài khoản</li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/account.jsp"> <i class="bi bi-person"></i>
					<span>Tài khoản</span>
			</a></li>
			<!-- End Profile Page Nav -->
			<%--
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/group.jsp"> <i
					class="bi bi-question-circle"></i> <span>Phân quyền</span>
			</a></li>--%>
			<!-- End F.A.Q Page Nav -->



		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="container">
			<h1>Quản lý Bài Viết</h1>

			<!-- Form Thêm / Sửa Bài Viết -->
			<div id="formContainer" class="form-container" style="display: none;">
				<h2 id="formTitle">Thêm Bài Viết</h2>
				<form id="articleForm" action="Thembaiviet" method="post">
					
					<input type="text" id="title" name="tenBai" placeholder="Tên Bài"
						required><br>
					<textarea id="content" name="noiDung" placeholder="Nội Dung"
						required></textarea>
					

					<div class="form-actions">
						<button type="submit" class="add" onclick="saveArticle()">Lưu</button>
						<button type="button" class="delete" onclick="closeForm()">Đóng</button>
					</div>
				</form>
			</div>

			<!-- Thanh Tìm Kiếm -->
			<div class="search-bar">
				<input type="text" id="searchInput"
					placeholder="Tìm kiếm theo tên hoặc nội dung..."
					onkeyup="searchArticles()">
			</div>

			<button class="add" onclick="showForm('add')">Thêm Bài Viết</button>

			<table id="articlesTable">
				<thead class="mau">
					<tr>
						<th>Mã Bài</th>
						<th>Mã Quản Trị</th>
						<th>Tên Bài</th>
						<th>Nội Dung</th>
						<th>Thời Gian</th>
						<th>Hành Động</th>
					</tr>
				</thead>
				
				<tbody class="mauduoi">
				<%
				LaydulieuReponsitory lg = new LaydulieuReponsitory();
				List<BaiViet> b = lg.LayThongTinBaiViet();
				for(BaiViet baiViet : b){
				%>
					<tr>
						<th></th>
						<th><%=baiViet.getMaBaiViet() %></th>
						<th><%=baiViet.getTenBai() %></th>
						<th><%=baiViet.getNoiDung() %></th>
						<th><%=baiViet.getThoiGian() %></th>
						<th>
						<form action="Xoabaiviet" method="post">
						<input type="hidden" name="xoaBaiViet" value="<%=baiViet.getMaBaiViet()%>">
						<button class="action-btn delete-btn" onclick="thongbao()">Xóa</button>
						</form>
						</th>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->


	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assetsquantri/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assetsquantri/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assetsquantri/vendor/chart.js/chart.umd.js"></script>
	<script src="assetsquantri/vendor/echarts/echarts.min.js"></script>
	<script src="assetsquantri/vendor/quill/quill.js"></script>
	<script
		src="assetsquantri/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assetsquantri/vendor/tinymce/tinymce.min.js"></script>
	<script src="assetsquantri/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assetsquantri/js/main.js"></script>
	<script> 
	document.getElementById('addb').addEventListener('click', () => {toggleUpload();});
	function toggleUpload() {
    const addForm = document.getElementById('addf');
    

    if (addForm.classList.contains('hide')) {
        addForm.classList.remove('hide');
   

    } else {
        addForm.classList.add('hide');
       
    }
}
	let articles = [
        { articleId: 1, adminId: 'A001', title: 'Bài viết 1', content: 'Nội dung bài viết 1', time: '2024-12-20T10:00' },
        { articleId: 2, adminId: 'A002', title: 'Bài viết 2', content: 'Nội dung bài viết 2', time: '2024-12-21T11:00' }
    ];

    function showForm(mode, article = null) {
        document.getElementById('formContainer').style.display = 'block';
        if (mode === 'add') {
            document.getElementById('formTitle').textContent = 'Thêm Bài Viết';
            document.getElementById('articleForm').reset();
        } else if (mode === 'edit' && article) {
            document.getElementById('formTitle').textContent = 'Sửa Bài Viết';
            document.getElementById('articleId').value = article.articleId;
            document.getElementById('adminId').value = article.adminId;
            document.getElementById('title').value = article.title;
            document.getElementById('content').value = article.content;
            document.getElementById('time').value = article.time;
        }
    }

    function closeForm() {
        document.getElementById('formContainer').style.display = 'none';
    }

    function saveArticle() {
        let articleId = document.getElementById('articleId').value;
        let adminId = document.getElementById('adminId').value;
        let title = document.getElementById('title').value;
        let content = document.getElementById('content').value;
        let time = document.getElementById('time').value;

        if (!articleId || !adminId || !title || !content || !time) {
            alert('Vui lòng điền đầy đủ thông tin!');
            return;
        }

        let article = { articleId, adminId, title, content, time };
        
        // Check if it's a new article or an edit
        if (articles.some(a => a.articleId == articleId)) {
            // Update article
            articles = articles.map(a => a.articleId == articleId ? article : a);
        } else {
            // Add new article
            articles.push(article);
        }

        closeForm();
        renderTable();
    }

    function renderTable() {
        let tableBody = document.getElementById('articlesTable').getElementsByTagName('tbody')[0];
        tableBody.innerHTML = '';

        articles.forEach(article => {
            let row = document.createElement('tr');
            row.innerHTML = `
                <td>${article.articleId}</td>
                <td>${article.adminId}</td>
                <td>${article.title}</td>
                <td>${article.content}</td>
                <td>${article.time}</td>
                <td>
                    <button class="action-btn edit-btn" onclick="showForm('edit', ${JSON.stringify(article)})">Sửa</button>
                    <button class="action-btn delete-btn" onclick="deleteArticle(${article.articleId})">Xóa</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    }

    function deleteArticle(articleId) {
        if (confirm('Bạn có chắc muốn xóa bài viết này?')) {
            articles = articles.filter(article => article.articleId != articleId);
            renderTable();
        }
    }

    function searchArticles() {
        let searchTerm = document.getElementById('searchInput').value.toLowerCase();
        let filteredArticles = articles.filter(article =>
            article.title.toLowerCase().includes(searchTerm) || 
            article.content.toLowerCase().includes(searchTerm)
        );
        renderFilteredTable(filteredArticles);
    }

    function renderFilteredTable(filteredArticles) {
        let tableBody = document.getElementById('articlesTable').getElementsByTagName('tbody')[0];
        tableBody.innerHTML = '';

        filteredArticles.forEach(article => {
            let row = document.createElement('tr');
            row.innerHTML = `
                <td>${article.articleId}</td>
                <td>${article.adminId}</td>
                <td>${article.title}</td>
                <td>${article.content}</td>
                <td>${article.time}</td>
                <td>
                    <button class="action-btn edit-btn" onclick="showForm('edit', ${JSON.stringify(article)})">Sửa</button>
                    <button class="action-btn delete-btn" onclick="deleteArticle(${article.articleId})">Xóa</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
    }
    function thongbao() {
    	alert('Bạn chắc chắn muốn xóa chứ huhu!');
	}

    // Render the table on page load
    renderTable();
  </script>

</body>

</html> 