<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
        <%@page import="java.net.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
String cgur = request.getQueryString();
String newtx="";
String xsname="";
String newcgur="";
String success="";
session.setAttribute("ymlxdm","3");
int dljs=0;
String dljl="1";
String newuser="";
//解密
String newzyurl= "";
if(cgur!=null){
  session.setAttribute("cgur",cgur);
 String[] cgursz=cgur.split("&");
  int zyurljs=1;
          // out.print(zyurlsz[zyi]);
    while(zyurljs<cgursz[1].length()){
           newcgur+=cgursz[1].charAt(zyurljs);
           zyurljs+=22;
      }
      //第二次获取
success=cgursz[3].substring(1,2);
}
else{
  xsname=session.getAttribute("xsname").toString();
  success=session.getAttribute("success").toString();
  newcgur=session.getAttribute("newcgur").toString();
}
/*out.print(xsname);
out.print(newcgur);
out.print(success);*/
//第二次获取
if(newzyurl!=""){
 newcgur=newzyurl.substring(4,8);
success=newzyurl.substring(12,13);
}
//获取登录信息
    	Cookie[] cookies = request.getCookies();
    	//保存有cookie对象
    	if(cookies != null && cookies.length > 0){
    		for(Cookie c: cookies){
    			if(c.getName().equals("dljl")){
    				dljl = c.getValue();
    			}
           if(c.getName().equals("newcgur")){
    				newuser = c.getValue();
    			}
    		}
    	}
      
      //out.print(newuser);

/*更新文章内容*/
    String zzname="";
    String zzdate="";
    String zzyds="";
    String zzwz="";
    zzname=request.getParameter("cdzz")+"";
    if(zzname.equals("")){
          zzname=session.getAttribute("zzname").toString();
          zzdate=session.getAttribute("zzdate").toString();
          /*out.print("0");
          out.print(zzname);
          out.print(zzdate);*/
    }
    else{
          zzname=request.getParameter("cdzz")+"";
          zzdate=request.getParameter("cdsj")+"";
          zzyds=request.getParameter("cdyds")+"";
          //out.print("1");
    }
    /*更新评论*/
    String xgpluname="";
    String xgpluser="";
    String xgplpl="";
    String xgpldate="";
    String xgsz="";
    String xgplur="jdbc:mysql://localhost:3306/xgpl?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection xgpllj =DriverManager.getConnection(xgplur);
    String xgplcx="select * from xgpltable where jrfs='1' order by date desc";
    PreparedStatement xgplpp = xgpllj.prepareStatement(xgplcx);
    ResultSet xgplr=xgplpp.executeQuery();
    while(xgplr.next()){
      xgpluname+=xgplr.getString("uname")+";";
      xgpluser+=xgplr.getString("user")+";";
      xgplpl+=xgplr.getString("pl")+";";
      xgpldate+=xgplr.getString("date")+";";
      }
      /*更新侧边评论*/
    String xgplunamecb="";
    String xgplusercb="";
    String xgplplcb="";
    String xgpldatecb="";
    String xgszcb="";
    String xgplcxcb="select * from xgpltable order by date desc";
    PreparedStatement xgplppcb = xgpllj.prepareStatement(xgplcxcb);
    ResultSet xgplrcb=xgplppcb.executeQuery();
    while(xgplrcb.next()){
      xgplunamecb+=xgplrcb.getString("uname")+";";
      xgplusercb+=xgplrcb.getString("user")+";";
      xgplplcb+=xgplrcb.getString("pl")+";";
      xgpldatecb+=xgplrcb.getString("date")+";";
      }
          /*登录名字显示*/    
     /*登录名字显示*/       
    String successsql="";
    String xsurl="jdbc:mysql://localhost:3306/user?user=root&password=123456";
    Connection ljrxs =DriverManager.getConnection(xsurl);
    String xsrs="select * from usertable where user=?";
    PreparedStatement prxs = ljrxs.prepareStatement(xsrs);
    prxs.setString(1,newcgur);
    ResultSet rxs=prxs.executeQuery();
    while(rxs.next()){
          xsname=rxs.getString("nickname");
          successsql=rxs.getString("success");
    } 
    //out.print(xsname);
    session.setAttribute("xsname",xsname);
    ljrxs.close(); 
    //获取登录信息
    if(successsql.equals("1")){
      Cookie newcgurcookie=new Cookie("newcgur","");
      response.addCookie(newcgurcookie);
      Cookie xsnamecookie=new Cookie("xsname","");
      response.addCookie(xsnamecookie);
      newcgurcookie=new Cookie("newcgur",newcgur);
      Cookie cgurcookie=new Cookie("cgur",cgur);
      xsnamecookie=new Cookie("xsname",URLEncoder.encode(xsname, "UTF-8"));
      Cookie dljlcookie=new Cookie("dljl",success);
      response.addCookie(newcgurcookie);
      response.addCookie(cgurcookie);
      response.addCookie(xsnamecookie);
      response.addCookie(dljlcookie);
    }
   else{
      newcgur="";
      Cookie newcgurcookie=new Cookie("newcgur","");
      Cookie xsnamecookie=new Cookie("xsname","");
      Cookie dljlcookie=new Cookie("dljl","0");
      response.addCookie(newcgurcookie);
      response.addCookie(dljlcookie);
    }
        //头像
    if(newcgur!=""&&success.equals("1")){
      newtx=newcgur+".ico";
    }
    else{
      newtx="pcdltp.ico";
    }
    // out.print(cgur);
      /*计算在线人数合和计算访问次数*/
  int rstj=1;
  int jscs=0;
  int newrs=1;
    String urlrs="jdbc:mysql://localhost:3306/rstjdata?user=root&password=123456";    
    Connection ljrs =DriverManager.getConnection(urlrs);
    String cxrs="select * from rstjtable";
    PreparedStatement prs = ljrs.prepareStatement(cxrs);
    ResultSet rs=prs.executeQuery();
    while(rs.next()){
      rstj=rs.getInt("rs")+rs.getInt("rs")-2;
      rstj=rstj/2;
      rstj=rstj%2;
      if(rstj<1){
        rstj=rs.getInt("rs")+rs.getInt("rs")+(int)(Math.random()*20);
      }
      jscs=rs.getInt("jscs");
    } 
    rstj+=(int)(Math.random()*10);
    newrs=rstj;
    jscs+=1;   
    ljrs.close();
    //传递  
    session.setAttribute("newcgur",newcgur);
%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
    <link href="./css/fgw.css" type="text/css" rel="stylesheet">
    <link href="./css/fgwcbl.css" type="text/css" rel="stylesheet"> 
     <link type="text/css" href="./css/ztbhtp.css" rel="stylesheet"/>
     <link href="../font-awesome-4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="https://www.qc-h.xyz/fgw/js/sj.js"></script>
    <script type="text/javascript" src="https://www.qc-h.xyz/fgw/js/fgw.js"></script>
    <script type="text/javascript" src="https://www.qc-h.xyz/fgw/js/dl.js"></script>
    <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/zx.js"></script>
    <script type="text/javascript" src="./js/fgwthYi.js"></script>
    <title>fgw</title>
    <style type="text/css">
        input#tj:focus{
            background-color:#F00;
            }
        input#ss:focus{
            background-color:#36F;
            }
          .yxtp {
            z-index: 2;
            right: 20px;
            bottom: 20px;
            width: 100px;
            position: fixed;
            border:  2px solid rgba(255, 255, 255, 0);;
          }
       
       
               
        </style>
        <div class="ylk"  id="ylk">
         <!-- 复选框的id属性值和label元素的for属性值相同的话 那么就可以通过label元素选中复选框 -->
       <input type="checkbox" id="nav" /><label for="nav"></label>
       <ul>
         <li><a  href="<%if(cgur!=null){out.print("https://www.qc-h.xyz/zhuye/pc/index.jsp?"+cgur);}else{out.print("https://www.qc-h.xyz/zhuye/pc/index.jsp");}%>" >首页</a></li>
         <li><a  href="http://qc-h.xyz/zhuye/yuanmafl/ymfl.html" >源码</a></li>
         <li><a href="javascript:;">小工具</a></li>
         <li><a href="https://www.qc-h.xyz/fgw/fgw.jsp">发个文</a></li>
         <!--<li><a href="javascript:;">视频</a></li>-->
         <li><a href="http://qc-h.xyz/dmw/html/dmw.html">动漫</a></li>
         <%/*out.print(success);out.print(newcgur);*/if(newcgur.equals("")||successsql.equals("0")){dljs=0;out.print("<li><a href='https://www.qc-h.xyz/zhuye/dl/dl.jsp'>");}else{dljs=1;out.print("<li><a onclick='dljs(this)'>");}%>登录</a>
          </li><%
          if(dljs==1&&successsql.equals("1")){
            out.print("<li id='zx' onclick='zx(this)' class='li2'><a>注销</a></li>");
            dljs=0;
            }%>
       </ul>
       <li class="canvashy" id="canvashy" onclick="djTh(this)"></li>
       <li class="ztbhtp" onclick="djTh(this)"><p  id="djThs" class="fa fa-moon-o"></p></li>
       </div>
</head>
<body  id="body1">
    <!--头部背景-->
<div class="syzt">
    <div class="headbg">
      <img class="headbg2"/>
      <div class="bgwz">
        <a href="https://www.qc-h.xyz">
         <h2>QC</h2>
         <br/>
         <span>「コード愛好家だ」</span>
         </a>
       </div>
    </div>
    
    <div class="bg">
       <div class="tuxia">
             <a href="#"><strong>垃圾网络，显示缓慢！</strong></a>
      </div>
     </div>
     <!--主体显示-->
    <div class="zt">
    <ul class="ztu">
        <!--用户账号和名字-->
        <li class="tx_li">
           <a class="tx_ss" href="<%if(newcgur!=""&&success.equals("1")){out.print("https://www.qc-h.xyz/mytx.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>">
           <img class="tx_tb" src="https://www.qc-h.xyz/usertx/<%out.print(newtx);%>">
           <p class="mingzi"><%if(xsname!=""&&success.equals("1")){out.print(xsname);}else{out.print("hhh");}%></p>
           </a> 
         </li>
         <!--右边栏白块-->
         <!--评论-->
         <li class="baikuai"><div class="pldiv"><p class="plp">最新评论</p><br/>
         <%
         String[] xgplunamecbsz=xgplunamecb.split(";");
         String[] xgplusercbsz=xgplusercb.split(";");
         String[] xgplplcbsz=xgplplcb.split(";");
         String[] xgpldatecbsz=xgpldatecb.split(";");
         for(int xgplicb= 0;xgplicb<xgplunamecbsz.length&&xgplicb<7;xgplicb++){
           %>
         <div>
            <p class="plusercbp"><img class="plusercbtp" src="https://www.qc-h.xyz/usertx/<%out.print(xgplusercbsz[xgplicb]);%>.ico">
           <div class="plusercbdiv1">
               <a class="plusercba1"><% out.print(xgplunamecbsz[xgplicb]);%></a>
           </div>
           <br/>
            <div class="plusercbdiv3">
               <a class="plusercba3"><% out.print(xgpldatecbsz[xgplicb]);%></a>
           </div>
           <br/>
           <div class="plusercbdiv2">
               <a class="plusercba2"><%if(xgplplcbsz[xgplicb].length()>15){out.print(xgplplcbsz[xgplicb].substring(0,15)+"...>");}else{out.print(xgplplcbsz[xgplicb]);}%></a>
           </div>
         </p>
         </div>
          <% }%>
         <form class="zxplfrom" action="<%if(newcgur!=""&&success.equals("1")){out.print("https://www.qc-h.xyz/zhuye/pc/gxpl.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>" method="POST">
             <input class="zxplname"  type="hidden" name="zxplname" value="<%out.print(xsname);%>">
             <input class="zxpluser"  type="hidden" name="zxpluser" value="<%out.print(newcgur);%>">
             <input type="hidden" name="jrfs" value="0">
             <input type="hidden" name="cdid" value="<%out.print("0");%>">
             <input class="zxpl" id="zxwbjc"  type="text" placeholder="<%if(newcgur!=""&&success.equals("1")){out.print("可以评论了٩(๑>◡<๑)۶ ");}else{out.print("请先登录再评论٩( 'ω' )و");}%>" name="zxpl" autocomplete="of">
             <br/>
            <%if(newcgur!=""&&success.equals("1")){
              out.print("<input onclick='gxplfscg(this)'  class='zxplan' type='submit' value='发送' />");
              }else{
                out.print("<input onclick='gxpl(this)' class='zxplan' type='submit' value='发送' />");
              }%>
         </form>
         </div></li>
         <!--友情链接-->
         <li class="baikuai2"><div class="yqljdiv"><p class="yqljp">友情链接</p><br/>
          <p class="yqljp1"><a class="ast" href="https://www.github.com">github</a></p>
          <p class="yqljp2"><a class="ast2" href="https://www.csdn.net">csdn</a></p>
            <p class="yqljp3"><a class="ast3" href="https://www.bilibili.com/">bilibili</a></p>
         </div></li>
         <!--在线人数-->
         <li class="zaixianrenshu"><div class="zxrsdiv"><p class="zxrsp">在线的人数</p><br/><p class="zxrsp3">Total <%out.print(newrs);%> users online</p></div></li>
         <!--主体文章-->
         <li class="ztuli"><div class="ztlr">
         <form class="zxplwzfrom" action="<%if(newcgur!=""&&success.equals("1")){out.print("https://www.qc-h.xyz/fgw/fgwhtcl.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>" method="POST">

          <div class="wzwbd">
          <h1 class="wzbt">标题:</h1><input class="wztitle" type="text"  name="wztitle" id="wztitle"  autocomplete="of"><!--required-->
          <h1 class="wzjjys">简介:</h1><textarea class="wzjj" type="text"  name="wzjj" id="wzjj" rows="10" cols="30" placeholder="<%if(newcgur!=""&&success.equals("1")){out.print("写个简介吧！٩(๑>◡<๑)۶ ");}else{out.print("请先登录再发布吧٩( 'ω' )و");}%>"></textarea> 
          <h1 class="wzzw">正文:</h1><a class="wzwb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea class="zxwzpl" id="zxwbjc" type="text" rows="10" cols=50" placeholder="<%if(newcgur!=""&&success.equals("1")){out.print("有什么想要和大家分享的？٩(๑>◡<๑)۶ (英文{}包含图片名即可添加图片！)");}else{out.print("请先登录再发布吧٩( 'ω' )و");}%>" name="zxpl"></textarea> <!--<input class="zxwzpl" id="zxwbjc" type="text" placeholder="<%if(newcgur!=""&&success.equals("1")){out.print("有什么想要和大家分享的？٩(๑>◡<๑)۶ ");}else{out.print("请先登录再发布吧٩( 'ω' )و");}%>" name="zxpl">-->
          <!-- <h1 class="wztpsc">文章图片上传：</h1>
          <input class="wztpscys" type="file" name="wztpsc" id="file" multiple />-->
          <%if(newcgur!=""&&success.equals("1")){out.print("<iframe class='ifClass' src='https://www.qc-h.xyz/fgw1/fgwtp.jsp'></iframe>");}%>
          <input class="zxplname"  type="hidden" name="zxplname" value="<%out.print(xsname);%>">
          <input class="zxpluser"  type="hidden" name="zxpluser" value="<%out.print(newcgur);%>">
          <input class="zxplcgur"  type="hidden" name="zxplcgur" value="<%out.print(cgur);%>">
             <br/>
            <%if(newcgur!=""&&success.equals("1")){
              out.print("<input onclick='gxplfscg(this)'  class='zxwzplan' type='submit' value='发布' />");
              }else{
                out.print("<input onclick='gxpl(this)' class='zxwzplan' type='submit' value='发布' />");
              }%></a></div>
              </form>
            </div></li>
      </ul>
     </div>
      <!--悬浮主体-->
    <div><img src="https://www.qc-h.xyz/zhuye/gjtp/1393817219.gif" class="yxtp">
     </div>
     <!--底部栏主体-->
     <div class="dilandiv">
       <div class="dlwbjl">
       <P class="dlp">
         <i style="font-size: 13px; font-style: normal;">©2021</i>
         <a class="dla" href="https://www.qc-h.xyz/源码.zip">qcjxs</a> all rights reserved.|<i style="font-size: 13px; font-style: normal;">本站运行时间:</i><a id="sjid" class="sjays"></a>
         this web page was created by
         <a class="dla2" href="https://space.bilibili.com/85985296/bangumi">qcjxs</a><br/>
         if you need to contact 
         <a class="dla3" href="tencent://AddContact/?fromId=45&fromSubId=1&subcmd=all&uin=1871982008&website=www.oicqzone.com">qq</a><br>
         <a class="dla4" onclick="fun(this)" id="dla4" ><i class="fa fa-refresh fa-spin"></i>更改网页显示模式</a>
         </P>
         </div>
     </div>
    </div>
</body>
</html>