<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
</head>
<body>
    <%
    int id=0;
    int zz=0;
    int em=0;
    char[] mimabiao={'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','z','x','c','v','b','n','m'};
    String user="";
    String sqlemail="";
    String url="jdbc:mysql://localhost:3306/user?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    String uname=request.getParameter("uname");
    String pwd=request.getParameter("upwd");
    String email=request.getParameter("email");
    String nickname=request.getParameter("nickname");
    String cx="select * from usertable";
    PreparedStatement p = lj.prepareStatement(cx);
    ResultSet r=p.executeQuery();
    while(r.next()){
    	id=r.getInt("id");
        user=r.getString("user");
        sqlemail=r.getString("email");
        //out.print(user+"\n");
    	if(user.equals(uname)){
            zz+=1;
        }
       if(email.equals(sqlemail)){
            em+=1;
        }
    }
    //判断账号是否为空
    if(uname!=""){
        //判断账号是否存在
        if(zz==0){
            //判断邮箱是否存在！
            if(em==0){
                //判断密码是否大于6位！
                if(pwd.length()>=6){
                    //判断邮箱是否为空！
                    if(email!=""){
                            id+=1;
                            String sql="insert into usertable values(?,?,?,?,?,?)";
                            PreparedStatement ps= lj.prepareStatement(sql);
                            //加密
                                String jmqqpwd="";
                                //out.print(Math.random()+"\n");
                                for(int i1=0;pwd.length()>i1;i1++){
                                    String sjs=mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+""+(int)(Math.random()*9)+"";
                                    String qqg=pwd.charAt(i1)+"";
                                    jmqqpwd=jmqqpwd+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+sjs+qqg+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)];
                                    
                                }
                                
                                jmqqpwd=mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+mimabiao[(int)(Math.random()*20)]+(int)(Math.random()*9)+""+jmqqpwd;
                            /*out.print(jmqqpwd);
                            out.print("\n"+(int)(Math.random()*10));*/
                            //上传数据
                            ps.setInt(1, id);
                            ps.setString(2, uname);
                            ps.setString(3,nickname);
                            ps.setString(4, jmqqpwd);
                            ps.setString(5,email);
                            ps.setString(6,"0");
                            ps.executeUpdate();
                            %>
                            <br><script type="text/javascript">alert('注册成功！')</script><br>
                            <%
                            response.setHeader("refresh","2;URL=https://www.qc-h.xyz/zhuye/dl/dl.jsp");
                            lj.close();
                    }
                    else{
                        //判断邮箱是否为空！
                            %>
                            <br><script type="text/javascript">alert('电子邮件地址不能为空！')</script><br>
                            <% 
                            response.setHeader("refresh","1;URL=https://www.qc-h.xyz/zc/register.html");

                    }
                }
                else{
                    //判断密码是否大于6位！
                    %>
                    <br><script type="text/javascript">alert('密码必须大于六位！')</script><br>
                    <% //out.print("密码必须大于六位！");
                    response.setHeader("refresh","1;URL=https://www.qc-h.xyz/zc/register.html");
                }
            }
            else{
                //判断邮箱是否存在！
                %>
                <br><script type="text/javascript">alert('此邮箱已使用！')</script><br>
                <%
                response.setHeader("refresh","1;URL=https://www.qc-h.xyz/zc/register.html");
            }
        }
        else{
            //判断账号是否存在
            %>
        	<br><script type="text/javascript">alert('账号已有！')</script><br>
   		    <%
    	response.setHeader("refresh","1;URL=https://www.qc-h.xyz/zc/register.html");
        }
        
    }
    else{
        //判断账号是否为空
        %>
    	<br><script type="text/javascript">alert('账号不能为空！')</script><br>
        <% //out.print("账号不能为空！");
        response.setHeader("refresh","1;URL=https://www.qc-h.xyz/zc/register.html");
    }
    %>
</body>
</html>
