<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score Management</title>
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
                        <li>Score Check</li>
                    </ul>
                    <table class="table">
                        <tr>
                            <td><strong>Student Name</strong></td>
                            <td><strong>Topic Name</strong></td>
                            <td><strong>Score</strong></td>
                        </tr>
                        <tr>
                            <td>${studentList.studentName }</td>
                            <td>${studentList.thesisName }</td>
                            <td>${studentList.thesisScore }</td>
                        </tr>

                    </table>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>