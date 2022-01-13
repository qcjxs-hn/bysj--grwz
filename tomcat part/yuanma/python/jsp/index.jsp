<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="./css/index.css" rel="stylesheet"/>
 <link href="https://www.qc-h.xyz/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">

<title>python源码</title>
</head>
<body>
    <a class="fh" href="javascript:history.go(-1)"><i class="fa fa-reply"></i>&nbsp;&nbsp;返回</a>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
String path=application.getRealPath("yuanma/python");
//out.print(path);
File f=new File(path);
File[] files=f.listFiles();
String pathname=this.getClass().getSimpleName().replaceAll("_",".");
//out.println(files);
if(files.length==0)
{
	out.println("啥也没有！");
	}
else{
for(int i=4;i<files.length;i++)
{
	if(files[i].isFile())
	{
		String fname=files[i].getName();
		//out.println(fname);
		int gs=fname.lastIndexOf(".");
		if(gs== -1){
			continue;
			
		}
		%><div class="yuankk"><%
		String su=fname.substring(gs);
		String wjname=fname.substring(0,gs);
		if(su.equals(".py")||su.equals(".txt"))
		{
			out.print("<li>");
			String url="https://www.qc-h.xyz/yuanma/python/"+fname+"";
			String url2="https://www.qc-h.xyz/yuanma/python/"+wjname+".py";
			//out.print(url);
			out.print("<a class='astyle' href='"+url+"'>");
			out.println(wjname);
			out.print("</a>");
			//out.print("<a href='"+url2+"'>");
			out.print("<iframe class='ifClass' src='"+url2+"'></iframe>");
			out.print("</a>");
			out.print("</li>");
		}
		%>
		</div>
		<%
	}
	}
}

%>

</body>
</html>