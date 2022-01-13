function gxgrzl() {
    //alert(document.getElementById("myfile").value);
    if(document.getElementById("myfile").value!=""){
    document.fileUpload1.target="_blank";
    document.fileUpload1.action="fileUpload";
    document.fileUpload1.submit();
     }
     
    if(document.getElementById("nichen").value!=""||document.getElementById("xgemail").value!=""||document.getElementById("newpassword").value!="")
    {
    document.fileUpload2.target="_blank";
    //alert(document.getElementById("nichen").innerHTML);
    document.fileUpload2.action="https://www.qc-h.xyz/mytxcl.jsp";
    document.fileUpload2.submit();
    }

}