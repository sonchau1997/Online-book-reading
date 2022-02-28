<%@ page import="model.bean.Account"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.dao.ProcessBookDAO"%>
<%@ page pageEncoding="utf-8"%>

<!-- head information declare  -->
<%@ include file="header-declare.jsp"%>

<body>
	<%!ArrayList<Account> loa = null;%>
	<%
		if (request.getAttribute("AccountList") != null)
			loa = (ArrayList<Account>) request.getAttribute("AccountList");
	%>



	<!-- Navigation -->
	<%@ include file="admin-navigation.jsp"%>

	<!-- Book managerment content -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Quản lý người dùng</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<div class="row" id="button-1">
			<!-- search -->
			<div class="col-lg-10">
				<form action="<%=request.getContextPath()%>/ProcessAccountServlet"
					method="get">
					<div class="input-group custom-search-form" style="width: 100%">
						<input style="width: 95%" name="searchForm" type="text"
							class="form-control" placeholder="Search...">
						<button style="margin-left: 0px; width: 5%"
							class="btn btn-default" name="searchAccBtn" value="true"
							type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
			<!-- /search -->
			<!-- Add btn -->
			<div class="col-lg-2">
				<button style="width: 80px;" type="button" class="btn btn-success"
					data-toggle="modal" data-target="#myModalAdd">Thêm</button>
			</div>
			<!-- /Add btn -->
		</div>

		<br>

		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Dữ liệu</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<th>Người dùng</th>
									<th>MSSV</th>
									<th>Họ</th>
									<th>Tên</th>
									<th>Vai trò</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<!-- get data with for -->
								<%
									if (request.getAttribute("AccountList") != null) {
										for (Account acc : loa) {
								%>
								<tr class="odd gradeX">
									<td><%=acc.getUsername()%></td>
									<td><%=acc.getMssv()%></td>
									<td><%=acc.getLastname()%></td>
									<td><%=acc.getFirstname()%></td>
									<%
										if (acc.isAdmin_role()) {
									%>
									<td style="width: 100px;"><p
											style="color: red; margin-top: 2px">Quản trị viên</p></td>
									<%
										} else {
									%>
									<td style="width: 100px;"><p
											style="color: blue; 5 px; margin-top: 2px">Đọc giả</p></td>
									<%
										}
									%>
									<td style="text-align: center;"><button type="button"
											class="btn btn-primary" data-toggle="modal">Sửa</button></td>
								</tr>
								<%
									}
									}
								%>
								<!-- /get data with for -->
							</tbody>
						</table>
						<!-- /.table-responsive -->

						<!-- Pagination -->
						<div class="row">
							<div class="col-lg-9"></div>
							<div class="col-lg-3">
								<ul class="pagination">
									<%
										String url = request.getContextPath() + "/ProcessBookServlet";
									%>
									<li><a
										href="<%=url%>?component=pagination&wantedRecord=2&maxIndexRecordOfPage=2">1</a></li>
									<li><a
										href="<%=url%>?component=pagination&wantedRecord=2&maxIndexRecordOfPage=4">2</a></li>
									<li><a
										href="<%=url%>?component=pagination&wantedRecord=2&maxIndexRecordOfPage=6">3</a></li>
									<li><a
										href="<%=url%>?component=pagination&wantedRecord=2&maxIndexRecordOfPage=8">4</a></li>
									<li><a
										href="<%=url%>?component=pagination&wantedRecord=2&maxIndexRecordOfPage=10">5</a></li>
								</ul>
							</div>
						</div>
						<!-- /Pagination-->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /Book managerment content -->

	<!-- footer information declare  -->
	<%@ include file="footer-declare.jsp"%>

</body>

</html>
