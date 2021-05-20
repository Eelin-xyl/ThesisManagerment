<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Topic Management</title>
        <!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/topicManage.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/getThesisDesc.js"></script>
    </head>

    <body>
        <div class="container">
            <jsp:include page="studentHomeHead.jsp" />
        </div>
        <div class="container">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <ul class="list-inline">
                    <li>Topic Management / Topic Selection</li>
                </ul>
                <br>
                <form action="${pageContext.request.contextPath}/student/selectTopic" method="post">
                    <input type="hidden" name="id" id="id" value="${sessionScope.student.id }" />
                    <div class="col-md-5">
                        <select class="form-control" id="topic" name="topic">
							<option value="">Please Choose...</option>
						</select>
                    </div>

                    <div class="col-md-6">
                        <textarea class="form-control" style="width: 350px;height: 120px" placeholder="Topic Description" id="thesisDesc" name="thesisDesc" ondblclick="show();"></textarea>
                    </div>
                    <div class="col-md-1">
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Submit</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="col-md-2"></div>
        </div>
    </body>

    </html>