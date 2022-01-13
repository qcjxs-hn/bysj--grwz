<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
              <div align="center"  >
              
              
              <h1>
                 简单的成绩管理系统
              </h1>
              <hr>
              <form action="jsy.jsp"  method="post">
              <table border="3 " border-color="#ffcccc" cellpadding="5"  bgcolor="#ffcccc">
	              <tr>
		              <td>老师姓名</td>
			              <td>
				              <input type="text" name="lsname">
			              </td>
	              </tr>
	              	              <tr>
		              <td>班级名称</td>
			              <td>
				              <input type="text" name="bjname">
			              </td>
	              </tr>
	              	              <tr>
		              <td align="right">科目数</td>
			              <td>
				              <input type="text" name="kmnum">
			              </td>
	              </tr>
	              	              <tr>
		              <td>学生人数</td>
			              <td>
				              <input type="text" name="xsnum">
			              </td>
	              </tr>
	              
	              <tr>
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