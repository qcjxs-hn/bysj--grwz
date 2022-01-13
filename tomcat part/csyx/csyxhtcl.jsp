<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
     <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
<title>Insert title here</title>
</head>
<body><%
    String email=session.getAttribute("yx").toString();
    String xgemail=(String)session.getAttribute("xgyx");
    //out.print(email);
    //String zd=session.getAttribute("zd").toString();
    String gq=(String)session.getAttribute("gq");
    String fhurl="https://www.qc-h.xyz/csyx/csyx.jsp?"+gq;
    //out.print(gq);
    String m1=request.getParameter("m1");
    String url="jdbc:mysql://localhost:3306/user?user=root&password=123456";
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    	//判断是否相等
    	if(m1.equals(xgemail)){
            //上传数据
    		 String up= "update usertable set email='"+xgemail+"' where email='"+email+"'";
    		 PreparedStatement p=lj.prepareStatement(up);
    		 int p1=p.executeUpdate();
    		 if(p1!=0){
    		 %>
         	<br><script type="text/javascript">alert('修改成功！')</script><br>
             <% 
             response.setHeader("refresh","1;URL=https://www.qc-h.xyz/zhuye/dl/dl.jsp");
    		 }
             else{
             %>
         	<br><script type="text/javascript">alert('不要乱搞哦！这下重新点邮件吧（　^ω^）！')</script><br>
             <%
             response.setHeader("refresh","1;URL="+fhurl); 
             }
            
    	}
    	else{
        	%>
        	<br><script type="text/javascript">alert('邮箱不相同！')</script><br>
            <% 
            response.setHeader("refresh","1;URL="+fhurl);
        
    	}
    	
 
%>
</body>
</html>