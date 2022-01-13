<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="java.util.Date"%>
        <%@page import="java.text.*"%>
    <%@page import="java.sql.*"%>
    <%
    String wzdataid="";
    String wztitlecx="";
    int newdateid=0;
    int jqcd=0;
    int newpicturenumber=0;
    String picturename="";
    String newpicturename="";
    String wzdatalmpicture="";
    String wztitle=request.getParameter("wztitle");
    String wzjj=request.getParameter("wzjj");
    String wzzw=request.getParameter("wzzw");
    String zxplname=request.getParameter("zxplname");
    String zxpluser=request.getParameter("zxpluser");
    String cgur=request.getParameter("zxplcgur");
    String zxplzw=request.getParameter("zxpl");
    String wzurl="https://www.qc-h.xyz/wzlr/wz1.jsp";
    String zzdate="";
    SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
    Date timeDate=new Date();
    String timestring =formatter.format(timeDate);
    String stringtime =timestring.toString();
    int yds=0;
    String wz=zxplzw;
      String pdString="{*.jpg}";
    int zfwz=0;
    int fhJs=0;
    int pPz=0;
    String df="<p>";
    String kg="&nbsp;&nbsp;";
    String wf="</p><p>";
    String newwz="";
    String tpxs="";
    int cd=wz.length();
    int zfHand=0;
    int zfEnd=0;
    String picturenamexs="";
    String kJiqz="<p><img class='wztpxs'src='https://www.qc-h.xyz/wztp/";
    String hJiqz="'><p>";
    String newPicturename="";
    String qWz="";
    //文章题目不能为空
    if(wztitle.equals("")){
        response.setHeader("refresh","0;URL=https://www.qc-h.xyz/fgw/fgw.jsp?"+cgur);
    }
    else{
        //文章简介不能为空
        if(wzjj.equals("")){
             response.setHeader("refresh","0;URL=https://www.qc-h.xyz/fgw/fgw.jsp?"+cgur);
        }
        else{
            //文章主体不能为空
            //out.ptint((String)wzzw);
            /*if(wzzw.equals("")){
                response.setHeader("refresh","0;URL=https://www.qc-h.xyz/fgw/fgw.jsp?"+cgur);
            }
            else{*/
                    for(int i=0;i<cd;i++)
                        {
                            if(pdString.indexOf(wz.charAt(i))!=-1){
                            //out.print("wz"+wz.charAt(i));
                            if(wz.charAt(i)=='{'){
                                zfHand=zfwz;
                            }
                            if(wz.charAt(i)=='}'){
                                zfEnd=zfwz; 
                            }
                            if(zfHand!=0&&zfEnd!=0){
                                picturenamexs= wz.substring(zfHand+1,zfEnd);
                                //out.print("qgc:"+zfHand+":"+zfEnd+"");
                                //out.print("picturename:"+picturenamexs);
                                zfHand=0;
                                zfEnd=0;
                            }
                            if(picturenamexs!=""){
                                newPicturename=kJiqz+picturenamexs+hJiqz;
                                //out.print("picturename:"+newPicturename);
                                newwz+=newPicturename+wf;
                                picturenamexs="";
                                zfHand=0;
                                zfEnd=0;
                            }
                        }
                            
                            if(wz.charAt(i)==' ')
                            {
                                newwz+=' ';
                            }
                            else if(wz.charAt(i)=='；'){
                                newwz+="；"+wf;
                            }
                            else if(wz.charAt(i)==';'){
                                newwz+=";"+wf;
                            }
                            else if(wz.charAt(i)=='：'){
                                newwz+="："+wf;
                            }
                            else if(wz.charAt(i)=='，'){
                                newwz+="，"+' ';
                            }
                            else if(wz.charAt(i)=='。'){
                                newwz+="。"+wf;
                            }
                            else if(wz.charAt(i)==','){
                                newwz+=","+' ';
                            }
                            else if(wz.charAt(i)=='{'){
                                newwz+=' ';
                            }
                            else if(wz.charAt(i)=='}'){
                                newwz+=' ';
                            }
                            else if(zfHand==0&&zfEnd==0){
                                newwz+=wz.charAt(i)+"";
                            }

                            fhJs+=1;
                            zfwz+=1;
                        }
    String newWz="<pre>"+df+newwz+"</pre>";
    //out.print("<pre>"+df+newwz+"</pre>");
    //"<pre>"+df+newwz+"</pre>"
    //先查询文章数
    String url="jdbc:mysql://localhost:3306/pqdata?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj =DriverManager.getConnection(url);
    String cx="select * from wzdatasjj";
    PreparedStatement pp = lj.prepareStatement(cx);
    ResultSet r=pp.executeQuery();
    while(r.next()){
      wzdataid+=r.getInt("id")+";";
      wzdatalmpicture+=r.getString("lmpicture")+";";
    }
    String[] wzdataidsz=wzdataid.split(";");
    String[] wzdatalmpicturesz=wzdatalmpicture.split(";");
    picturename=wzdatalmpicturesz[wzdataidsz.length-1];
    jqcd=(picturename.length())-4;
    //out.print(wzdataidsz[wzdataidsz.length-1]);
    //out.print(picturename.substring(0,jqcd));
    newpicturenumber = Integer.parseInt(picturename.substring(0,jqcd))+1;
    newpicturename = newpicturenumber+""+".jpg";
    newdateid=Integer.parseInt(wzdataidsz[wzdataidsz.length-1])+1;
    String cx2="select * from wzdatasjj where title=? && zz=?";
    PreparedStatement ppcx1 = lj.prepareStatement(cx2);
    ppcx1.setString(1,wztitle);
    ppcx1.setString(2,zxplname);
    ResultSet ppcx2=ppcx1.executeQuery();
    //out.print(ppcx2);
    while(ppcx2.next()){
      wztitlecx+=ppcx2.getString("title");
    }
    //out.print(wztitlecx);
    if(wztitlecx.equals("")){
    //开始写入
    String cr="insert into wzdatasjj values (?,?,?,?,?,?,?,?,?,?)";
    PreparedStatement ppupdate = lj.prepareStatement(cr);
    ppupdate.setInt(1,newdateid);
    ppupdate.setString(2,wztitle);
    ppupdate.setString(3,wzjj);
    ppupdate.setString(4,wzurl);
    ppupdate.setString(5,stringtime);
    ppupdate.setString(6,newpicturename);
    ppupdate.setString(7,zxplname);
    ppupdate.setInt(8,0);
    ppupdate.setInt(9,0);
    ppupdate.setInt(10,0);
    ppupdate.executeUpdate();
    lj.close();
    String url2="jdbc:mysql://localhost:3306/wzk?user=root&password=123456&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.jdbc.Driver");
    Connection lj2 =DriverManager.getConnection(url2);
    String cr2="insert into wzktable values (?,?,?,?)";
    PreparedStatement ppupdate2 = lj2.prepareStatement(cr2);
    ppupdate2.setString(1,zxplname);
    ppupdate2.setString(2,stringtime);
    ppupdate2.setString(3,wztitle);
    ppupdate2.setString(4,newWz);
    ppupdate2.executeUpdate();
    lj2.close();
    }
    else{
      out.print("<script>alert('该文章已有！');</script>");
    }
    response.setHeader("refresh","0;URL=https://www.qc-h.xyz");
         //}
        }
    }

    %>