<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
           <%
           String lsname=request.getParameter("lsname");
           String bjname=request.getParameter("bjname");
           int kmnum=0;
           int xsnum=0;
           kmnum= Integer.parseInt(request.getParameter("kmnum"));
            xsnum=Integer.parseInt(request.getParameter("xsnum"));
            session.setAttribute("lsname",lsname);
            session.setAttribute("bjname", bjname);
            session.setAttribute("xsnum", xsnum);
            %>
            <% 
            String s1="",s2="",s3="",s4=""; 
           if(lsname=="")
           {
        	     s1="必须输入教师名称";
        	     session.setAttribute("bjcw", s1);
        	     
        	     response.sendRedirect("cwy.jsp");
           }
            if(bjname=="")
            {
        	     s2="必须输入班级名称";
        	     session.setAttribute("bjcw", s2);
        	     response.sendRedirect("cwy.jsp");
            }
            if(kmnum==0)
            {
        	      s3="班级数目不正确";
        	      session.setAttribute("bjcw", s3);
        	      response.sendRedirect("cwy.jsp");
            }
           if(xsnum==0)
           {
        	    s4="班级人数不正确";
        	    session.setAttribute("bjcw",s4);
        	    response.sendRedirect("cwy.jsp");
           }
           
          %>
             <div align="center">
              <h1>
                 请输入科目名称
              </h1>
              <hr>
              
              老师姓名：<%out.print(lsname);%>  &nbsp; &nbsp;
              班级名称：<%out.print(bjname);%> &nbsp; &nbsp;
              学生人数：<%out.print(xsnum);%> &nbsp; &nbsp;<br/>
               <form action="srcj.jsp">
               <table border="3"  cellpadding="5"  bgcolor="#ffcccc">
               
              <%
              for(int i=0;i<kmnum;i++)
              {
            	  %>
            	 <tr>
		              <td>科目<%out.print(i);%>名称</td>
			              <td>

				              <input type="text" name="mc">

				              <br>
			              </td>
	              </tr>
	              
            	  <%
              }
              %>
               <tr>
               <br>
		               <td colspan="2" align="right">
		                 &nbsp;<input type="submit"  value="确定">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                 <input type="reset" value="重置">
		              </td>
	              </tr>
	              </table>
	        </form>
              </div>
</body>
</html>