<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify Successfully</title>
<style>
	body{        
	    background-image: url(images/stu.jpg);
	    height: 100%;
   		width: 100%;
	}
</style>
<script type="text/javascript"> 
	var t=5;//设定跳转的时间 
	setInterval("refer()",1000); //启动1秒定时 
	function refer(){  
	    if(t==0){ 
	        location="index.jsp"; //#设定跳转的链接地址 
	    } 
	    document.getElementById('show').innerHTML=" After "+ t +" seconds will direct to HomePage"; // 显示倒计时 
	    t--; // 计数器递减 
	    //本文转自： 
	} 
</script>

</head>
<body>
	<br> <br><br> <br>
	<div align="center">
		<font color="blue" size="5px">Modify Successfully! </font>
		<font id="show" color="blue" size="5px"></font>
		<br>
		<a href="index.jsp">Click here...</a>
	</div>
</body>
</html>