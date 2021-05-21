<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Teacher Search</title>
            <!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->

<%--             <script type="text/javascript" src="${pageContext.request.contextPath}/js/autoJump.js"></script> --%>
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
                            <li>Teacher Management / Teacher Search</li>
                        </ul>
                        <p>
                            <font color="red" size="6px">${message }</font>
                        </p>
                        <form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/admin/showTeacherOne" method="post">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div>
                                            <input type="text" placeholder="ID" class="form-control" id="teacherNo" name="teacherNo">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div>
                                            <input type="text" placeholder="Name" class="form-control" id="teacherName" name="teacherName">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div>
                                            <button type="submit" class="btn btn-primary">Search</button>
                                            <button type="submit" id="showButton" name="showButton" class="btn btn-primary">All Teachers</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                </div>
                            </div>

                        </form>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Teacher ID</th>
                                    <th>Teacher Name</th>
                                    <th>Department</th>
                                    <th>Sex</th>
                                    <th>Telephone</th>
                                    <th>Operation</th>

                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${teacherList }" var="teacher">
                                    <tr>
                                        <td>${teacher.teacherNo }</td>
                                        <td>${teacher.teacherName }</td>
                                        <td>${teacher.departmentName}</td>
                                        <td>${teacher.sex }</td>
                                        <td>${teacher.phone }</td>
                                        <td>
                                            <a href="<c:url value="/admin/modifyTeacher?id=${teacher.id } " />">Modify</a>
                                            <a href="<c:url value="/admin/deleteTeacher?id=${teacher.id } " />">Delete</a>
                                        </td>
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