"use strict";

function djTh(kj) {
  console.log(kj.id);

  if (document.getElementById(kj.id).className == "fa fa-moon-o") {
    document.getElementById(kj.id).setAttribute("class", "fa fa-sun-o");
  } else {
    document.getElementById(kj.id).setAttribute("class", "fa fa-moon-o");
  }
}