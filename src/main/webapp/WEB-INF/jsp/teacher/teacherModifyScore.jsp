<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Score Management</title>
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
                            <li>Thesis Score / Score Review</li>
                        </ul>
                        <table class="table">
                            <tr>
                                <th>Student Name</th>
                                <th>Current Score</th>
                                <th>Operation</th>
                            </tr>

                            <c:forEach items="${studentList }" var="student">
                                <tr>
                                    <td>${student.studentName }</td>
                                    <td>${student.thesisScore }</td>
                                    <td>
                                        <a href="<c:url value=" /teacher/modifyStudentScore?id=${student.id } " />">Modify</a>
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