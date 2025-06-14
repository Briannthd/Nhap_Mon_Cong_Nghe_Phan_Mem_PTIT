<%@page import="model.User"%>
<%@page import="model.GioHang"%>
<%@page import="java.util.List"%>
<%@page import="Reponsitory.Laydulieuchonguoidung"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Liên hệ</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
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
<style>
.d-none {
    display: none;
}

.d-block {
    display: block;
}
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
					<div class="left-top-bar">
						Web bán hàng thời trang phong cách 
					</div>

				
				</div>
			</div> -->

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="Laydulieusanpham" class="logo">
						<img src="assetsquantri/img/LOGOTHE5IVE-removebg.png" alt="IMG-LOGO">
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
							
							<li class="active-menu">
								<a href="blog.html">Blog</a>
							</li>
							
							<li>
								<a href="about.jsp">Giới thiệu</a>
							</li>

							<li class="active-menu">
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
						<%
						Laydulieuchonguoidung lgn = new Laydulieuchonguoidung();
							List<GioHang> gh = lgn.LayHetThongTinGioHang();
							HttpSession tk = request.getSession(false);
							List<User> user = (List<User>) tk.getAttribute("Ghinhotaikhoan");
							
								int soluong = 0;
								float tongTien = 0;
								if(user != null){
								for(GioHang gioHang:gh){
									for(User u : user)
										if(u.getMaTaiKhoan()==gioHang.getMaNguoiDung()){
									soluong += gioHang.getSoLuong();
									tongTien += gioHang.getGia();
										}
								}
							}
							
							
						%>
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
					
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="Laydulieusanpham"><img src="assetsquantri/img/logo.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div
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
							
							}%>
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
							data-notify="<%=soluong%>">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>


						<div class="icon-header-dropdown">
							<a href="#"
								class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
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
				<!-- <li>
					<div class="left-top-bar">
						Trang web bán thời trang của tuấn
					</div>
				</li> -->

			
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
					<a href="about.jsp">Giới thiệu</a>
				</li>

				<li>
					<a href="contact.jsp">Liên hệ</a>
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
				<span class="mtext-103 cl2">
					Giỏ hàng của bạn
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
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
					    Tổng tiền: <%=tongTien%>đ
					</div>


					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							Xem giỏ hàng
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Kiểm tra
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Liên hệ
		</h2>
	</section>	


	<!-- Content page -->
<section class="bg0 p-t-104 p-b-116">
  <div class="container">
    <div class="row justify-content-center gy-5">
      <!-- Form bên trái -->
      <div class="col-lg-6 col-md-10 me-0">
        <div class="p-4 border rounded shadow-sm bg-white h-100">
          <form action="Emailweb" method="post">
            <h4 class="mtext-105 cl2 txt-center p-b-30 fw-bold">
              Để lại tin nhắn cho chúng tôi
            </h4>

            <div class="bor8 m-b-20 how-pos4-parent">
              <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30 fw-bold" 
                     type="text" name="email"
                     placeholder="Địa chỉ email" value="nguyenvana@gmail.com">
              <img class="how-pos4 pointer-none" src="images/icons/icon-email.png" alt="ICON">
            </div>

            <div class="bor8 m-b-30">
              <textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25 fw-bold" 
                        name="msg" placeholder="Chúng tôi có thể giúp gì cho bạn?"></textarea>
            </div>

            <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
              Gửi
            </button>
          </form>
        </div>
      </div>

     <!-- Thông tin bên phải -->
		<div class="col-lg-5 col-md-10 ms-0">
		  <div class="p-4 py-5 border rounded shadow-sm bg-white h-100 d-flex align-items-center">
		    <div class="w-100">
		      <div class="contact-item d-flex align-items-start gap-3 mb-4">
		        <span class="contact-item-icon"><i class="lnr lnr-map-marker"></i></span>
		        <div>
		          <span class="mtext-110 cl2">Địa chỉ</span>
		          <p class="stext-115 cl6 p-t-10">379 Hudson Street, Floor 8, New York, NY 10014, USA</p>
		        </div>
		      </div>
		
		      <div class="contact-item d-flex align-items-start gap-3 mb-4">
		        <span class="contact-item-icon"><i class="lnr lnr-phone-handset"></i></span>
		        <div>
		          <span class="mtext-110 cl2">Số điện thoại</span>
		          <p class="stext-115 cl1 p-t-10">18008098</p>
		        </div>
		      </div>
		
		      <div class="contact-item d-flex align-items-start gap-3">
		        <span class="contact-item-icon"><i class="lnr lnr-envelope"></i></span>
		        <div>
		          <span class="mtext-110 cl2">Thư điện tử</span>
		          <p class="stext-115 cl1 p-t-10">dotanhung0505@gmail.com</p>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>

    </div>
  </div>
</section>


	
	<!-- Map -->
	<!-- <div class="map">
		<div class="size-303" id="google_map" data-map-x="40.691446" data-map-y="-73.886787" data-pin="images/icons/pin.png" data-scrollwhell="0" data-draggable="1" data-zoom="11"></div>
	</div> -->



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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/map-custom.js"></script>
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
    
</body>
</html>