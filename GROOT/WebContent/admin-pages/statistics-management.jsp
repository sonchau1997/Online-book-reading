<%@ page import="model.bean.Book"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.dao.ProcessBookDAO"%>
<%@ page pageEncoding="utf-8"%>

<!-- head information declare  -->
<%@ include file="header-declare.jsp"%>

<body>
	<%!ArrayList<Book> lob = null;%>
	<%
		if (request.getAttribute("BookList") != null)
			lob = (ArrayList<Book>) request.getAttribute("BookList");
	%>



	<!-- Navigation -->
	<%@ include file="admin-navigation.jsp"%>

	<!-- Book managerment content -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Thống kê lượt xem</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<div class="row" id="button-1">
			<!-- search -->
			<div class="col-lg-10">
				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="Search...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
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
									<th>ID</th>
									<th>Tên sách</th>
									<th>Hình ảnh</th>
									<th>Lượt xem</th>
								</tr>
							</thead>
							<tbody>
								<!-- get data with for -->
								<%
									if (request.getAttribute("BookList") != null) {
										for (Book b : lob) {
								%>
								<tr class="odd gradeX">
									<td><%=b.getId()%></td>
									<td><%=b.getName()%></td>
									<td><img style="height: 60px; height: 40px;"
										src="data:image;base64,<%=b.getImgBase64()%>"></td>
									<td style="width: 50%"><div class="progress"
											style="height: 30px; margin-bottom: 0px;">
											<div class="progress-bar" style="width: <%=b.getViews()%>%; height: 30px"><p style="color: black; margin-top: 5px"><%=b.getViews()%></p></div>
										</div></td>
								</tr>
								<%
									}
									}
								%>
								<!-- /get data with for -->
							</tbody>
						</table>
						<!-- /.table-responsive -->
						<!-- Modal Add -->
						<div class="modal fade" id="myModalAdd" role="dialog">
							<div class="modal-dialog">

								<!-- Add Modal content-->
								<div class="modal-content">
									<form action="<%=request.getContextPath()%>/ProcessBookServlet"
										method="post" enctype="multipart/form-data">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h3 style="text-align: center;" class="modal-title">Thêm
												sách</h3>
										</div>
										<!-- Modal body-->
										<div class="modal-body" id="bodyFormAdd">

											<div class="row">
												<div class="col-lg-3">
													<h6>Tên:</h6>
												</div>
												<div class="col-lg-9">
													<input type="text" name="name" class="textfield" id="tf2"
														name="name" style="width: 100%">
												</div>
											</div>

											<div class="row">
												<div class="col-lg-3">
													<h6>Tác giả:</h6>
												</div>
												<div class="col-lg-9">
													<input type="text" name="author" class="textfield" id="tf3"
														name="author" style="width: 100%">
												</div>
											</div>

											<div class="row">
												<div class="col-lg-3">
													<h6>Thể loại:</h6>
												</div>
												<!-- 												<div class="col-lg-9 form-group"> -->
												<!-- 													<select class="form-control" id="sel1"> -->
												<!-- 														<option>1</option> -->
												<!-- 														<option>2</option> -->
												<!-- 														<option>3</option> -->
												<!-- 														<option>4</option> -->
												<!-- 													</select> -->
												<!-- 												</div> -->
												<div class="col-lg-9">
													<input type="text" name="type" class="textfield" id="tf3"
														name="type" style="width: 100%">
												</div>
											</div>

											<div class="row">
												<div class="col-lg-3">
													<h6>Hình ảnh sách:</h6>
												</div>
												<div class="col-lg-9">
													<input type="file" id="img" name="img">
												</div>
											</div>

											<div class="row">
												<div class="col-lg-3">
													<h6>Tệp sách:</h6>
												</div>
												<div class="col-lg-9">
													<input type="file" id="pdf" name="pdf">
												</div>
											</div>

										</div>

										<div class="modal-footer">
											<input type="submit" name="OK" class="btn btn-default"
												value="OK">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Hủy</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- /Add Modal content-->

						<!-- Modal Edit -->
						<div class="modal fade" id="myModalEdit" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Modal Header</h4>
									</div>
									<div class="modal-body">
										<p>Some text in the modal to edit.</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>
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
