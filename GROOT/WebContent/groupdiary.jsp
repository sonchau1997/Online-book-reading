<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Group 7</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="CSS/MyBootrap.css">
<link rel="stylesheet" href="CSS/about_css.css" />
<link rel="stylesheet" href="CSS/nav_css.css" />
<!-- Add icon library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Add css online library -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
table, td, th {
	border: 1px solid black;
	text-align: left;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 15px;
}
</style>
<body>
	<!---------------------------nav bar ------------------------------->
	<jsp:include page="./group menu.jsp"></jsp:include>


	<!-- 	content----------------------------------------------------------- -->
	<div class="row" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="col-2"></div>
		<div class="col-8">
			<table>
				<tr>
					<th><h4>Thành viên</h4></th>
					<th><h4>Công việc</h4></th>
				</tr>
				<tr>
					<td><strong>Trần Hữu Linh - 16130443</strong></td>
					<td><strong>- Thiết kế và hiện thực trang đọc sách</strong><br>
						<strong>- Làm chức năng chuyển hướng trang theo loại tài
							khoản (user/admin) phục vụ cho chức năng đăng nhập</strong><br> <strong>-
							Làm chức năng mã hóa hình ảnh sang base64 và tệp sách sang dữ
							liệu nhị phân, phục vụ cho chức năng thêm sách</strong><br> <strong>-
							Làm chức năng quản lý kho sách cho người dùng</strong></td>
				</tr>
				<tr>
					<td><strong>Châu Văn Sơn - 16130549</strong></td>
					<td><strong>-Thiết kế và hiện thực trang admin -
							Trang thống kê.</strong><br> <strong>- Làm chức năng xem
							sách và xem sau (thêm sách vào kho người dùng).</strong><br> <strong>-
							Làm chức năng cập nhật lượt xem của sách và thống kê chúng.</strong><br>
						<strong>- Tích hợp chức năng Chat.</strong></td>
				</tr>
				<tr>
					<td><strong>Dương Ngọc Quý - 16130530.</strong></td>
					<td><strong>- Thiết kế và hiện thực trang admin -
							Trang quản lý người dùng.</strong><br> <strong>- Làm chức
							năng đăng nhập, đăng ký, đăng xuất.</strong><br> <strong>-
							Làm chức năng tìm kiếm sách và tài khoản từ Database.</strong></td>

				</tr>
				<tr>
					<td><strong>Đinh Hoàng Bảo - 16130293.</strong></td>
					<td><strong>- Thiết kế và hiện thực trang admin -
							Trang quản lý sách.</strong><br> <strong>- Làm chức năng
							thêm-sửa-xóa sách.</strong><br> <strong>- Làm chức năng phân
							trang theo truy vấn từ Database cho cả trang đọc sách và admin.</strong></td>

				</tr>

			</table>
		</div>
		<div class="col-2"></div>
	</div>
	<!-- 	header----------------------------------------------------------- -->
	<!-- Footer -->
	<footer class="w3-container w3-padding-5 w3-center w3-xlarge"
		style="background-color: black; border-top-color: red; border-top-style: solid;">
		<i class="fa fa-facebook-official w3-hover-opacity w3-text-white"></i>
		<i class="fa fa-instagram w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-snapchat w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-twitter w3-hover-opacity w3-text-white"></i> <i
			class="fa fa-linkedin w3-hover-opacity w3-text-white"></i>
	</footer>

</body>
</html>