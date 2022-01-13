<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    String zhi="即将跳转动漫网页框架,未来开发！";
    //out.print(zhi);
    out.print("<script>alert('即将跳转动漫网页框架,将在未来开发！');</script>");
    response.setHeader("refresh","0;URL=http://localhost:8082/");
    //response.sendRedirect("http://localhost:8082/");
%>
</body>
</html>