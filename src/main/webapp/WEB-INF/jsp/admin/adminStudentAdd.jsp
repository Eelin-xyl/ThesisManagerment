<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Student</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/majorManage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/verifyPhone.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="adminHomeHead.jsp" />
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<!-- <h4>添加学生</h4> -->
				<ul class="list-inline">
					<li>Student Management</li>
					<li>/</li>
					<li>Add Student</li>
				</ul>
				<p><font color="red" size="5px">${message }</font></p>
				<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/admin/studentAdd" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">Student ID:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="studentNo" name="studentNo">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Student Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="studentName" name="studentName">
						</div>
					</div>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">Major:</label>
						<div class="col-sm-10">
							<select class="form-control" id="major" name="major">
								<option value="">Please Choose...</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">Sex:</label>
						<div class="col-sm-10">
							<select class="form-control" id="sex" name="sex"> 
								<option value="男">Male</option>
								<option value="女">Female</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">Grade:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="grade" name="grade">
						</div>
					</div>
					
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">Telephone:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="phone" name="phone" onblur="verify();">
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="col-sm-3"></div>
							<button type="submit" class="btn btn-primary col-sm-2">Submit</button>
							<div class="col-sm-2"></div>
							<button type="reset" class="btn btn-danger col-sm-2">Resit</button>
							<div class="col-sm-3"></div>
						</div>
					</div>

				</form>
			</div>
			<div class="col-md-2"></div>
		</div>

	</div>
</body>
</html>