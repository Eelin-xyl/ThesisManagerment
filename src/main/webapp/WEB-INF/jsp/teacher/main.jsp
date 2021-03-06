<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <!--  TeacherInfo Homepage  -->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher</title>
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
                    <!-- <h4>TeacherInfo</h4> -->
                    <!-- 				<ul class="list-inline"> -->
                    <!-- 					<li>Teacher Information</li> -->
                    <!-- 				</ul> -->
                    <br></br>
					<ul class="list-inline">
                        <li>Teacher Information</li>
                    </ul>
                    <p>
                        <font color="red" size="4px">${deleteMessage }</font>
                    </p>
                    <p>
                        <font color="red" size="4px">${message }</font>
                    </p>
                    <br></br>
                    <table class="table table-bordered">
                        <tr>
                            <td width="15%" align="right"><strong>Teacher ID:</strong></td>
                            <td width="85%">${sessionScope.teacher.teacherNo }</td>
                        </tr>
                        <tr>
                            <td align="right"><strong>Name:</strong></td>
                            <td>${sessionScope.teacher.teacherName }</td>
                        </tr>
                        <tr>
                            <td align="right"><strong>Sex:</strong></td>
                            <td>${sessionScope.teacher.sex }</td>
                        </tr>
                        <tr>
                            <td align="right"><strong>Department:</strong></td>
                            <td>${sessionScope.teacher.departmentName }</td>
                        </tr>
                        <tr>
                            <td align="right"><strong>Telephone:</strong></td>
                            <td>${sessionScope.teacher.phone }</td>
                        </tr>

                    </table>

                </div>
                <div class="col-md-2"></div>
            </div>
        </div>



    </body>

    </html>