<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <!--  Administrator Homepage  -->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator</title>
        <!-- <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
    </head>

    <body>
        <div class="container">
            <jsp:include page="adminHomeHead.jsp" />
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <!-- <h4>Administrator Information</h4> -->
                    <ul class="list-inline">
                        <li>Administrator Information</li>
                    </ul>
                    <br>
                    <p>
                        <font color="red" size="4px">${message }</font>
                    </p>
                    <table class="table table-bordered">
                        <tr>
                            <th width="15%" align="right">
                                <font size="4px">Username:</font>
                            </th>
                            <td width="85%">
                                <font size="4px">${sessionScope.currentUser.userNo }</font>
                            </td>
                        </tr>

                    </table>

                </div>
                <div class="col-md-2"></div>
            </div>
        </div>



    </body>

    </html>