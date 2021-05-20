<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>

        <meta charset="utf-8">
        <title>Login</title>
        <!-- CSS -->

        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>
        <div class="top">
            <script type="text/javascript">
                setTimeout(function() {
                    document.getElementById('message').style.display = 'none';
                }, 1500);
            </script>


            <div class="container">
                <a href="${pageContext.request.contextPath}/quit">
                    <img src="assets/images/logo.png" width="30%" height="30%" />
                </a>
                <br></br>
                <div class="form-bottom">
                    <form class="login-form" action="${pageContext.request.contextPath}/login/login" method="post">

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="ID：" id="userNo" name="userNo" required>
                        </div>

                        <div class="form-group">
                            <input type="password" placeholder="PassWord：" class="form-control" id="password" name="password" required>
                        </div>

                        <button type="submit" class="btn">Login</button>
                    </form>
                </div>
            </div>
            <p>&nbsp;</p>
            <font color=red size="5px" id="message">${message}</font>
        </div>
        <!-- Javascript -->
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>
    </body>

    </html>