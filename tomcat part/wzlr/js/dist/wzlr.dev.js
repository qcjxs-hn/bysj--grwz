"use strict";

function getCookie(name) {
  /*获取cookie*/
  var czz = name + '=';
  var xyz = document.cookie.split(';');

  for (var index = 0; index < xyz.length; index++) {
    var newxyz = xyz[index];
    /*清除字符段空格 */

    while (newxyz.charAt(0) == ' ') {
      newxyz = newxyz.substring(1, newxyz.length);
    } //alert(newxyz);
    //alert(newxyz.indexOf(czz));

    /*如果有就剪切 */


    if (newxyz.indexOf(czz) == 0) {
      return unescape(newxyz.substring(czz.length, newxyz.length));
    }
  }
}

function fun(dla4) {
  /*完成指定动作*/
  var mz = "ymdh"; //alert(getCookie("ymdh"));

  if (getCookie("ymdh") == "1") {
    document.cookie = mz + "=" + "0";
    window.location.reload(true);
  } else {
    document.cookie = mz + "=" + "1";
    window.location.reload(true);
  }
}

function ymqh(ymla) {
  /*页数 */
  //var zhi=document.getElementById(ymla).innerHTML;
  var mz2 = "pages";
  var zhi = ymla.innerHTML; //alert(zhi);

  document.cookie = mz2 + "=" + zhi;
  window.location.reload(true);
}
/*function adjsjmn(ymli){
  var ajid=document.getElementById("ymla");
  ajid.click();
}*/


function nextpage(xypage) {
  var mz2 = "pages";
  var newpage = Number(getCookie(mz2)) + 1; //alert(getCookie(mz2));

  if (getCookie(mz2) != isNaN) {
    newpage = 2; //alert(newpage);

    document.cookie = mz2 + "=" + newpage;
    window.location.reload(true);
  } else {
    //alert(newpage);
    document.cookie = mz2 + "=" + newpage;
    window.location.reload(true);
  }
}

function previouspage(sypage) {
  var mz2 = "pages";
  var newpage2 = Number(getCookie(mz2)) - 1; //alert(newpage2);

  if (newpage2 > 0) {
    document.cookie = mz2 + "=" + newpage2;
    window.location.reload(true);
  }
}

function front(zqm) {
  var mz2 = "pages";
  var newpage3 = 1; //alert(newpage3);

  document.cookie = mz2 + "=" + newpage3;
  window.location.reload(true);
}

function last(zhm) {
  var mz2 = "pages";
  var newpage4 = document.getElementById("zzysj").innerHTML; //alert(newpage4);

  document.cookie = mz2 + "=" + newpage4;
  window.location.reload(true);
}

function refresh() {
  window.location.reload(true);
}