<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.net.*"%>
<%
    String dzname=request.getParameter("dzname");
    String dzbh=request.getParameter("dzbh");
    String zzname=request.getParameter("dzzz");
    String zztitle=request.getParameter("dztitle");
    String zzdate=request.getParameter("dzsj");
    String zzdzs="";
    String user="";
    int  newzzdzs =0;
    /*out.print(dzname);
    out.print(dzbh);
    out.print(zzname);
    out.print(zztitle);
    out.print(zzdate);*/
     String cgur=(String)session.getAttribute("cgur");
    /*判断是否点赞*/
    String xsurl="jdbc:mysql://localhost:3306/user?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    Connection ljrxs =DriverManager.getConnection(xsurl);
    String xsrs="select * from userdz where user=? && yzh=?";
    PreparedStatement prxs = ljrxs.prepareStatement(xsrs);
    prxs.setString(1,dzname);
    prxs.setString(2,dzbh);
    ResultSet rxs=prxs.executeQuery();
    while(rxs.next()){
          user+=rxs.getString("user");
    } 
    //out.print(user+"1");
    if(user.equals("")){
        //out.print(dzname+"1");
        String sqlUserUpdate="insert into userdz values(?,?)";
        PreparedStatement psUser= ljrxs.prepareStatement(sqlUserUpdate);
        psUser.setString(1,dzname);
        psUser.setString(2,dzbh);
        psUser.executeUpdate();
        psUser.close();
        ljrxs.close();
    String url="jdbc:mysql://localhost:3306/pqdata?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    Connection ljrs =DriverManager.getConnection(url);
     String cxsrs="select dzs from wzdatasjj  where zz = ? && title=? && date=?";
    PreparedStatement cxps= ljrs.prepareStatement(cxsrs);
    cxps.setString(1,zzname);
    cxps.setString(2,zztitle);
    cxps.setString(3,zzdate);
    ResultSet crxs=cxps.executeQuery();
        while(crxs.next()){
          zzdzs+=crxs.getString("dzs");
         } 
    if(zzdzs==""){
            newzzdzs=1;
      }else{
            newzzdzs=Integer.parseInt(zzdzs)+1;
      }
      //更改点赞数
    String sqlUpdate="update wzdatasjj SET dzs=? where zz = ? && title=? && date=?";
    PreparedStatement ps= ljrs.prepareStatement(sqlUpdate);  
    ps.setInt(1,newzzdzs);
    ps.setString(2,zzname);
    ps.setString(3,zztitle);
    ps.setString(4,zzdate);
    //out.print(ps);
    ps.executeUpdate(); 
    ps.close();
    ljrs.close();
    //response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp");
     if(cgur.equals("")){
          response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp");   
        }
        else{
            response.setHeader("refresh","0;URL=https://www.qc-h.xyz/wzlr/wz1.jsp?"+cgur);
        }
    }
%>