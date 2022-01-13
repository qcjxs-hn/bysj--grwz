"use strict";

var cdXsmsName = "cdXsmsValue";
var cdXsms = getCookie(cdXsmsName);

if (cdXsms != null && cdXsms == 0) {
  djTh(cdXsms);
  document.getElementById("canvashy").style = "border:60px solid rgb(20, 20, 61);";
  document.getElementById("djThs").setAttribute("class", "fa fa-moon-o");
  document.getElementById("body1").style = "background-color:#f5f5f579;";
  document.getElementById("ylk").style = "background-color:#f5f5f579;";

  for (var i3 = 0; i3 < acd - 12; i3++) {
    document.getElementsByTagName("a")[i3].style = "color:#000;";
  }
} else {
  document.getElementById("canvashy").style = "border:60px solid rgba(245, 245, 245, 0.8);";
  document.getElementById("body1").style = "background-color:rgb(20, 20, 61);";
  document.getElementById("ylk").style = "background-color:rgb(20, 20, 61);"; //console.log(document.getElementById("body1").style);

  document.getElementById("djThs").setAttribute("class", "fa fa-sun-o"); //document.getElementsByTagName("a")[0].style="color:#fff;";

  for (var i2 = 0; i2 < acd - 12; i2++) {
    document.getElementsByTagName("a")[i2].style = "color:#fff;";
  }

  for (var i = 0; i < cs; i++) {
    document.getElementsByTagName("a")[i].style = "box-shadow: 1px 1px 1px 1px #000, -5px -3px 6px 1px #000;color:#fff;";
  }

  for (var i5 = 0; i5 < pcd - 1; i5++) {
    document.getElementsByTagName("p")[i5].style = "color:#000;";
  }

  cdXsms = document.getElementById("cdXsms").Value;
  console.log(cdXsms);
  djTh(cdXsms);
}

console.log("cdXsms" + cdXsms);

function djTh(kj) {
  // console.log(kj);
  //a标签长度
  var acd = document.getElementsByTagName("a").length; //p标签长度

  var pcd = document.getElementsByTagName("p").length; //头部栏长度

  var cs = 0;

  if (document.getElementById("zx") != null) {
    cs = 7;
  } else {
    cs = 6;
  } //更改图像和背景


  if (document.getElementById("djThs").className == "fa fa-moon-o" || cdXsms == 0 || kj == "0") {
    document.getElementById("canvashy").style = "border:60px solid rgba(245, 245, 245, 0.8);";
    document.getElementById("body1").style = "background-color:rgb(20, 20, 61);";
    document.getElementById("ylk").style = "background-color:rgb(20, 20, 61);"; //console.log(document.getElementById("body1").style);

    document.getElementById("djThs").setAttribute("class", "fa fa-sun-o"); //document.getElementsByTagName("a")[0].style="color:#fff;";

    for (var i2 = 0; i2 < acd - 12; i2++) {
      document.getElementsByTagName("a")[i2].style = "color:#fff;";
    }

    for (var i = 0; i < cs; i++) {
      document.getElementsByTagName("a")[i].style = "box-shadow: 1px 1px 1px 1px #000, -5px -3px 6px 1px #000;color:#fff;";
    }

    for (var i5 = 0; i5 < pcd - 1; i5++) {
      document.getElementsByTagName("p")[i5].style = "color:#000;";
    } // console.log(document.getElementsByTagName("a")[0].style);


    document.getElementById("djThs").Value = 1;
    cdXsms = 1;
    document.cookie = cdXsmsName + "=" + cdXsms;
    console.log(document.getElementById("djThs").Value);
  } else {
    console.log(kj);
    document.getElementById("canvashy").style = "border:60px solid rgb(20, 20, 61);";
    document.getElementById("djThs").setAttribute("class", "fa fa-moon-o");
    document.getElementById("body1").style = "background-color:#f5f5f579;";
    document.getElementById("ylk").style = "background-color:#f5f5f579;";

    for (var i3 = 0; i3 < acd - 12; i3++) {
      document.getElementsByTagName("a")[i3].style = "color:#000;";
    }

    document.getElementById("djThs").Value = 0;
    cdXsms = 0;
    document.cookie = cdXsmsName + "=" + cdXsms;
    console.log(document.getElementById("djThs").Value);
    /* for(var i4=0;i4<cs;i4++){
         document.getElementsByTagName("a")[i4].style="box-shadow: 5px 3px 6px 1px #c6d9ed, -5px -3px 6px 1px #fff;";
     }*/
  }
}