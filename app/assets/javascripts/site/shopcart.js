function loadTopCart(){
   $.ajax({
		url:contextPath+"/addcar/loadCookie.do?time="+new Date().getTime(),
		type:"post",
		success:function(data){
			$("#topCart").html(data);
			var count = $("#count").val();
			$("#allCount").html(count);
		}
	});
}
function removeCookie(id){
	$.ajax({
		url:contextPath+"/addcar/delectCookie.do?time="+new Date().getTime(),
		data:{"specification":id},
		type:"post",
		success:function(data){
			loadTopCart();
		}
	});
}

function removeCart(id){
	$.ajax({
		url:contextPath+"/addcar/delectCookie.do?time="+new Date().getTime(),
		data:{"specification":id},
		type:"post",
		success:function(data){
			window.location.reload();
		}
	});
}

function synchronizeCart(){
	var flag = false;
	$.ajax({
		url:contextPath+"/addcar/synchronizeCart.do",
		type:"post",
		dataType:"json",
		success:function(json){
			alert("111111111"+json.flag);
			flag=json.flag;
			loadTopCart();
		}	
	});
	return flag;
}
function addCartDetail(id,obj){
		$.ajax({
			type:"post",
			url:contextPath+"/addcar/addShopCar.do",
			data:{"quantity":1,"pid": id},
			async:false,
			dataType:"json",
			success:function(json){
				if(json.flag == true){
					$("#floatCart").css({left:$(obj).position().left-250,top:$(obj).position().top});
					$("#floatCart").show();
					$("#prodCount").text(json.count);
					$("#allPrice").text(json.allPrice);
					$("#scdcount").text(json.count);
					loadTopCart();
				}
			}
		});
}