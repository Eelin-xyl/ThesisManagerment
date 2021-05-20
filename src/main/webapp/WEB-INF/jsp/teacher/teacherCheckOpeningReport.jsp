<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Schedule Management</title>
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
                        <ul class="list-inline">
                            <li>Schedule Management / Audit Opening Report</li>
                        </ul>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>File Download</th>
                                    <th>Status</th>
                                    <th>Result</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${studentList }" var="student" varStatus="loop">
                                    <c:url value="/teacher/fileDownload" var="downUrl">
                                        <c:param name="fileName" value="${student.studentOpeningName }"></c:param>
                                        <c:param name="filePath" value="${student.studentOpeningPath }"></c:param>
                                    </c:url>
                                    <c:url value="/teacher/openingPass" var="passUrl">
                                        <c:param name="studentNo" value="${student.studentNo }"></c:param>
                                        <c:param name="fileName" value="${student.studentOpeningName }"></c:param>
                                        <c:param name="filePath" value="${student.studentOpeningPath }"></c:param>
                                    </c:url>
                                    <c:url value="/teacher/openingFail" var="failUrl">
                                        <c:param name="studentNo" value="${student.studentNo }"></c:param>
                                        <c:param name="fileName" value="${student.studentOpeningName }"></c:param>
                                        <c:param name="filePath" value="${student.studentOpeningPath }"></c:param>
                                    </c:url>
                                    <tr>
                                        <td>${student.studentNo }</td>
                                        <td>${student.studentName }</td>
                                        <td><a href="${downUrl }">${student.studentOpeningName }</a></td>
                                        <td>${student.completionName }</td>
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