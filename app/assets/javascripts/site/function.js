// JavaScript Document
$(function(){
	$("#site-nav .menu").movelist();
})

//回车键事件
document.onkeypress=function(e)
{
    var code; 
    if  (!e) 
    { 
        var e=window.event; 
    } 
    if(e.keyCode) 
    {   
        code=e.keyCode; 
    } 
    else if(e.which) 
    { 
        code   =   e.which; 
    }
    if(code==13)
    {
      searchKword();
       return false;
    }
}

function searchSelect(obj, value){
	$(".headerSearch>li").removeClass("current");
	$(obj).addClass("current")
	$("#searchType").val(value);
}

function cartHidden() {
	$("#floatCart").hide();
}

//时间倒数
function countDown(){
	$(".timeCount").each(function(){
		var objId=$(this).attr("id");
		if (objId.indexOf("counter_")>-1){
			objHid = $("#hid_counter_" + objId.substring(objId.indexOf("_")+1)).val();
			var d=Date.parse(objHid.replace(/-/g, "/")); 
			var today=new Date();
			var time=d-today;

			if(Math.floor(time)>0){
				var dd=Math.floor(time/(1000*60*60*24));
				if(dd>=1){
					var hh=Math.floor(time/(1000*60*60))%24;
				}else{
					var hh=Math.floor(time/(1000*60*60))%24+(dd*24);
				}
				var mm=Math.floor(time/(1000*60))%60;
				var ss=Math.floor(time/1000) % 60;
				
				if(dd <=9) dd="0"+dd;
				if(hh <=9) hh="0"+hh;
				if(mm <=9) mm="0"+mm;
				if(ss <=9) ss="0"+ss;
				
				if(dd>=1){
					$("#"+objId).html("<div><em>"+dd+"</em>天<s></s></div><div class=\"n\">:</div><div><em>"+hh+"</em>时<s></s></div><div class=\"n\">:</div><div><em>"+mm+"</em>分<s></s></div>");
				}else{
					$("#"+objId).html("<div><em>"+hh+"</em>时<s></s></div><div class=\"n\">:</div><div><em>"+mm+"</em>分<s></s></div><div class=\"n\">:</div><div><em>"+ss+"</em>秒<s></s></div>");
				}
			}
		}
	})
	setTimeout('countDown()',100);
}

function AllCheckBox(){
	var isCheck=$("#allCheck").is(':checked');
	if(isCheck){
		$('input[type="checkbox"]').attr("checked",true);
	}else{
		$('input[type="checkbox"]').removeAttr("checked");
	}
}

function getHelpInc(obj, cUrl){
	 $.ajax({
		url:cUrl+"?time="+new Date().toString(),
		type:'GET',
		async:false,
		cache:false,
		dataType:'html',
		success:function(data){
			$(obj).html(data);
		}
	});
}

function TBAagreement(){
	$("#J_TBAgreement").toggle();
}

function linkSearch(kword,stype){
    var kw=encodeURI(kword.replace(/^\s+|\s+$/g,""));
    $("#k").val(kw);
    $("#searchType").val(stype);
	$("#topSearchForm").submit();
}


function removeScd(id){
    $.ajax({
		url:contextPath+"/welcome/rmcart.do",
		data:{"id":id},
		type:"post",
		dataType:"json",
		success:function(data){
		   if(data.flag){
		     $("#scdcount").text(data.count);
		     loadTopCart();
		   }
		}
	});
}


function incTabStow(obj){
	$(obj).meuntabs(".tabProductMenu", ".sotwProduct", {
		currentTab : 0,
		switchingMode : 'o'
	});
}

function getCode(obj){
	$(obj).attr("src", contextPath+"/user/authCode.do?time="+new Date().getTime());
}