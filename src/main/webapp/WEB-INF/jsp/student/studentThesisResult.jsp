<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Topic Management</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<% 
// 	String ss = (String)request.getAttribute("realTimeTopicMessage"); 
// 	application.setAttribute("realMessage", ss);
%>
<body>
	<div class="container">
		<jsp:include page="studentHomeHead.jsp" />
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<ul class="list-inline">
					<li>Topic Management	/	Topic Result</li>
				</ul>
				<font></font>
				<table class="table table-bordered" >
					<tr>
						<th width="15%" align="right">Student ID:</th>
						<td width="85%">${sessionScope.student.studentNo }</td>
					</tr>
					<tr>
						<th align="right">Topic:</th>
						<td >${topicName }</td>
					</tr>

				</table>
				
			</div>
			<div class="col-md-2"></div>
		</div>

	</div>

</body>
</html>