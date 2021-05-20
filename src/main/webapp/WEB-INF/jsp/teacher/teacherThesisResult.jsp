<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Topic Management</title>
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
                            <li>Topic Management / Topic Result</li>
                        </ul>
                        <p>
                            <font color="red" size="2px">${thesisMessage }</font>
                        </p>


                        <table class="table table-hover ">
                            <thead>
                                <tr>
                                    <th>Topic Name</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Operation</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${thesisTitleList }" var="thesisTitle">
                                    <tr>
                                        <td>${thesisTitle.thesisName }</td>
                                        <td>${thesisTitle.description }</td>
                                        <td>${thesisTitle.statusName }</td>

                                        <td>
                                            <a href="<c:url value=" /teacher/modifyThesisTitleFrom?id=${thesisTitle.id } " />">Modify</a> &nbsp;
                                            <a href="<c:url value=" /teacher/deleteThesisTitle?id=${thesisTitle.id } " />">Delete</a>
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