"use strict";

function dblkz() {
  var Csz = 0;
  var ztlrHeight = document.getElementById("ztlrjs").offsetHeight; //var ztplHeight=document.getElementById("ztpljs").offsetHeight;

  /*var ztplHeight2=document.getElementById("ztpljs2").offsetHeight;
  var baikuai2Height=document.getElementById("baikuai2js").offsetHeight;
  var zaixianrenshuHeight=document.getElementById("zaixianrenshujs").offsetHeight;*/
  // console.log("ztlrHeight"+ztlrHeight);

  if (ztlrHeight < 300) {
    Csz = 800;
  } else {
    Csz = ztlrHeight / 4 + 100;
  }

  var newZtlrHeight = Csz;
  var newMarginTop = newZtlrHeight + "px";
  /*console.log("ztpl"+ztplHeight);
  console.log(newZtlrHeight);
  console.log(newMarginTop);*/

  document.getElementById("dilandiv").style.marginTop = newMarginTop;
}

dblkz();