<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Modify Topic</title>
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
                        <h4>Modify Topic</h4>
                        <form role="form" class="form-horizontal" action="${pageContext.request.contextPath}/teacher/modifyThesisTitleToDb" method="post">
                            <input type="hidden" name="id" id="id" value="${id }" />
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">Topic:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="thesisTitle" name="thesisTitle" value="${thesisTitleName }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="firstname" class="col-sm-2 control-label">Description:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="thesisDesc" name="thesisDesc" value="${thesisTitleDesc }">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="col-sm-3"></div>
                                    <button type="submit" class="btn btn-primary col-sm-2">Submit</button>
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