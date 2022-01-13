<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
        <%@page import="java.net.*"%>
<!doctype html>
<html lang="en">
<%

String cgur = request.getQueryString();
  String newzyurl= "";
  String newcgur="";
  String newuser="";
  String success="0";
  String newtx="";
  String xsname="";
int dljs=1;
  //获取登录信息
    	Cookie[] cookies = request.getCookies();
//out.print(zyurl);
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
    		}
    	}
   /* out.print(success); 
    out.print(newcgur);  */
}

session.setAttribute("newtx",newtx);
//传输类型
String typezhi="1";
session.setAttribute("ymlxdm","1");
/*Cookie cookiezhi=new Cookie("phoneorpc","1");
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
    String url="jdbc:mysql://localhost:3306/pqdata?user=root&password=123456";
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    String cx="select * from wzdatasjj  order by date desc";
    PreparedStatement p = lj.prepareStatement(cx);
    ResultSet r=p.executeQuery();
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
    rstj+=1;
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
    }
        //头像
    /*out.print(success);  
    out.print(newcgur);  */
    if(newcgur!=""&&success.equals("1")){
      newtx=newcgur+".ico";
    }
    else{
      newtx="dltp.ico";
    }
        //传输类型
    session.setAttribute("phoneorpc",typezhi);
    session.setAttribute("cgur",cgur);
    session.setAttribute("newtx",newtx);
    session.setAttribute("newcgur",newcgur);
    session.setAttribute("success",success);
    session.setAttribute("xgpljrfs","0");
%>
<head>
  <meta charset="utf-8">
  <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
  <title>qc</title>
 <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
 <link href="sjindex.css" type="text/css" rel="stylesheet">
 <link href="/font-awesome-4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet">
 <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/index.js"></script>
 <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/vue.min.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/sj.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/dl.js"></script>
 <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/zx.js"></script>
<script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/ydqw.js"></script>
 <script type="text/javascript" src="https://www.qc-h.xyz/zhuye/zhuyejs/wzdj.js"></script>
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
 <div class="ylk">
 <!--网站名字-->
    <div class="wztpimg">
        <img class="tx_tb2" src="https://www.qc-h.xyz/zhuye/gjtp/sjwztp.ico"><a style="font-size:20px;"><!--正在开发中！电脑页面完整点！--></a>
    </div>
 <!--登录-->
         <div class="imgdiv">
         </div>
          <li class="txli">
            <a class="tx_ss" href="<%if(newcgur!=""){out.print("https://www.qc-h.xyz/mytx.jsp");}else{out.print("https://www.qc-h.xyz/zhuye/dl/dl.jsp");}%>">
            <img class="tx_tb" src="https://www.qc-h.xyz/usertx/<%out.print(newtx);%>">
            </a> 
          </li>
  <!-- 复选框的id属性值和label元素的for属性值相同的话 那么就可以通过label元素选中复选框 -->
<input type="checkbox" id="nav" /><label for="nav"></label>
<ul>
 <li><a  href="http://qc-h.xyz/zhuye/yuanmafl/ymfl.html" >源码</a></li>
  <li><a href="https://www.qc-h.xyz/xgj/xgj.jsp">小工具</a></li>
  <li><a href="<%if(cgur!=null){out.print("https://www.qc-h.xyz/fgw/fgw.jsp?"+cgur);}else{out.print("https://www.qc-h.xyz/fgw/fgw.jsp");}%>">发个文</a></li>
  <li><a href="javascript:window.location.href='https://www.qc-h.xyz/muxing/mx.html';">模型</a></li>
  <li><a href="http://qc-h.xyz/dmw/html/dmw.html">动漫</a></li>
  <%/*out.print(success);out.print(newcgur);*/if(newcgur.equals("")&&successsql.equals("0")){dljs=0;out.print("<li><a href='https://www.qc-h.xyz/zhuye/dl/dl.jsp'>");}else{dljs=1;out.print("<li><a onclick='dljs(this)'>");}%>登录</a>
      </li><%
      if(dljs==1&&successsql.equals("1")){
        out.print("<li id='zx' onclick='zx(this)' class='li2'><a>注销</a></li>");
        dljs=0;
        }%>
</ul>
</div>
</head>
<body >

<div class="syzt">
  <div class="headbg">
    <img class="headbg2"/>
    <div class="bgwz">
      <a href="https://www.qc-h.xyz/conf.zip">
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
  <!--主体--> 
    <div class="zt">        
       <ul class="ztu"> 
          <!--正文主体-->
          <%  
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
          int mywzs=5;
          //css样式中class初始值
          String classzhi="box boxone";
          //页面显示cookie值名称
          String cookiename="ymdh";
          /**/
          String cookiename2="pages";
          if(pageszhi==1){
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
          for(int i= qsz;i<zsz;i++){
           if(pqdatadatesz[i]==null){
             break;
           }
          %>
            <div id="boxone<%out.print(i);%>"    onclick="djfw(this)"  class="box">
            <!--<div class="divlm">-->
              <img class="lmtpys" src="https://www.qc-h.xyz/wzdtphoto/<%out.print(pqdatalmpicturesz[i]);%>"/><!--备用out.print(i+".jpg");-->
              <h4 class="lmbiaoti"><%out.print(pqdatatitlesz[i]);%></h4><p class="plm"><%out.print(pqdatazwsz[i]);%></p>
              <div class="wzlmdl">
                 <a class="lmsj"><i class="fa fa-calendar"></i><%out.print(pqdatadatesz[i]);%></a>
                  <a class="lmpl"><i class="fa fa-comment-o"></i><%out.print(pqdataplssz[i]);%>个评论</a>
                  <a class="lmzz"><i class="fa fa-user"></i><%out.print(pqdatazzsz[i]);%></a>
                  <a class="lmyd"><i class="fa fa-eye"></i><%out.print(pqdataydssz[i]);%>次阅读</a>
          <!-- <a class="ydqw" onclick="ydqwj()">阅读全文
                  <i class="fa fa-chevron-circle-right"></i>-->
                  <div class="ydqw">
                  <form class="ydqw1" name="ydqw1" action="<%out.print(pqdataurlsz[i]);%>" method="POST">
                  <input type="hidden" name="cdid" value="<%out.print(pqdataidsz[i]);%>">
                  <input type="hidden" name="zztitle" value="<%out.print(pqdatatitlesz[i]);%>">
                  <input type="hidden" name="cdzz" value="<%out.print(pqdatazzsz[i]);%>">
                  <input type="hidden" name="cdsj" value="<%out.print(pqdatadatesz[i]);%>">
                  <input type="hidden" name="cdyds" value="<%out.print(pqdataydssz[i]);%>">
                  <input class="ydqwin" type="submit" id="ydqwin<%out.print(i);%>" value="阅读全文"><i class="fa fa-chevron-circle-right"></i>
                 </form>
                 </div>
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
      <div><img src="https://www.qc-h.xyz/zhuye/gjtp/1393817219.gif" class="yxtp">
      </div>
     
      <!--底部栏主体-->
      <div class="dilandiv">
        <div class="dlwbjl">
        <P class="dlp">
          <i style="font-size: 19px; font-style: normal;">©2021</i>
          <a class="dla" href="https://www.qc-h.xyz/源码.zip">qcjxs</a> all rights reserved.|<i style="font-size: 20px; font-style: normal;">本站运行时间</i><a id="sjid" class="sjays"></a>
          this web page was created by
          <a class="dla2" href="https://space.bilibili.com/85985296/bangumi">qcjxs</a><br/>
          if you need to contact 
          <a class="dla3" href="tencent://AddContact/?fromId=45&fromSubId=1&subcmd=all&uin=1871982008&website=www.oicqzone.com">qq</a><br>
          </P>
          </div>
</div>
</body>
</html>
  