<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chu</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./CSS/MyBootrap.css">
<link rel="stylesheet" href="./CSS/thongke_css.css">
<link rel="stylesheet" href="CSS/nav_css.css" />
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Add css online library -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Add bootrap online library -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<body>

	<!-- 	group menu -->
	<%-- 	<jsp:include page="./group menu.jsp"></jsp:include> --%>
	<!-- 	project menu -->
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10"><%@ include file="./home-menu.jsp"%></div>
			<div class="col-1"></div>
		</div>
	</div>

	<div class="container">

		<div class="row" style="margin-top: 20px">
			<div class="col-1"></div>
			<div class="col-10"
				style="width: 100%; height: 30px; background: #dff0d8">
				<p style="color: #3c763d; margin-top: 3px">NÊN sao chép, chia
					sẻ, KHÔNG NÊN thương mại hoá.</p>
			</div>
			<div class="col-1"></div>
		</div>

		<div class="row" style="margin-top: 20px; margin-bottom: 120px;">
			<!-- 	content -->
			<!------------ col 1 --------------->
			<div class="col-1">
				<a href="./index.jsp" style="color: red; cursor: pointer;"><i
					class="fa fa-hand-o-right"></i>Trở về trang group</a>
			</div>
			<!------------ col 2 --------------->
			<div class="col-10">
				<div class="sidebar">
					<!----header---->
					<div class="row">
						<div class="col-12">
							<div
								style="background-color: #008CBA; color: white; font-size: 20px; padding: 12px;">Danh
								mục sách</div>
						</div>
					</div>
					<!----/header---->
					<!----danh muc sach---->
					<div class="row">
						<%
							String path = request.getContextPath() + "/ProcessBookServlet?setting=linkBook";
						%>
						<div class="col-4">
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=KinhTe QuanLy&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Kinh tế - Quản lý</i></a>
							</div>
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=TamLy KyNangSong&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Tâm lý - Kỹ năng sống</i></a>
							</div>
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=VanHoc VietNam&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Văn Học Việt Nam</i></a>
							</div>
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=PhapLuat&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Pháp luật</i></a>
							</div>
						</div>
						<div class="col-4">
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=Nong Lam Ngu&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Nông - Lâm -Ngư</i></a>
							</div>
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=LichSu&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Lịch sử</i></a>
							</div>
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=KienTruc XayDung&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Kiến trúc - Xây dựng</i></a>
							</div>
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=CongNgeThongTin&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Công nghệ thông tin</i></a>
							</div>
						</div>
						<div class="col-4">
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=KhoaHoc KyThuat&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Khoa học kỹ thuật</i></a>
							</div>
							<div class="link">
								<a
									href="<%=path%>&bookTypelink=NgoaiNgu&wantedRecord=6&maxIndexRecordOfPage=6"><i
									class="fa fa-dot-circle-o"> &nbsp; Ngoại ngữ</i></a>
							</div>
						</div>
					</div>
					<!----danh muc sach---->
				</div>
				<!------------ col 3 --------------->


				<!-- End Subiz -->
				<!------------ col 4 --------------->
				<div class="col-1"></div>
			</div>

		</div>
	</div>


	<div class="container" style="color: #008CBA; margin-top: 20px">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10"
				style="border-top-style: solid; border-top-width: 1px; border-top-color: #ccc"></div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3">
				<h4>Về chúng tôi</h4>
				<p>Đây là dự án của bốn thành viên DH16DTB.</p>

			</div>
			<div class="col-2"></div>

			<div class="col-1"></div>
			<div class="col-4">
				<h5>
					<strong>Thông tin liên hệ</strong>
				</h5>
				<p>
					<strong>Địa chỉ:</strong> QL1A,ĐH.Nông Lâm TPHCM, Q.Thủ Đức, TPHCM
					<!-- Random Adress -->
				</p>
				<p>
					<strong>Email:</strong> web2018group7@gmail.com
				</p>
				<p>
					<strong>Sđt:</strong> (888) 888 8888
				</p>
			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<!-- chat -->
	<script>
		(function(s, u, b, i, z) {
			u[i] = u[i] || function() {
				u[i].t = +new Date();
				(u[i].q = u[i].q || []).push(arguments);
			};
			z = s.createElement('script');
			var zz = s.getElementsByTagName('script')[0];
			z.async = 1;
			z.src = b;
			z.id = 'subiz-script';
			zz.parentNode.insertBefore(z, zz);
		})(document, window, 'https://widgetv4.subiz.com/static/js/app.js',
				'subiz');
		subiz('setAccount', 'acqfjdfahemqvbqquopc');
	</script>
	<!-- End chat -->
</body>
</html>