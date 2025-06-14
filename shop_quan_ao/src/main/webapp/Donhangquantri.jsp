<%@page import="model.ChiTietSanPham"%>
<%@page import="Reponsitory.LaydulieuReponsitory"%>
<%@page import="model.DonHang"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@page import="controller.Donhang"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
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
			<li class="nav-item"><a class="nav-link "
				href="<%=projectName%>/Donhangquantri.jsp"> <i
					class="bi bi-cart"></i> <span>Đơn hàng</span>
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

<main id="main" class="main">
    <section class="section orders">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Danh sách đơn hàng</h5>

                <!-- Thanh tìm kiếm -->
                <div class="col-12 mb-3">
                    <input type="text" id="searchInput" class="form-control" placeholder="Tìm kiếm theo tên khách hàng...">
                </div>

                <!-- <div id="editSection" style="display: none;">
                    <form action="SuavaXoaDonHanQuanTri">
                        <input type="hidden" id="itemId" name="idDonHangCanSua"/>
                        <label for="status">Trạng thái:</label>
                        <select id="status" name="trangThai">
                            <option value="Đang giao đến bạn">Đang giao đến bạn</option>
                            <option value="Tạm dừng">Tạm dừng</option>
                            <option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
                            <option value="Hoàn thành">Hoàn thành</option>
                        </select>
                        <button type="submit" class="btn btn-primary" name="Luu" uu">Lưu</button>
                    </form>
                </div> -->
				<!-- Modal chỉnh sửa trạng thái -->
				<div class="modal fade" id="editStatusModal" tabindex="-1" aria-labelledby="editStatusModalLabel" aria-hidden="true">
					<div class="modal-dialog">
					  <div class="modal-content">
						<div class="modal-header">
						  <h5 class="modal-title" id="editStatusModalLabel">Chỉnh sửa trạng thái đơn hàng</h5>
						  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<form action="SuavaXoaDonHanQuanTri">
						  <div class="modal-body">
							<input type="hidden" id="itemId" name="idDonHangCanSua"/>
							<div class="mb-3">
							  <label for="status" class="form-label">Trạng thái:</label>
							  <select class="form-select" id="status" name="trangThai">
								<option value="Đang giao đến bạn">Đang giao đến bạn</option>
								<option value="Tạm dừng">Tạm dừng</option>
								<option value="Đang chuẩn bị hàng">Đang chuẩn bị hàng</option>
								<option value="Hoàn thành">Hoàn thành</option>
							  </select>
							</div>
						  </div>
						  <div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
							<button type="submit" class="btn btn-primary" name="Luu" value="Luu">Lưu thay đổi</button>
						  </div>
						</form>
					  </div>
					</div>
				  </div>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Sản phẩm</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Tổng giá trị</th>
                            <th scope="col">Ngày đặt</th>
                            <th scope="col">Địa chỉ giao</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
                        List<DonHang> l = lgn.LayThongTinDonHang();
                        LaydulieuReponsitory lg = new LaydulieuReponsitory();
                        List<ChiTietSanPham> listChiTiet = lg.Laythongtinchitietsanpham();
                        for (DonHang h : l) {
                        %>
                        <tr>
                            <th scope="row"><%=h.getMaDonHang()%></th>
                            <td><%=h.getTenKhachHang()%></td>
                            <td><%=h.getMaChiTietSanPham()%></td>
                            <td><%=h.getSoLuong()%></td>
                            <td><%=h.getSoDienThoai()%></td>
                            <td><%=h.getGia()%></td>
                            <td><%=h.getNgayDatHang()%></td>
                            <td><%=h.getDiaChiGiaoHang()%></td>
                            <td><span class="badge bg-warning"><%=h.getTrangThai()%></span></td>
                             <td>
                                <button class="btn btn-warning btn-sm" onclick="editStatus('<%=h.getMaDonHang() %>')">Sửa</button>
                                <form action="SuavaXoaDonHanQuanTri">
                                    <input type="hidden" value="<%=h.getMaDonHang()%>" name="idDonHang">
                                    <button class="btn btn-danger btn-sm" name="Xoa" value="Xoa" onclick="confirmDelete()">Xóa</button>
                                </form>
                            </td> 
							<%-- <td>
								<button class="btn btn-warning btn-sm" onclick="editStatus('<%=h.getMaDonHang() %>')">Sửa</button>
								<form action="SuavaXoaDonHanQuanTri" style="display: inline;">
								  <input type="hidden" value="<%=h.getMaDonHang()%>" name="idDonHang">
								  <!-- <button class="btn btn-danger btn-sm" name="Xoa" value="Xoa" onclick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng này?')">Xóa</button> -->
								</form>
							  </td> --%>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</main>
	<script src="assetsquantri/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assetsquantri/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assetsquantri/vendor/chart.js/chart.umd.js"></script>
	<script src="assetsquantri/vendor/echarts/echarts.min.js"></script>
	<script src="assetsquantri/vendor/quill/quill.js"></script>
	<script
		src="assetsquantri/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assetsquantri/vendor/tinymce/tinymce.min.js"></script>
	<script src="assetsquantri/vendor/php-email-form/validate.js"></script>
<div id="smoke" class="smoke hide"></div>
<script src="assetsquantri/js/main.js"></script>
<script>
    // Lắng nghe sự kiện nhập dữ liệu từ thanh tìm kiếm
     document.getElementById('searchInput').addEventListener('input', function () {
        const searchValue = this.value.toLowerCase(); // Lấy giá trị tìm kiếm
        const rows = document.querySelectorAll('tbody tr'); // Tất cả các hàng trong bảng

        rows.forEach(row => {
            const customerName = row.querySelector('td:nth-child(2)')?.textContent.trim().toLowerCase(); // Tên khách hàng từ cột thứ 2
            if (customerName && customerName.includes(searchValue)) {
                row.style.display = ''; // Hiển thị hàng nếu tên khách hàng chứa giá trị tìm kiếm
            } else {
                row.style.display = 'none'; // Ẩn hàng nếu không khớp
            }
        });
    }); 

    // Hàm xác nhận xóa
    function confirmDelete() {
        const confirmed = confirm("Bạn có chắc chắn muốn xóa mục này không?");
        if (confirmed) {
            alert("Mục đã được xóa thành công!");
        } else {
            alert("Hành động đã bị hủy.");
        }
    }

    // Hàm chỉnh sửa trạng thái
    // function editStatus(id) {
    //     const editSection = document.getElementById("editSection");
    //     editSection.style.display = "block";  // Hiển thị phần sửa

    //     const idInput = document.getElementById("itemId");
    //     idInput.value = id;

    //     // alert("Bạn chắc chắn muốn sửa chứ?");
    // }
	function editStatus(id) {
  // Đặt giá trị ID vào hidden input
  document.getElementById("itemId").value = id;
  
  // Hiển thị modal
  var editModal = new bootstrap.Modal(document.getElementById('editStatusModal'));
  editModal.show();
}

function submitEditForm() {
  // Submit form khi click nút Lưu
  document.querySelector('#editStatusModal form').submit();
}
    // xóa tìm kiéme đi để chạy
     document.getElementById('addb').addEventListener('click', () => {toggleUpload();});
	function toggleUpload() {
		const addForm = document.getElementById('addf');
		

		if (addForm.classList.contains('hide')) {
			addForm.classList.remove('hide');
	   

		} else {
			addForm.classList.add('hide');
		   
		}
	}

	document.getElementById('editB').addEventListener('click', () => {editForm();});
	function editForm() {
		const editF = document.getElementById('editF');
		const smoke = document.getElementById('smoke');
		
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



		

</body>

</html>