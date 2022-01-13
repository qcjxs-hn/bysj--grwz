<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.net.*"%>
<!doctype html>
<html lang="en">
<!--<script type="text/javascript">
var url = window.location.href;        
if (url.indexOf("https") < 0) {        
  url = url.replace("http:", "https:");        
window.location.replace(url);        
}</script>-->
<%
String cgur = request.getQueryString();
  String newzyurl= "";
  String newcgur="";
  String newuser="";
  String success="0";
  String newtx="";
  String xsname="";
  String cdXsmsValue="0";
  String cookieCdXsmsValue="";
int dljs=1;
  //获取登录信息
    	Cookie[] cookies = request.getCookies();
//out.print(zyurl);
if(cgur!=null){
  String[] cgursz=cgur.split("&");
/*out.print("0:"+cgursz[0]);
out.print("1:"+cgursz[1]);
out.print("2:"+cgursz[2]);
out.print("3:"+cgursz[3]);*/  
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

    	//保存有cookie对象
    	if(cookies != null && cookies.length > 0){
    		for(Cookie c: cookies){
    			if(c.getName().equals("dljl")){
    				success = c.getValue();
    			}
           if(c.getName().equals("newcgur")){
    				newcgur = c.getValue();
    			}
           if(c.getName().equals("cgur")){
    				 cgur = c.getValue();
    			}
           if(c.getName().equals("xsname")){
    			  xsname = URLDecoder.decode(c.getValue(), "UTF-8");
    			}
           if(c.getName().equals("cdXsmsValue")){
    				 cdXsmsValue = c.getValue();
             //out.print("cdx"+cdXsmsValue);
             session.setAttribute("cdXsmsValue",cdXsmsValue);
    			}
    		}
    	}
   /* out.print(success); 
    out.print(newcgur);  */
}
/*out.print(newzyurl);*/


/**/

/*out.print(cgur);*/
/*out.print(success);*/
/*
int cgurjs=1;
while(cgurjs<newzyurl.length()){
  newcgur+=cgur.charAt(cgurjs);
  cgurjs+=4;
}*/

      //out.print(newuser);
    if(session.getAttribute("cdXsmsValue")!=null){
               cookieCdXsmsValue=session.getAttribute("cdXsmsValue").toString();
      }
    if(cookieCdXsmsValue!=null){
    Cookie CdXsmsValuecookie=new Cookie("cdXsmsValue",cookieCdXsmsValue);
    //out.print(cookieCdXsmsValue);
    response.addCookie(CdXsmsValuecookie);
    }

session.setAttribute("ymlxdm","1");
//out.print(newcgur);

/*Cookie cookiezhi=new Cookie("phoneorpc","0");
response.addCookie(cookiezhi);*/
/*连接数据库*/
    String pqdataid="";
    String pqdatatitle="";
    String pqdatazw="";
    String pqdataurl="";
    String pqdatadate="";
    String pqdatalmpicture="";
    String pqdatazz="";
    String pqdatayds="";
    String pqdatapls="";
    String pqdatadzs="";
    String bttitle="";
    String url="jdbc:mysql://localhost:3306/pqdata?user=root&password=123456";
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    String cx="select * from wzdatasjj order by date desc";
    PreparedStatement pp = lj.prepareStatement(cx);
    ResultSet r=pp.executeQuery();
    while(r.next()){
      pqdataid+=r.getString("id")+";";
      pqdatatitle+=r.getString("title")+";";
      pqdatazw+=r.getString("jj")+";";
      pqdataurl+=r.getString("url")+";";
      pqdatadate+=r.getString("date")+";";
      pqdatalmpicture+=r.getString("lmpicture")+";";
      pqdatazz+=r.getString("zz")+";";
      pqdatayds+=r.getInt("yds")+""+";";
      pqdatapls+=r.getInt("pls")+""+";";
      pqdatadzs+=r.getInt("dzs")+""+";";
    }
    lj.close();
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
        rstj=rs.getInt("rs")+rs.getInt("rs")+(int)(Math.random()*3);
      }
      jscs=rs.getInt("jscs")/2;
    } 
    rstj+=(int)(Math.random()*3);
    newrs=rstj;
    jscs+=1;      
    String sql="UPDATE rstjtable SET rs = ? , jscs=? WHERE id = 1";
    PreparedStatement ps= ljrs.prepareStatement(sql);  
    ps.setInt(1,newrs);
    ps.setInt(2,jscs);  
    ps.executeUpdate(); 
    ps.close();
    ljrs.close();  
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
    Cookie CdXsmsValuecookie=new Cookie("cdXsmsValue","1");
        response.addCookie(CdXsmsValuecookie);
    }
    //out.print(xrs.getString("nickname"));
    /*更新评论*/
    String xgpluname="";
    String xgpluser="";
    String xgplpl="";
    String xgpldate="";
    String xgsz="";
    String xgplurl="jdbc:mysql://localhost:3306/xgpl?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.jdbc.Driver");
    Connection xgpllj =DriverManager.getConnection(xgplurl);
    String xgplcx="select * from xgpltable order by date desc";
    PreparedStatement xgplpp = xgpllj.prepareStatement(xgplcx);
    ResultSet xgplr=xgplpp.executeQuery();
    while(xgplr.next()){
      xgpluname+=xgplr.getString("uname")+";";
      xgpluser+=xgplr.getString("user")+";";
      xgplpl+=xgplr.getString("pl")+";";
      xgpldate+=xgplr.getString("date")+";";
      }
    xgpllj.close(); 
    //头像
    /*out.print(success);  
    out.print(newcgur);  */
    if(newcgur!=""&&success.equals("1")){
      newtx=newcgur+".ico";
    }
    else{
      newtx="pcdltp.ico";
    }
    /*out.print(success);  
    out.print(newcgur);*/
    //传输类型
    String typezhi="0";
    session.setAttribute("phoneorpc",typezhi);
    session.setAttribute("cgur",cgur);
    session.setAttribute("newtx",newtx);
    session.setAttribute("newcgur",newcgur);
    session.setAttribute("success",successsql);
    session.setAttribute("xgpljrfs",typezhi);
    //out.print(dljl);
%>
<head>
  <meta charset="utf-8">
  <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
  <title>qc</title>
 <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
 <link href="index1.css" type="text/css" rel="stylesheet">
 <link href="indexcbl.css" type="text/css" rel="stylesheet">
 <link type="text/css" href="ztbhtp.css" rel="stylesheet"/>
 <link href="/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/index.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/vue.min.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/sj.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/dl.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/zx.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/ydqw.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/btjs.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/wzdj.js"></script>

<script src="https://www.qc-h.xyz/zhuye/zhuyejs/darkmode-js/lib/darkmode-js.js"></script>
 <script>var mz="ymdh";</script>
 <style type="text/css">
 input#tj:focus{
	 background-color:#F00;
	 }
 input#ss:focus{
	 background-color:#36F;
	 }
    html,body{
            cursor: url("../gjtp/cao.png") ,auto;
        }
   .yxtp {
     z-index: 2;
     right: 20px;
     bottom: 20px;
     width: 100px;
     position: fixed;
     border:  2px solid rgba(255, 255, 255, 0);;
   }
   .imgsb{
            z-index: 2;
            width: 50px;
            height: 50px;
            position: absolute;
            background-image: url('../gjtp/goat.gif');
            background-size: cover;
   }

		
 </style>
 <div class="ylk" id="ylk">
  <!-- 复选框的id属性值和label元素的for属性值相同的话 那么就可以通过label元素选中复选框 -->
<input type="checkbox" id="nav" /><label for="nav"></label>
<ul>
  <li><a  href="http://qc-h.xyz/zhuye/yuanmafl/ymfl.html" >源码</a></li>
  <li><a href="https://www.qc-h.xyz/xgj/xgj">小工具</a></li>
  <li><a href="<%if(cgur!=null){out.print("https://www.qc-h.xyz/fgw/fgw.jsp?"+cgur);}else{out.print("https://www.qc-h.xyz/fgw/fgw.jsp");}%>">发个文</a></li>
  <li><a href="javascript:window.location.href='https://www.qc-h.xyz/muxing/mx.html';">模型</a></li>
  <li><a href="https://www.qc-h.xyz/dmw/dmw.jsp">动漫</a></li>
  <%/*out.print(success);out.print(newcgur);*/if(newcgur.equals("")||successsql.equals("0")){dljs=0;out.print("<li><a href='https://www.qc-h.xyz/zhuye/dl/dl.jsp'>");}else{dljs=1;out.print("<li><a onclick='dljs(this)'>");}%>登录</a>
      </li><%
      if(dljs==1&&successsql.equals("1")){
        out.print("<li id='zx' onclick='zx(this)' class='li2'><a>注销</a></li>");
        dljs=0;
        }%>
     
</ul>
<li class="canvashy" id="canvashy" onclick="djTh(this)" value=0></li>
<li class="ztbhtp" onclick="djTh(this)"><p  id="djThs" class="fa fa-moon-o"></p></li>
<!--<script>
  new Darkmode().showWidget();
</script>-->
</div>
</head>
<body id="body1">

<!--头部背景-->
<div class="syzt" id="syzt">
  <div class="headbg">
    <img class="headbg2"/>
    <div class="bgwz">
      <a href="https://www.qc-h.xyz">
       <h2>QC</h2>
       <br/>
       <span  id="wzts"  v-bind:title="xianshi">「コード愛好家だ」</span>
       <script>
       var wzts=new Vue({
                el:'#wzts',
       data:{
         xianshi:'慢慢写终会写完的！'+new Date().toLocaleString()
       }
       })

       </script>
       </a>
     </div>
  </div>

  <div class="bg">
     <div class="tuxia">
           <a href="#"><strong>垃圾网络，显示缓慢！</strong></a>
    </div>
   </div>
  <!--主体--> 
    <div class="zt">        
       <ul class="ztu"> 
         <li><script src="https://www.qc-h.xyz/zhuye/zhuyejs/main.js"></script></li>
         <!--用户账号和名字-->
         <li class="tx_li">
            <a class="tx_ss" href="<%if(newcgur!=""&&successsql.equals("1")){out.print("https://www.qc-h.xyz/mytx.jsp");}else{dljs=0;out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>">
            <img class="tx_tb" src="https://www.qc-h.xyz/usertx/<%out.print(newtx);%>">
            <p class="mingzi"><%if(xsname!=""&&successsql.equals("1")){out.print(xsname);}else{out.print("hhh");}%></p>
            </a> 
          </li>
          <!--右边栏白块-->
          <!--评论-->
          <li class="baikuai"><div class="pldiv"><p class="plp">最新评论</p><br/>
          <%
          String[] xgplunamesz=xgpluname.split(";");
          String[] xgplusersz=xgpluser.split(";");
          String[] xgplplsz=xgplpl.split(";");
          String[] xgpldatesz=xgpldate.split(";");
          for(int xgpli= 0;xgpli<xgplunamesz.length&&xgpli<7;xgpli++){
            %>
          <div>
             <p class="pluserp"><img class="plusertp" src="https://www.qc-h.xyz/usertx/<%out.print(xgplusersz[xgpli]);%>.ico">
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
          </p>
          </div>
                   <% }%>
          <form class="zxplfrom" action="<%if(newcgur!=""){out.print("https://www.qc-h.xyz/zhuye/pc/gxpl.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>" method="POST">
              <input class="zxplname"  type="hidden" name="zxplname" value="<%out.print(xsname);%>">
              <input class="zxpluser"  type="hidden" name="zxpluser" value="<%out.print(newcgur);%>">
              <input type="hidden" name="jrfs" value="0">
              <input type="hidden" name="cdid" value="<%out.print("0");%>">
              <input class="zxpl"  type="text" placeholder="<%if(newcgur!=""&&success.equals("1")){out.print("可以评论了٩(๑>◡<๑)۶ ");}else{out.print("请先登录再评论٩( 'ω' )و");}%>" name="zxpl" autocomplete="of">
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
          <!--正文主体-->
          <ul class="ztuul">
         <% 
          //out.print(pqdataid);
          String[]  pqdataidsz =pqdataid.split(";");
          String[]  pqdatatitlesz =pqdatatitle.split(";");
          String[]  pqdatazwsz=pqdatazw.split(";");
          String[]  pqdataurlsz=pqdataurl.split(";");
          String[]  pqdatadatesz=pqdatadate.split(";");
          String[]  pqdatalmpicturesz=pqdatalmpicture.split(";");
          String[]  pqdatazzsz=pqdatazz.split(";");
          String[]  pqdataydssz=pqdatayds.split(";");
          String[]  pqdataplssz=pqdatapls.split(";");
          String[]  pqdatadzssz=pqdatadzs.split(";");
          String  cookiezhi=null;
          cookies=null;
          //页面初始化
          int pageszhi=1;
          //起始值
          int qsz=0;
          //终点值
          int zsz=0;
          //页面文章数
          int mywzs=6;
          //css样式中class初始值
          String classzhi="box newboxone";
          int ymys=0;
          //页面显示cookie值名称
          String cookiename="ymdh";
          /**/
          String cookiename2="pages";
          if(pageszhi==1){
                Cookie cookieName2cookie=new Cookie(cookiename2,"1");
                response.addCookie(cookieName2cookie);
                qsz=0;
                zsz=mywzs;
              }
          cookies=request.getCookies();
          /*页面跟换*/ 
          if(cookies!=null){
          for(int i5=0;i5<cookies.length;i5++){
            if(cookies[i5].getName().equals(cookiename2)){
              pageszhi=Integer.parseInt(cookies[i5].getValue());
              if(pageszhi==1){
                qsz=0;
                zsz=mywzs;
              }
              else{
                qsz=pageszhi*mywzs-mywzs;
                zsz=pageszhi*mywzs;
                while(qsz>pqdatatitlesz.length)
                {
                  qsz-=1;
                }
                while(zsz>pqdatatitlesz.length){
                  zsz-=1;
                }
                //out.print(qsz);
                //out.print(zsz);
              }
            }
            }
          }
          /*生成box*/
          Cookie zszcookie=new Cookie("zsz",zsz+"");
          response.addCookie(zszcookie);
          for(int i= qsz;i<zsz;i++){
           if(pqdatadatesz[i]==null){
             break;
           }
          %>
              <!--废弃<script>
                if(getCookie("ymdh")==0){
              //alert(getCookie("ymdh"));
            }
            else{
            alert(getCookie("ymdh"));
            /*boxone=document.getElementById("boxone");
            boxone.className = "newboxone"*/
            //alert(boxone.className);
            document.getElementById("boxone").setAttribute("class","box newboxone")
           }
         </script>-->
         <%    
         
         /*获取cookie*/
         /*Cookie cookiezhi1=new Cookie("ymdh","0");
         response.addCookie(cookiezhi1);*/
          //cookiezhi=cookies[1].getValue();
          if(cookies!=null){
          for(int i3=0;i3<cookies.length;i3++){
            //out.print(cookies[i3].getName());
            if(cookies[i3].getName().equals(cookiename))
            {
            //out.print(cookies[i3].getValue());
             if(cookies[i3].getValue().equals("1")){
                 ymys=1;
                 classzhi="box newboxone";
             }
             else{
                ymys=0;
                classzhi="box boxone";
             }
            }
          }
          }
          else{
             classzhi="box newboxone";
          }
          //out.print(rstj);
          %>
          <li id="boxone<%out.print(i);%>"   class="<%out.print(classzhi);%>"  onclick="djfw(this)">
            <div class="divlm">
              <img class="lmtpys" src="https://www.qc-h.xyz/wzdtphoto/<%out.print(pqdatalmpicturesz[i]);%>"/><!--备用out.print(i+".jpg");-->
              <p  class="lmbiaoti"><%if(pqdatatitlesz[i].length()<50||ymys==1){out.print(pqdatatitlesz[i]);}else{out.print(pqdatatitlesz[i].substring(0,50)+"...");}%></p><p class="plm"><%out.print(pqdatazwsz[i]);%></p>
              <div class="wzlmdl">
                  <a class="lmsj"><i class="fa fa-calendar"></i><%out.print(pqdatadatesz[i]);%></a>
                  <a class="lmpl"><i class="fa fa-comment-o"></i><%out.print(pqdataplssz[i]);%>个评论</a>
                  <a class="lmzz"><i class="fa fa-user"></i><%out.print(pqdatazzsz[i]);%></a>
                  <a class="lmyd"><i class="fa fa-eye"></i><%out.print(pqdataydssz[i]);%>次阅读</a>
                  <a class="lmdz"><i class="fa fa-thumbs-o-up"></i><%out.print(pqdatadzssz[i]);%>个点赞</a>
          <!-- <a class="ydqw" onclick="ydqwj()">阅读全文
                  <i class="fa fa-chevron-circle-right"></i>-->
                  <div class="ydqw">
                  <form class="ydqw1" name="ydqw1" id="ydqw1" action="<%out.print(pqdataurlsz[i]);%>" method="POST">
                  <input type="hidden" name="cdid" value="<%out.print(pqdataidsz[i]);%>">
                  <input type="hidden" name="zztitle" value="<%out.print(pqdatatitlesz[i]);%>">
                  <input type="hidden" name="cdzz" value="<%out.print(pqdatazzsz[i]);%>"> 
                  <input type="hidden" name="cdsj" value="<%out.print(pqdatadatesz[i]);%>">
                  <input type="hidden" name="cdpls" value="<%out.print(pqdataplssz[i]);%>">
                  <input type="hidden" name="cdyds" value="<%out.print(pqdataydssz[i]);%>">
                  <input type="hidden" name="cdyds" value="<%out.print(pqdatadzssz[i]);%>">
                  <input  class="ydqwin" type="submit" id="ydqwin<%out.print(i);%>" value="阅读全文"><i class="fa fa-chevron-circle-right"></i>
                 </form></div>
              </div>
            </div>
          </li>
       <%
           			}
           %>
 
       </ul>
      </div>
             <!--页码栏-->
             <%
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
              int cd= pqdatatitlesz.length;
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
              </ul>
              </div>
       <!--悬浮主体-->
       <div  class="imgsb"></div>
      <div><img src="https://www.qc-h.xyz/zhuye/gjtp/1393817219.gif" class="yxtp">
      </div>
      <!--底部栏主体-->
      <div class="dilandiv">
      <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/sbgs.js"></script>
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
  