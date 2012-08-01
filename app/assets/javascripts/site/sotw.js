// JavaScript Document

function shopFav(id, obj){
	var _this=$(obj);
	$.ajax({
		url:contextPath+"/periphery/shop/addShopFav.do",
		data:{"id":id},
		type:"post",
		dataType:"json",
		success:function(jo){
			if(jo.flag == true){
				_this.find("span").text("已收藏");
				_this.attr("class","nosotwButton");
			}
		}	
	});
}

function memberProdFav(id, obj){
	var _this=$(obj);
	$.ajax({
		url:contextPath+"/periphery/product/addProductFav.do",
		data:{"id":id},
		type:"post",
		dataType:"json",
		success:function(jo){
			if(jo.flag == true){
				_this.find("span").text("已收藏");
				_this.attr("class","nosotwButton");
			}
		}	
	});
}

function prodFav(id, obj){
	var _this=$(obj);
	$.ajax({
		url:contextPath+"/periphery/product/addProductFav.do",
		data:{"id":id},
		type:"post",
		dataType:"json",
		success:function(jo){
			if(jo.flag == true){
				_this.find("span").text("已收藏");
				_this.attr("class","noCommentCButton");
			}
		}	
	});
}

function favProd(id, obj){
    var _this=$(obj);
	$.ajax({
		url:contextPath+"/periphery/product/addProductFav.do",
		data:{"id":id},
		type:"post",
		dataType:"json",
		success:function(jo){
			if(jo.flag == true){
				_this.find("span").text("已收藏");
				_this.attr("class","nosotwButton");
			}
		}	
	});
}

function addProdNum(){
       var oldNum=$("#quantity").val();
       var newIvm=parseInt($("#quantity").val())+1;
       $("#quantity").val(newIvm);
  }

  function minusprodNum(){
       if(parseInt( $("#quantity").val())>1){
           var oldNum=$("#quantity").val();
        var newIvm=parseInt($("#quantity").val())-1;
         $("#quantity").val(newIvm);
       }
  }

function  getNowNum(){
	nowNom=$("#quantity").val();
}

function numKeyUp(){
	var str=$("#quantity").val();
	if(str.replace(/^ +| +$/g,'')==''||!/^[0-9]*$/.test(str)||str=='0'){
		$("#quantity").val(1);
	}
}

function addCart(){
	var errorStatus=0;
	$.ajax({
		url:contextPath+"/addcar/checkProdIvm.do",
		data:{"quantity":$("#quantity").val(),"pid": $("#pid").val(),"specification":$("#specificationVal").val()},
		type:"post",
		async:false,
		dataType:"json",
		success:function(data){
			errorStatus=data.r;
		}
	});
	return errorStatus;
}

function cartCheck(){
	if(addCart()==0){
		$.ajax({
			url:contextPath+"/cart/addProdCart.do",
			data:{"quantity":$("#quantity").val(),"pid": $("#pid").val(),"specification":$("#specificationVal").val()},
			type:"post",
			async:false,
			dataType:"json",
			success:function(json){
				if(json.flag == true){
					alert(0)
					$("#floatCart").show();
					$("#prodCount").text(json.cartDeatilSize);
					$("#allPrice").text(json.allPrice);
					$("#scdcount").text(json.cartDeatilSize);
					loadTopCart();
				}
			}
		});
	}else{
		$("#errorDiv").show();
		$("#errorText").html("库存或者米币不够!");
	}
}
function cartCheckcookie(){
	if(addCart()==0){
		$.ajax({
			type:"post",
			url:contextPath+"/addcar/addShopCar.do",
			data:{"quantity":$("#quantity").val(),"pid": $("#pid").val(),"specification":$("#specificationVal").val()},
			async:false,
			dataType:"json",
			success:function(json){
				if(json.flag == true){
					$("#floatCart").show();
					$("#prodCount").text(json.count);
					$("#allPrice").text(json.allPrice);
					$("#scdcount").text(json.count);
					loadTopCart();
				}
			}
		});
	}else{
		$("#errorDiv").show();
		$("#errorText").html("库存或者米币不够!");
	}
}
  
function prodButton(){
	if(addCart()==0){
		$("#payForm").attr("action",contextPath+"/cart/prodCart.do");
		$("#payForm").submit();
	}else{
		$("#errorDiv").show();
		$("#errorText").html("库存或者米币不够!");
	}
}