"use strict";

var cdXsmsName = "cdXsmsValue";
var cdXsms = getCookie(cdXsmsName);
console.log("cdXsms" + cdXsms);

function djTh(kj) {
  //console.log("djThs");
  //a标签长度
  var acd = document.getElementsByTagName("a").length; //头部栏长度

  var cs = 0;
  var cs2 = 0;

  if (document.getElementById("zx") != null) {
    //console.log("cs"+cs);
    cs = 7;
    cs2 = 11; //console.log("cs"+document.getElementById("zx"));
  } else {
    //console.log(cs);
    cs = 6;
    cs2 = 11;
  } //更改图像和背景


  if (document.getElementById("djThs").className == "fa fa-moon-o") {
    document.getElementById("canvashy").style = "border:60px solid rgba(245, 245, 245, 0.8);";
    document.getElementById("body1").style = "background-color:#281e41;";
    document.getElementById("ylk").style = "background-color:rgb(20, 20, 61);"; //console.log(document.getElementById("body1").style);

    document.getElementById("djThs").setAttribute("class", "fa fa-sun-o"); //document.getElementsByTagName("a")[0].style="color:#fff;";

    console.log(document.getElementsByTagName("a"));

    for (var i2 = 0; i2 < acd - cs2; i2++) {
      document.getElementsByTagName("a")[i2].style = "color:#fff;";
    }

    for (var i = 0; i < cs; i++) {
      document.getElementsByTagName("a")[i].style = "box-shadow: 1px 1px 1px 1px #000, -5px -3px 6px 1px #000;color:#fff;";
    }

    document.getElementById("djThs").setAttribute("value", "1");
    cdXsms = 1;
    document.cookie = cdXsmsName + "=" + cdXsms;
    console.log(document.getElementById("djThs").Value);
  } else {
    document.getElementById("canvashy").style = "border:60px solid rgb(20, 20, 61);";
    document.getElementById("djThs").setAttribute("class", "fa fa-moon-o");
    document.getElementById("body1").style = "background-color:#f5f5f579;";
    document.getElementById("ylk").style = "background-color:#f5f5f579;"; // document.getElementById("djThs").Value=1;

    for (var i3 = 0; i3 < acd - cs2; i3++) {
      document.getElementsByTagName("a")[i3].style = "color:#000;";
    }

    document.getElementById("djThs").setAttribute("value", "0");
    cdXsms = 0;
    document.cookie = cdXsmsName + "=" + cdXsms;
    console.log(document.getElementById("djThs").Value);
    /*for(var i4=0;i4<cs;i4++){
        document.getElementsByTagName("a")[i4].style="box-shadow: 5px 3px 6px 1px #c6d9ed, -5px -3px 6px 1px #fff;";
    }*/
  }
}
/*function cookieTh(params) {
    var acd =document.getElementsByTagName("a").length;
    //头部栏长度
    var cs=0;
    var cs2=0;
    if(document.getElementById("zx")!=null){
        //console.log("cs"+cs);
        cs=7;
        cs2=12;
       //console.log("cs"+document.getElementById("zx"));
    }
    else{
        //console.log(cs);
        cs=6;
        cs2=11;
    }
     //更改图像和背景
     if(cdXsms==0){
        document.getElementById("canvashy").style="border:60px solid rgba(245, 245, 245, 0.8);";
        document.getElementById("body1").style="background-color:#281e41;";
        document.getElementById("ylk").style="background-color:rgb(20, 20, 61);";
        //console.log(document.getElementById("body1").style);
        document.getElementById("djThs").setAttribute("class","fa fa-sun-o");
        //document.getElementsByTagName("a")[0].style="color:#fff;";
        
        for(var i2=0;i2<acd-cs2;i2++){
            document.getElementsByTagName("a")[i2].style="color:#fff;";
        }
        for(var i=0;i<cs;i++){
            document.getElementsByTagName("a")[i].style="box-shadow: 1px 1px 1px 1px #000, -5px -3px 6px 1px #000;color:#fff;"; 
        }
        cdXsms=1;
        document.cookie=cdXsmsName+"="+cdXsms;
        console.log(document.getElementById("djThs").Value);
       /* document.getElementById("djThs").setAttribute("value","1");
        cdXsms=1;
        document.cookie=cdXsmsName+"="+cdXsms;
        console.log(document.getElementById("djThs").Value);
    
        }
        else{
            document.getElementById("canvashy").style="border:60px solid rgb(20, 20, 61);";
            document.getElementById("djThs").setAttribute("class","fa fa-moon-o");
            document.getElementById("body1").style="background-color:#f5f5f579;";
            document.getElementById("ylk").style="background-color:#f5f5f579;";
           // document.getElementById("djThs").Value=1;
            for(var i3=0;i3<acd-cs2;i3++){
                document.getElementsByTagName("a")[i3].style="color:#000;";
            }
            cdXsms=0;
            document.cookie=cdXsmsName+"="+cdXsms;
            console.log(document.getElementById("djThs").Value);
           /* document.getElementById("djThs").setAttribute("value","0");
            cdXsms=0;
           document.cookie=cdXsmsName+"="+cdXsms;
            console.log(document.getElementById("djThs").Value);
    */

/*for(var i4=0;i4<cs;i4++){
    document.getElementsByTagName("a")[i4].style="box-shadow: 5px 3px 6px 1px #c6d9ed, -5px -3px 6px 1px #fff;";
}
}
}
cookieTh()*/