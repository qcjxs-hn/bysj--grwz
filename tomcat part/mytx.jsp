<!--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.awt.Window"%>
<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="java.net.URL"%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>个人资料</title>
<link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
<link href="mytx.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/mytx.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="vector.js"></script>
</head>
<body>
<%
String cguser=(String)session.getAttribute("newcgur");
String cgurl=(String)session.getAttribute("newcgur");
String cgur=request.getParameter("cgur")+"";
//out.print(cgurl);
session.setAttribute("cgur",cgur);
session.setAttribute("cgurl",cgurl);
session.setAttribute("tpyhm",cguser);

//获取前面头像
String newtx=session.getAttribute("newtx").toString();
%>
<div id="container">
	<div id="output">
		<div class="containerT">
			<h1 class="sctxys">修改自己的个人资料</h1>
            <form  name="fileUpload1" method="post" enctype="multipart/form-data">
                <div class="pxgtx"><img class="tbys" src="https://www.qc-h.xyz/usertx/<%out.print(newtx);%>"><input class="wjscys" id="myfile" type="file" value="文件上传" name="myfile" /></div>
                <!--<p class="tjys"><input class="tjanys" type="submit" value="更新个人资料" "></p>-->
                <!--<p class="tjys"><input class="tjanys" type="button" name="Submit" value="更新个人资料" onclick="gxgrzl()"></p>-->
                </form>
            <form name="fileUpload2" method="post" enctype="multipart/text">
                <div class="divnc"><h5 class="h5xgncys">昵称：</h5><input class="xgncys" id="nichen" type="text" name="nichen" placeholder="修改请输入显示昵称！"/></div>
                <div class="divemail"><h5 class="h5xgemail">电子邮件：</h5><input class="xgemailys" id="xgemail" type="email" name="xgemail" placeholder="修改请输入新的电子邮件！"/> </div>
                <div class="divnewpassword"><h5 class="h5xgmm">新密码：</h5><input class="xgmmys" id="newpassword" type="password" name="newpassword" placeholder="修改请输入新的密码！"/></div>
                <p class="tjys"><input class="tjanys" type="button" name="Submit" value="更新个人资料" onclick="gxgrzl()"></p>
                <!--<p class="tjys"><input class="tjanys" type="submit" value="更新个人资料" ">-->
                </form>
                
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
<!--action="fileUpload"-->
<!--action="https://www.qc-h.xyz/mytxcl.jsp"--> 
<!--废弃<div class="scdiv">
    <p class="color01"></p>
    <p class="color02"></p>
    <p class="color03"></p>
    <p class="color04"></p>
    <p class="color05"></p>
</div>
<div class="scdiv2">
    <p class="color012"></p>
    <p class="color022"></p>
    <p class="color032"></p>
    <p class="color042"></p>
    <p class="color052"></p>
</div>-->
</body>
</html>