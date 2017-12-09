<?php
  /* $DOCUMENT_ROOT    =    $_SERVER['DOCUMENT_ROOT'];
   $name    =    $_POST['name'];
   $context    =    $_POST['context'];
   $date    =    $_POST['date'];
   //数据过滤
   $content = $name . "\t" . $context . "\t" . $date . ";\n";
  @ $fp    =    fopen("$DOCUMENT_ROOT/say.txt",'ab');

   flock($fp,LOCK_EX);
  
  if(!$fp){
  	echo '留言失败';
  	exit;
  }
  
  fwrite($fp,$content);
 
  flock($fp,LOCK_UN);

  fclose($fp);  

  echo '留言成功';*/
  if(!empty($_POST['name'])&&!empty($_POST['context'])&&!empty($_POST['date'])){

  $name    =    $_POST['name'];
 
  $context    =    $_POST['context'];
  
  $date    =    $_POST['date'];
}

if(empty($context)){
     echo '请输入留言内容';

     exit;
}
  //进行数据过滤

   if(!get_magic_quotes_gpc()){
      $context    =    addslashes($context);
      $date    =    addslashes($date);
   }

   $context = htmlspecialchars($context);

   //输入的值必须是中文，英文字符   
   if(!preg_match('/^[(\w)|_|(\s)|(\x4e00-\x9fa5)]+$/u',$context)){
   		echo '仅允许输入字母、数字、空格、汉字、下划线';
   		exit;
   }
   
  $db = new mysqli('localhost','root','100100mxh','student_sign');

  if(mysqli_connect_errno()){
  	 echo '连接数据库错误，请稍后再试';
  	 exit;
  }
  $db->set_charset('utf8');


  $query    =    "INSERT INTO say VALUES ('".$context."','".$date."',NULL,'".$name."')";  

  $results    =    $db->query($query);


  if($results){
  	echo '留言成功';
  }else{
  	echo '留言失败,请稍后再试';
  }
   $db->close();
?>