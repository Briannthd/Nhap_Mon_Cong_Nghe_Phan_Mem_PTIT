
<%@page import="model.User"%>
<%@page import="model.DanhMuc"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Template Main CSS File -->
<link href="assetsquantri/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
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

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-person-circle"></i> <span
						<%if (listt != null) {
	for (User u : listt) {%>
						class="d-none d-md-block dropdown-toggle ps-2"><%=u.getHoTen()%>
					</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6><%=u.getTenTaiKhoan()%></h6> <%
 if (u.getMaQuyen() == 1) {
 %> <span>Quản
								trị viên</span> <%
 } else {
 %> <span>Khách hàng</span> <%
 }
 %>
						</li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="Thongtincanhan.jsp"> <i class="bi bi-person"></i> <span>Thông
									tin cá nhân </span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li><a class="dropdown-item d-flex align-items-center"
							href="Dangxuat"> <i class="bi bi-box-arrow-right"></i> <span>Đăng
									xuất</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<%
				}
				}
				%>
				<!-- End Profile Nav -->

			</ul>
		</nav>

	</header>
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-heading"><strong>Tổng quan dữ liệu</strong></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Bieudodoanhthu"> <i
					class="fas fa-tachometer-alt"></i> <span>Biểu đồ thống kê</span>
			</a></li>

			<li class="nav-heading"><strong>Quản lý bán hàng</strong></li>
			<li class="nav-item"><a class="nav-link "
				href="<%=projectName%>/category.jsp"> <i
					class="bi bi-layout-text-window-reverse"></i> <span>Danh mục</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Donhangquantri.jsp"> <i
					class="bi bi-cart"></i> <span>Đơn hàng</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/productquantri.jsp"> <i
					class="bi bi-grid"></i> <span>Sản phẩm</span>
			</a></li>
			<li class="nav-item"><a class="nav-link collapsed"
				href="<%=projectName%>/Quanlidanhgia.jsp"> <i class="fa fa-star"></i>
					<span>Đánh giá</span>
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

			<%-- <li class="nav-item">
        <a class="nav-link collapsed" href="<%=projectName%>/group.jsp">
          <i class="bi bi-question-circle"></i>
          <span>Phân quyền</span>
        </a>
      </li><!-- End F.A.Q Page Nav --> --%>

		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Danh mục</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Quản lý
							bán hàng</a></li>
					<li class="breadcrumb-item active">Danh mục</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
						          <h3 class="card-title"><b>Quản lý danh mục</b></h3>
							<div
								style="display: flex; justify-content: flex-end; align-items: center; gap: 8px; margin-bottom: 10px;">
								<p style="margin: 0;">Thêm danh mục phân loại</p>
								<button type="button" id="addb" class="btn btn-success">
									<i class="bi bi-plus-lg"></i>
								</button>
							</div>
							<div class="card">
								<div class="card-body row hide" id="addf">
									<h5 class="card-title">Thêm danh mục phân loại</h5>
									<%
									String msg = request.getParameter("success");
									String err = request.getParameter("error");

									if ("true".equals(msg)) {
									%>
									<div class="alert alert-success">Thêm danh mục thành
										công!</div>
									<%
									} else if ("fail".equals(err)) {
									%>
									<div class="alert alert-danger">Thêm danh mục thất bại!</div>
									<%
									} else if ("empty".equals(err)) {
									%>
									<div class="alert alert-warning">Tên danh mục không được
										để trống.</div>
									<%
									} else if ("duplicate".equals(err)) {
									%>
									<div class="alert alert-warning">Tên danh mục đã tồn tại!</div>
									<%
									}
									%>

									<!-- Vertical Form -->
									<form id="form-them-danh-muc">
										<div class="col-12">
											<label for="inputName" class="form-label">Tên danh
												mục</label> <input type="text" class="form-control" id="inputName"
												name="addThemSanPham">
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-primary">Thêm</button>
										</div>
									</form>
									<!-- Vertical Form -->

								</div>

								<!-- Thanh tìm kiếm -->
								<div class="search-container" style="padding: 20px;">
									<input type="text" id="search-input" class="form-control"
										placeholder="Tìm kiếm danh mục..." />
								</div>

							</div>
							<!-- Table with stripped rows -->
							<table class="table datatable">
								<thead>
									<tr>
										<th>Mã số</th>
										<th>Phân loại</th>
										<th class="small-column">Số lượng sản phẩm</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<%
									LaydulieuReponsitory lg = new LaydulieuReponsitory();
									List<DanhMuc> l = lg.SelectDanhMuc();
									for (DanhMuc danhmuc : l) {
										
									%>
									<tr>
										<td><%=danhmuc.getMaDanhmuc()%></td>
										<td><%=danhmuc.getTenDanhMuc()%></td>
										<td class="small-column"><%=danhmuc.getSoluong()%></td>
										<td>
											<button type="button" class="btn btn-outline-warning btn-sm"
												data-id="1" onclick="editForm(this)">Sửa</button> <!-- Xoá Button -->
											<form action="Xoadanhmuc" method="post"
												class="d-inline-block" 
												onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">
												<input type="hidden" value="<%=danhmuc.getMaDanhmuc()%>" name="id">
												<button class="btn btn-outline-danger btn-sm" type="submit">Xoá</button>
											</form> <!-- Chi tiết Button -->
											<form action="Chitietdanhmuc" method="get"
												class="d-inline-block">
												<input type="hidden" value="<%=danhmuc.getMaDanhmuc()%>" name="id">
												<button type="submit" class="btn btn-outline-info btn-sm"
													id="detailB">Chi tiết</button>
											</form>
											</div>
										</td>
									</tr>
									<%
									}
									
									%>


								</tbody>
							</table>
							<!-- End Table with stripped rows -->

						</div>
					</div>

				</div>
			</div>
		</section>
		<%
		String loi = (String) request.getAttribute("loi");
		if (loi != null) {
		%>
		<script>
    alert("Lỗi sửa sản phẩm");
    </script>
		<%
		}
		%>
		<div class="card editForm hide" id="editF">
			<div class="card-body row">
				<h5 class="card-title">Sửa danh mục</h5>

				<!-- Vertical Form -->
				<form action="UpdateDanhMuc" method="post" id="form-sua-danh-muc">
					<input type="hidden" id="product-id" name="product-id" readonly>

					<div class="col-12">
						<label for="inputName" class="form-label">Tên danh mục mới</label>
						<input type="text" class="form-control" id="inputUpdate"
							name="updateDanhMuc">
					</div>

					<!-- Error Message Box -->
					<div id="edit-error-msg" class="text-danger"></div>
					<!-- This will show error messages -->

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Sửa</button>
						<button type="button" class="btn btn-secondary" id="cancelBtn">Hủy</button>
					</div>
				</form>
				<!-- End Vertical Form -->
			</div>
		</div>

		<div class="card detailForm hide" id="detailF">
			<div class="card-body row ">
				<h5 class="card-title">Chi tiết danh mục</h5>

				<!-- Vertical Form -->
				<form>
					<div class="col-12">
						<table class="table datatable">
							<thead>
								<tr>
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Giá</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>01</td>
									<td>Mini Silver Mesh Watch</td>
									<td>$86.85</td>
								</tr>
								<tr>
									<td>01</td>
									<td>Mini Silver Mesh Watch</td>
									<td>$86.85</td>
								</tr>
								<tr>
									<td>01</td>
									<td>Mini Silver Mesh Watch</td>
									<td>$86.85</td>
								</tr>
								<tr>
									<td>01</td>
									<td>Mini Silver Mesh Watch</td>
									<td>$86.85</td>
								</tr>
								<tr>
									<td>01</td>
									<td>Mini Silver Mesh Watch</td>
									<td>$86.85</td>
								</tr>
								<tr>
									<td>01</td>
									<td>Mini Silver Mesh Watch</td>
									<td>$86.85</td>
								</tr>
							</tbody>
						</table>
				</form>
				<!-- Vertical Form -->
			</div>
		</div>

		</div>
	</main>
	<!-- End #main -->
	<div id="smoke" class="smoke hide"></div>
	<!-- ======= Footer ======= -->


	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<!--  <script src="assetsquantri/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assetsquantri/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assetsquantri/vendor/chart.js/chart.umd.js"></script>
  <script src="assetsquantri/vendor/echarts/echarts.min.js"></script>
  <script src="assetsquantri/vendor/quill/quill.js"></script>
  <script src="assetsquantri/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assetsquantri/vendor/tinymce/tinymce.min.js"></script>
  <script src="assetsquantri/vendor/php-email-form/validate.js"></script> -->
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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

/*  document.getElementById('editB').addEventListener('click', () => {editForm();}); */
function editForm(button) {
    const editF = document.getElementById('editF');
    const smoke = document.getElementById('smoke');
    const productIdInput = document.getElementById('product-id'); // Input để lưu id sản phẩm
    const productId = button.getAttribute('data-id'); // Lấy data-id từ button

    // Nếu tồn tại input product-id, cập nhật giá trị id vào input đó
    if (productIdInput) {
        productIdInput.value = productId; // Gán id vào input
    }

    // Hiển thị form chỉnh sửa
    if (editF.classList.contains('hide')) {
        editF.classList.remove('hide');
        smoke.classList.remove('hide');
    }
}

	document.getElementById('detailB').addEventListener('click', () => {detailForm();});
	function detailForm() {
		const detailF = document.getElementById('detailF');
		const smoke = document.getElementById('smoke');
		
		if (detailF.classList.contains('hide')) {
			detailF.classList.remove('hide');
			smoke.classList.remove('hide');
		}
	}
	document.getElementById('smoke').addEventListener('click', function() {
	  document.getElementById('smoke').classList.add('hide');
	  document.getElementById('editF').classList.add('hide');
	  document.getElementById('detailF').classList.add('hide');  
	});
	
  </script>

	<script>
	document.addEventListener("DOMContentLoaded", function () {
	  const form = document.getElementById("form-them-danh-muc");
	  const input = document.getElementById("inputName");
	
	  if (!form || !input) return;
	
	  function xuLyThemDanhMuc() {
	    const tenDanhMuc = input.value.trim();
	
	    if (!tenDanhMuc) {
	      alert("Tên danh mục không được để trống!");
	      return;
	    }
	
	    fetch("Themdanhmuc", {
	      method: "POST",
	      headers: {
	        "Content-Type": "application/x-www-form-urlencoded"
	      },
	      body: "addThemSanPham=" + encodeURIComponent(tenDanhMuc)
	    })
	    .then(res => res.text())
	    .then(result => {
	      switch (result.trim()) {
	        case "success":
	          alert("Thêm danh mục thành công!");
	          location.reload(); // tự động reload
	          break;
	        case "duplicate":
	          alert("Tên danh mục đã tồn tại!");
	          break;
	        case "empty":
	          alert("Tên danh mục không được để trống!");
	          break;
	        default:
	          alert("Có lỗi xảy ra khi thêm danh mục.");
	      }
	    })
	    .catch(err => {
	      console.error("Lỗi fetch:", err);
	      alert("Không thể kết nối đến server.");
	    });
	  }
	
	  input.addEventListener("keydown", function(e) {
	    if (e.key === "Enter") {
	      e.preventDefault();
	      xuLyThemDanhMuc(); // xử lý giống submit
	    }
	  });
	
	  form.addEventListener("submit", function(e) {
	    e.preventDefault();
	    xuLyThemDanhMuc();
	  });
	});
	</script>

	<script>
	function confirmDelete(id) {
	  if (confirm("Bạn có chắc chắn muốn xoá danh mục này không?")) {
	    window.location.href = "Xoadanhmuc?id=" + id;
	  }
	}
	</script>

	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const form = document.getElementById("form-sua-danh-muc");
	    const input = document.getElementById("inputUpdate");
	    const msgBox = document.getElementById("edit-error-msg");
	
	    if (!form || !input) return;
	
	    // Xử lý khi sửa danh mục
	    function xuLySuaDanhMuc() {
	        const tenDanhMuc = input.value.trim(); // Lấy giá trị tên danh mục nhập vào
	
	        // Kiểm tra nếu tên danh mục rỗng
	        if (!tenDanhMuc) {
	            msgBox.textContent = "Tên danh mục không được để trống!";
	            return;
	        }
	
	        // Gửi yêu cầu kiểm tra trùng tên danh mục
	        fetch("UpdateDanhMuc", {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/x-www-form-urlencoded"
	            },
	            body: "product-id=" + encodeURIComponent(document.getElementById('product-id').value) + 
	                  "&updateDanhMuc=" + encodeURIComponent(tenDanhMuc)
	        })
	        .then(res => res.text())
	        .then(result => {
	            switch (result.trim()) {
	                case "success":
	                    alert("Sửa danh mục thành công!");
	                    location.reload(); // Reload trang sau khi sửa thành công
	                    break;
	                case "duplicate":
	                    msgBox.textContent = "Tên danh mục mới đã tồn tại!";
	                    break;
	                case "fail":
	                    msgBox.textContent = "Cập nhật danh mục thất bại!";
	                    break;
	                case "empty":
	                    msgBox.textContent = "Tên danh mục không được để trống!";
	                    break;
	                default:
	                    msgBox.textContent = "Có lỗi xảy ra khi sửa danh mục.";
	            }
	        })
	        .catch(err => {
	            console.error("Lỗi fetch:", err);
	            msgBox.textContent = "❌ Không thể kết nối đến server.";
	        });
	        
	    }
	
	    // Lắng nghe sự kiện nhấn enter trong input
	    input.addEventListener("keydown", function(e) {
	        if (e.key === "Enter") {
	            e.preventDefault();
	            xuLySuaDanhMuc(); // Gọi hàm xử lý sửa danh mục khi nhấn enter
	        }
	    });
	
	    // Lắng nghe sự kiện submit của form
	    form.addEventListener("submit", function(e) {
	        e.preventDefault(); // Ngừng hành động mặc định của form submit
	        xuLySuaDanhMuc(); // Gọi hàm xử lý sửa danh mục
	    });
	    
	    cancelBtn.addEventListener("click", function() {
	        const editForm = document.getElementById('editF');
	        const smoke = document.getElementById('smoke');
	        // Ẩn form và lớp phủ mờ
	        if (editForm) {
	            editForm.classList.add('hide');
	        }
	        if (smoke) {
	            smoke.classList.add('hide');
	        }
	        // Reset các trường nhập liệu
	        form.reset();
	        msgBox.textContent = ''; // Xóa thông báo lỗi
	    });

	});
	</script>

	<script>
	document.getElementById('search-input').addEventListener('input', function() {
	    const filter = this.value.toLowerCase(); // Lấy giá trị tìm kiếm và chuyển sang chữ thường
	    const rows = document.querySelectorAll('table tbody tr'); // Chọn tất cả các dòng trong bảng
	
	    rows.forEach(row => {
	        const columns = row.querySelectorAll('td');
	        let matchFound = false;
	
	        columns.forEach(column => {
	            // Kiểm tra xem một trong các cột có chứa chuỗi tìm kiếm không
	            if (column.textContent.toLowerCase().includes(filter)) {
	                matchFound = true;
	            }
	        });
	
	        // Ẩn hoặc hiển thị dòng tùy vào kết quả tìm kiếm
	        if (matchFound) {
	            row.style.display = '';
	        } else {
	            row.style.display = 'none';
	        }
	    });
	});
	
	</script>
</body>

</html>
