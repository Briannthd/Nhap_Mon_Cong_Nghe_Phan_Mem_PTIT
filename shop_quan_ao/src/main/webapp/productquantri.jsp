<%@page import="model.User"%>
<%@page import="model.ChiTietSanPham"%>
<%@page import="model.DanhMuc"%>
<%@page import="model.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin/Product</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Template Main CSS File -->
<link href="assetsquantri/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style>

/* Che lớp mờ */
#smoke {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 999;
}

/* Modal chính */
#editF {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	background: white;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	z-index: 1000;
	border-radius: 8px;
}

/* Ẩn các phần tử */
.hide {
	display: none;
}

/* Nút đóng */
.close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	cursor: pointer;
}
</style>
</head>

<body>
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
			<div class="logo d-flex align-items-center">
				<a href="<%=projectName%>/Bieudodoanhthu" class="d-flex align-items-center">
					<img src="assetsquantri/img/LOGOTHE5IVE-removebg.png" alt="">
					<span class="d-none d-lg-block">Admin</span>
				</a>
			</div>

			<i class="bi bi-list toggle-sidebar-btn"></i>
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
<li class="nav-heading"><strong>Tổng quan dữ liệu</strong></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Bieudodoanhthu"> <i class="fas fa-tachometer-alt"></i> <span>Biểu đồ
						thống kê</span>
			</a></li>

			<li class="nav-heading"><strong>Quản lý bán hàng</strong></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/category.jsp"> <i
					class="bi bi-layout-text-window-reverse"></i> <span>Danh mục</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed" href="<%=projectName%>/Donhangquantri.jsp">
					<i class="bi bi-cart"></i> <span>Đơn hàng</span>
			</a></li>
			<li class="nav-item"><a class="nav-link "
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
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Quanlibaiviet.jsp"> <i
					class="fa fa-newspaper"></i> <span>Bài viết</span>
			</a></li> 
			<li class="nav-heading"><strong>Quản lý tài khoản</strong></li>

			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/account.jsp"> <i class="bi bi-person"></i>
					<span>Tài khoản</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<%-- <li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/group.jsp"> <i
					class="bi bi-question-circle"></i> <span>Phân quyền</span>
			</a></li> --%>
			<!-- End F.A.Q Page Nav -->



		</ul>

	</aside>
	<!-- End Sidebar-->
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Sản phẩm</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Quản lý
							bán hàng</a></li>
					<li class="breadcrumb-item active">Sản phẩm</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h3 class="card-title">
								<b>Quản lý sản phẩm</b>
							</h3>
							<div style="display: flex; justify-content: flex-end; align-items: center; gap: 8px; margin-bottom: 10px;">
								<p style="margin: 0;">Thêm sản phẩm</p>
								<button type="button" id="addb" class="btn btn-success">
									<i class="bi bi-plus-lg"></i>
								</button>
							</div>
							<div class="card">
								<div class="card-body row hide" id="addf">
									<h5 class="card-title">Thêm sản phẩm</h5>

									<!-- Vertical Form -->
									<form action="Themsanphamproductquantri" method="post"
										enctype="multipart/form-data">
										<div class="col-12">
											<label for="inputName" class="form-label">Tên sản
												phẩm</label> <input type="text" class="form-control" id="inputName"
												placeholder="Tên sản phẩm" name="addTensanpham"> <label
												for="categorySelect" class="form-label">Chọn danh
												mục của sản phẩm</label> <select class="form-select"
												id="categorySelect" name="addDanhmucsanpham">
												<option selected>Chọn danh mục...</option>
												<option value="1">Quần áo Nữ</option>
												<option value="2">Quần áo Nam</option>
												<option value="3">Phụ kiện</option>
												<option value="4">Giày dép</option>
												<option value="5">Túi xách</option>
											</select> <label for="inputPrice" class="form-label">Đơn giá</label> <input
												type="number" class="form-control" id="inputPrice"
												placeholder="Đơn vị: $" name="idGiasanpham" min="0" step="0.1">
											<!-- <form id="uploadForm" action="/upload" method="post"
												enctype="multipart/form-data">
												<label for="inputImg">Ảnh:</label><br> <input
													type="file" id="inputImg" name="image" accept="image/*"
													required>f
											</form> -->
											<label for="inputImg">Ảnh:</label><br> <input
												type="file" id="inputImg" name="image" accept="image/*"
												required> <br> <label for="inputDetail"
												class="form-label">Mô tả</label> <input class="form-control"
												id="inputDetail" placeholder="Mô tả sản phẩm" name="addMota">


										</div>
										<%
										String loi = (String) request.getAttribute("loi");
														if(loi != null){
										%>
										<script >
										alert("Các trường hợp không được bỏ trống");
										</script>
										<%} %>
										<div class="text-center">
											<!-- <button type="submit" class="btn btn-primary">Thêm</button> -->
											<button type="submit" class="btn btn-primary" onclick="return confirm('Bạn có chắc chắn muốn thêm sản phẩm không?')">Thêm</button>
										</div>
									</form>
									<!-- Vertical Form -->
								</div>
							</div>
						</div>
						<!-- Table with stripped rows -->
					</div>
					<table class="table datatable">
						<thead>
							<tr>
								<th>Mã SP</th>
								<th>Tên SP</th>
								<th>Hình ảnh</th>
								<th>Số lượng</th>
								<th>Phân loại</th>
								<th>Giá</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<%
							int soluong;
							LaydulieuReponsitory ldl = new LaydulieuReponsitory();
							List<SanPham> sanpham = ldl.Laythongtinsanpham();
							List<DanhMuc> danhmuc = ldl.Laythongtidanhmuc();
							List<ChiTietSanPham> chitiet = ldl.Laythongtinchitietsanpham();
							int idxd = 0;
							for (SanPham sp : sanpham) {
								if(!sp.getDaXoa().equals("1")){
								soluong = 0; // Khởi tạo lại mỗi lần lặp qua sản phẩm mới
							%>
							<tr>
								<td><%=sp.getMaSanpham()%></td>
								<td><%=sp.getTenSanPham()%></td>
								<td><img src="<%=sp.getDuongDanAnh()%>"
									alt="<%=sp.getTenSanPham()%>"
									style="width: 100px; height: auto;" loading="lazy"></td>
								<%
								// Tính tổng số lượng cho sản phẩm này
								for (ChiTietSanPham c : chitiet) {
									if (sp.getMaSanpham() == c.getMaSanPham()) {
										soluong += c.getSoLuong();
									}
								}
								sp.setSoLuong(soluong); // Sử dụng setter để gán giá trị cho soLuong
								%>
								<td><%=sp.getSoLuong()%></td>

								<%
								for (DanhMuc dm : danhmuc) {
									if (dm.getMaDanhmuc() == sp.getMaDanhMuc()) {
								%>
								<td><%=dm.getTenDanhMuc()%></td>
								<%
								}
								}
								%>

								<td><%=sp.getGia()%>đ</td>
								<td><div class="d-flex flex-wrap justify-content-center gap-2 mt-2">
    								<!-- Sửa Button -->
    								<button type="button" class="btn btn-outline-warning btn-sm" data-id="1" onclick="editForm(this)">Sửa</button>
  									<!-- Xoá Button -->
    								<form action="Xoasanphamproductqt" method="post" class="d-inline-block" onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">
      										<input type="hidden" value="1" name="id">
      										<button class="btn btn-outline-danger btn-sm" type="submit">Xoá</button>
    								</form>

    								<!-- Chi tiết Button -->
    								<form action="LayidSanPhamquantri" method="post" class="d-inline-block">
      										<input type="hidden" value="1" name="idd">
      										<button type="submit" class="btn btn-outline-info btn-sm" id="detailB">Chi tiết</button>
    								</form>
  									</div>
								</td>

							</tr>
							<%
							}
							}
							%>
						</tbody>

					</table>
					<!-- End Table with stripped rows -->


				</div>
			</div>

		</section>
		<!-- 	<div class="card editForm hide" id="editF"
			style="top: 10%; left: 10%;">
			<div class="card-body row ">
				<h5 class="card-title">Sửa sản phẩm</h5>

				Vertical Form
				<form>
					<label for="editName" class="form-label">Tên sản phẩm</label> <input
						type="text" class="form-control" id="editName"
						placeholder="Tên sản phẩm"> <label for="categorySelect"
						class="form-label">Chọn danh mục của sản phẩm</label> <select
						class="form-select" id="editCategory">
						<option selected>Chọn danh mục...</option>
						<option value="1">Quần áo nam</option>
						<option value="2">Quần áo nữ</option>
						<option value="3">Phụ kiện</option>
						<option value="4">Giày dép</option>
						<option value="5">Túi xách</option>
					</select> <label for="editPrice" class="form-label">Đơn giá</label> <input
						type="number" class="form-control" id="editPrice"
						placeholder="Đơn vị: $">
					<form id="editUploadForm" action="/upload" method="post"
						enctype="multipart/form-data">
						<label for="editImg">Ảnh:</label><br> <input type="file"
							id="editImg" name="image" accept="image/*" required>
					</form>
					<label for="editDetail" class="form-label">Mô tả</label> <input
						type="number" class="form-control" id="editDetail"
						placeholder="Mô tả sản phẩm">

					<button type="submit" id="cuppha" class="btn btn-primary">Sửa</button>
				</form>
			</div>

		</div> -->
		<div id="smoke" class="hide" onclick="closeModal(event)"></div>
		<div id="editF" class="hide">
			<div class="modal-content">
				<span class="close-btn" onclick="closeModal()">×</span>
				<form onsubmit="handleSave(event)" class="card-body row"
					id="editProductForm" action="Suasanphamproductquantri"
					method="POST" enctype="multipart/form-data">
					<input type="hidden" id="product-id" name="product-id" readonly>

					<h5 class="card-title">Sửa sản phẩm</h5>

					<!-- Tên sản phẩm -->
					<label for="editName" class="form-label">Tên sản phẩm</label> <input
						type="text" class="form-control" id="editName" name="name"
						placeholder="Tên sản phẩm">

					<!-- Chọn danh mục sản phẩm -->
					<label for="categorySelect" class="form-label">Chọn danh
						mục của sản phẩm</label> <select class="form-select" id="editCategory"
						name="category">
						<option selected>Chọn danh mục...</option>
						<option value="1">Nữ</option>
						<option value="2">Nam</option>
						<option value="3">Túi</option>
						<option value="4">Giày</option>
						<option value="5">Đồng hồ</option>
					</select>

					<!-- Đơn giá -->
					<label for="editPrice" class="form-label">Đơn giá</label> <input
						type="number" class="form-control" id="editPrice" name="price"
						placeholder="Đơn vị: $">

					<!-- Ảnh -->
					<label for="editImg" class="form-label">Ảnh:</label><br> <input
						type="file" id="editImg" name="image" accept="image/*" required>

					<!-- Mô tả sản phẩm -->
					<label for="editDetail" class="form-label">Mô tả</label>
					<textarea class="form-control" id="editDetail" name="description"
						placeholder="Mô tả sản phẩm"></textarea>

					<!-- Nút submit -->
					<button type="submit" id="cuppha" class="btn btn-primary">Sửa</button>
				</form>


			</div>
		</div>

		<div class="card detailForm hide" id="detailF">
			<div class="card-body row ">
				<h5 class="card-title">Chi tiết sản phẩm</h5>

				<!-- Vertical Form -->
				<form>
					<div class="col-12">
						<!-- Sử dụng lớp 'table-responsive' của Bootstrap để tạo thanh cuộn -->
						<div class="table-responsive" style="max-height: 400px;">
							<table class="table datatable">
								<thead>
									<tr>
										<th>Màu sắc</th>
										<th>Kích cỡ</th>
										<th>Số lượng</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
									for (ChiTietSanPham c : chitiet) {
									%>
									<tr>
										<td><%=c.getMauSac()%></td>
										<td><%=c.getKichCo()%></td>
										<td><%=c.getSoLuong()%></td>
										<td>
											<!-- Các nút sửa và xóa được đặt trong một div với lớp 'btn-group' -->
											<div class="btn-group" role="group">

												<button id="editsB" onclick="editsForm()" type="button"
													class="btn btn-outline-warning">Sửa</button>

												<!-- Nút xóa -->
												<form action="Xoachitietproductquantri" method="POST"
													class="d-inline">
													<input type="hidden" name="id"
														value="<%=c.getIdChiTietSanPham()%>">
													<button type="submit" class="btn btn-outline-danger">Xoá</button>
												</form>
											</div>
										</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</form>

				<!-- Vertical Form -->
			</div>
		</div>
		<div class="card editForm hide" style="z-index: 2222" id="editS">
			<div class="card-body row ">
				<h5 class="card-title">Sửa kiểu</h5>

				<!-- Vertical Form -->
				<form>
					<label for="editColor" class="form-label">Màu sắc</label> <input
						type="text" class="form-control" id="editColor"
						placeholder="Màu sắc"> <label for="inputSize"
						class="form-label">Kích cỡ</label> <select class="form-select"
						id="editSize">
						<option selected>Chọn kích cỡ...</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
						<option value="XXL">XXL</option>
						<option value="3XL">3XL</option>
					</select> <label for="editQuantity" class="form-label">Số lượng</label> <input
						type="number" class="form-control" id="editQuantity"
						placeholder="Số lượng">

					<button type="submit" class="btn btn-primary">Sửa</button>
				</form>
			</div>

		</div>
		</div>
	</main>
	<!-- End #main -->
	<div id="smoke" class="smoke hide"></div>
	<div id="smoke2" class="smoke hide" style="z-index: 2221"></div>
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
	document.getElementById('addb').addEventListener('click', toggleUpload);
	function toggleUpload() {
	    const addForm = document.getElementById('addf');
	    addForm.classList.toggle('hide');
	}

	document.getElementById('adds').addEventListener('click', styleUpload);
	function styleUpload() {
	    const addStyle = document.getElementById('addstyle');
	    addStyle.classList.toggle('hide');
	}

	const form = document.getElementById('inputForm');
	const submitButton = document.getElementById('submitButton');
	const tableBody = document.querySelector('#recordsTable tbody');

	let records = [];
	const updateTable = () => {
	    tableBody.innerHTML = "";
	    if (records.length === 0) {
	        tableBody.innerHTML = `<tr><td>Chưa có kiểu dáng nào được thêm</td></tr>`;
	        return;
	    }
	    records.forEach((record, index) => {
	        const row = document.createElement('tr');
	        row.innerHTML = `
	            <td>${index + 1}</td>
	            <td>${record.color}</td>
	            <td>${record.size}</td>
	            <td>${record.quantity}</td>
	        `;
	        tableBody.appendChild(row);
	    });
	};

	submitButton.addEventListener('click', () => {
	    const color = document.getElementById('inputColor').value.trim();
	    const size = document.getElementById('inputSize').value.trim();
	    const quantity = document.getElementById('inputQuantity').value.trim();

	    if (!color || !size || !quantity) {
	        alert("hãy nhập đầy đủ các mục");
	        return;
	    }

	    records.push({ color, size, quantity });
	    updateTable();
	    form.reset();
	});


/* function editForm() {
    const editF = document.getElementById('editF');
    const smoke = document.getElementById('smoke');
    editF.classList.remove('hide');
    smoke.classList.remove('hide');
} */
//Hàm mở modal
function editForm(button) {
    const editF = document.getElementById('editF'); // Modal chỉnh sửa
    const smoke = document.getElementById('smoke'); // Lớp mờ nền
    const productIdInput = document.getElementById('product-id'); // Ô input chứa ID sản phẩm

    // Lấy ID từ nút bấm và gán vào ô input
    const productId = button.getAttribute('data-id');
    productIdInput.value = productId;

    // Hiển thị modal và lớp mờ nền
    editF.classList.remove('hide');
    smoke.classList.remove('hide');
}

// Hàm đóng modal
function closeModal(event) {
    const editF = document.getElementById('editF');
    const smoke = document.getElementById('smoke');

    // Nếu click vào lớp mờ hoặc nút đóng
    if (!event || event.target === smoke || event.target.classList.contains('close-btn')) {
        editF.classList.add('hide');
        smoke.classList.add('hide');
    }
}

// Xử lý nút lưu
 function handleSave(event) {
   /*  event.preventDefault(); // Ngăn chặn reload trang
    alert('Đã lưu thông tin!'); */
    closeModal(); // Đóng modal sau khi lưu
} 

function detailForm() {
    const detailF = document.getElementById('detailF');
    const smoke = document.getElementById('smoke');
    detailF.classList.remove('hide');
    smoke.classList.remove('hide');
}

document.getElementById('smoke').addEventListener('click', function () {
    document.getElementById('smoke').classList.add('hide');
    document.getElementById('editF').classList.add('hide');
    document.getElementById('detailF').classList.add('hide');
    saveTabState('');
});
 function editsForm() {
    const editS = document.getElementById('editS');
    const smoke = document.getElementById('smoke2');
    editS.classList.remove('hide');
    smoke2.classList.remove('hide');
} 
document.getElementById('smoke2').addEventListener('click', function () {
    document.getElementById('smoke2').classList.add('hide');
    document.getElementById('editS').classList.add('hide');
    saveTabState('');
});

// Lưu trạng thái tab vào Local Storage
function saveTabState(tabId) {
    localStorage.setItem('activeTab', tabId);
}

// Khôi phục trạng thái tab khi load lại trang
window.addEventListener('load', () => {
    const activeTab = localStorage.getItem('activeTab');
    if (activeTab) {
        document.getElementById(activeTab)?.classList.remove('hide');
        document.getElementById('smoke')?.classList.remove('hide');
    }
});
//Sử dụng sự kiện click cho tất cả các nút sửa
document.querySelectorAll('.editB').forEach(button => {
    button.addEventListener('click', function() {
        var productId = this.getAttribute('data-id');
        // Mở form sửa sản phẩm hoặc xử lý các hành động khác
        console.log("Sửa sản phẩm với ID: " + productId);
        // Thực hiện các thao tác liên quan, ví dụ hiển thị form sửa
    });
});

</script>


</body>

</html>