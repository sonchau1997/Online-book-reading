<%@ page import="model.bean.Book"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.dao.ProcessBookDAO"%>
<%@ page pageEncoding="utf-8"%>

<!-- head information declare  -->
<%@ include file="header-declare.jsp"%>

<body>
	<%!Book book;%>
	<%
		book = (Book) session.getAttribute("book");
	%>

	<!-- Navigation -->
	<%@ include file="admin-navigation.jsp"%>

	<!-- Book managerment content -->
	<div id="page-wrapper">
		<div class="row">
			<!-- header -->
			<div class="col-lg-12">
				<h1 class="page-header">Quản lý sách-Chỉnh sửa nội dung sách</h1>
			</div>
			<!-- /header -->
		</div>

		<!-- edit form -->
		<div>
			<form
				action="<%=request.getContextPath()%>/ProcessBookServlet?editId=<%=book.getId()%>"
				method="post" enctype="multipart/form-data">
				<!-- Modal body-->
				<div class="modal-body" id="bodyFormAdd">

					<div class="row">
						<div class="col-lg-3">
							<h6>Tên:</h6>
						</div>
						<div class="col-lg-9">
							<input type="text" class="textfield" id="tf2" name="editName"
								value="<%=book.getName()%>" style="width: 60%">
						</div>
					</div>

					<div class="row">
						<div class="col-lg-3">
							<h6>Tác giả:</h6>
						</div>
						<div class="col-lg-9">
							<input type="text" class="textfield" id="tf3" name="editAuthor"
								value="<%=book.getAuthor()%>" style="width: 60%">
						</div>
					</div>

					<div class="row">
						<div class="col-lg-3">
							<h6>Thể loại:</h6>
						</div>
						<div class="col-lg-9">
							<select class="" id="type" name="editType" style="width: 60%">
								<option value="KinhTe QuanLy">Kinh tế - Quản lý</option>
								<option value="TamLy KyNangSong">Tâm lý - Kỹ năng sống</option>
								<option value="VanHoc VietNam">Văn Học Việt Nam</option>
								<option value="PhapLuat">Pháp Luật</option>
								<option value="Nong Lam ngu">Nông - Lâm - Ngư</option>
								<option value="KienTruc XayDung">Kiến Trúc - Xây Dựng</option>
								<option value="LichSu">Lịch sử</option>
								<option value="CongNgheThongTin">Công Nghệ Thông Tin</option>
								<option value="KhoaHoc KyThuat">Khoa Học - Kỹ Thuật</option>
								<option value="Ngoai Ngu">Ngoại Ngữ</option>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-3">
							<h6>Hình ảnh sách:</h6>
						</div>
						<div class="col-lg-9">
							<p style="font-size: 11px; color: red; margin-bottom: 1px;">Để
								trống nếu không muốn thay đổi hình ảnh sách</p>
							<input type="file" id="img" name="img">
						</div>
					</div>

					<div class="row">
						<div class="col-lg-3">
							<h6>Tệp sách:</h6>
						</div>
						<div class="col-lg-9">
							<p style="font-size: 11px; color: red; margin-bottom: 1px;">Để
								trống nếu không muốn thay đổi tệp sách</p>
							<input type="file" id="pdf" name="pdf">
						</div>
					</div>

					<br>
					<!-- footer -->
					<div class="row">
						<div class="col-lg-3">
							<input type="submit" name="editOKBtn" class="btn btn-default"
								value="OK">
						</div>
						<div class="col-lg-9"></div>
					</div>
					<!-- /footer -->
				</div>


			</form>
		</div>
		<!-- /edit form -->

	</div>
	<!-- /Book managerment content -->

	<!-- footer information declare  -->
	<%@ include file="footer-declare.jsp"%>

</body>

</html>
