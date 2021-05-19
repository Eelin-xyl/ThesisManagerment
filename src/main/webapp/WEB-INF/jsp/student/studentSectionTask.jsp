<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Phase Tasks</title>
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
				<!-- <h4>填写阶段任务</h4> -->
				<ul class="list-inline">
					<li>Schedule Management</li>
					<li>/</li>
					<li>Phase Tasks</li>
				</ul>
				
				<table class="table">
					<tr>
						<td>Phase Tasks Description</td>
						<td>Status</td>
					</tr>

					<c:forEach items="${progressList }" var="progress">
						<tr>
							<td>${progress.context }</td>
							<td>${progress.stateName }</td>
						</tr>
					</c:forEach>
				</table>

			</div>
			<div class="col-md-2"></div>
		</div>

	</div>
	
</body>
</html>