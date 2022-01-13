
<?php
/*function isMobile() { 
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
      return true;
    } 
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset($_SERVER['HTTP_VIA'])) { 
      // 找不到为flase,否则为true
      return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    } 
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高。其中'MicroMessenger'是电脑微信
    if (isset($_SERVER['HTTP_USER_AGENT'])) {
      $clientkeywords = array('nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile','MicroMessenger'); 
      // 从HTTP_USER_AGENT中查找手机浏览器的关键字
      if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
        return true;
      } 
    } 
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) { 
      // 如果只支持wml并且不支持html那一定是移动设备
      // 如果支持wml和html但是wml在html之前则是移动设备
      if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
        return true;
      } 
    } 
    return false;
  }*/

header("Content-type:text/html;charset=utf-8");
//echo $_POST['uname'];
//echo $_POST['pwd'];
$uname=$_POST['uname'];
$pwd=$_POST['pwd'];
$ymlxdm=$_POST['ymlxdm'];
$mysqli=new mysqli('127.0.0.1','root','123456','user','3306');
//登录
//echo $uname;
if($_POST['zhi']=="登录"){
$sql="select * from usertable where user='$uname'";
//$sql2="select * from usertable where email='$uname' AND pwd='$pwd'";
$mysqli->query("SET NAMES UTF8");
$result=$mysqli->query($sql);
//解吗
$sqldate=$result->fetch_object();
if($sqldate!=null){
$sqlname=$sqldate->user;
$sqlpwd=$sqldate->pwd;
$sqlsuccess=$sqldate->success;
}
else{
    $sqlpwd="0";
}
/*echo $sqlpwd;
echo $sqlname;*/
//$result2=$mysqli->query($sql2);
//echo strlen($sqlpwd);
$newpwd="";
$cd=strlen($sqlpwd);
$js=15;
while($js<$cd){
    $newpwd.=$sqlpwd[$js];
    $js+=17;
}
//设置session
/*function setsession(){
    session_start();
    $_SESSION["cguser1"]="23h";
}*/
//加密账号
$userjs=0;
//账户加密赋值
$usercd=strlen($uname);
$strjm=substr(md5(time()),0,20);
$newuser="";
//账户前缀加密
$userqz="user";
$userqzjm=substr(md5(time()),0,20);
$newuserqz="";
//状态加密赋值
$successqz="dlzt";
$successqzjm=substr(md5(time()),0,20);
$newsuccessqz="";
//随机字符
$sjzf=substr(md5(time()),0,1);
$sjzf2=substr(md5($uname),0,20);
while($userjs<$usercd){
    //账户加密
    //$newuser.=$strjm[$userjs].$user[$userjs];
    $newuser.=$strjm[$userjs];
    $newuser.=$uname[$userjs];
    $newuser.=$strjm;
    //账户前缀加密
    $newuserqz.=$userqzjm[$userjs];
    $newuserqz.=$userqz[$userjs];
    $newuserqz.=$userqzjm;
    //状态加密
  
    $newsuccessqz.=$successqzjm[$userjs];
    $newsuccessqz.=$successqz[$userjs];
    $newsuccessqz.=$successqzjm;
    $userjs+=1;
}
//echo $strjm;
//echo $newpwd;
        //判断是否有账号
        if($uname!=null){
            //判断是否注册
            if($result->num_rows!=0){
            //判断是否输入密码
                    if($pwd!=null){
                        //判断密码是否正确
                        if($pwd==$newpwd){
                            //判断手机还是pc
                            //是否已登录
                            if($sqlsuccess=="0"){
                                //echo "UPDATE usertable SET success='1' WHERE user='$uname'";
                                $mysqli->query("UPDATE usertable SET success='1' WHERE user='$uname'");
                                //mysqli_query($mysqli,"UPDATE usertable SET success='1' WHERE user=$uname");
                                //判端页面
                                if($ymlxdm=="1"){
                                if($_POST['phoneorpc']=="1"){
                                    header("Location:https://www.qc-h.xyz/zhuye/phone/sjindex.jsp?".$newuserqz."&".$newuser."&".$newsuccessqz."&".$sjzf."1");
                                    setcookie("cguser","true");
                                }
                                else{
                                    header("Location:https://www.qc-h.xyz/zhuye/pc/index.jsp?".$newuserqz."&".$newuser."&".$newsuccessqz."&".$sjzf."1");
                                    setcookie("cguser","false");
                                }
                            }elseif ($ymlxdm=="2") {
                                header("Location:https://www.qc-h.xyz/wzlr/wz1.jsp?".$newuserqz."&".$newuser."&".$newsuccessqz."&".$sjzf."1");
                                setcookie("cguser","true");
                            }elseif ($ymlxdm=="3") {
                                header("Location:https://www.qc-h.xyz/fgw/fgw.jsp?".$newuserqz."&".$newuser."&".$newsuccessqz."&".$sjzf."1");
                                setcookie("cguser","true");
                            }
                        }
                        else{
                            echo "<script>alert('此账号已登录！')</script>";    
                            if($_POST['phoneorpc']=="1"){
                                header("Location:https://www.qc-h.xyz/zhuye/phone/sjindex.jsp?".$newuserqz."&".$newuser."&".$newsuccessqz."&".$sjzf."1");
                                setcookie("cguser","true");
                            }
                            else{
                                header("Location:https://www.qc-h.xyz/zhuye/pc/index.jsp?".$newuserqz."&".$newuser."&".$newsuccessqz."&".$sjzf."1");
                                setcookie("cguser","false");
                            }
                        }
                        }
                        else{
                            echo "<script>alert('密码错误，请重新输入！')</script>";
                            header("refresh:1;url=https://www.qc-h.xyz/zhuye/dl/dl.jsp");
                        }
                }
                else{
                    echo "<script>alert('请输入密码！')</script>";
                    header("refresh:1;url=https://www.qc-h.xyz/zhuye/dl/dl.jsp");
                }
            }
            else{
                echo "<script>alert('此账号未注册！')</script>";
                header("refresh:1;url=https://www.qc-h.xyz/zhuye/dl/dl.jsp");
            }
        }
        else{
            echo "<script>alert('请输入用户名！')</script>";
            header("refresh:1;url=https://www.qc-h.xyz/zhuye/dl/dl.jsp");
        }
}
//注册
else if($_POST['zhi']=="注册"){
    header("Location:https://www.qc-h.xyz/zc/register.html");
}
//忘记密码
else{
    header("Location:https://www.qc-h.xyz/wjmm/wjmm.html");
}

?>
