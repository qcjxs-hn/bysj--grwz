window.addEventListener("load",()=>{
    //获取上传元素
    let uploadFile=document.querySelector("#file");
    let list =document.querySelector(".imglist");
    let file=document.querySelector(".file");
    //选中触发
    uploadFile.addEventListener("change",function (params) {
          for(let item of this.files){
              //动态生成dom节点li
              console.log(item);
              let li =document.createElement("li");
              //文件上传的名字储存在name中
              li.innerHTML=`               
              <div class="close">x</div>
              <img src="C:/Users/Administrator/Pictures/Camera Roll/${item.name}"/>`;
              list.insertBefore(li,file);

          }               
    });
});