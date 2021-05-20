<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Schedule Management</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/topicManage4Teacher.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="teacherHomeHead.jsp" />
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<ul class="list-inline">
					<li>Schedule Management    /	Issue Assignment</li>
				</ul>
				<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/teacher/uploadTaskBook" method="post" enctype="multipart/form-data" >
					<div class="col-md-4">
						<select class="form-control" id="topic4Teacher" name="topic4Teacher">
							<option value="">Select Topic</option>
						</select>
					</div>
					<div class="col-md-2">
						<label class=" control-label">Upload</label>
					</div>
					<div class="col-md-3">
						<input type="file" id="file1" name="file1">
					</div>
					<div class="col-md-3">
						<button type="submit" class="btn btn-primary" id="submitButton" name="submitButton">Submit</button>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>

	</div>


</body>
</html>