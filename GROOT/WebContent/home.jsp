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
</head>
<body>
	<%!int bookstoreSize = 0;%>
	<%
		if (session.getAttribute("bookstoreSize") != null) {
			bookstoreSize = (int) session.getAttribute("bookstoreSize");
		} else {
			// đặt lại size khi đăng xuất nếu ko sẽ hiện giá trị cũ
			bookstoreSize = 0;
		}
	%>

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

	<div class="container" style="margin-top: 20px">
		<div class="row" style="margin-top: 40px;">
			<!-- 	content -->
			<!------------ col 1 --------------->
			<div class="col-1">
				<a href="./index.jsp" style="color: red; cursor: pointer;"><i
					class="fa fa-hand-o-right"></i>Trở về trang group</a>
			</div>
			<!------------ col 2 --------------->
			<div class="col-2">
				<div class="sidebar" style="height: 380px;">
					<div
						style="background-color: #008CBA; color: white; font-size: 20px; padding: 12px;">Danh
						mục sách</div>
					<%
						String path = request.getContextPath() + "/ProcessBookServlet?setting=linkBook";
					%>
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
			<!------------ col 3 --------------->
			<!-- tab begin -->
			<div class="col-8">
				<div class="tke-tab">
					<button class="tablinks" onclick="openCity(event, 'London')"
						id="defaultOpen">Sách mới</button>
					<button class="tablinks" onclick="openCity(event, 'Paris')">Sách
						xem nhiều</button>
					<form
						action="<%=request.getContextPath()%>/ProcessUserBookstoreServlet"
						method="post">
						<button type="submit" name="bookStoreBtn" class="tablinks"
							onclick="openCity(event, 'Paris')"
							style="float: right; background-color: #008CBA; color: white;">
							<span class="glyphicon 	glyphicon glyphicon-book"
								aria-hidden="true"></span> Kho sách<span class="badge"
								style="background-color: orange; color: black; margin-left: 5px;"><%=bookstoreSize%></span>
						</button>
					</form>
				</div>
				<!-- tab sach moi ----------------------------------------------->
				<div id="London" class="tke-tab-content">
					<span onclick="this.parentElement.style.display='none'"
						class="topright">&times</span>
					<!-- danh muc sach --------->
					<%@ include file="/home-book-frame.jsp"%>

					<%
						if (getServletContext().getAttribute("bookType") != null) {
							String bookType = (String) getServletContext().getAttribute("bookType");
					%>
					<!-- next previous button -->
					<div class="row">
						<div class="col-7"></div>
						<div class="col-5 pn-btn-frame">
							<a href="#" class="previous round">&#8249;</a> <a
								href="<%=path%>&bookTypelink=<%=bookType%>&wantedRecord=6&maxIndexRecordOfPage=6">1</a><a
								href="<%=path%>&bookTypelink=<%=bookType%>&wantedRecord=6&maxIndexRecordOfPage=12">2</a><a
								href="<%=path%>&bookTypelink=<%=bookType%>&wantedRecord=6&maxIndexRecordOfPage=18">3</a><a
								href="<%=path%>&bookTypelink=<%=bookType%>&wantedRecord=6&maxIndexRecordOfPage=24">4</a><a
								href="<%=path%>&bookTypelink=<%=bookType%>&wantedRecord=6&maxIndexRecordOfPage=30">5</a><a
								class="next round">&#8250;</a>
						</div>
					</div>
					<%
						}
					%>
				</div>

				<!-- tab xem nhieu ----------------------------------------------------->
				<div id="Paris" class="tke-tab-content">
					<span onclick="this.parentElement.style.display='none'"
						class="topright">&times</span>
					<!-- danh muc sach -->
				</div>
			</div>

			<script>
				function openCity(evt, cityName) {
					var i, tabcontent, tablinks;
					tabcontent = document
							.getElementsByClassName("tke-tab-content");
					for (i = 0; i < tabcontent.length; i++) {
						tabcontent[i].style.display = "none";
					}
					tablinks = document.getElementsByClassName("tablinks");
					for (i = 0; i < tablinks.length; i++) {
						tablinks[i].className = tablinks[i].className.replace(
								" active", "");
					}
					document.getElementById(cityName).style.display = "block";
					evt.currentTarget.className += " active";
				}

				// Get the element with id="defaultOpen" and click on it
				document.getElementById("defaultOpen").click();
			</script>
		</div>
		<!------------ col 4 --------------->
		<div class="col-1"></div>
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