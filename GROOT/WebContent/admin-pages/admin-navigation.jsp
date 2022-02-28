<%@ page pageEncoding="utf-8"%>
<%@page import="model.bean.Account"%>

<%!Account acc;%>
<%
	acc = (Account) session.getAttribute("account");
%>

<!-- Navigation -->
<div id="wrapper">
	<nav class="navbar navbar-default navbar-static-top" role="navigation"
		style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">Web Nhóm 7 Admin</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>10 hours ago</em>
								</span>
							</div>
							<div>Messing content 1</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<strong>John Smith</strong> <span class="pull-right text-muted">
									<em>Yesterday</em>
								</span>
							</div>
							<div>Messing content 2</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>Read
								All Messages</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>

			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> New Comment <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-envelope fa-fw"></i> Message Sent <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>See
								All Alerts</strong> <i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<form class="dropdown-menu dropdown-user"
					action="<%=request.getContextPath()%>/ProcessAccountServlet"
					method="post">
					<ul>
						<li><a href="#" style="color: black"><%=acc.getUsername()%></a></li>
						<li><a style="color: black"
							href="<%=request.getContextPath()%>/introduction.jsp">Trang
								chủ</a></li>
						<li class="divider"></li>
						<li><button class="btn btn-default" type="submit"
								name="logout">
								<i class="fa fa-sign-out fa-fw"></i> Đăng xuất
							</button></li>

					</ul>
				</form> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					<li><a
						href="<%=request.getContextPath()%>/ProcessBookServlet?setting=statistics-management&wantedRecord=10&maxIndexRecordOfPage=10"><i
							class="fa fa-dashboard fa-fw"></i> Thống kê</a></li>
					<li><a
						href="<%=request.getContextPath()%>/ProcessAccountServlet?accountGetting=accountGetting&wantedRecord=10&maxIndexRecordOfPage=10"><i
							class="fa fa-dashboard fa-fw"></i> Quản lý người dùng</a></li>
					<li><a
						href="<%=request.getContextPath()%>/ProcessBookServlet?setting=book-management&wantedRecord=10&maxIndexRecordOfPage=10"><i
							class="fa fa-book fa-fw"></i> Quản lý sách</a></li>
					<li><a href="typeManagement.html"><i
							class="glyphicon  glyphicon-book fa-fw"></i> Quản lý thể loại</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side -->
	</nav>
</div>