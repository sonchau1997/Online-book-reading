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

	<div class="container" style="margin-top: 30px;">
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
					}
				%>
			</div>
			<div class="col-2"></div>
		</div>

		<div class="row">
			<div class="col-12" style="height: 50px"></div>
			<div class="col-2"></div>
			<div class="col-8" id="lab2_frame">
				<form action="<%=request.getContextPath()%>/ProcessAccountServlet"
					method="post">
					<div>
						<div>
							<h3>T???o t??i kho???n</h3>
						</div>
					</div>
					<div>
						<div>
							<input type="text" name="mssv" placeholder="M?? s??? sinh vi??n..."
								required>
						</div>
						<div>
							<div class="row">
								<div class="col-6">
									<input type="text" name="firstname" placeholder="H???..."
										required>
								</div>
								<div class="col-6">
									<input type="text" name="lastname" placeholder="t??n..."
										required>
								</div>
							</div>
						</div>
						<div>
							<input type="text" name="username" placeholder="T??n ????ng nh???p..."
								required>
						</div>
						<div>
							<input onkeyup='check();' id="password" type="password"
								placeholder="M???t kh???u..." required>
						</div>
						<div>
							<input onkeyup='check();' id="confirm_password" type="password"
								name="password" placeholder="Nh???p l???i m???t kh???u..." required>
							<span id='message'></span>
						</div>
						<div>
							<input type="checkbox"
								style="margin-top: 10px; margin-bottom: 20px; cursor: pointer;" required>
							T??i ?????ng ?? v???i c??c ??i???u kho???n.
						</div>
					</div>

					<div>
						<div>
							<button type="submit" name="register">????ng k??</button>
						</div>
						<div style="text-align: center; margin-bottom: 30px;">
							???? c?? t??i kho???n ? <a style=""
								href="<%=request.getContextPath()%>/login-page.jsp"> ????ng
								nh???p ??? ????y</a>
						</div>
					</div>

					<script type="text/javascript">
						var check = function() {
							if (document.getElementById('password').value == document
									.getElementById('confirm_password').value) {
								document.getElementById('message').style.color = 'green';
								document.getElementById('message').innerHTML = 'M???t kh???u kh???p';
							} else {
								document.getElementById('message').style.color = 'red';
								document.getElementById('message').innerHTML = 'M???t kh???u kh??ng kh???p !';
							}
						}
					</script>

				</form>
			</div>
			<div class="col-2"></div>

		</div>
	</div>
</body>
</html>