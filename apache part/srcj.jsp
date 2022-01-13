<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
  <div align="center">
              <h1>
                 请输入学生姓名和各科成绩
              </h1>
              <hr>
                老师姓名：<%out.print(session.getAttribute("lsname"));%>  &nbsp; &nbsp;
                        班级名称：<%out.print(session.getAttribute("bjname"));%> &nbsp; &nbsp;
                        学生人数：<%out.print(session.getAttribute("xsnum"));%> &nbsp; &nbsp;<br/><br/>
                   <%String sz[]=request.getParameterValues("mc");  %>    
                   
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<td>学生姓名</td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <%
                   for(String szi:sz)
                   {%>
                	   <td>
                	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(szi); %>成绩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	   </td>
                	   
                <%
                   }
                   %>  
          
                  
                  
                   <form action="">
               <div align="left" >
               
                        <%
              for(int i=1;i<(int)session.getAttribute("xsnum");i++)
              {
            	  %>
      

				              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="cj" size=5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				              <br>
			   
	              
            	  <%
              }
              %>
   </div>
              
                  
                 
                   
               
              
            
              </form>
              </div>
</body>
</html>