<i%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-image: url(../images/bg.jpg);
                background-attachment: fixed;
            }
            
            * {
                border: 0px solid transparent !important;
            }
            
            th,
            td {
                text-align: center
            }
        </style>
    </head>

    <body>

        <div class="container">
            <nav class="navbar navbar-default">


                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="${pageContext.request.contextPath}/admin/modifyPassword">
                                Password Management
                            </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Teacher Management</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/teacherAdd">Teacher Add</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/showAllTeacher">Teacher List</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Student Management</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/studentAdd">Student Add</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/showAllStudent">Student List</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="${pageContext.request.contextPath}/admin/checkThesis">
                                Topic Management
                            </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" style="color: red">
                                Current User : &nbsp; ${sessionScope.currentUser.userNo }
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/quit">Exit</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
        </nav>
        </div>

        <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>

    </html>