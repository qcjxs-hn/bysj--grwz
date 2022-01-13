  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
   <% /*注销*/
    String newcgur=(String)session.getAttribute("newcgur");
    //success=session.getAttribute("success").toString();       
    String surl="jdbc:mysql://localhost:3306/user?user=root&password=123456";
    Connection slj =DriverManager.getConnection(surl);
    String srs="update usertable set success=? where user=?";
    PreparedStatement updatesuccess = slj.prepareStatement(srs);
    updatesuccess.setString(1,"0");
    updatesuccess.setString(2,newcgur);
    updatesuccess.executeUpdate();
    session.setAttribute("zx","1");
    response.setHeader("refresh","0;URL=https://www.qc-h.xyz");
    %>