//alert('hello world!');
//不能重复赋值

/*const age=30;
age=31;
console.log(age);*/
//可重复赋值

/*let age= 30;
age=31;
console.log(age);*/
//
//老的赋值方式

/*var age= 30;
age=31;
console.log(age); */

/*const name="hhh";
const age=30;
const rating=4.5; //js中没有浮点型
const isboolean=true;
const x= null;
const y=undefined;
let z;
console.log(typeof );
*/
//arrays 数组

/*const arraysz=["datd1","data2","data3"];
//arraysz[1]="data4";
//数组后加入数据
arraysz.push("data5");
//数组前加入数据
arraysz.unshift("startdata");
//移除数据
//arraysz.pop();
//数组长度
console.log(arraysz.length);
 //查看某元素索引
 console.log(arraysz.indexOf("data3"));

console.log(arraysz);
console.log(arraysz[1]);
*/
//字典

/*const zd={
    data1:'zhi',
    data2:'zhi2',
    data3:'zhi3',
    shuzi:30,
    sz:["data4","data5","data6"],
    twzd:{
        startdata:"twzd1",
        seconddata:"twzd2",
    }
};
console.log(zd);
//索引
console.log(zd.data1,zd.twzd,zd.sz[1],zd.twzd.startdata);
//抽取字典中的值
const {data1,shuzi,twzd:{ startdata }}=zd;
console.log(data1,shuzi,startdata);
*/

/*//json
const todos=[
    {
        id:1,
        text:'Take out trash',
        isCompleted:true
    },
    {
        id:2,
        text:'Meeting with boss',
        isCompleted:true
    },
    {
        id:3,
        text:'three data',
        isCompleted:false
    },
];


console.log(todos);
const toJson=JSON.stringify(todos);
console.log(toJson);*/

/*function kzkd() {
    var bodywidth= document.getElementById("body1").clientWidth;
    var allwidth= document.body.clientWidth;
    console.log(bodywidth);
    console.log(allwidth);
}
kzkd()*/
"use strict";