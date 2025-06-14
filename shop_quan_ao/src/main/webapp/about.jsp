<%@page import="model.User"%>
<%@page import="model.GioHang"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Giới thiệu</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<!-- <link rel="icon" type="image/png" href="images/icons/favicon.png"/> -->
	<link rel="icon" type="image/png" href="images/icons/LOGOTHE5IVE.jpg"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<style >
.icon-header-dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-menu {
    display: none; /* Ẩn menu mặc định */
    position: absolute;
    top: 100%;
    left: 0;
    background-color: white;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    padding: 10px 20px;
    z-index: 10;
    border-radius: 5px;
}

.dropdown-menu ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

.dropdown-menu ul li {
    padding: 8px 0;
}

.dropdown-menu ul li a {
    text-decoration: none;
    color: #333;
    font-size: 14px;
}

.icon-header-dropdown:hover .dropdown-menu {
    display: block; /* Hiển thị menu khi hover */
}

</style>
</head>
<body class="animsition">
	
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<!-- <div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					
				</div>
			</div> -->

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="Laydulieusanpham" class="logo">

						<img src="images/icons/LOGOTHE5IVE-removebg.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="Laydulieusanpham">Trang chủ</a>
								 
							</li>

							<li >
								<a href="Cuahang">Cửa hàng</a>
							</li>

							<li  class="label1" data-label1="hot">
								<a href="Giohang">Giỏ hàng</a>
							</li>
							
							<li><a href="blog.html">Blog</a></li>

							<li class="active-menu">
								<a href="about.jsp">Giới thiệu</a>
							</li>

							<li>
								<a href="contact.jsp">Liên hệ</a>
							</li>
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div
							<%Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
							List<GioHang> gh = lgn.LayHetThongTinGioHang();
							HttpSession tk = request.getSession(false);
							List<User> user = (List<User>) tk.getAttribute("Ghinhotaikhoan");
							int soluong = 0;
							float tongTien = 0;
							if (user != null) {
								for (GioHang gioHang : gh) {
									for (User u : user)
										if (u.getMaTaiKhoan() == gioHang.getMaNguoiDung()) {
											soluong += gioHang.getSoLuong();
											tongTien += gioHang.getGia();
										}
								}
							
							}%>
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="<%=soluong%>">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>


						<div class="icon-header-dropdown">
							<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="toggleDropdown(event)">
							    <i class="fa fa-user"></i>
							</a>
							
							<!-- Thẻ con chứa thông tin cá nhân và đơn hàng -->
							<div class="dropdown-menu">
								<ul>
									<li><a href="Thongtincanhan.jsp">Thông tin cá nhân</a></li>
									<li><a href="Thongtindonhangdamua.jsp">Đơn hàng</a></li>
									<li><a href="Dangxuat">Đăng xuất</a></li>
								</ul>
							</div>
						</div>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="images/icons/LOGOTHE5IVE-removebg.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m">
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<%
				tongTien = 0;
				if (user != null) {
					for (GioHang gioHang : gh) {
						for (User u : user)
					if (u.getMaTaiKhoan() == gioHang.getMaNguoiDung()) {
						soluong += gioHang.getSoLuong();
						tongTien += gioHang.getGia();
					}
					}

				}
				%>
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
					data-notify="<%=soluong%>">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>


				<div class="icon-header-dropdown">
					<a href="#"
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i
						class="fa fa-user"></i>
					</a>

					<!-- Thẻ con chứa thông tin cá nhân và đơn hàng -->
					<div class="dropdown-menu">
						<ul>
							<li><a href="Thongtincanhan.jsp">Thông tin cá nhân</a></li>
							<li><a href="Thongtindonhangdamua.jsp">Đơn hàng</a></li>
							<li><a href="Dangxuat">Đăng xuất</a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Miễn phí giao hàng cho đơn từ $100
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Trợ giúp & FAQs
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Tài khoản của tôi
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							VN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="Laydulieusanpham">Trang chủ</a>
					
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="Cuahang">Cửa hàng</a>
				</li>

				<li>
					<a href="Giohang" class="label1 rs1" data-label1="hot">Giỏ hàng</a>
				</li>

				<li>
					<a href="blog.html">Blog</a>
				</li>

				<li>
					<a href="about.jsp">Giới thiệu</a>
				</li>

				<li>
					<a href="contact.html">Liên hệ</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Giỏ hàng </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<%
					if (user != null) {
						for (GioHang giohang : gh) {
							for (User u : user) {
						if (u.getMaTaiKhoan() == giohang.getMaNguoiDung()) {
					%>
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="<%=giohang.getDuongDan()%>" alt="IMG">
						</div>
						<div class="header-cart-item-txt" style="padding-top: 4px;">
							<a href="#" class="header-cart-item-name hov-cl1 trans-04" style="margin-bottom: 4px; display: inline-block;">
								<%= giohang.getTenSanPham() %>
							</a>
							<div class="header-cart-item-info" style="font-size: 13px; color: #888;">
								Số lượng: <%= giohang.getSoLuong() %> &nbsp;-&nbsp; Tổng: <%= String.format("%.2f", giohang.getGia()) %>
							</div>
						</div>
					</li>
					<%
					}
					}
					}
					}
					%>

				</ul>

				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
  <strong>Tổng tiền:</strong> 
  <span style="font-weight: normal;"><%= tongTien %>đ</span>
</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="Giohang"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							Xem giỏ hàng </a> <a href="Giohang"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Kiểm tra </a>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			<strong>Về chúng tôi</strong>
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-100 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							<strong> Hành Trình Chúng Tôi</strong>
						</h3>

						<p class="stext-113 cl6 p-b-26 text-align: justify">
							The 5ive là điểm đến lý tưởng dành cho những ai yêu thích phong cách thời trang hiện đại, tinh tế và luôn bắt kịp xu hướng. Tại đây, bạn sẽ dễ dàng khám phá bộ sưu tập đa dạng từ quần áo, giày dép, túi xách cho đến phụ kiện thời trang – tất cả đều được chọn lọc kỹ lưỡng nhằm tôn lên cá tính và gu thẩm mỹ riêng biệt của từng khách hàng.

Giao diện của The 5ive được thiết kế hiện đại, thân thiện với người dùng, giúp việc mua sắm trực tuyến trở nên đơn giản và thú vị. Mỗi sản phẩm đều được mô tả chi tiết với hình ảnh rõ nét, thông tin chất liệu, size, màu sắc và gợi ý phối đồ độc đáo. Bạn có thể dễ dàng lọc theo danh mục, mức giá, màu sắc hay kích cỡ để nhanh chóng tìm ra item ưng ý.
						</p>

					
					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							<img src="images/about-01.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="order-md-2 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							<strong>Sứ Mệnh Của Chúng Tôi</strong>
						</h3>

						<p class="stext-113 cl6 p-b-26 text-align: justify">
							The 5ive không chỉ là nơi bạn mua sắm quần áo - mà là nơi bạn khám phá và thể hiện bản sắc riêng qua từng thiết kế.
Chúng tôi mang đến những lựa chọn thời trang hiện đại, tinh tế và đa dạng, được tuyển chọn kỹ lưỡng để phù hợp với nhiều phong cách - từ tối giản thanh lịch, năng động cá tính đến bắt trend thời thượng.

Bên cạnh chất lượng sản phẩm, chúng tôi chú trọng vào trải nghiệm mua sắm trực tuyến: giao diện thân thiện, bộ lọc thông minh, hình ảnh rõ nét và dịch vụ hỗ trợ tận tâm – tất cả đều hướng đến sự tiện lợi, thoải mái và truyền cảm hứng cho người dùng.

Với The 5ive, thời trang không chỉ là vẻ ngoài, mà là cách bạn kể câu chuyện của chính mình - một cách tự tin và khác biệt.
</p>

						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<em>"Define Your Style - Live The 5ive."</em>

						</div>
					</div>
				</div>

				<div class="order-md-1 col-11 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img0">
							<img src="images/about-02.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
		

	<!-- Footer -->
		<!-- Footer -->
	<footer class="bg3 p-t-75 p-b-32">
		<div class="container">
	<div class="row">
    <!-- LIÊN HỆ VỚI CHÚNG TÔI -->
    <div class="col-sm-6 col-lg-4 p-b-50">
    <h4 class="stext-301 cl0 p-b-30"><strong>The 5ive</strong></h4>
        <p class="stext-107 cl7 size-201">
          The 5ive là thương hiệu thời trang hiện đại, kết hợp sự tối giản và cá tính, đề cao tự do thể hiện bản thân. Với chúng tôi, thời trang là tuyên ngôn cá nhân.
        </p><p class="stext-107 cl7 size-201 p-t-10">
        <em>"Define Your Style – Live The 5ive."</em>
    </p>
        
    </div>

<!-- HỖ TRỢ KHÁCH HÀNG -->
<div class="col-sm-6 col-lg-4 p-b-50">
    <h4 class="stext-301 cl0 p-b-30"><strong>Hỗ trợ khách hàng</strong></h4>
    <p class="stext-107 cl7 size-201">
        <strong>Tổng đài chăm sóc khách hàng:</strong>
    </p>
    <p class="stext-107 cl7 size-201">
        <strong>Thời trang/Nhận hàng:</strong> 1800 6789
    </p>
    <p class="stext-107 cl7 size-201">
        <strong>Đổi trả/Bảo hành:</strong> 1800 1234
    </p>
    <p class="stext-107 cl7 size-201">
        <strong>Email CSKH:</strong> support@the5ive.vn
    </p>
</div>


    <!-- THEO DÕI CHÚNG TÔI -->
    <div class="col-sm-6 col-lg-4 p-b-50">
    <h4 class="stext-301 cl0 p-b-30"><strong>Theo dõi chúng tôi</strong></h4>
         <div class="auth-external-list">
        <div class="row social-icons-custom">
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-facebook"></i>
                </a>
            </div>
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-instagram"></i>
                </a>
            </div>
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-pinterest-p"></i>
                </a>
            </div>
            <div class="col-2 d-flex justify-content-right">
                <a href="#" class="social-icon">
                    <i class="fa fa-twitter"></i> <!-- Icon thêm nếu muốn đủ 4 -->
                </a>
            </div>
        </div>
    </div>
</div>

    </div>
			</div>

			<div class="p-t-40">
				<div class="flex-c-m flex-w p-b-18">
					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
					</a>

					<a href="#" class="m-all-1">
						<img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
					</a>
				</div>

				<p class="stext-107 cl6 txt-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> &amp; distributed by <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

				</p>
			</div>
		</div>
	</footer>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	
	<script>
	// điều hướng icon hợp lý
	// Hàm để mở và đóng dropdown
	function toggleDropdown(event) {
	    event.preventDefault();  // Ngừng hành động mặc định của <a> (tránh điều hướng)
	
	    // Lấy thẻ dropdown
	    const dropdownMenu = document.querySelector('.dropdown-menu');
	    
	    // Chuyển đổi việc hiển thị menu dropdown (hiển thị/ẩn)
	    dropdownMenu.classList.toggle('show');  // Tạo class 'show' để hiển thị dropdown
	}
	
	// Hàm để đóng dropdown khi click ra ngoài
	function closeDropdown(event) {
	    const dropdownMenu = document.querySelector('.dropdown-menu');
	    
	    // Kiểm tra nếu click ra ngoài dropdown (và không click vào icon user)
	    if (!dropdownMenu.contains(event.target) && !event.target.closest('.icon-header-item')) {
	        dropdownMenu.classList.remove('show');  // Ẩn dropdown
	    }
	}
	
	// Lắng nghe sự kiện click toàn trang
	document.addEventListener('click', closeDropdown);

    </script>
}
	
</body>
</html>