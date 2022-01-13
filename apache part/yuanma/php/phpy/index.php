<html>
<body>
        <?php
        header("Content-type:text/html;charset=utf-8");
            function getDirContent($path){
                if(!is_dir($path)){
                    return false;
                }
                //readdir方法
                $dir = opendir($path);
                #echo $dir;
                $arr = array();
                while($content = readdir($dir)){
                    if($content != '.' && $content != '..'&&stripos($content,".")!=false){
                        //$arr[] = $content;
                        $url="http://qc-h.xyz/yuanma/php/$content";
                        #echo $url;
                        echo "<li><a href='$url'>$content</a></li>";
                    }
                }
                closedir($dir); 
            
                //scandir方法
                /*$arr = array();
                $data = scandir($path);
                foreach ($data as $value){
                    if($value != '.' && $value != '..'){
                        $arr[] = $value;
                    }
                }*/

                return $arr;
                
            }
           getdirContent("H:\\xampp\\htdocs\\yuanma\\php");
           /*for($i=0;$i<count($zhi);$i++){
               print_r($zhi[$i]);

           }*/
          
        ?>
</body>
</html>