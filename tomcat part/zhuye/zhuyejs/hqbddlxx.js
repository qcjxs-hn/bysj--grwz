setInterval(function() {
/*var locator=new ActiveXObject ("WbemScripting.SWbemLocator");
    var service=locator.ConnectServer(".");*/
    
    var cpu=new Enumerator (service.ExecQuery("SELECT * FROM Win32_Processor")).item();
    document.getElementById(xs).innerHTML = cpu.LoadPercentage;
}, 1000)
/*function cpuSimulator() {

    var J = 100,
    
    getNow = function() {
    
    return new Date().getTime();
    
    };
    
    !(function() {
    
    var I = document.createElement("div"),
    
    s = 50,
    
    fn = function(l) {
    
    l = 1;
    
    var now = getNow();
    
    var c = 1;
    
    while (c < J) {
    
    if (now > D + c*s) {
    
    l++;
    
    }
    
    c++;
    
    }
    
    D = getNow();
    
    I.innerHTML = "CPU：" + l/J * 100 + "%";
    
    },
    
    t = setInterval(fn, 500),
    
    D = getNow();
    
    I.style.cssText = "width:80px; height:20px; position:fixed !important; _position:absolute; top:10px; right:10px; border:1px solid #406c99; padding:2px; color:#f00;";
    
    document.body.appendChild(I);
    
    fn();
    
    })();
    
    }
    cpuSimulator();*/