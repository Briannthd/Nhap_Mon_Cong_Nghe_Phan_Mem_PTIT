<%@page import="java.util.Map"%>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
			<li class="nav-item"><a class="nav-link"
				href="<%=projectName%>/Bieudodoanhthu"> <i class="fas fa-tachometer-alt"></i> <span>Biểu đồ
						thống kê</span>
			</a></li>
			<li class="nav-heading"><strong>Quản lý bán hàng</strong></li>
			<li class="nav-item"><a class="nav-link collapsed"
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

		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
				 <h5 class="card-title">Thống kê doanh thu theo tháng</h5>
<canvas id="revenueChartMonth" width="800" height="400"></canvas>


				<%
    Map<Integer, Double> doanhThuTheoThang = (Map<Integer, Double>) request.getAttribute("doanhthuthang");
    System.out.println("Doanh thu theo tháng bên JSP: " + doanhThuTheoThang);

    // Chuẩn bị dữ liệu labels và data cho biểu đồ theo tháng
    StringBuilder labelsthang = new StringBuilder("[" );
    StringBuilder datathang = new StringBuilder("[");

    for (Map.Entry<Integer, Double> entry : doanhThuTheoThang.entrySet()) {
        labelsthang.append("\"").append(entry.getKey()).append("\", ");
        datathang.append(entry.getValue()).append(", ");
    }

    // Xóa dấu phẩy cuối cùng
    if (labelsthang.length() > 1) labelsthang.setLength(labelsthang.length() - 2);
    if (datathang.length() > 1) datathang.setLength(datathang.length() - 2);

    labelsthang.append("]");
    datathang.append("]");
%>

<script>
    // Gán dữ liệu từ JSP vào JavaScript
    const labelsMonth = <%= labelsthang.toString() %>;
    const dataMonth = <%= datathang.toString() %>;

    console.log("Labels tháng: ", labelsMonth);
    console.log("Data tháng: ", dataMonth);

    const ctxMonth = document.getElementById('revenueChartMonth').getContext('2d');
    const revenueChartMonth = new Chart(ctxMonth, {
        type: 'bar', // Loại biểu đồ: bar
        data: {
            labels: labelsMonth,
            datasets: [{
                label: 'Doanh thu theo tháng',
                data: dataMonth,
                backgroundColor: [
                	  '#20C997',
                	  '#879EF2', // Tím/xanh lam nhạt
                	  '#7EE45E', // Xanh lá sáng
                	  '#36AA3B', // Xanh lá đậm
                	  '#35C7A5', // Xanh ngọc tươi
                	  '#3DD6C6', // Xanh ngọc nhạt
                	  '#9EE6E1', // Xanh ngọc pha trắng
                	  '#69B9E9', // Xanh dương nhạt
                	  '#98CCF2', // Xanh baby pastel
                	  '#4F91CE', // Xanh nước biển trung bình
                	  '#267ECF', // Xanh dương đậm
                	  '#5994C5'  // Xanh xám
                  ],
                  borderColor: [
                   	  '#64A6FF', // Viền cho xanh nhạt (#E1F2FF)
                	  '#519DFF', // Viền cho xanh dịu (#CFE8FF)
                	  '#3D94FF', // Viền cho xanh baby (#B8DEFF)
                	  '#298BFF', // Viền cho xanh pastel sáng (#A2D4FF)
                	  '#1E84F7', // Viền cho xanh sky tươi (#8CCBFF)
                	  '#127CEB', // Viền cho xanh biển sáng (#74C2FF)
                	  '#3893D3', // Viền cho xanh băng nhạt (#BEE3FA)
                	  '#44A1E0', // Viền cho xanh trắng dịu (#D6F0FF)
                	  '#2898CB', // Viền cho xanh ngọc nhạt (#A5E2FF)
                	  '#3FB0DB', // Viền cho xanh nước đá (#C4F1FF)
                	  '#53BDE7', // Viền cho xanh băng sáng (#DAF3FF)
                	  '#67CCF2'  // Viền cho xanh icy mát (#E6F7FF)
                  ],
                  borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'Tháng'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Doanh thu '
                    },
                    beginAtZero: true
                }
            }
        }
    });

    // Định nghĩa hàm randomColor nếu chưa có
    function randomColor() {
        const r = Math.floor(Math.random() * 256);
        const g = Math.floor(Math.random() * 256);
        const b = Math.floor(Math.random() * 256);
        return `rgb(${r}, ${g}, ${b})`;
    }
</script>
				</div>
				</div>
					<!-- End Bar CHart -->

  					<div class="card">
				<div class="card-body">
					 <h5 class="card-title">Thống kê doanh thu theo ngày</h5>
					<canvas id="revenueChart" width="800" height="400"></canvas>

					<%
					// Lấy dữ liệu từ request
					Map<String, Double> doanhThuMap = (Map<String, Double>) request.getAttribute("doanhThuMap");
					System.out.print("Doanh thu bên jsp là: " + doanhThuMap);
					// Chuẩn bị dữ liệu labels và data cho biểu đồ
					StringBuilder labels = new StringBuilder("[");
					StringBuilder data = new StringBuilder("[");

					for (Map.Entry<String, Double> entry : doanhThuMap.entrySet()) {
						labels.append("\"").append(entry.getKey()).append("\", ");
						data.append(entry.getValue()).append(", ");
					}

					// Xóa dấu phẩy cuối cùng
					if (labels.length() > 1)
						labels.setLength(labels.length() - 2);
					if (data.length() > 1)
						data.setLength(data.length() - 2);

					labels.append("]");
					data.append("]");
					%>

					<script>
        // Gán dữ liệu từ JSP vào JavaScript
        const labels = <%=labels.toString()%>;
        const data = <%=data.toString()%>;

        console.log("Labels: ", labels);
        console.log("Data: ", data);
        // Vẽ biểu đồ với Chart.js
        const ctx = document.getElementById('revenueChart').getContext('2d');
        const revenueChart = new Chart(ctx, {
            type: 'bar', // Loại biểu đồ: bar
            data: {
                labels: labels,
                datasets: [{
                    label: 'Doanh thu ',
                    data: data,
                    backgroundColor: [
                    	  '#20C997',
                    	  '#879EF2', // Tím/xanh lam nhạt
                    	  '#7EE45E', // Xanh lá sáng
                    	  '#36AA3B', // Xanh lá đậm
                    	  '#35C7A5', // Xanh ngọc tươi
                    	  '#3DD6C6', // Xanh ngọc nhạt
                    	  '#9EE6E1', // Xanh ngọc pha trắng
                    	  '#69B9E9', // Xanh dương nhạt
                    	  '#98CCF2', // Xanh baby pastel
                    	  '#4F91CE', // Xanh nước biển trung bình
                    	  '#267ECF', // Xanh dương đậm
                    	  '#5994C5'  // Xanh xám
                      ],
                      borderColor: [
                    	  '#64A6FF', // Viền cho xanh nhạt (#E1F2FF)
                    	  '#519DFF', // Viền cho xanh dịu (#CFE8FF)
                    	  '#3D94FF', // Viền cho xanh baby (#B8DEFF)
                    	  '#298BFF', // Viền cho xanh pastel sáng (#A2D4FF)
                    	  '#1E84F7', // Viền cho xanh sky tươi (#8CCBFF)
                    	  '#127CEB', // Viền cho xanh biển sáng (#74C2FF)
                    	  '#3893D3', // Viền cho xanh băng nhạt (#BEE3FA)
                    	  '#44A1E0', // Viền cho xanh trắng dịu (#D6F0FF)
                    	  '#2898CB', // Viền cho xanh ngọc nhạt (#A5E2FF)
                    	  '#3FB0DB', // Viền cho xanh nước đá (#C4F1FF)
                    	  '#53BDE7', // Viền cho xanh băng sáng (#DAF3FF)
                    	  '#67CCF2'  // Viền cho xanh icy mát (#E6F7FF)
                      ],
                      borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Ngày đặt hàng'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Doanh thu '
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</div>
</div>
<div class="card">
				<div class="card-body">

            <h5 class="card-title">Thống kê số lượng sản phẩm</h5>

            <!-- Pie Chart -->
            <canvas id="pieChart" style="max-height: 400px;"></canvas>

            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    // Lấy dữ liệu Map từ request.setAttribute (chuỗi JSON từ Servlet)
                    const soLuongsanpham = JSON.parse('${soLuongSanPham}');  // Chuyển chuỗi JSON thành đối tượng JavaScript
                    
                    // Lấy tên sản phẩm và số lượng từ Map
                    const productNames = Object.keys(soLuongsanpham);
                    const quantities = Object.values(soLuongsanpham);
                    
                    // Tạo mảng màu ngẫu nhiên cho biểu đồ
                    const randomColors = quantities.map(() => 
                        `rgb(${Math.random() * 255}, ${Math.random() * 255}, ${Math.random() * 255})`
                    );

                    // Vẽ biểu đồ tròn
                    new Chart(document.querySelector('#pieChart'), {
                        type: 'pie',
                        data: {
                            labels: productNames,  // Tên sản phẩm
                            datasets: [{
                                label: 'Danh mục sản phẩm',
                                data: quantities,  // Dữ liệu số lượng sản phẩm
                                backgroundColor: [
                                	  '#20C997',
                                	  '#879EF2', // Tím/xanh lam nhạt
                                	  '#7EE45E', // Xanh lá sáng
                                	  '#36AA3B', // Xanh lá đậm
                                	  '#35C7A5', // Xanh ngọc tươi
                                	  '#3DD6C6', // Xanh ngọc nhạt
                                	  '#9EE6E1', // Xanh ngọc pha trắng
                                	  '#69B9E9', // Xanh dương nhạt
                                	  '#98CCF2', // Xanh baby pastel
                                	  '#4F91CE', // Xanh nước biển trung bình
                                	  '#267ECF', // Xanh dương đậm
                                	  '#5994C5'  // Xanh xám
                                 	 
                                ],
                                hoverOffset: 4
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                tooltip: {
                                    callbacks: {
                                        label: function(tooltipItem) {
                                            return tooltipItem.label + ': ' + tooltipItem.raw + ' sản phẩm';
                                        }
                                    }
                                }
                            }
                        }
                    });
                });
            </script>
    </div>
    </div>
				
			<div class="card">
				<div class="card-body">
			<!-- Bar Chart -->
			<!--Thống kê mặt hàng bán chạy nhất  -->
			<h5 class="card-title">Mặt hàng bán chạy nhất</h5>
			<canvas id="topSellingChart" style="max-height: 400px;"></canvas>

			<%
			// Lấy danh sách mặt hàng bán chạy từ request
			List<SanPham> banHangList = (List<SanPham>) request.getAttribute("soLuongHangBanChay");
			System.out.println("Mặt hàng bán chạy nhất bên jsp: " + banHangList);

			// Xây dựng chuỗi labels1 và data1
			StringBuilder labels1 = new StringBuilder("[");
			StringBuilder data1 = new StringBuilder("[");

			for (SanPham item : banHangList) {
				labels1.append("\"").append(item.getTenSanPham()).append("\", ");
				data1.append(item.getSoLuong()).append(", ");
			}

			// Xóa dấu phẩy cuối cùng
			if (labels1.length() > 1)
				labels1.setLength(labels1.length() - 2);
			if (data1.length() > 1)
				data1.setLength(data1.length() - 2);

			labels1.append("]");
			data1.append("]");
			%>

			<script>
    document.addEventListener("DOMContentLoaded", () => {
        new Chart(document.querySelector('#topSellingChart'), {
            type: 'bar', // Loại biểu đồ: bar
            data: {
                labels: <%=labels1.toString()%>,  // Labels là tên sản phẩm
                datasets: [{
                    label: 'Số lượng bán',
                    data: <%=data1.toString()%>,  // Dữ liệu là số lượng bán
                    backgroundColor: [
                    	  '#20C997',
                    	  '#879EF2', // Tím/xanh lam nhạt
                    	  '#7EE45E', // Xanh lá sáng
                    	  '#36AA3B', // Xanh lá đậm
                    	  '#35C7A5', // Xanh ngọc tươi
                    	  '#3DD6C6', // Xanh ngọc nhạt
                    	  '#9EE6E1', // Xanh ngọc pha trắng
                    	  '#69B9E9', // Xanh dương nhạt
                    	  '#98CCF2', // Xanh baby pastel
                    	  '#4F91CE', // Xanh nước biển trung bình
                    	  '#267ECF', // Xanh dương đậm
                    	  '#5994C5'  // Xanh xám
                    ],
                    borderColor: [
                      	'#64A6FF', // Viền cho xanh nhạt (#E1F2FF)
                  	  	'#519DFF', // Viền cho xanh dịu (#CFE8FF)
                  	  	'#3D94FF', // Viền cho xanh baby (#B8DEFF)
                  	  	'#298BFF', // Viền cho xanh pastel sáng (#A2D4FF)
                  	  	'#1E84F7', // Viền cho xanh sky tươi (#8CCBFF)
                  	  	'#127CEB', // Viền cho xanh biển sáng (#74C2FF)
                  	  	'#3893D3', // Viền cho xanh băng nhạt (#BEE3FA)
                  	  	'#44A1E0', // Viền cho xanh trắng dịu (#D6F0FF)
                  	  	'#2898CB', // Viền cho xanh ngọc nhạt (#A5E2FF)
                  	  	'#3FB0DB', // Viền cho xanh nước đá (#C4F1FF)
                  	  	'#53BDE7', // Viền cho xanh băng sáng (#DAF3FF)
                  	  	'#67CCF2'  // Viền cho xanh icy mát (#E6F7FF)
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Tên sản phẩm'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Số lượng bán'
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    });
</script>
			</div>
		</div>
		
			<!-- End Bar Chart -->



			<!-- <div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Biểu đồ cơ cấu giá</h5>

						Column Chart
						<div id="columnChart"></div>

						<script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#columnChart"), {
                    series: [{
                      name: 'số lượng đơn mua',
                      data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
                    }, {
                      name: 'Tổng giá',
                      data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
                    }, {
                      name: 'Giá áp khuyến mãi',
                      data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
                    }],
                    chart: {
                      type: 'bar',
                      height: 350
                    },
                    plotOptions: {
                      bar: {
                        horizontal: false,
                        columnWidth: '55%',
                        endingShape: 'rounded'
                      },
                    },
                    dataLabels: {
                      enabled: false
                    },
                    stroke: {
                      show: true,
                      width: 2,
                      colors: ['transparent']
                    },
                    xaxis: {
                      categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                    },
                    yaxis: {
                      title: {
                        text: '$ (thousands)'
                      }
                    },
                    fill: {
                      opacity: 1
                    },
                    tooltip: {
                      y: {
                        formatter: function(val) {
                          return "$ " + val + " thousands"
                        }
                      }
                    }
                  }).render();
                });
              </script>
						End Column Chart

					</div>
				</div>
			</div> -->
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