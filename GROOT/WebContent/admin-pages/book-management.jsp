<%@ page import="model.bean.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
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
				<h1 class="page-header">Quản lý sách</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<div class="row" id="button-1">
			<!-- search -->
			<div class="col-lg-10">
				<form action="<%=request.getContextPath()%>/ProcessBookServlet"
					method="get">
					<div class="input-group custom-search-form" style="width: 100%">
						<input style="width: 95%" name="searchForm" type="text"
							class="form-control" placeholder="Search...">
						<button style="margin-left: 0px; width: 5%"
							class="btn btn-default" name="searchBookBtn" value="true"
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
									<th>ID</th>
									<th>Tên sách</th>
									<th>Hình Ảnh</th>
									<th>Tác giả</th>
									<th>Thể loại</th>
									<th></th>
									<th></th>
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
									<td><%=b.getAuthor()%></td>
									<td><%=b.getType()%></td>
									<td style="text-align: center;"><form
											action="<%=request.getContextPath()%>/ProcessBookServlet?bookId=<%=b.getId()%>"
											method="post">
											<button name="editBtn" type="submit" class="btn btn-edit">Sửa</button>
										</form></td>
									<td style="text-align: center;"><form
											action="<%=request.getContextPath()%>/ProcessBookServlet?bookId=<%=b.getId()%>"
											method="post">
											<button name="deleteBtn" type="submit" class="btn btn-danger">Xóa</button>
										</form></td>

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
									<form action="<%=request.getContextPath()%>/processBookServlet"
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
												<div class="col-lg-9">
													<select class="" id="type" name="type" style="width: 60%">
														<option value="KinhTe QuanLy">Kinh tế - Quản lý</option>
														<option value="TamLy KyNangSong">Tâm lý - Kỹ năng
															sống</option>
														<option value="VanHoc VietNam">Văn Học Việt Nam</option>
														<option value="PhapLuat">Pháp Luật</option>
														<option value="Nong Lam ngu">Nông - Lâm - Ngư</option>
														<option value="KienTruc XayDung">Kiến Trúc - Xây
															Dựng</option>
														<option value="LichSu">Lịch sử</option>
														<option value="CongNgheThongTin">Công Nghệ Thông
															Tin</option>
														<option value="KhoaHoc KyThuat">Khoa Học - Kỹ
															Thuật</option>
														<option value="Ngoai Ngu">Ngoại Ngữ</option>
													</select>
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


						<!-- Pagination -->
						<div class="row">
							<div class="col-lg-9"></div>
							<div class="col-lg-3">
								<ul class="pagination">
									<%
										String url = request.getContextPath() + "/ProcessBookServlet";
									%>
									<li><a
										href="<%=url%>?setting=book-management&wantedRecord=10&maxIndexRecordOfPage=10">1</a></li>
									<li><a
										href="<%=url%>?setting=book-management&wantedRecord=10&maxIndexRecordOfPage=20">2</a></li>
									<li><a
										href="<%=url%>?setting=book-management&wantedRecord=10&maxIndexRecordOfPage=30">3</a></li>
									<li><a
										href="<%=url%>?setting=book-management&wantedRecord=10&maxIndexRecordOfPage=40">4</a></li>
									<li><a
										href="<%=url%>?setting=book-management&wantedRecord=10&maxIndexRecordOfPage=50">5</a></li>
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
