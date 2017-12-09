<?php

if(!empty($_REQUEST['username'])&&!empty($_REQUEST['id'])){
      $name = $_REQUEST['username'];
      $id = $_REQUEST['id'];
}

$start = $_REQUEST['start'];
$end = $_REQUEST['end'];

$last =  strtotime($end) - strtotime($start)-3600;


      //对name,id进行数据过滤
     $name = htmlspecialchars($name);
     $id = htmlspecialchars($id);

     if(!get_magic_quotes_gpc()){
         $name    =    addslashes($name);
         $id    =    addslashes($id);
     }
  
     if(preg_match('/[^\x80-\xff]/',$name)){
           echo '输入的姓名不正确';
           exit;
     }
    
     if(!preg_match('/^(\d){8}$/',$id)){
          echo '输入的学号不正确';
          exit;
     }


    //对name,id进行数据过滤
   
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
              $time=$row['time']+1;
              $db_last=$row['last'];
              break;
          }/*else if($row['student_name']==$name&&$row['student_id']!=$id ||$row['student_name']!=$name&&$row['student_id']==$id){
            echo '姓名或者学号输入错误';
            return;
          }*/
      }
/*      if($i==$results->num_rows){
           echo "姓名和学号都输入错误";
           return;
      }*/

      //连接到sign_item数据库中

      $db_1 = new mysqli('localhost','root','100100mxh','student_sign');

      if(mysqli_connect_errno()){
         echo "连接数据库失败,请稍后再试!\n";
         echo "<br />";
         exit;
      }

      $query_1 = "INSERT INTO sign_item(end,start,id,name) VALUES ('".$end."','".$start."','".NULL."','".$name."');";
     // $query_1    =    "INSERT INTO sign_item VALUES ('".$end."','".$start."',NULL,'".$name."')";  
     
      $db_1->set_charset("utf8");

      $results_1 = $db_1->query($query_1);

      if(!$results_1){
          echo "数据插入数据库失败!\n";
      
      }
      //将数据库获得的持续时间的时分秒分离出来
      $lastTimeArray    =    explode(':',$db_last);

     // echo $lastTimeArray[0].' '.$lastTimeArray[1].' '.$lastTimeArray[2];
      
    //  $lastTime=$lastTimeArray[0]*3600+$lastTimeArray[1]*60+$lastTimeArray[2];
      
      $lastTime = gmdate("H:i:s",$last);

      $lastAry = explode(':',$lastTime);

      $hour= $lastTimeArray[0]+$lastAry[0];
      $min=$lastTimeArray[1]+$lastAry[1];
      $sec=$lastTimeArray[2]+$lastAry[2];

   
      if($sec>=60){
          $sec=$sec%60;
          $min+=1;
      }

      if($min>=60){
        
         $min = $min%60;
         $hour+=1;
      }

      $lastStr =$hour.':'.$min.':'.$sec;

     
     
    //  $last = gmdate("H:i:s",$last);

   
   
    
   
     $query = "UPDATE sign SET last = '".$lastStr."' ,time ='". $time."'  WHERE student_name = '".$name."'";
    
      $results    =    $db->query($query);
      
      if($results){
         echo '签到成功!';
      }else{
          echo '签到失败!';
      }
      $db->close();

?>