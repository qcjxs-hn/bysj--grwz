"use strict";

function wzdzsDj(pdUserValue) {
  var wnMc = document.getElementById("wzdzsjs").className; //console.log(pdUserValue);

  if (wnMc != null && wnMc == "fa fa-thumbs-o-up" && pdUserValue == "0") {
    alert("点赞成功，感谢！(⺣◡⺣)♡");
    document.getElementById("wzdzsjs").setAttribute("class", "fa fa-thumbs-up"); //document.dzOrfxsc.target="_blank";
    //alert(document.getElementById("nichen").innerHTML);

    document.dzOrfxsc.action = "https://www.qc-h.xyz/wzlr/dzht.jsp";
    document.dzOrfxsc.submit();
    document.dzOrfxsc.onsubmit = "return false";
  } else if (wnMc != null && wnMc == "fa fa-thumbs-up" && pdUserValue == "1") {
    alert("你已点赞，不要重复哦！٩( 'ω' )و");
    document.getElementById("wzdzsjs").setAttribute("class", "fa fa-thumbs-up");
  } else if (wnMc != null && wnMc == "fa fa-thumbs-o-up" && pdUserValue == "2") {
    alert("请先登录！٩( 'ω' )و");
    document.getElementById("wzdzsjs").setAttribute("class", "fa fa-thumbs-o-up");
    window.location.href = "https://www.qc-h.xyz/zhuye/dl/dl.jsp";
  } //console.log(wnMc);

}

function wzfxDj(params) {
  var wnMcfx = document.getElementById("wzfxjs").className;

  if (wnMcfx != null && wnMcfx == "fa fa-share-alt") {
    document.getElementById("wzfxjs").setAttribute("class", "fa fa-share-alt-square");
  } else {
    document.getElementById("wzfxjs").setAttribute("class", "fa fa-share-alt");
  }

  console.log(wnMcfx);
}