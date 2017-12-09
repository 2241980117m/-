window.onload=function(){
	var osub=document.getElementsByTagName("button")[0];
	//利用cookie传递name
    var start = document.cookie.indexOf("Name");
	var end = document.cookie.indexOf(";",start);
	var nameStr=decodeURIComponent(document.cookie.substring(start+5));
	console.log(nameStr);


	var ocontent=document.getElementsByClassName("content")[0];

   // var nameStr = getArgs();
	//获取之前的留言内容
	$.ajax({
        url:'./assets/readSay.php',
        type:'POST',
        dataType:'json',
        success:function(data){
        	console.log(data);
        /*	var data=JSON.parse(data1);*/
        	var obj_length=data.length;
        	console.log(obj_length);
         for(var i=obj_length-1;i>=0;i--){			
               inner_model(data[i].student_name,data[i].context,data[i].date);
        	}
        	
        },
        error:function(data){
        	alert(data);
        }
	});
	osub.onclick=function(){

		var txt=document.getElementById("text").value;

		if(txt == ""){
			alert('请先输入留言内容');
			return;
		}else if(!/^[\w_\s|(\u4E00-\u9FA5)]+$/.test(txt)){
			alert('仅允许输入字母、数字、空格、汉字、下划线');
			return;
		}
		//获取留言日期
		else{
			$.ajax({   
			url:'assets/start.php',
			type:'GET',
			cache:false,
			dataTye:'text',
			success:function(data){
				var date=data;
				console.log(date);
				//将成员姓名、留言内容、日期传递到后台
					$.ajax({
		   				url:'assets/say.php',
		   				type:'POST',
		   				data:{
		   					name:nameStr,
		   	  				context:txt,
			  				date:date
		  			 	},
		   			dataType:'text',
		   			success:function(data){
		   				 
		   				 if(data == '仅允许输入字母、数字、空格、汉字、下划线'){
		   				 		alert(data);
		   				 }else{
		   				 	before_inner_model(nameStr,txt,date);
		   				 	alert(data);
		   				 }
		   				 document.getElementById("text").value="";
		   			},
		   			error:function(jqyxhr,status,txt){
		   				 alert(status+txt);
		   			}
				});
			},
			error:function(){
				alert('留言失败，请稍后再试');
			}
		})
	 }

	};

	//返回当前url的查询部分
	function getArgs(){
		var query = location.search.substring(1);
		var pos = query.indexOf('=');
        var name = query.substring(pos+1);
        return decodeURI(name);
	}
 
	function create_model(oclass,oid){
      /* var icon="<div class='col-xs-3 col-sm-2' id='name'>"+name+"</div>";
       icon+="<div class='col-xs-7 col-sm-6' id='context'>"+context+"</div>";
       icon+="<div class='col-xs-6 col-sm-4' id='date'>"+date+"</div>";*/
       var odiv = document.createElement("div");
       odiv.className=oclass;
       odiv.id=oid;
       return odiv;
	}
	function inner_model(name,context,date){
		   var orow = document.createElement("div");
		   orow.className="row"; 
           var oname = create_model('col-xs-3 col-sm-2','name');
           oname.innerHTML = name;
           var ocontext = create_model('col-xs-4 col-sm-6','context');
           ocontext.innerHTML=context;
           var odate = create_model('col-xs-5 col-sm-4','date');
           odate.innerHTML=deal_date(date);
           orow.appendChild(oname);
           orow.appendChild(ocontext);
           orow.appendChild(odate);
           ocontent.appendChild(orow);
	}
	function before_inner_model(name,context,date){
		   var orow = document.createElement("div");
		   orow.className="row"; 
           var oname = create_model('col-xs-3 col-sm-2','name');
           oname.innerHTML = name;
           var ocontext = create_model('col-xs-4 col-sm-6','context');
           ocontext.innerHTML=context;
           var odate = create_model('col-xs-5 col-sm-4','date');
           odate.innerHTML=deal_date(date);
           orow.appendChild(oname);
           orow.appendChild(ocontext);
           orow.appendChild(odate);
           ocontent.insertBefore(orow,ocontent.getElementsByTagName("div")[0]);
	}
	function deal_date(str){
        var str_array = str.split('-');
        var string = str_array[1]+"-"+str_array[2];
        return string;
	}
}