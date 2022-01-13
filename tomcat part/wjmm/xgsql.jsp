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
    //out.print(email);
    //String zd=session.getAttribute("zd").toString();
    String gq=session.getAttribute("gq").toString();
    String fhurl="https://www.qc-h.xyz/wjmm/wjmm.jsp?zhid="+gq;
    String m1=request.getParameter("m1");
    String m2=request.getParameter("m2");
     char[] mimabiao={'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','z','x','c','v','b','n','m'};
    String url="jdbc:mysql://localhost:3306/user?user=root&password=123456";
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    //判断m1和m2长度
    if(m1.length()>=6|m2.length()>=6){
    	//判断是否相等
    	if(m1.equals(m2)){
             //加密
             String jmqqpwd="";
             //out.print(Math.random()+"\n");
              for(int i1=0;m1.length()>i1;i1++){
                  String sjs=mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+"";
                  String qqg=m1.charAt(i1)+"";
                  jmqqpwd=jmqqpwd+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+sjs+qqg+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)];           
                 }
                                
                jmqqpwd=mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+(int)(Math.random()*9)+""+jmqqpwd;

            //上传数据
    		 String up= "update usertable set pwd='"+jmqqpwd+"' where email='"+email+"'";
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
        	<br><script type="text/javascript">alert('密码不相同！')</script><br>
            <% 
            response.setHeader("refresh","1;URL="+fhurl);
        
    	}
    	
    }
    else{
    	%>
    	<br><script type="text/javascript">alert('密码必须大于六位！')</script><br>
        <% //out.print("密码必须大于六位！");
        response.setHeader("refresh","1;URL="+fhurl);
    }
 
%>
</body>
</html>