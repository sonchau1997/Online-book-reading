<%@ page import="model.bean.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%!ArrayList<Book> lob = null;%>
	<%
		if (session.getAttribute("bookStore") != null)
			lob = (ArrayList<Book>) session.getAttribute("bookStore");
	%>

	<!-- 	project menu -->
	<div class="container" style="margin-top: 20px;">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10"><%@ include file="./home-menu.jsp"%></div>
			<div class="col-1"></div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<div class="row">
					<div class=col-8>
						<h3>Kho sách người dùng</h3>
					</div>
					<div class=col-4>
						<form
							action="<%=request.getContextPath()%>/ProcessUserBookstoreServlet"
							method="post">
							<button name="returnLaterWatchingBtn" type="submit"
								class="btn btn-success"
								style="width: 70px; margin-top: 20px; margin-left: 22px">Trở
								về</button>
						</form>
					</div>
				</div>
				<table class="table table-hover">
					<tbody>
						<!-- get data with for -->
						<%
							if (session.getAttribute("bookStore") != null) {
								for (Book b : lob) {
						%>
						<tr class="odd gradeX">
							<td style="width: 25%"><img style="height: 150px;"
								src="data:image;base64,<%=b.getImgBase64()%>"></td>
							<td style="width: 25%"><div class="row"
									style="margin-left: 5px;">
									<div class="col-12"><%=b.getName()%></div>
									<div class="col-12"><%=b.getAuthor()%></div>
								</div></td>
							<td style="text-align: center;"><form
									action="<%=request.getContextPath()%>/ProcessWatchingServlet?bookId=<%=b.getId()%>"
									method="post">
									<button name="" type="submit" class="btn btn-primary"
										style="width: 70px;">Xem</button>
								</form> <br>
								<form
									action="<%=request.getContextPath()%>/ProcessUserBookstoreServlet?bookId=<%=b.getId()%>"
									method="post">
									<button name="deleteLaterWatchingBtn" type="submit"
										class="btn btn-primary" style="width: 70px;">Xóa</button>
								</form></td>
						</tr>
						<%
							}
							}
						%>
						<!-- /get data with for -->
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-1"></div>
	</div>

</body>
</html>