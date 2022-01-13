<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
     <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>登录</title>

<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/vector.js"></script>
</head>
<body>
       <%
	   String phoneorpc=(String)session.getAttribute("phoneorpc");
	   out.print(phoneorpc);
	   if(phoneorpc==null){
		   phoneorpc="1";
	   }
	   String ymlxdm="0";
	     //获取登录信息
    	Cookie[] cookies = request.getCookies();
	   Cookie cookiezhi=new Cookie("ymlxdm",ymlxdm);
       response.addCookie(cookiezhi);
	   /*String zzname=request.getParameter("zxplzzname");
	   String zzdate=request.getParameter("zxpldate");*/
	   //out.print(phoneorpc);
	   //session.setAttribute("phoneorpc1",phoneorpc);\
	   if(ymlxdm==null){
		       	//保存有cookie对象
    	if(cookies != null && cookies.length > 0){
    		for(Cookie c: cookies){
    			if(c.getName().equals("ymlxdm")){
    				ymlxdm = c.getValue();
    			}
    		}
    	}
	   }
	   else{
		   ymlxdm=(String)session.getAttribute("ymlxdm");
	   }
	   %>

<!--废弃
	<script language="JavaScript"> 
	//类型值传递
	var blname="phoneorpc"+"=";
	/*//将cookie切割
	var cookiezhi=document.cookie.split(";");
	//将cookie
	for (var i = 0; i < cookiezhi.length; i++) {
		//分成字符串
		var cookiezhiany=cookiezhi[i];
		//判断前端是否有空格
		while (cookiezhiany.charAt(0)=='') {
			cookiezhiany=cookiezhiany.substring(1,cookiezhiany.length);
		}
		//查找字符串是否含有变量
		if (cookiezhiany.indexOf(blname)==0) {
			var newcookiezhi=unescape(cookiezhiany.substring(blname.length,cookiezhiany.length));
			//setCookie("phoneorpc","",-1);
			*/
			/*var newcookiezhi =sessionStorage.getItem("phoneorpc")
			document.cookie=blname+newcookiezhi;/
		}
	}*/
	
	</script>-->
<div id="container">
	<div id="output">
		<div class="containerT">
			<h1>用户登录</h1>
			<form action="http://qc-h.xyz/zhuye/dl/login1.php" method="POST">
				<input type="text" placeholder="用户名" name="uname">
				<input type="password" placeholder="密码" name="pwd">
				<input type="hidden" name="phoneorpc" value="<%out.print(phoneorpc);%>">
				<input type="hidden" name="ymlxdm" value="<%out.print(ymlxdm);%>">
				<input type="submit" value="登录" name="zhi"/>
				<input type="submit" value="注册" name="zhi"/>
				<input type="submit" value="忘记密码" name="zhi"/>
				<div id="prompt" class="prompt"></div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
    $(function(){
        Victor("container", "output");   //登录背景函数
        $("#entry_name").focus();
        $(document).keydown(function(event){
            if(event.keyCode==13){
                $("#entry_btn").click();
            }
        });
    });
</script>
</body>
</html>