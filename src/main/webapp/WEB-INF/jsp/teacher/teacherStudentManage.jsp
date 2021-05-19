<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student List</title>
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
				<!-- <h4>管理的学生</h4> -->
				<ul class="list-inline">
					<li>Student List</li>
					<li>/</li>
					<li>Student Information Review</li>
				</ul>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Student ID</th>
							<th>Student Name</th>
							<th>Topic</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${studentList }" var="student" varStatus="loop">
							<tr>
								<td>${student.studentNo }</td>
								<td>${student.studentName }</td>
								<td>${student.thesisName }</td>
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