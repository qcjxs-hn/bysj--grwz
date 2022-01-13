<%@page import="java.awt.Window"%>
<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
         <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
             <link rel="stylesheet" type="text/css" href="css/style2.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/vector.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>忘记密码</title>
</head>
<body>
    <%
    String email2="";
    String jmurl="";
    String jmurl2="";
    String xgqurl="";
    String xgemail="";
    xgqurl=request.getQueryString();
    String url2=request.getParameter("zhid");
    String ggyx=request.getParameter("3bc5e602b2d4c7fffe79258e2ac6952e");
    //xgqurl=url2;
    //out.print("网页连接为："+ggyx);
    //out.print("网页连接为："+xgqurl);
    session.setAttribute("gq",xgqurl);
    //解密
    for(int i=0;url2.length()>i;){
    	String zm=url2.charAt(i)+"";
    	jmurl+=zm;
    	i+=9;
    }
    //解密2
    for(int i2=0;ggyx.length()>i2;){
    	String zm2=ggyx.charAt(i2)+"";
    	jmurl2+=zm2;
    	i2+=9;
    }
    //out.print("网页连接为："+jmurl2);
    email2=jmurl;
    xgemail=jmurl2;
    session.setAttribute("yx",email2);
    session.setAttribute("xgyx",xgemail);
    //session.setAttribute("zd", jmurl);
    //out.print("网页连接为："+jmurl);
    %>

     <div id="container">
        <div id="output">
            <div class="containerT">
                <h1>更改邮箱</h1>
                    <form action="csyxhtcl.jsp" method="POST">
                        <h3 class="zhstyle">新邮箱：</h3>
                        <input type="text" name="m1" placeholder="请输入刚才的邮箱(新邮箱)！"/>
                        <input type="submit" value="提交"/>
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