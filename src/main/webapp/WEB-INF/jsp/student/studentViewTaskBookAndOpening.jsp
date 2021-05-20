<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Schedule Management</title>
            <!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
        </head>

        <body>
            <div class="container">
                <jsp:include page="studentHomeHead.jsp" />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <ul class="list-inline">
                            <li>Schedule Management / Assignment Download</li>
                        </ul>
                        <p>
                            <font color="red">${message }</font>
                        </p>
                        <table class="table table-bordered">
                            <tr>
                                <td>File Name</td>
                                <td>Operation</td>
                            </tr>

                            <c:forEach items="${fileList }" var="file">
                                <c:url value="/student/fileDownload" var="downUrl">
                                    <c:param name="fileName" value="${file.key }"></c:param>
                                    <c:param name="filePath" value="${file.value }"></c:param>
                                </c:url>
                                <c:url value="/teacher/fileDelete" var="deleteUrl">
                                    <c:param name="fileName" value="${file.key }"></c:param>
                                    <c:param name="filePath" value="${file.value }"></c:param>
                                </c:url>
                                <tr>
                                    <td>${file.key }</td>
                                    <td>
                                        <a href="${downUrl }">Download</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </body>

        </html>