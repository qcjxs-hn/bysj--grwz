<?php
  //浮点数
  $f1=1.23;
  $f2=1.23e10;
  $f3=PHP_INT_MAX+1;
  //整型
  $f4=123;


  var_dump($f1,$f2,$f3,$f4);    
  //判断数据类型
  echo '<hr/>';
  var_dump(is_int($f4));
  var_dump(is_string($f2));
  echo '<br/>';
  //四种整型数据
  $a1=110;
  $a2=0b110;//二进制
  $a3=0110;//八进制
  $a4=0x110;//十六进制
  echo $a1,'~',$a2,'~',$a3,'~',$a4,'<hr/>';


?>