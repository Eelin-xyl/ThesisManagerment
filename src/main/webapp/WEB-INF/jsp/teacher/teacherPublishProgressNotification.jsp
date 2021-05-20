<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule Management</title>
        <!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/student4Teacher.js"></script>
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
                        <li>Schedule Management / Public Progress Notification</li>
                    </ul>
                    <form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/teacher/publishTeacherProgress" method="post">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Student Name:</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="studentId" name="studentId">
									<option value="">Please Choose...</option>
								</select>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Description:</label>
                            <div class="col-sm-5">
                                <textarea class=" form-control " style="width: 490px;height: 100px" placeholder="Description..." id="progressContext" name="progressContext"></textarea>
                            </div>
                            <div class="col-sm-5"></div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-3"></div>
                                <button type="submit" class="btn btn-primary col-sm-2" id="submitButton" name="submitButton">Submit</button>
                                <div class="col-sm-2"></div>
                                <button type="reset" class="btn btn-danger col-sm-2">Reset</button>
                                <div class="col-sm-3"></div>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="col-md-2"></div>
            </div>
        </div>

    </body>

    </html>