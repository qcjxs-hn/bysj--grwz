function secondToDate(second) {
    if (!second) {
    return 0;
    }
    //alert(second);
    var time = new Array(0, 0, 0, 0, 0);
    /*if (second >= 365 * 24 * 3600) {
    time[0] = parseInt(second / (365 * 24 * 3600));
    second %= 365 * 24 * 3600;
    }*/
    time[0]=0;
    if (second >= 24 * 3600) {
    time[1] = parseInt(second / (24 * 3600));
    second %= 24 * 3600;
    }
    if (second >= 3600) {
    time[2] = parseInt(second / 3600);
    second %= 3600;
    }
    if (second >= 60) {
    time[3] = parseInt(second / 60);
    second %= 60;
    }
    if (second > 0) {
    time[4] = second;
    }
    //alert(time);
    return time;
    }
function setTime() {
    var starttime = Math.round(new Date(Date.UTC(2021, 07, 18, 0, 0, 0)).getTime() / 1000);
    var timestamp = Math.round((new Date().getTime() + 8 * 60 * 60 * 1000) / 1000);
    //alert(starttime);
    //alert(timestamp);
    //alert(timestamp - starttime);
    currentTime = secondToDate((timestamp - starttime));
    currentTimeHtml =currentTime[1] + '天'
    + currentTime[2] + '时' + currentTime[3] + '分' + currentTime[4]
    + '秒';
    document.getElementById("sjid").innerHTML = currentTimeHtml;
    }    setInterval(setTime, 1000);
/*function sleep(miao) {
    var now = new Date();
    var ghtime=now.getTime()+miao;
    while (true) {
        now =new Date();
        if (now.getTime()>ghtime) {
            return true;
        }
    }
}*/