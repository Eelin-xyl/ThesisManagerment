<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thesis Score</title>
    </head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/student4Pass.js"></script>

    <body>
        <div class="container">
            <jsp:include page="teacherHomeHead.jsp" />
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <ul class="list-inline">
                        <li>Thesis Score / Score Add</li>
                    </ul>
                    <p>
                        <font color="red" size="4px">${message }</font>
                    </p>
                    <form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/teacher/addStudentScore" method="post">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Student Name:</label>
                                    <div>
                                        <select class="form-control" id="studentList" name="studentList">
											<option value="">Please Choose...</option>
										</select>
                                    </div>
                                    <div class="col-sm-5"></div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Add Student Score：</label>
                                    <input class="form-control" id="score" name="score" onkeyup="value=value.replace(/[^\d]/g,'')" placeholder="Score" />
                                </div>
                            </div>
                            <div class="col-md-5"></div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary" id="submitButton" name="submitButton">Submit</button>
                            </div>
                            <div class="col-md-3">
                                <button type="reset" class="btn btn-danger ">Reset</button>
                            </div>
                            <div class="col-md-6"></div>
                        </div>

                    </form>

                </div>
                <div class="col-md-2"></div>
            </div>
        </div>
    </body>

    </html>