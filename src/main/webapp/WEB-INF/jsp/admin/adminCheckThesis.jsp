<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Topic Review</title>
            <!--             <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
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
                            <li>Topic Management</li>
                        </ul>

                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th width="25%">Topic Name</th>
                                    <th width="50%">Topic Description</th>
                                    <th width="10%">Status</th>
                                    <th>Operation</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${thesisTitleList }" var="thesis" varStatus="loop">
                                    <tr>
                                        <td>${thesis.thesisName }</td>
                                        <td>${thesis.description }</td>
                                        <td>${thesis.statusName }</td>
                                        <td>
                                            <a href="<c:url value="/admin/agreeThesis?id=${thesis.id } " />">Pass</a> &nbsp;
                                            <a href="<c:url value="/admin/disagreeThesis?id=${thesis.id } " />">Fail</a>
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