/*window.onresize=function(){	

    change();

}*/
/*window.onbeforeunload = function(){
    if(enter[2].value!="下线"){
       alert(111);
    // window.event.returnValue="您还没有完成签到!确定要退出本页吗？"; 
    }else{
      alert(enter[2].value);
      return;
    }
  }*/
   window.onbeforeunload = function(){  
    
      return '真的要关闭此页面吗?';
    }  
window.onload=function(){

	var enter=document.getElementsByTagName('input');
  var btn=document.getElementsByTagName("button");
    var start;
    var data;
    var tag=0;
    var oend;

   /* enter[0].onblur=function(){
       window.name=enter[0].value;
    }*/
   
  btn[1].onclick=function(){
      var c=judge(enter);    
      if(!c){
        alert("请先输入姓名和学号");
        exit;
      }
   document.cookie=encodeURIComponent("Name")+"="+encodeURIComponent(enter[0].value)+";";
      $.ajax({
         url:'./assets/status.php',
         type:'POST',
         data:{
            name:enter[0].value,
            id:enter[1].value
         },
         success:function(data){
            if(data == '1'){
         
              
             //  window.location.href="say.html";
               //   window.open("say.html?name="+enter[0].value);
               window.open("say.html");
             }else{
                alert("输入的姓名或者学号出错");
                return;
             }
         },
         error:function(){
            alert("连接数据库失败");
         }
      });
  }
  enter[2].onclick=function(){
		if(enter[2].value=="签到")
		{
			var c=judge(enter);
            if(c==true) {
                      $.ajax({
                            url:'./assets/status.php',
                            type:'POST',
                            data:{
                                name:enter[0].value,
                                id:enter[1].value
                            },
                            success:function(data){
                                if(data == '0'){
                                     alert("输入的姓名或者学号出错");
                                    return;
                                }else{
                                   enter[2].value == "签到" ? enter[2].value = "下线" : enter[2].value = "签到";
                                   enter[1].disabled = true;
                                   enter[0].disabled = true;                 
                                }
                              },
                            error:function(){
                                alert("连接数据库失败");
                            }
                          });
             //   enter[2].value == "签到" ? enter[2].value = "下线" : enter[2].value = "签到";
               // enter[0].value = "";
              //  enter[1].value = "";
             //   enter[1].disabled = true;
             //   enter[0].disabled = true;
                $.ajax({
                    url: "assets/start.php",
                    type: 'GET',
                    async: true,
                    cache:false,
                    dataType: 'text',
                    success: function (date) {
                        start = date;    
                        document.cookie=encodeURIComponent("Start")+"="+encodeURIComponent(start)+";";        
                    },
                    error: function () {
                        alert("失败！");

                    }
                });

            }

		}
	/*	else {

			c=true;
			document.location.reload()

		}*/


               /*  enter[0].placeholder = "已经签到";
                 enter[1].placeholder = "已经签到";*/

          else if(enter[2].value=='下线'){

            if(!tag) {
                $.ajax({
                    url: "assets/start.php",
                    type: 'GET',
                    cache: false,
                    async: true,
                    dataType: 'text',
                    success: function (date) {
                      oend = date;
                      document.cookie=encodeURIComponent("End")+"="+encodeURIComponent(oend)+";";
                     data={
                         username:enter[0].value,
                         id:enter[1].value,
                         start:start,
                		     end:oend
                      };
                    $.ajax({
                          type: 'POST',
                          url: "assets/sign.php",
                          async: true,
                          cache: false,
                          traditional: true,
                    
                          data: data,
                          success: function (data) {
                              alert(data);
                              enter[2].disabled=true;

                          },
                          error: function () {
                              alert("签到失败!");


                           }

                });
                    },
                    error: function () {
                        alert("签到失败！");
                    }

                });

            }
         }



	}
	enter[0].onmousedown=function(){
		enter[0].style.border="1px solid #5bc0de";
		enter[0].placeholder="姓名";


	}
	enter[1].onmousedown=function(){
		enter[1].style.border="1px solid #5bc0de";
		enter[1].placeholder="学号";
	}
	/*change();*/


}
/*function change(){
	var pass=document.getElementById("username");
	var enter=document.getElementById('enter');
  var say=document.getElementById('say');
	enter.style.width=pass.clientWidth/2+"px";
  say.style.width=pass.clientWidth/2+"px";
//	window.body.background.opaticy=0.5;
}*/
function judge(enter){

 if(enter[0].value=="" || enter[1].value==" ")
	{

		enter[0].value="";
		enter[0].placeholder="输入不能为空";
		enter[1].placeholder="输入不能为空";
		enter[0].style.border="1px solid red";
		enter[1].style.border="1px solid red";
		return false;
	}
else if((/[^\u4E00-\u9FA5]/g).test(enter[0].value))
{
		enter[0].value="";

		enter[0].placeholder="输入格式有误";

		enter[0].style.border="1px solid red";

		return false;

	// enter[0].style.color="red";
	// enter[0].value="请注意输入格式";
}
else if((/[^\d]{2,}/g).test(enter[1].value) || enter[1].value.length!=8)
{
	enter[1].value="";

	enter[1].placeholder="输入格式有误";
	enter[1].style.border="1px solid red";

	return false;
}
else return true;
}

