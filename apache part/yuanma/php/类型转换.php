<?php
 
   //创建数据
  $a='abc1.1.1';
  $b='1.1.1abc';
  $c='100.1111';
   //自动转换
   echo $a + $b;//算术+运算，系统先转换成数值类型（整型与浮点型），然后计算
   //强制转换
 
   echo '<br/>',(float)$a,(float)$b,"<br/>",(int)$c;
   ?>