<%@ page pageEncoding="utf-8"%>
<%@page import="model.bean.Account"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./CSS/MyBootrap.css">
<link rel="stylesheet" href="./CSS/thongke_css.css">
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Add css online library -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Add bootrap online library -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="./CSS/project-menu-css.css">
<title>Insert title here</title>
</head>
<body>
	<%!Account acc;%>
	<%
		acc = (Account) session.getAttribute("account");
		if (acc != null) {
			session.setAttribute("hadLogin", "hadLogin");
			//lấy mssv phục vụ cho lấy kho sách
			session.setAttribute("mssv", acc.getMssv());
		}
	%>

	<div class="row library-nav">
		<div class="col-2">
			<img style="margin-top: 5px; margin-left: 10px;" alt=""
				src="./IMAGES/library logo.png">
		</div>
		<div class="col-3">
			<a href="<%=request.getContextPath()%>/introduction.jsp"><button>Trang
					chủ</button></a>
			<!-- <button>Thể loại sách</button> -->
			<button>Phản hồi</button>
		</div>
		<div class="col-4 search-container">
			<form action="#">
				<input type="text" placeholder="Search..." name="search"> <span><button
						class="search-button" type="submit">
						<i class="fa fa-search "></i>
					</button></span>
			</form>
		</div>
		<%
			if (acc != null) {
		%>
		<div class="col-3">
			<div class="btn-group">
				<form action="ProcessAccountServlet" method="post">
					<button type="button" class="btn btn-default"><%=acc.getUsername()%></button>
					<button title="Thông báo" type="button" class="btn btn-default">
						<i class="fa fa-bell-o"></i>
					</button>
					<button title="Hộp thư" type="button" class="btn btn-default">
						<i class="fa fa-envelope-o"></i>
					</button>
					<button title="Đăng xuất" name="logout" type="submit"
						class="btn btn-default">
						<i class="fa fa-sign-out "></i>
					</button>
					<%
						if (acc.isAdmin_role()) {
					%>
					<a href="<%=request.getContextPath()%>/admin-pages/admin.jsp"
						title="Quản trị">
						<button type="button" class="btn btn-default">
							<i style="color: red" class="fa fa-cog "></i>
						</button>
					</a>
					<%
						}
					%>
				</form>
			</div>
		</div>

	</div>
	<%
		} else {
	%>
	<div class="col-2" style="margin-left: 50px;">
		<%@ include file="./login.jsp"%>
	</div>
	<%
		}
	%>
	</div>
</body>
</html>