<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<%

String smtphost = "smtp.qq.com"; // 发送邮件服务器
String user = "1871982008@qq.com"; // 邮件服务器登录用户名
String password = "fysiihjhsxbqfdfh"; // 邮件服务器登录密码
String from = "1871982008@qq.com"; // 发送人邮件地址
String username=request.getParameter("zh");//账户名字
String subject = "下次不要这么不小心，现在是找回密码时间！"; // 邮件标题
String sqlname="";
String sqlemail="";
int z=0;
if(username!=""){
/*数据库操作*/
    String url="jdbc:mysql://localhost:3306/user?user=root&password=123456";
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    String cx="select * from usertable";
    PreparedStatement p = lj.prepareStatement(cx);
    ResultSet r=p.executeQuery();
    while(r.next()){
    	/*out.print(r.getString("email"));
    	out.print(r.getString("user"));*/
    	if(username.equals(r.getString("user")))
    	{
    		sqlname=r.getString("user");
    		sqlemail=r.getString("email");
    		z+=1;
    	}
    }
/*  out.print(sqlname);
  out.print(username);
  out.print(z);*/
if(sqlname.equals(username) & z>0){
String to = sqlemail; // 接受人邮件地址
String qquser="";
//out.print(to);
/*//qq截取
switch(sqlemail.length()-7){
   case 5: qquser= sqlemail.substring(0, 5);break;
   case 6: qquser= sqlemail.substring(0, 6);break;
   case 7: qquser= sqlemail.substring(0, 7);break;
   case 8: qquser= sqlemail.substring(0, 8);break;
   case 9: qquser= sqlemail.substring(0, 9);break;
   case 10: qquser= sqlemail.substring(0, 10);break;
   case 11: qquser= sqlemail.substring(0, 11);break;
   case 12: qquser= sqlemail.substring(0, 12);break;
}*/
//out.print(sqlemail.length()+""+qquser);
//加密
String jmqquser="";
//out.print(Math.random()+"\n");
for(int i1=0;sqlemail.length()>i1;i1++){
	String sjs=(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+"";
	String qqg=sqlemail.charAt(i1)+"";
	//out.print(qqg);
	jmqquser=jmqquser+qqg+sjs;
}
//out.print(jmqquser);
//String body = "1111"; // 邮件内容
/*String username=session.getAttribute("username").toString();
String username2=session.getAttribute("username2").toString();

String email=session.getAttribute("email").toString();
String email2=session.getAttribute("email2").toString();
session.setAttribute("username", username);
session.setAttribute("email", email);
session.setAttribute("username2", username2);
session.setAttribute("email2", email2);*/

			// 以下为发送程序
			try {
			//初始化Properties类对象
			Properties props = new Properties();
			//设置mail.smtp.host属性
			props.put("mail.smtp.host", smtphost);
			//设置使用验证
			props.put("mail.smtp.auth","true");
			// 获取非共享的session对象
			Session ssn=Session.getInstance(props,null);
			//创建一个默认的MimeMessage对象。
			MimeMessage message = new MimeMessage(ssn);
			//创建InternetAddress对象
			InternetAddress fromAddress = new InternetAddress(from);
			//设置From: 头部的header字段
			message.setFrom(fromAddress);
			//创建InternetAddress对象
			InternetAddress toAddress = new InternetAddress(to);
			//设置 To: 头部的header字段
			message.addRecipient(Message.RecipientType.TO, toAddress);
			//设置 Subject: header字段
			message.setSubject(subject);
			// 现在设置的实际消息
			//message.setText(body);
			message.setContent("<table style=font-size:14px;text-align:center;border:1px solid #ccc;table-layout:fixed;width:500px cellspacing='0'><thead><tr>"+
			"<th style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-weight:normal;color:#a0a0a0;background:#eee;border-color:#dfdfdf' width='260px'>账号</th>"+
			"<th style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-weight:normal;color:#a0a0a0;background:#eee;border-color:#dfdfdf' width='260px'>邮箱</th>"+
			"<th style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;font-weight:normal;color:#a0a0a0;background:#eee;border-color:#dfdfdf' width='140px'>操作</th>"+
			"</tr></thead><tbody><tr>"+"<td style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis'>"+username+"</td>"+
			"<td style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis'><a href='mailto:"+sqlemail+"' rel='noopener' target='_blank'>"+sqlemail+"</a></td>"+
			"<td style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis'><a href='https://www.qc-h.xyz/wjmm/wjmm.jsp?zhid="+jmqquser+"' style='color:#1E5494;text-decoration:none;vertical-align:middle' target='_blank' rel='noopener'>立即重置</a></td>"+
			"</tr></tbody></table>","text/html;charset=utf-8");
			//定义发送协议
			Transport transport = ssn.getTransport("smtp");
			//建立与服务器的链接
			transport.connect(smtphost, user, password);
			//发送邮件
			transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			//transport.send(message);
			//关闭邮件传输
			transport.close();
			%>
				<br><script type="text/javascript">alert('邮件已发送,请注意查收！')</script><br>
			 <%
			 response.setHeader("refresh","0;URL=http://qc-h.xyz/zhuye/dl/dl.html");
			} catch(Exception m) //捕获异常
			{
			out.println(m.toString());
			m.printStackTrace();
			}
}
else{
    %>
 	<br><script type="text/javascript">alert('账号不存在！')</script><br>
     <%
     response.setHeader("refresh","0;URL=http://qc-h.xyz/wjmm/wjmm.html");
}
}
else{
    %>
 	<br><script type="text/javascript">alert('账号不能为空！')</script><br>
     <%
     response.setHeader("refresh","1;URL=http://qc-h.xyz/wjmm/wjmm.html");
	
}

%>
</body>
</html>