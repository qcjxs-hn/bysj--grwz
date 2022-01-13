<?php

   define('NAME','zhi');
   const PI=3;
   echo NAME,'</br>',PI;

   //系统常量
   echo '<hr/>',PHP_VERSION,'<br/>',PHP_INT_SIZE,'</br>',PHP_INT_MAX;

   //魔术常量

   echo '<hr/>';
   echo __DIR__,'<br/>',__FILE__,'<br/>',__LINE__,'<br/>';
   echo __LINE__;
   echo '<hr/>';
   echo '<hr/>';
   echo '源码：';
   echo '<hr/>';
   print("define('NAME','zhi');const PI=3;echo NAME,</br>,PI;");
   echo '<hr/>';
   echo '<hr/>';
   print("//系统常量");
   print("'<br/>',PHP_VERSION,'<br/>',PHP_INT_SIZE,'</br>',PHP_INT_MAX;");
   echo '<hr/>';
   echo '<hr/>';
   print("//魔术常量");
   print(" __DIR__,'<br/>',__FILE__,'<br/>',__LINE__,'<br/>';__LINE__;");
   echo '<hr/>';
   echo '<hr/>';
?>