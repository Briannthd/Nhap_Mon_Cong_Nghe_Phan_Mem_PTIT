<%@page import="model.Quyen"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.LoginReponsitory"%>
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
    /* Đảm bảo bảng có thể cuộn ngang */
    .table-responsive {
        overflow-x: auto;
    }

    /* Giảm kích thước font chữ trên màn hình nhỏ */
    @media (max-width: 768px) {
        .table th, .table td {
            font-size: 12px; /* Giảm kích thước font */
            white-space: nowrap; /* Giữ nội dung trên một dòng */
        }

        /* Ẩn các cột ít quan trọng */
        .table th:nth-child(3), .table td:nth-child(3), /* Mật khẩu */
        .table th:nth-child(6), .table td:nth-child(6), /* Địa chỉ */
        .table th:nth-child(7), .table td:nth-child(7)  /* Số điện thoại */ {
            display: none;
        }
    }

    /* Chỉnh nút hành động cho điện thoại */
    @media (max-width: 576px) {
        .table th, .table td {
            font-size: 10px;
        }
        .btn {
            font-size: 10px;
            padding: 3px 6px;
        }
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
			<a href="<%=projectName%>/Bieudodoanhthu" class="logo d-flex align-items-center">
				<img src="assetsquantri/img/LOGOTHE5IVE-removebg.png" alt="">
				<span class="d-none d-lg-block">Admin</span>
			</a>

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
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Quanlibaiviet.jsp"> <i
					class="fa fa-newspaper"></i> <span>Bài viết</span>
			</a></li> 
			<li class="nav-heading"><strong>Quản lý tài khoản</strong></li>

			<li class="nav-item"><a class="nav-link "
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

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Tài khoản</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Quản lý
							tài khoản</a></li>
					<li class="breadcrumb-item active">Tài khoản</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">

						<!-- Table with stripped rows -->
					<div class="table-responsive">
    <table class="table datatable col-lg-8">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên tài khoản</th>
                <th>Mật khẩu</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Địa chỉ</th>
                <th>Số điện thoại</th>
                <th>Quyền</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <% 
            String loiSuaQuyen = request.getAttribute("Loisuaquyen") != null ? request.getAttribute("Loisuaquyen").toString() : "";
            LaydulieuReponsitory lg = new LaydulieuReponsitory();
            List<User> list = lg.Laythongtinnguoidung();
            List<Quyen> q = lg.Laythongtin();
            for (User l : list) {
            	System.out.print(l.getHoTen());
            %>
            <tr>
                <td><%=l.getMaTaiKhoan()%></td>
                <td><%=l.getTenTaiKhoan()%></td>
                <td><%=l.getMatKhau().substring(0, 10)%></td>
                <td><%=l.getHoTen()%></td>
                <td><%=l.getEmail()%></td>
                <td><%=l.getDiaChi()%></td>
                <td><%=l.getSoDienThoai()%></td>
                <% 
                for (Quyen quyen : q) {
                    if (l.getMaQuyen() == quyen.getMaQuyen()) {
                %>
                <td><%=quyen.getTenQuyen()%></td>
                <% 
                    }
                }
                %>
                <td><%=l.getTrangThai()%></td>
                <div class="card-body row hide" id="editForm">
                    <h5 class="card-title">Sửa tài khoản</h5>
                    <!-- Vertical Form -->
                    <form action="suaTaiKhoanAdmin" method="POST">
                        <input type="hidden" name="id" id="editId">
                        <div class="col-12">
                            <input type="hidden" class="form-control" id="editName" name="idMaTaiKhoan" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Chọn quyền</label>
                            <div>
                                <input type="radio" id="adminRole" name="idQuyenMuonSua" value="1" required>
                                <label for="adminRole">Admin</label>
                            </div>
                            <div>
                                <input type="radio" id="KhachRole" name="idQuyenMuonSua" value="3" required>
                                <label for="KhachRole">Khách hàng</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Trạng thái</label>
                            <div>
                                <input type="radio" id="trangThaiTrueRole" name="idTrangThaiMuonSua" value="True" required>
                                <label for="trangThaiTrueRole">True</label>
                            </div>
                            <div>
                                <input type="radio" id="idTrangThaiFlaseMuonSua" name="idTrangThaiMuonSua" value="Flase" required>
                                <label for="idTrangThaiFlaseMuonSua">Flase</label>
                            </div>
                        </div>
                        <p class="text-danger"><%=loiSuaQuyen%></p>
                        <div class="size-204 respon6-next">
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                                <button type="button" class="btn btn-secondary" onclick="toggleEditForm()">Hủy</button>
                            </div>
                        </div>
                    </form>
                    <!-- Vertical Form -->
                </div>
               <%--  <td>
                    <div class="d-flex justify-content-center align-items-center">
                        <form action="suaTaiKhoanAdmin" method="POST">
                            <input type="hidden" name="idMaTaiKhoan" value="<%=l.getMaTaiKhoan()%>">
                            <button type="button" class="btn btn-outline-warning" onclick="showEditForm('<%=l.getMaTaiKhoan()%>', '<%=l.getMaTaiKhoan()%>')">Sửa</button>
                        </form>

                        <form action="xoaIdNguoiDungAccount" method="GET">
                            <input type="hidden" name="id" value="<%=l.getMaTaiKhoan()%>">
                            <button type="submit" class="btn btn-outline-danger bt2-">Xoá</button>
                        </form>
                    </div>
                </td> --%>
                <td>
    <div class="d-flex justify-content-center align-items-center">
        <!-- Nút Sửa (giữ nguyên) -->
        <form action="suaTaiKhoanAdmin" method="POST">
            <input type="hidden" name="idMaTaiKhoan" value="<%=l.getMaTaiKhoan()%>">
            <button type="button" class="btn btn-outline-warning" onclick="showEditForm('<%=l.getMaTaiKhoan()%>', '<%=l.getMaTaiKhoan()%>')">Sửa</button>
        </form>

        <!-- Nút Xóa với modal xác nhận -->
        <button type="button" class="btn btn-outline-danger ms-2" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal<%=l.getMaTaiKhoan()%>">
            Xoá
        </button>
        
        <!-- Modal xác nhận xóa -->
        <div class="modal fade" id="confirmDeleteModal<%=l.getMaTaiKhoan()%>" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn xóa tài khoản <%=l.getTenTaiKhoan()%> không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <form action="xoaIdNguoiDungAccount" method="POST" style="display: inline;">
                            <input type="hidden" name="id" value="<%=l.getMaTaiKhoan()%>">
                            <button type="submit" class="btn btn-danger">Xác nhận xóa</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
					
						<!-- End Table with stripped rows -->

					</div>
				</div>

			</div>
			</div>
		</section>

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
	function showEditForm(id, name) {
	    // Hiển thị form sửa
	    const editForm = document.getElementById('editForm');
	    editForm.classList.remove('hide');

	    // Gán giá trị vào các input
	    document.getElementById('editId').value = id;
	    document.getElementById('editName').value = name;
	}

	function toggleEditForm() {
	    // Ẩn form sửa
	    const editForm = document.getElementById('editForm');
	    editForm.classList.add('hide');
	}
	
  </script>
  
  

</body>

</html>