<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.sql.*"%>
    <%
        /*更新评论*/
    String xgplcdid=request.getParameter("cdid").toString();
    String xgpluname=request.getParameter("zxplname").toString();
    String xgpluser=request.getParameter("zxpluser").toString();
    String xgplpl=request.getParameter("zxpl").toString();
    String xgpljrfs=request.getParameter("jrfs").toString();
    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
    String zzname="";
    String zzdate="";
    Date timeDate=new Date();
    String timestring =formatter.format(timeDate);
    String stringtime =timestring.toString();

    /*out.print(ydlurl);
    out.print(stringtime);
    out.print(xgpluname);out.print(xgpluser);
    out.print(xgplpl);*/
   /* out.print(xgpluname);
    out.print(cdxgpldate);*/
    String xgplurl="jdbc:mysql://localhost:3306/xgpl?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection xgpllj =DriverManager.getConnection(xgplurl);
    String xgplup="insert into xgpltable  values(?,?,?,?,?,?)";
    PreparedStatement xgplpp = xgpllj.prepareStatement(xgplup);
    xgplpp.setString(1,xgpluname);
    xgplpp.setString(2,xgpluser);
    xgplpp.setString(3,xgplpl);
    xgplpp.setString(4,stringtime);
    xgplpp.setString(5,xgpljrfs);
    xgplpp.setString(6,xgplcdid);
    xgplpp.executeUpdate();
    //out.print(xgpljrfs);
    if(xgpljrfs.equals("0")){
        String cgur=session.getAttribute("cgur").toString();
        if(cgur!=null){
          //out.print("1");
          response.setHeader("refresh","0;URL=https://www.qc-h.xyz/zhuye/pc/index.jsp?"+cgur);
        }
        else{
            response.setHeader("refresh","0;URL=https://www.qc-h.xyz/zhuye/pc/index.jsp");
        }
    }
    else{
        String cdxgpldate=request.getParameter("zxpldate").toString();
        String zxplzzname=request.getParameter("zxplzzname").toString();
        session.setAttribute("zzname",zxplzzname);
        session.setAttribute("zzdate",cdxgpldate);
        session.setAttribute("xgpljrfs",xgpljrfs);
        response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp");
        String cgur=session.getAttribute("cgur").toString();
        if(cgur.equals("")){
          //out.print("1");
          response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp");   
        }
        else{
            response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp?"+cgur);
        }
    }
    %>