
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="https://www.qc-h.xyz/zhuye/gjtp/wangzhantp.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qc</title>
</head>
<body>
    <script>
        var system ={}; 
            var p = navigator.platform;      
            system.win = p.indexOf("Win") == 0; 
            system.mac = p.indexOf("Mac") == 0; 
            system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);    
            if(system.win||system.mac||system.xll){//如果是电脑跳转到pcym
                window.location.href="https://www.qc-h.xyz/zhuye/pc/index.jsp"; 
            }else{  //如果是手机,跳转到phoneym
                window.location.href="https://www.qc-h.xyz/zhuye/phone/sjindex.jsp"; 
            }
        </script>
</body>
</html>