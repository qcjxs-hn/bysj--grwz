"use strict";

window.addEventListener("load", function () {
  //获取上传元素
  var uploadFile = document.querySelector("#file");
  var list = document.querySelector(".imglist");
  var file = document.querySelector(".file"); //选中触发

  uploadFile.addEventListener("change", function (params) {
    var _iteratorNormalCompletion = true;
    var _didIteratorError = false;
    var _iteratorError = undefined;

    try {
      for (var _iterator = this.files[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
        var item = _step.value;
        //动态生成dom节点li
        console.log(item);
        var li = document.createElement("li"); //文件上传的名字储存在name中

        li.innerHTML = "               \n              <div class=\"close\">x</div>\n              <img src=\"C:/Users/Administrator/Pictures/Camera Roll/".concat(item.name, "\"/>");
        list.insertBefore(li, file);
      }
    } catch (err) {
      _didIteratorError = true;
      _iteratorError = err;
    } finally {
      try {
        if (!_iteratorNormalCompletion && _iterator["return"] != null) {
          _iterator["return"]();
        }
      } finally {
        if (_didIteratorError) {
          throw _iteratorError;
        }
      }
    }
  });
});