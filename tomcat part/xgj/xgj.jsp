<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/hqbddlxx.js"></script>
    <title>Document</title>
</head>
<body><%
Connection Conn = new Connection();

//Conn.EnablePrivileges = true;
/*Class.forName("com.mysql.jdbc.Driver");
Connection wzhqlj =DriverManager.getConnection("jdbc:mysql://:3306/");*/
//如果是登陆其他电脑就需要提供用户名和密码

//Conn.Username = "administrator";

//Conn.Password = "";

System.Management.ManagementScope Ms = new System.Management.ManagementScope("\\\\localhost\\root\\cimv2", Conn);     

System.Management.ObjectQuery Query = new System.Management.ObjectQuery("select *  from Win32_Processor ");

ManagementObjectSearcher Searcher = new ManagementObjectSearcher(Ms,Query);
ManagementObjectCollection ReturnCollection = Searcher.Get();

foreach(ManagementObject item in ReturnCollection)

{

     Console.WriteLine(item["LoadPercentage"]);
     out.print(item["LoadPercentage"]);

}%>
    <div id="xs"></div>
</body>
</html>