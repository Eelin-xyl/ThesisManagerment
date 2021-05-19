<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--  学生信息主页  -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
	<div class="container">
		<jsp:include page="studentHomeHead.jsp" />
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<!-- <h4>学生信息</h4> -->
							<br></br>
				
				<ul class="list-inline">
					<li>Student Information</li>
				</ul>
				<p><font color="red" size="4px">${message }</font></p>
				<p><font color="red" size="4px">${topicMessage }</font></p>
				<table border="0" class="table table-bordered" >
					<tr>
						<td  width="15%" align="right"><strong>Student ID:</strong></td>
						<td width="85%">${sessionScope.student.studentNo }</td>
					</tr>
					<tr>
						<td  align="right"><strong>Name:</strong></td>
						<td>${sessionScope.student.studentName }</td>
					</tr>
					<tr>
						<td  align="right"><strong>Sex:</strong></td>
						<td>${sessionScope.student.sex }</td>
					</tr>
					<tr>
						<td  align="right"><strong>Major:</strong></td>
						<td>${sessionScope.student.majorName }</td>
					</tr>
					<tr>
						<td  align="right"><strong>Grade:</strong></td>
						<td>${sessionScope.student.grade }</td>
					</tr>
					<tr>
						<td  align="right"><strong>Telephone:</strong></td>
						<td>${sessionScope.student.phone }</td>
					</tr>

				</table>

			</div>
			<div class="col-md-2"></div>
		</div>
	</div>



</body>
</html>