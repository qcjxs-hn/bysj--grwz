"use strict";

function zx(zx) {
  /*Cookie newcgurcookie=new Cookie("newcgur","");
  Cookie xsnamecookie=new Cookie("xsname",xsname);
  Cookie dljlcookie=new Cookie("dljl","0");*/
  console.log(getCookie("dljl"));
  console.log(getCookie("newcgur"));

  if (getCookie("newcgur") != null || getCookie("dljl") != "1") {
    document.cookie = "newcgur" + "=" + "";
    document.cookie = "xsname" + "=" + "";
    document.cookie = "dljl" + "=" + "0";
    window.location.reload(true);
    window.location.href = "https://www.qc-h.xyz/zhuye/zx/zx.jsp";
  }
}