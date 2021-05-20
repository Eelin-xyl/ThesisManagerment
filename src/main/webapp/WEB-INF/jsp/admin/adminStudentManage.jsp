<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Management</title>
<!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- 	   <link rel="stylesheet" href="assets/css/style.css"> -->

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
					<li>Student Management	/	Student Search</li>
				</ul>
				
				<p><font color="red" size="6px">${message }</font></p>
									
				<form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/admin/showStudentOne" method="post">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<div >
									<input type="text" placeholder="Student ID" class="form-control" id="studentNo" name="studentNo">
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<div class="form-group">
								<div>
									<input type="text" placeholder="Student Name" class="form-control" id="studentName" name="studentName">
								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
						<div class="col-md-3">
							<div class="form-group">
								<div>
								
									<button type="submit" class="btn btn-primary">Search</button>
									<button type="submit" id="showButton" name="showButton" class="btn btn-primary">All Students</button>							

								</div>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>

				</form>
				
				<table class="table">
					<thead>
						<tr>
							<th>Student ID</th>
							<th>Student Name</th>
							<th>Sex</th>
							<th>Major</th>
							<th>Grade</th>
							<th>Telephone</th>
							<th>Operation</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${studentList }" var="student" varStatus="loop">
							<tr>
								<th>${student.studentNo }</th>
								<th>${student.studentName }</th>
								<th>${student.sex }</th>
								<th>${student.majorName }</th>
								<th>${student.grade }</th>
								<th>${student.phone }</th>
								<th>
									<a href="<c:url value="/admin/modifyStudent?id=${student.id }"/>">Modify</a>
									<a href="<c:url value="/admin/deleteStudent?id=${student.id }"/>">Delete</a>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			
			</div>
			<div class="col-md-2"></div>
		</div>

	</div>
</body>
</html>