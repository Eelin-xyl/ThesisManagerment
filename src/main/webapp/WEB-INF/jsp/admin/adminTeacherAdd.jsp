<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Teacher</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/departmentManage.js"></script>
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
				<ul class="list-inline">
					<li>Teacher Management</li>
					<li>/</li>
					<li>Add Teacher</li>
				</ul>
				<p><font color="red" size="5px">${message }</font></p>
				<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/admin/teacherAdd" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">Teacher ID:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="teacherNo" name="teacherNo">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Teacher Name:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="teacherName" name="teacherName">
						</div>
					</div>
					
					<div class="form-group">
						<label for="department" class="col-sm-2 control-label">Department:</label>
						<div class="col-sm-10">
							<select class="form-control" id="department" name="department" >
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
						<label for="firstname" class="col-sm-2 control-label">Telephone:</label>
						<div class="col-sm-10">
							<input type="number" class="form-control" id="phone" name="phone" onblur="verify();" >
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

	</div>
</body>
</html>