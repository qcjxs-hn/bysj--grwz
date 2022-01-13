
function delPlFunction(pdUserkj,pdUserValue) {
    alert("删除成功！(⺣◡⺣)♡");
    var newxyz =pdUserkj.id.substring(pdUserkj.id.length-1,pdUserkj.id.length);

    var wnMc=document.getElementById(pdUserkj.id).className;
    if(wnMc!=null&&wnMc=="fa fa-trash-o"&&pdUserValue!=""){
        alert("删除成功！(⺣◡⺣)♡");
        document.getElementById(pdUserkj.id).setAttribute("class","fa fa-trash");
        //document.dzOrfxsc.target="_blank";
        //alert(document.getElementById("nichen").innerHTML);
       //delPlId.action="https://www.qc-h.xyz/wzlr/delPlHt.jsp";
       /* delPlId.submit();*/
    }
    else if(wnMc!=null&&wnMc=="fa fa-trash-o"&&pdUserValue==""){
        alert("请先登录！٩( 'ω' )و");
        document.getElementById("delPlId").setAttribute("class","fa-trash");
        window.location.href="https://www.qc-h.xyz/zhuye/dl/dl.jsp";
    }
    //console.log(wnMc);
}