<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
    <%
    String cguser=session.getAttribute("newcgur").toString();
    String cgurl=session.getAttribute("cgurl").toString();
    //out.print(cgurl);
    String nichen=request.getParameter("nichen");
    String xgemail=request.getParameter("xgemail");
    String newpassword=request.getParameter("newpassword");
    char[] mimabiao={'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','z','x','c','v','b','n','m'};
    //String xgemail=request.getParameter("xgemail");
    //out.print(fildname);
    //out.print(nichen);
    /*连接数据库*/
    String updateurl="";
    String pwdurl="";
    String url="jdbc:mysql://localhost:3306/user?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    /*更改编码*/
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    if(xgemail.length()>0){
           /* out.print(xgemail);
            out.print(cguser);*/
            // 以下变量为用户根据自己的情况设置
            String smtphost = "smtp.qq.com"; // 发送邮件服务器
            String user = "1871982008@qq.com"; // 邮件服务器登录用户名
            String password = "fysiihjhsxbqfdfh"; // 邮件服务器登录密码
            String from = "1871982008@qq.com"; // 发送人邮件地址
            String subject = "更改邮箱，点击下面哟！↓"; // 邮件标题
            String sqlname="";
            String sqlemail="";
            int z=0;
             String cx="select * from usertable";
                PreparedStatement p = lj.prepareStatement(cx);
                ResultSet r=p.executeQuery();
                while(r.next()){
                    /*out.print(r.getString("email"));*/
                    /*out.print(r.getString("user"));*/
                    if(cguser.equals(r.getString("user")))
                    {
                        sqlname=r.getString("user");
                        sqlemail=r.getString("email");
                        z+=1;
                    }
                }
           /* out.print(sqlname);
            out.print(cguser);*/
            //判断名字是否相同
            if(sqlname.equals(cguser) & z>=0){
            String to = sqlemail; // 接受人邮件地址
            String qquser="";
            //out.print(to);
           /* //qq截取
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
            //加密
            String jmqquser="";
            String jmyxuser="";
            //out.print(Math.random()+"\n");
            for(int i1=0;sqlemail.length()>i1;i1++){
                String sjs=(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+"";
                String qqg=sqlemail.charAt(i1)+"";
                //out.print(qqg);
                jmqquser=jmqquser+qqg+sjs;
            }
            //更改邮箱加密
            //out.print(Math.random()+"\n");
            for(int i2=0;xgemail.length()>i2;i2++){
                String sjsYx=(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+"";
                String qqgYx=xgemail.charAt(i2)+"";
                //out.print(qqg);
                jmyxuser=jmyxuser+qqgYx+sjsYx;
            }
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
			"</tr></thead><tbody><tr>"+"<td style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis'>"+cguser+"</td>"+
			"<td style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis'><a href='mailto:"+sqlemail+"' rel='noopener' target='_blank'>"+sqlemail+"</a></td>"+
			"<td style='padding:5px 0;text-indent:8px;border:1px solid #eee;border-width:0 1px 1px 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis'><a href='https://www.qc-h.xyz/csyx/csyx.jsp?zhid="+jmqquser+"+&&3bc5e602b2d4c7fffe79258e2ac6952e="+jmyxuser+"' style='color:#1E5494;text-decoration:none;vertical-align:middle' target='_blank' rel='noopener'>立即更改</a></td>"+
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
			 response.setHeader("refresh","0;URL=https://www.qc-h.xyz/mytx.jsp");
			} catch(Exception m) //捕获异常
			{
			out.println(m.toString());
			m.printStackTrace();
			}
      /* updateurl="update usertable set xgemail=? where user=?";
       PreparedStatement update1 = lj.prepareStatement(updateurl);
       update1.setString(1,nichen);
       update1.setString(2,cguser);
       update1.executeUpdate();*/
            }
    }
    //修改昵称
    if(nichen.length()>0){
        /*out.print(nichen);
        out.print(cguser);*/
       updateurl="update usertable set nickname=? where user=?";
       PreparedStatement updatenic = lj.prepareStatement(updateurl);
       updatenic.setString(1,nichen);
       updatenic.setString(2,cguser);
       updatenic.executeUpdate();
       %><br><script type="text/javascript">alert('修改昵称成功！')</script><br>
       <%
               response.setHeader("refresh","0;URL=https://www.qc-h.xyz/zhuye/pc/index.jsp"+"?"+cgurl);
    }
    //修改密码
    if(newpassword.length()>0){
      /* out.print(newpassword);
        out.print(cguser);*/
        String jmqqpwd="";
        //out.print(Math.random()+"\n");
         for(int i1=0;newpassword.length()>i1;i1++){
           String sjs=mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+"";
            String qqg=newpassword.charAt(i1)+"";
            jmqqpwd=jmqqpwd+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+sjs+qqg+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)];
            }
       jmqqpwd=mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+(int)(Math.random()*9)+""+jmqqpwd;
       /*out.print(jmqqpwd);
       out.print("\n"+(int)(Math.random()*10));*/
       pwdurl="update usertable set pwd=? where user=?";
       PreparedStatement updatepwd = lj.prepareStatement(pwdurl);
       updatepwd.setString(1,jmqqpwd);
       updatepwd.setString(2,cguser);
       updatepwd.executeUpdate();%>
       <br><script type="text/javascript">alert('修改密码成功！')</script><br>
        <%
        response.setHeader("refresh","0;URL=https://www.qc-h.xyz/zhuye/dl/dl.jsp");
    }
     response.setHeader("refresh","0;URL=https://www.qc-h.xyz");
    %>