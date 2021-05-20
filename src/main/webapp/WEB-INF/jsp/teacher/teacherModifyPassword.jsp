<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify Password</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/passwordManage.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="teacherHomeHead.jsp" />
	</div>
	
	<div class="container">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<ul class="list-inline">
					<li>Information Management	/	Modify Password</li>
				</ul>
			<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/modifyPassword" method="post">
			
				<input type="hidden" class="form-control" name="currentUserNo" id="currentUserNo" value="${sessionScope.currentUser.userNo }">
				<input type="hidden" class="form-control" name="db_password" id="db_password" value="${sessionScope.currentUser.password }">
				
				<div class="form-group">
					<label class="col-sm-2 control-label">Current Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="oldPassword" name="oldPassword" onblur="getPassword();" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">New Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="newPassword1" id="newPassword1" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">Re-enter:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="newPassword2" id="newPassword2" onblur="comparePassword();" required>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="col-sm-3"></div>
						<button type="submit" class="btn btn-primary col-sm-2">Submit</button>
						<div class="col-sm-2"></div>
						<button type="reset" class="btn btn-danger col-sm-2">Reset</button>
						<div class="col-sm-3"></div>
					</div>
				</div>

			</form>

		</div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>