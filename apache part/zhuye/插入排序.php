<?php
$arr=array(4,5,8,6,1,5,7,9,2);
for($n=0,$len=count($arr);$n<$len;$n++)
{
    $xz=$arr[$n];
    for($i=$n-1;$i>=0;$i--)
    {
    if($arr[$i]>$xz){
        $arr[$i+1]=$arr[$i];
        $arr[$i]=$xz;
        

    }else{
    break;
    }
}

}
echo '<pre>';
print_r($arr);
?>