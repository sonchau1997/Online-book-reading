<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="model.bean.Book"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Chỉ nên dùng request không dùng session do chưa người dùng chưa đn để get danh sach-->
	<%!ArrayList<Book> lob = null;%>
	<%
		if (request.getAttribute("BookList") != null)
			lob = (ArrayList<Book>) request.getAttribute("BookList");
	%>
	<%-- action="ProcessWatchingServlet?Account=<%=acc%>&bool-url=<%=%>" --%>

	<div class="row" style="margin-top: 20px;">

		<%
			if (request.getAttribute("BookList") != null) {
				for (Book b : lob) {
		%>
		<!--sach 1-->
		<div class="col-4 book-frame">
			<div class="book-image" style="margin-top: 10px;">
				<img src="data:image;base64,<%=b.getImgBase64()%>">
			</div>
			<div class="book-info" style="margin-top: 20px;">
				<p><%=b.getName()%></p>
				<p><%=b.getAuthor()%></p>
			</div>
			<div class="book-overlay">
				<form
					action="<%=request.getContextPath()%>/ProcessWatchingServlet?bookId=<%=b.getId()%>"
					method="post">
					<a>
						<button type="submit" name="watch" class="btn btn-primary"
							style="width: 100%">Xem</button>
					</a>
				</form>
				<a><button id="watchBtn" class="btn btn-primary"
						style="width: 100%">Xem sau</button></a>
			</div>

		</div>
		<%
			}
			}
		%>
	</div>


</body>
</html>