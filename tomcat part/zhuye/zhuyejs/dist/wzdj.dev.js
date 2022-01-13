"use strict";

var ajValue = 0;
var ajName = "";
var newajnumber = "";
var cd = 0;
/*var ajAction="";*/
//双击跳转事件

function djfw(liid) {
  //console.log(liid.id);
  ajName = liid.id;
  cd = ajName.length; //console.log(cd);
  //分割字符

  newajnumber = ajName.substring(cd - 1, cd); //console.log(newajnumber);

  if (ajValue >= 1) {
    document.getElementById("ydqwin" + newajnumber).click();
  } //计数


  ajValue += 1;
} //1秒自动初始化


function qZero(qz) {
  cd = 0;
  ajName = "";
  newajnumber = "";
  ajValue = 0; // console.log(ajValue);
}

setInterval(qZero, 2000);