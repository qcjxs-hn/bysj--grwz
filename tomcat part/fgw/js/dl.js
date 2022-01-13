function dljs(dl) {
    alert("你已登录！");
}
function gxpl(gxpl) {
    alert("请先登录！");
    window.location.href="https://www.qc-h.xyz/zhuye/dl/dl.jsp";
}
function gxplfscg(gxplfscg) {
    var zxwbzhi=document.getElementById("zxwbjc").value;
    var wztitlezhi=document.getElementById("wztitle").value;
    var wzjjzhi=document.getElementById("wzjj").value;

    if(zxwbzhi!=""){
        alert("发布成功！");
    }
    if(wztitlezhi!=""){
        window.location.href="https://www.qc-h.xyz/fgw/fgw.jsp";
    }
    else{
        alert("标题不能为空！o(´^｀)o");
    }
    if(wzjjzhi!=""){
        window.location.href="https://www.qc-h.xyz/fgw/fgw.jsp";
    }
    else{
        alert("简介不能为空！o(´^｀)o");
    }

    //alert("评论成功！");
    //window.location.href="https://www.qc-h.xyz";
}