<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#00ffff">
	<%!
		int sum=0;//用于累计求人数
		String s="";//用于累计访问 人的名字
	%>
	<%out.print(request.getParameter("uname"));%>
	<%
		if(request.getParameter("uname")!=null&&request.getParameter("password")!=null)//保证入口
		{
			sum++;
			s=s+"<br/>"+request.getParameter("uname");
	%>
			目前共有<%=sum %>人浏览了该页面，他们的名字分别是<%=s +"<br/>"%>
	<% 
		}
		else{
			out.print("暂时还没人访问该网站!");
		}
	%>
</body>
</html>