<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#frame {
	
}

#frame #imgcontainer {
	text-align: center;
}

#frame img.avatar {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin-top: 10%;
}

#frame input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	/* 	display: inline-block; */
	border: 1px solid #d7e1e6;
	border-top-color: #9fb8c4;
	/* 	box-sizing: border-box; */
}

#frame .login-button {
	background-color: #00B2EE;
	color: white;
	border: none;
	cursor: pointer;
	width: 30%;
	height: 40px;
	margin-left: 35%;
	border-radius: 20px;
	font-size: 20px;
	text-align: center;
	margin-bottom: 20px;
}

#frame .login-button:hover {
	opacity: 0.8;
}

#frame a {
	color: #6a6a6a;
	text-decoration: none;
}

#frame a:hover {
	color: #00B2EE;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 40%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- Trigger/Open The Modal -->
	<!-- button dang nhap tren menu -->
	<button id="myBtn" 
		style="background-color: #ce0000; color: white; margin-left: 50px;">Đăng
		nhập</button>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div class="container" style="margin-left: 10px;">
				<div class="row">
					<div class="col-12" id="frame">
						<form action="<%= request.getContextPath() %>/ProcessAccountServlet" method="post">
							<div>
								<div>
									<label><b>Tên đăng nhập:</b><br></label> <input
										type="text" name="username"
										placeholder="Nhập tên tài khoản...">
								</div>
								<div>
									<label><b>Mật khẩu: </b><br></label> <input
										type="password" name="password" placeholder="Nhập mật khẩu...">
								</div>
								<div>
									<input type="checkbox" style="cursor: pointer;"> Duy
									trì đăng nhập
								</div>
							</div>

							<div>
								<div>
									<button class="login-button" type="submit" name="login">Đăng
										nhập</button>
								</div>

								<div style="text-align: center;">
									<a href="#"">Quên mật khẩu ?</a> <br> <a
										href="./register.jsp" style="color: red;">Đăng ký</a>

								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>
