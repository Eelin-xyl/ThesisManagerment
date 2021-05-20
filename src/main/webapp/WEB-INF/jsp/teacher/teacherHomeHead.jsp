<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teacher</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style>
	body{        
	    background-image: url(../images/bg.jpg);
	    background-attachment: fixed;
	}
	*{
     	border: 0px solid transparent !important;
 	}
 	
 	th,td{
 		text-align: center
 	}
</style>
</head>
<body>

<div class="container">
		<nav class="navbar navbar-default">
		<div class="container-fluid">

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">
							Information Management
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/teacher/modifyInfo">Modify Information</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/teacher/modifyPassword">Password Change</a>
							</li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Topic Management</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/teacher/uploadThesisTitle">Upload Topic</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/teacher/thesisResult">Topic Result</a>
							</li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >Schedule Management</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/teacher/uploadTaskBook">Issue Assignment</a>
							</li>

							<li>
								<a href="${pageContext.request.contextPath}/teacher/checkOppening">Audit Opening Report</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/teacher/publishProgress">Publish Progress Notification</a>
							</li>

						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >Student List</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/teacher/studentManage">Student Information Review</a>
							</li>
						</ul>
					</li>
				</ul>

				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">File Management</a>
						<ul class="dropdown-menu">

							<li>
								<a href="${pageContext.request.contextPath}/teacher/uploadFileResult">Uploaded File</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/teacher/checkThesis">Thesis Audition</a>
							</li>
						</ul>
						
					</li>
				</ul>
				
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" >Thesis Score</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/teacher/scoreAdd">Add Score</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/teacher/scoreModify">Score Review</a>
							</li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/quit">Exit</a></li>
				</ul>
				<!-- 显示当前用户 -->
				<ul class="nav navbar-nav navbar-right">
					<p class="navbar-text" >
						<a href="${pageContext.request.contextPath}/teacher/main" style="color: red">
							Current User &nbsp; ${sessionScope.teacher.teacherName  }
						</a>
					</p>
				</ul>
				
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>
	
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>