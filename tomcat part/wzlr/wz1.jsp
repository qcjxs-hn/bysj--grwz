<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.net.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
    String newtx="";
    String xsname="";
    String newcgur="";
    String success="";
    String zztitle="";
    String zzname="";
    String zzdate="";
    String zzpls="";
    String zzyds="";
    String zzwz="";
    String cookiezztitle="";
    String cookiezzname="";
    String cookiezzdate="";
    String cookiezzyds="";
    String cookiezzpls="";
    String cookiecdid="0";
    String cookieCdXsmsValue="";
    int pls=0;
    int xgpljrfs=0;
    int  newzzyds =0;
    String cdid=request.getParameter("cdid");
    Cookie[] cookies = request.getCookies();
    zzname=request.getParameter("cdzz")+"";
    zzdate=request.getParameter("cdsj")+"";
    zzpls=request.getParameter("cdpls")+"";
    zztitle=request.getParameter("zztitle")+"";
    cookieCdXsmsValue=(String)session.getAttribute("cdXsmsValue");
    if(cookieCdXsmsValue!=null){
          Cookie CdXsmsValuecookie=new Cookie("cdXsmsValue",cookieCdXsmsValue);
    response.addCookie(CdXsmsValuecookie);
    }
   // zzname=request.getParameter("cdzz")+"";
   /*out.print("1");
            out.print(zztitle);
          out.print(zzname);
          out.print(zzdate);*/
String cgur=request.getQueryString();
session.setAttribute("ymlxdm","2");
int dljs=0;
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
session.setAttribute("newcgur",newcgur);
}
else{
  cgur=(String)session.getAttribute("cgur");
  if(cgur!=null){
  String[] cgursz=cgur.split("&");
  int zyurljs=1;
          // out.print(zyurlsz[zyi]);
    while(zyurljs<cgursz[1].length()){
           newcgur+=cgursz[1].charAt(zyurljs);
           zyurljs+=22;
      }
      //第二次获取
success=cgursz[3].substring(1,2);
session.setAttribute("newcgur",newcgur);
  }
  //out.print((String)session.getAttribute("xgpljrfs"));
 if((session.getAttribute("xgpljrfs")+"").equals("null")){
   xgpljrfs=0;
                /* %>
<script>window.location.reload(true);</script>
  <%
   out.print("3");
    //out.print(session.getAttribute("xgpljrfs").toString()+"qz");
   // xgpljrfs=Integer.parseInt(session.getAttribute("xgpljrfs"));
  }
  else{
                  %>
<script>window.location.reload(true);</script>
  <%*/
  }
  else{
  xgpljrfs=Integer.parseInt(session.getAttribute("xgpljrfs")+"");
  }
  if(xgpljrfs!=1){
  xsname=(String)session.getAttribute("xsname");
  success=(String)session.getAttribute("success");
  newcgur=(String)session.getAttribute("newcgur");
  }
  session.setAttribute("xgpljrfs",xgpljrfs);
}

/*更新文章内容*/
      //获取登录信息
    	//保存有cookie对象
    	if(cookies != null && cookies.length > 0){
    		for(Cookie c: cookies){
          if(c.getName().equals("cdid")){
    				cookiecdid = c.getValue();
    			}
    		}
      }
     //out.print(cookiecdid);
        if(cdid!=null&&Integer.parseInt(cdid)!=Integer.parseInt(cookiecdid)){
          Cookie zztitlecookie=new Cookie("zztitle",URLEncoder.encode("", "UTF-8"));
          Cookie zznamecookie=new Cookie("zzname",URLEncoder.encode("", "UTF-8"));
          Cookie zzdatecookie=new Cookie("zzdate","");
          Cookie zzplscookie=new Cookie("zzpls","");
          response.addCookie(zztitlecookie);
          response.addCookie(zznamecookie);
          response.addCookie(zzdatecookie);
          //out.print(cdid);
          zztitlecookie=new Cookie("zztitle",URLEncoder.encode(zztitle, "UTF-8"));
          zznamecookie=new Cookie("zzname",URLEncoder.encode(zzname, "UTF-8"));
          zzdatecookie=new Cookie("zzdate",zzdate);
          zzplscookie=new Cookie("zzpls",zzpls);
          Cookie cdidcookie=new Cookie("cdid",cdid);
          Cookie zzydscookie=new Cookie("zzyds",zzyds);
          Cookie xsnamecookie=new Cookie("xsname",URLEncoder.encode(xsname, "UTF-8"));
          /*out.print("6");
         out.print(zztitle);
          out.print(zzname);
          out.print(zzdate);
          out.print(zzyds);*/
          response.addCookie(cdidcookie);
          response.addCookie(zztitlecookie);
          response.addCookie(zznamecookie);
          response.addCookie(zzdatecookie);
          response.addCookie(zzydscookie);
          response.addCookie(xsnamecookie);

        }
        //out.print("文章"+zztitle);
if(zztitle.equals("null")){
        /*更新文章内容*/
      //获取登录信息
    if(cookies != null && cookies.length > 0){
    		for(Cookie c: cookies){
          if(c.getName().equals("cdid")){
    				cookiecdid = c.getValue();
    			}
          if(c.getName().equals("zztitle")){
    				cookiezztitle = URLDecoder.decode(c.getValue(), "UTF-8");
    			}
    			if(c.getName().equals("zzname")){
    				cookiezzname = URLDecoder.decode(c.getValue(), "UTF-8");
    			}
           if(c.getName().equals("zzdate")){
    				cookiezzdate = c.getValue();
    			}
           if(c.getName().equals("zzyds")){
    			  cookiezzyds = c.getValue();
    			}
          if(c.getName().equals("zzpls")){
    				cookiezzpls = c.getValue();
    			}   
           if(c.getName().equals("cdXsmsValue")){
    			 cookieCdXsmsValue = c.getValue();
                session.setAttribute("cdXsmsValue",cookieCdXsmsValue);
    			}   
    		}
      }  
 // out.print("7");     
   // out.print(cookiezztitle);
    cdid=cookiecdid;
    zztitle=cookiezztitle;
    zzname=cookiezzname;
    zzdate=cookiezzdate;
    zzpls=cookiezzpls;
    zzyds=cookiezzyds;
}
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

    
    session.setAttribute("xsname",xsname);
    session.setAttribute("success",successsql);
    //获取登录信息
    if(successsql.equals(success)){
      Cookie newcgurcookie=new Cookie("newcgur","");
      response.addCookie(newcgurcookie);
      newcgurcookie=new Cookie("newcgur",newcgur);
      Cookie xsnamecookie=new Cookie("xsname",URLEncoder.encode(xsname, "UTF-8"));
      Cookie dljlcookie=new Cookie("dljl",successsql);
      response.addCookie(newcgurcookie);
      response.addCookie(xsnamecookie);
      response.addCookie(dljlcookie);
            //获取文章信息
            //out.print("5");

    	//保存有cookie对象
    	if(cookies != null && cookies.length > 0){
    		for(Cookie c: cookies){
          if(c.getName().equals("zztitle")){
    				cookiezztitle = URLDecoder.decode(c.getValue(), "UTF-8");
    			}
    			if(c.getName().equals("zzname")){
    				cookiezzname = URLDecoder.decode(c.getValue(), "UTF-8");
    			}
           if(c.getName().equals("zzdate")){
    				cookiezzdate = c.getValue();
    			}
           if(c.getName().equals("zzyds")){
    			  cookiezzyds = c.getValue();
    			}  
           if(c.getName().equals("zzpls")){
    			  cookiezzpls = c.getValue();
    			}    
            if(c.getName().equals("dljl")){
    				success = c.getValue();
    			}
          /*if(c.getName().equals("newcgur")){
    				newcgur = c.getValue();
    			}
           if(c.getName().equals("xsname")){

    			  xsname =  URLDecoder.decode(c.getValue(), "UTF-8");
    			}*/
    		}
    }
    }
    else{
      //newcgur="";
      Cookie newcgurcookie=new Cookie("newcgur","");
      Cookie xsnamecookie=new Cookie("xsname","");
      Cookie dljlcookie=new Cookie("dljl","0");
      response.addCookie(newcgurcookie);
      response.addCookie(xsnamecookie);
      response.addCookie(dljlcookie);
    }
    if(newcgur.equals("")||successsql.equals("0")){
              Cookie dljlcookie=new Cookie("dljl","0");
            response.addCookie(dljlcookie); 
          }

    /* out.print("9");
    out.print(successsql);  
    out.print(newcgur);  
    out.print(zzname);*/
 //头像
    if(newcgur!=""&&successsql.equals("1")){
      newtx=newcgur+".ico";
    }
    else{
      newtx="pcdltp.ico";
    }

  //文章显示
    String xgplurl="jdbc:mysql://localhost:3306/wzk?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection wzhqlj =DriverManager.getConnection(xgplurl);
    String wzhqcx="select wz from wzktable where username=? && date=? && title=?";
    PreparedStatement wzhqp = wzhqlj.prepareStatement(wzhqcx);
    /*out.print(zzname);
    out.print(zzdate);*/
    wzhqp.setString(1,zzname);
    wzhqp.setString(2,zzdate);
    wzhqp.setString(3,zztitle);
    //wzhqlr=wzhqp.executeQuery(wzhqp);
   // out.print(wzhqp);
    ResultSet wzhqlr=wzhqp.executeQuery();
    while(wzhqlr.next()){
      //out.print(wzhqlr.getString("wz"));
      zzwz+=wzhqlr.getString("wz");
      //out.print(zzwz);
      }
      wzhqlj.close();
      
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
    String xgplcx="select * from xgpltable where jrfs='1' && dywznumber=? order by date desc";
    PreparedStatement xgplpp = xgpllj.prepareStatement(xgplcx);
    xgplpp.setString(1,cdid);
    ResultSet xgplr=xgplpp.executeQuery();
    while(xgplr.next()){
      xgpluname+=xgplr.getString("uname")+";";
      xgpluser+=xgplr.getString("user")+";";
      xgplpl+=xgplr.getString("pl")+";";
      xgpldate+=xgplr.getString("date")+";";
      pls+=1;
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
      xgpllj.close();
    //阅读次数++
   // out.print(zztitle);
    String url="jdbc:mysql://localhost:3306/pqdata?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    Connection ljrs =DriverManager.getConnection(url);
    String cxsrs="select yds from wzdatasjj  where title=?";
    PreparedStatement cxps= ljrs.prepareStatement(cxsrs);
    cxps.setString(1,zztitle);
    ResultSet crxs=cxps.executeQuery();
        while(crxs.next()){
          zzyds+=crxs.getInt("yds")+"";
    } 
    if(zzyds==""){
            newzzyds=1;
      }else{
            newzzyds=Integer.parseInt(zzyds)+1;
      }
    /*out.print("newzzyds"+newzzyds);
    out.print(newzzyds);
    out.print("zz"+newzzyds);
    out.print("zz"+zzname);
    out.print("zz"+zztitle);
    out.print("zz"+zzdate);*/
    /*更新阅读数和评论数*/
    String sqlUpdate="update wzdatasjj SET yds=? , pls=? where zz = ? && title=? && date=?";
    PreparedStatement ps= ljrs.prepareStatement(sqlUpdate);  
    ps.setInt(1,newzzyds);
    ps.setInt(2,pls);
    ps.setString(3,zzname);
    ps.setString(4,zztitle);
    ps.setString(5,zzdate);
    //out.print(ps);
    ps.executeUpdate(); 
    ps.close();
    ljrs.close();
    zzyds=newzzyds+"";

    /*out.print(successsql);  
    out.print(newcgur);*/

   /* out.print(success); 
    out.print(cgur);*/
      /*计算在线人数合和计算访问次数*/
  int rstj=1;
  int jscs=0;
  int newrs=1;
    String urlrs="jdbc:mysql://localhost:3306/rstjdata?user=root&password=123456";    
    Connection ljrsxs =DriverManager.getConnection(urlrs);
    String cxrs="select * from rstjtable";
    PreparedStatement prs = ljrsxs.prepareStatement(cxrs);
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
    rstj+=1;
    newrs=rstj;
    jscs+=1;   
    ljrsxs.close();
        //传递
    session.setAttribute("newcgur",newcgur);
    /*判断本人是否已点赞该文章*/
    String pdUser="";
    String pdxsurl="jdbc:mysql://localhost:3306/user?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    Connection ljrxsPd =DriverManager.getConnection(pdxsurl);
    String xsPdrs="select * from userdz where user=? && yzh=?";
    PreparedStatement pdrxs = ljrxsPd.prepareStatement(xsPdrs);
    pdrxs.setString(1,xsname);
    pdrxs.setString(2,cdid);
    ResultSet rxsp=pdrxs.executeQuery();
    while(rxsp.next()){
          pdUser+=rxsp.getString("user");
    }
    
%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
    <link href="./css/wzlr.css" type="text/css" rel="stylesheet">
    <link href="./css/wzlrcbl.css" type="text/css" rel="stylesheet"> 
     <link type="text/css" href="./css/ztbhtp.css" rel="stylesheet"/>
     <link href="/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/sj.js"></script>
    <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/index.js"></script>
    <script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/wzlr.js"></script>
    <script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/dl.js"></script>
    <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/zx.js"></script>
    <%-- <script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/wzthYi.js"></script> --%>
    
    <title>wz</title>
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
         <%if(newcgur.equals("")&&successsql.equals("0")){dljs=0;out.print("<li><a href='https://www.qc-h.xyz/zhuye/dl/dl.jsp'>");}else{dljs=1;out.print("<li><a onclick='dljs(this)'>");}%>登录</a>
             </li><%
             if(dljs==1&&successsql.equals("1")){
               out.print("<li id='zx' onclick='zx(this)' class='li2'><a>注销</a></li>");
               }%>
       </ul>
       <li class="canvashy" id="canvashy" onclick="djTh(this)" ></li>
       <li class="ztbhtp" onclick="djTh(this)"><div id="djThs" class="fa fa-moon-o" value="<%out.print(cookieCdXsmsValue);%>"></div></li>
       
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
           <a class="tx_ss" href="<%if(newcgur!=""&&successsql.equals("1")){out.print("https://www.qc-h.xyz/mytx.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>">
           <img class="tx_tb" src="https://www.qc-h.xyz/usertx/<%out.print(newtx);%>">
           <p class="mingzi"><%if(xsname!=""&&successsql.equals("1")){out.print(xsname);}else{out.print("hhh");}%></p>
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
         <form class="zxplfrom" action="<%if(newcgur!=""&&successsql.equals("1")){out.print("https://www.qc-h.xyz/zhuye/pc/gxpl.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>" method="POST">
             <input class="zxplname"  type="hidden" name="zxplname" value="<%out.print(xsname);%>">
             <input class="zxpluser"  type="hidden" name="zxpluser" value="<%out.print(newcgur);%>">
             <input type="hidden" name="jrfs" value="0">
             <input type="hidden" name="cdid" value="<%out.print("0");%>">
             <input class="zxpl" id="zxwbjc"  type="text" placeholder="<%if(newcgur!=""&&successsql.equals("1")){out.print("可以评论了٩(๑>◡<๑)۶ ");}else{out.print("请先登录再评论٩( 'ω' )و");}%>" name="zxpl" autocomplete="of">
             <br/>
            <%if(newcgur!=""&&successsql.equals("1")){
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
         <li><div id="ztlrjs" class="ztlr" >
         <h1 class="wzbt"><%=zztitle%></h1>
         <div class="wzzx"><a class="lmsj"><i class="fa fa-calendar"></i><%out.print(zzdate);%></a>
         <a class="lmpl"><i class="fa fa-comment-o"></i><%out.print(zzpls);%>个评论</a>
         <a class="lmzz"><i class="fa fa-user"></i><%out.print(zzname);%></a>
         <a class="lmyd"><i class="fa fa-eye"></i><%out.print(zzyds);%>次阅读</a></div>
          <br/>
         <div class="wzwbd"><a class="wzwb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(zzwz);%></a>
         <%
             if(newcgur.equals("")&&successsql.equals("")){
                        xsname="";
                      }
                     // out.print(xsname+"1");
         %>
         <!--点赞or分享-->
         <form name="dzOrfxsc" enctype="multipart/text" onsubmit="return false" method="POST">
          <input type="hidden" name="dzname" value="<%out.print(xsname);%>">
          <input type="hidden" name="dzbh" value="<%out.print(cdid);%>">
          <input type="hidden" name="dztitle" value="<%out.print(zztitle);%>">
          <input type="hidden" name="dzzz" value="<%out.print(zzname);%>"> 
          <input type="hidden" name="dzsj" value="<%out.print(zzdate);%>">
         <div class="dzOrfx"><%if(pdUser!=""){
           if(xsname.equals("")){
             out.print("<div class='wzdzs'  onclick='wzdzsDj(2)'>");
           }else{
             out.print("<div class='wzdzs'  onclick='wzdzsDj(1)'>");
             }
             }else{
               if(xsname.equals("")){
                 out.print("<div class='wzdzs'  onclick='wzdzsDj(2)'>");
                 }else{
                   out.print("<div type='submit' class='wzdzs'  onclick='wzdzsDj(0)'>");
                   }
                   }%><i id="wzdzsjs" class="<%if(pdUser!=""&&xsname!=""){out.print("fa fa-thumbs-up");}else{out.print("fa fa-thumbs-o-up");}%>">&nbsp;&nbsp;&nbsp;&nbsp;点赞</i></div>
         <div onclick="wzfxDj(this)" class="wzfx"><i id="wzfxjs" class="fa fa-share-alt">&nbsp;&nbsp;&nbsp;&nbsp;分享</i></div></div>
         </form>
         </div>
         </div></li>
         <li>
             <%
          String[] xgplunamesz=xgpluname.split(";");
          String[] xgplusersz=xgpluser.split(";");
          String[] xgplplsz=xgplpl.split(";");
          String[] xgpldatesz=xgpldate.split(";");
          
          for(int xgpli= 0;xgpli<xgplunamesz.length&&xgpli<5;xgpli++){
            /*out.print(xgplunamesz[0]);
            out.print(xgplunamesz.length);*/
            if(xgplunamesz.length!=0&&xgplunamesz[0]!=""){
            %>
            <div class="ztpl" id="ztpljs">             
         <p class="pluserp"><img class="plusertp" src="https://www.qc-h.xyz/usertx/<%out.print(xgplusersz[xgpli]);%>.ico">
         <!--删除评论-->
        <form name="delPlId" action="https://www.qc-h.xyz/wzlr/delPlHt.jsp"  method="POST">
          <input type="hidden" name="delUser" value="<%out.print(newcgur);%>">
          
            <div class="pluserdiv1">
                <a class="plusera1"><% out.print(xgplunamesz[xgpli]);%></a>
            </div>
            <br/>
             <div class="pluserdiv3">
                <a class="plusera3"><% out.print(xgpldatesz[xgpli]);%></a>
            </div>
            <br/>
            <div class="pluserdiv2">
                <a class="plusera2"><%if(xgplplsz[xgpli].length()>15){out.print(xgplplsz[xgpli].substring(0,15)+"...>");}else{out.print(xgplplsz[xgpli]);}%></a>
            </div>
            <%/*out.print(xgplunamesz[xgpli]);out.print(xsname);*/if(xgplunamesz[xgpli].equals(xsname)){%><div class="delTp"><input id="sumAn" class="sumAn" type="submit" onclick='delPlFunction(this,"<%out.print(newcgur);%>")' /><i id='delPlId<%out.print(xgpli);%>' class='fa fa-trash-o iBq'></i></div><%}%>
          </p>
          </div>
          <input type="hidden" name="delUserPl" id="delUserPl" value="<%out.print(xgplplsz[xgpli]);%>">
          <input type="hidden" name="delWzh" value="<%out.print(cdid);%>">
          </form>
          <%}
          else{
            %>
            <div  class="ztpl" id="ztpljs">
            <a>此篇文章暂时没有评论！</a>
            </div>
            <%
          }
           }%>
          <div>
                         <!--页码栏-->
             <%
                       //页面初始化
          int pageszhi=1;
          //起始值
          int qsz=0;
          //终点值
          int zsz;
          //页面评论数
          int mywzs=5;
          //页面显示cookie值名称
          String cookiename="ymdh";
          /**/
          String cookiename2="pages";
          if(pageszhi==1){
                qsz=0;
                zsz=mywzs;
              }
             String ymlpzzhi="ymlpz";
             //out.print(pageszhi);
             if(pageszhi>1){
               ymlpzzhi="ymlpz2";
              }
              else{
                ymlpzzhi="ymlpz";
              }%>
              
             <div id="ymlpz" class="<%out.print(ymlpzzhi);%>">
              <ul class="ulsk">
              <%
            /////////计算最终页//////////
              int cd= xgplunamesz.length;
              int zcd=0;
              while(cd>0){
                cd-=mywzs;
                zcd+=1;
              }
              %><a id="zzysj" style="display:none;"><%out.print(zcd);%></a><%
           ///////////////////////////
              int cspages=1;
              //out.print(pageszhi);
              while(pageszhi-cspages>=1){
                cspages+=1;
              }
              if(pageszhi>1){%>
                <li class="ymlys" id="zqm" onclick="front(this)"><a class="fa fa-angle-double-left ulsklia2 ymlays"></a></li>
                <li class="ymlys" id="sypage" onclick="previouspage(this)"><a class="fa fa-angle-left ulsklia ymlays"></a></li>
           <%   }
              for(int ia=cspages;ia<=pageszhi+2;ia++){
              %>
                <li id="ymli" class="ymlys"><a id="ymla" onclick="ymqh(this)" class="ymlays"><%out.print(ia);%></a></li>
              <%
              }
              %>
                <li class="ymlys" id="xypage" onclick="nextpage(this)"><a class="fa fa-angle-right ulsklia ymlays"></a></li>
                <li class="ymlys" id="zhm" onclick="last(this)"><a class="fa fa-angle-double-right ulsklia2 ymlays"></a></li>
          </div>
          <div class="ztpl" id="ztpljs">         
          <form class="zxplwzfrom" action="<%if(newcgur!=""&&successsql.equals("1")){out.print("https://www.qc-h.xyz/zhuye/pc/gxpl.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>" method="POST">
             <input type="hidden" name="zxplname" value="<%out.print(xsname);%>">
             <input type="hidden" name="zxpluser" value="<%out.print(newcgur);%>">
             <input type="hidden" name="zxplzzname" value="<%out.print(zzname);%>">
             <input type="hidden" name="zxpldate" value="<%out.print(zzdate);%>">
             <input type="hidden" name="jrfs" value="1">
             <input type="hidden" name="cdid" value="<%out.print(cdid);%>">
             <input class="zxwzpl" id="zxwbjc" type="text" placeholder="<%if(newcgur!=""&&successsql.equals("1")){out.print("可以评论了٩(๑>◡<๑)۶ ");}else{out.print("请先登录再评论٩( 'ω' )و");}%>" name="zxpl" autocomplete="of">
             <br/>
            <%if(newcgur!=""&&successsql.equals("1")){
              out.print("<input onclick='gxplfscg(this)'  class='zxwzplan' type='submit' value='发送' />");
              }else{
                out.print("<input onclick='gxpl(this)' class='zxwzplan' type='submit' value='发送' />");
              }%>
              </form>
              </div>
          </li>

      </ul>
     </div>
      <!--悬浮主体-->
     <div><img src="https://www.qc-h.xyz/zhuye/gjtp/1393817219.gif" class="yxtp">
     </div>
     <!--底部栏主体-->
     <!--<script>
         console.log(document.getElementById("ztlrjs"));
     </script>-->
     <div class="dilandiv" id="dilandiv">
      <script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/dblkz.js"></script>
      <script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/wzfx.js"></script>
      <script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/delPl.js"></script>
      <!--<script type="text/javascript" src="https://www.qc-h.xyz/wzlr/js/test.js"></script>-->
      <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/thYi.js"></script>
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