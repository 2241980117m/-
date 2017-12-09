<?php
        $db = new mysqli('localhost','root','100100mxh','student_sign');

  		if(mysqli_connect_errno()){
  	 		echo '连接数据库错误，请稍后再试';
  	 		exit;
  		}

        $context    =    array();

  		$db->set_charset('utf8');

  		$query    =    "SELECT * FROM say";

        $results    =    $db->query($query);

        $results_num    =    $results->num_rows;

        for($i=0;$i<$results_num;$i++){
        	$row    =    $results->fetch_assoc();
            $context[$i]    =    $row;
        }

        echo json_encode($context);

?>