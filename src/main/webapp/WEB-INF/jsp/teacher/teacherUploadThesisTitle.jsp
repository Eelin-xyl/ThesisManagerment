<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Topic Management</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
					<li>Topic Management	/	Topic Upload</li>
				</ul>
				<p><font color="red" size="4px">${message }</font> </p>
				<form action="${pageContext.request.contextPath}/teacher/uploadThesisTitle" method="post">
					<div class="form-group">
						<label>Topic Name：</label>
						<input class="form-control" placeholder="Topic Name" id="thesisTitle" name="thesisTitle"/>
					</div>
					
					<div class="form-group">
						<label>Topic Description：</label>
						<textarea class="form-control" placeholder="Topic Description..." id="thesisDesc" name="thesisDesc"></textarea>
					</div>

					<div class="form-group">
						<div class="row">

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