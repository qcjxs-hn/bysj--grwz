"use strict";

function dljs(dl) {
  alert("你已登录！");
}

function gxpl(gxpl) {
  alert("请先登录！");
  window.location.href = "https://www.qc-h.xyz/zhuye/dl/dl.jsp";
}

function gxplfscg(gxplfscg) {
  var zxwbzhi = document.getElementById("zxwbjc").value;

  if (zxwbzhi != "") {
    alert("评论成功！");
  } else {
    window.location.href = "https://www.qc-h.xyz/wzlr/wz1.jsp";
  } //alert("评论成功！");
  //window.location.href="https://www.qc-h.xyz";

}