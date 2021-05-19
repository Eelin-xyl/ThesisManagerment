<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<style>
	body{        
	    background-image: url(../images/stu.jpg);
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
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Information Management</a>
						<ul class="dropdown-menu">
						<li>
							<a href="${pageContext.request.contextPath}/student/main">Student Information</a>
						
						</li>
							<li>
								<a href="${pageContext.request.contextPath}/student/modifyInfo">Modify Information</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/student/modifyPassword">Password Change</a>
							</li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Topic Management</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/student/thesis">Topic Selection</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/student/thesisResult">Topic Result</a>
							</li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Schedule Management</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/student/viewTaskOpening">Assignment Download</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/student/openingResult">Opening Report</a>
							</li>

							<li>
								<a href="${pageContext.request.contextPath}/student/sectionTask">Phase Tasks</a>
							</li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">File Management</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/student/uploadFile">Upload File</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/student/resourcesDownload">Uploaded File</a>
							</li>
						</ul>
					</li>
				</ul>
				
				
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Score Management</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/student/score">Check Score</a>
							</li>
						</ul>
					</li>
				</ul>
				
				<ul class="nav navbar-nav">
					<li><a href="${pageContext.request.contextPath}/quit">Exit</a></li>
				</ul>
				
				<!-- 显示当前用户 -->
				<ul class="nav navbar-nav navbar-right">
					<p class="navbar-text" style="color: red">Current User: &nbsp;${sessionScope.currentUser.userNo }</p>
				</ul>

				
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>
	</div>

	<div class="container" align="right">
		
		<font size="4px">实时选课信息</font><br>
		<p><font color="blue" size="3px">${realMessage }</font></p>
		
	</div>

	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>