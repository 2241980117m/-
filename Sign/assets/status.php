<?php
     if(!empty($_POST['name'])&&!empty($_POST['id'])){
     	$name = $_POST['name'];
        $id = $_POST['id'];
     }
      //对name,id进行数据过滤
     $name = htmlspecialchars($name);
     $id = htmlspecialchars($id);

   	 if(!get_magic_quotes_gpc()){
      	 $name    =    addslashes($name);
      	 $id    =    addslashes($id);
   	 }
  
   	 if(preg_match('/[^\x80-\xff]/',$name)){
           echo '输入的用户名不正确';
           exit;
   	 }
   	
   	 if(!preg_match('/^(\d){8}$/',$id)){
          echo '输入的学号不正确';
          exit;
   	 }

      $db    =    new mysqli('localhost','root','100100mxh','student_sign');
      if(mysqli_connect_errno()){
         echo "连接数据库失败,请稍后再试!";
         exit;
      }
      $db->set_charset("utf8");

      $query1   =    "SELECT * FROM sign";

      $results    =    $db->query($query1);

      for($i=0;$i<$results->num_rows;$i++){
        $row = $results->fetch_assoc();
          if($row['student_name']==$name&&$row['student_id']==$id){
           
            echo 1;
            return;
          }else if($row['student_name']==$name&&$row['student_id']!=$id ||$row['student_name']!=$name&&$row['student_id']==$id){
           
            echo 0;
            return;
          }
      }
      if($i==$results->num_rows){
           
           echo 0;
           return;
      }
?>