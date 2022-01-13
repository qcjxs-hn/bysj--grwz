<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.net.*"%>
    <%
    String delUser=request.getParameter("delUser");
    String delWzh=request.getParameter("delWzh");
    String cgur=(String)session.getAttribute("cgur");
    String delUserPl=request.getParameter("delUserPl");
    String xgplurl="jdbc:mysql://localhost:3306/xgpl?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection xgpllj =DriverManager.getConnection(xgplurl);
    String xgplDel="delete from xgpltable where user=? && pl=? && dywznumber=?";
     PreparedStatement delps= xgpllj.prepareStatement(xgplDel);
     delps.setString(1,delUser);
     delps.setString(2,delUserPl);
     delps.setString(3,delWzh);
    //out.print(delUser+delps+delWzh);
     delps.executeUpdate();
          if(cgur.equals("")){
          response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp");   
        }
        else{
            response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp?"+cgur);
        }
     //response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp");
    %>