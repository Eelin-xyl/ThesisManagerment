<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Audit Phase Task</title>
            <!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
        </head>

        <body>
            <div class="container">
                <jsp:include page="teacherHomeHead.jsp" />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <!-- <h4>CheckProcessNotification</h4> -->
                        <ul class="list-inline">
                            <li>Schedule Management</li>
                            <li>/</li>
                            <li>Audit Phase Task</li>
                        </ul>
                        <table class="table table-hover ">
                            <thead>
                                <tr>
                                    <th>Student Name</th>
                                    <th>Topic Name</th>
                                    <th>Task Description</th>
                                    <th>Current Status</th>
                                    <th>Result</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${allStudentProgressList }" var="progress">


                                    <c:url value="/teacher/passProgress" var="passUrl">
                                        <c:param name="progressId" value="${progress.id }"></c:param>
                                    </c:url>
                                    <c:url value="/teacher/failProgress" var="failUrl">
                                        <c:param name="progressId" value="${progress.id }"></c:param>
                                    </c:url>

                                    <tr>
                                        <td>${progress.studentName }</td>
                                        <td>${progress.thesisTitleName }</td>
                                        <td>${progress.context }</td>
                                        <td>${progress.stateName }</td>
                                        <td>
                                            <a href="${passUrl }">Pass</a> &nbsp;&nbsp;&nbsp;
                                            <a href="${failUrl }">Fail</a>
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