<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="CSS/MyBootrap.css">
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Add css online library -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Add bootrap online library -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
#lab2_frame {
	border-style: solid;
	border-color: #d7e1e6;
	border-width: 1px;
	border-radius: 10px;
	color: #6a6a6a;
	border-radius: 10px;
}

#lab2_frame h3 {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

#lab2_frame input[type=text], input[type=email], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	border-width: 1px;
	/* 	display: inline-block; */
	border: 2px solid #d7e1e6;
	/* 	box-sizing: border-box; */
}

#lab2_frame button {
	background-color: #008cba;
	color: white;
	border: none;
	cursor: pointer;
	width: 100%;
	padding: 15px;
	border-radius: 20px;
	font-size: 20px;
	text-align: center;
	margin-top: 30px;
	margin-bottom: 50px;
}

#lab2_frame button:hover {
	opacity: 0.8;
}

#lab2_frame a {
	color: #6a6a6a;
	cursor: pointer;
	text-decoration: underline;
}

#lab2_frame a:hover {
	color: #00B2EE;
}
</style>
</head>
<body>
	<jsp:include page="home-menu.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">

				<%!String notify;%>
				<%
					notify = (String) request.getAttribute("fail");
					if (notify != null) {
				%>
				<p style="color: red"><%=notify%></p>
				<%
					} else {
						notify = (String) request.getAttribute("success");
				%>
				<p style="color: green"><%=notify%></p>
				<%
					}
				%>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12" style="height: 10px"></div>
			<div class="col-2"></div>
			<div class="col-8" id="lab2_frame">


				<div>
					<h3>Đăng nhập</h3>
				</div>

				<div>
					<form action="<%=request.getContextPath()%>/ProcessAccountServlet"
						method="post">
						<div>
							<div>
								<label><b>Tên đăng nhập:</b><br></label> <input type="text"
									name="username" placeholder="Nhập tên tài khoản...">
							</div>
							<div>
								<label><b>Mật khẩu: </b><br></label> <input type="password"
									name="password" placeholder="Nhập mật khẩu...">
							</div>
							<div>
								<input type="checkbox" style="cursor: pointer;"> Duy trì
								đăng nhập
							</div>
						</div>

						<div>
							<div>
								<button class="login-button" type="submit" name="login">Đăng
									nhập</button>
							</div>

							<div style="text-align: center;">
								<a href="#"">Quên mật khẩu ?</a> <br>

							</div>
						</div>
					</form>
				</div>

				<div>
					<div style="text-align: center; margin-bottom: 30px;">
						Chưa có tài khoản ? <a style="color: red"
							href="<%=request.getContextPath()%>/register.jsp"> đăng ký ở
							đây</a>
					</div>
				</div>

			</div>
			<div class="col-2"></div>

		</div>
	</div>
</body>
</html>