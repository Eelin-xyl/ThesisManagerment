<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Thesis Audition</title>
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
                        <!-- <h4>CheckThesis</h4> -->
                        <ul class="list-inline">
                            <li>File Management    /	Thesis Audition</li>
                        </ul>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th width="10%">Name</th>
                                    <th>Topic</th>
                                    <th>Thesis</th>
                                    <th>Current Status</th>
                                    <th>Thesis Result</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${fileList }" var="file">
                                    <c:url value="/teacher/passThesisInfo" var="passUrl">
                                        <c:param name="studentId" value="${file.id }"></c:param>
                                    </c:url>

                                    <c:url value="/teacher/failThesisInfo" var="failUrl">
                                        <c:param name="studentId" value="${file.id }"></c:param>
                                    </c:url>

                                    <c:url value="/teacher/fileDownload" var="downUrl">
                                        <c:param name="fileName" value="${file.fileName }"></c:param>
                                        <c:param name="filePath" value="${file.filePath }"></c:param>
                                    </c:url>

                                    <tr>
                                        <td>${file.studentName }</td>
                                        <td>${file.thesisName }</td>
                                        <td>
                                            <a href="${downUrl }">${file.fileName }</a>
                                        </td>
                                        <td>${file.completionName }</td>
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