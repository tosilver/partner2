//侧边栏点击效果
var nav_click = document.getElementsByClassName("nav_click");
var nav_span = document.getElementsByClassName("nav_span");
var primary = document.getElementsByClassName("primary");
console.log(nav_span)
for(var i = 0;i<nav_click.length;i++){
	nav_click[i].index = i;
	nav_click[i].onclick = function(){
		for(var k = 0;k<nav_click.length;k++){
			primary[k].style = "display:none;";
			nav_span[k].style = "color:#b8c7ce";
			nav_click[k].style = "border-left: 3px solid transparent";
			nav_span[this.index].style = "color:#Fff";
			nav_click[this.index].style = "border-left: 3px solid #3c8dbc";
			primary[this.index].style = "display:block;"
		}	
	}
}

//点击注销
$(function(){
	$(".header_right").hover(function(){
		$(".header_b").css({"display":"block","transition":"1s"});
	},function(){
		$(".header_b").css("display","none");
	})
})

//点击分类隐藏
//var header_center = document.getElementsByClassName("header_center")[0];
//var header_left = document.getElementsByClassName("header_left")[0];
//var header_li = document.getElementsByClassName("header_li")[0];
//var sidebars = document.getElementsByClassName("sidebar")[0]; 
//var nav_li = document.getElementsByClassName("nav_li");
//var nav_span01 = document.getElementsByClassName("nav_span01");
//var click = document.getElementsByClassName("click")[0];
//var nav_p = document.getElementsByClassName("nav_p");
//var b = 1;
//header_center.onclick = function(){
//	if(b == 1){
//	   header_left.style = "width:5%;transition: .3s;font-size:0.3rem;";
//	   sidebars.style = "width:5%;transition: .3s;";
//	   for(var i = 0;i<nav_li.length;i++){
//	   		nav_li[i].style = "border-left: 3px solid transparent;padding:45px 10px 0px 20px;";
//	   }
//	   for (var i = 0;i<nav_span01.length;i++){
//	   	 	nav_span01[i].style = "display:none;";
//	   }
//		for(var i = 0;i<primary.length;i++){
// 			primary[i].style = "width:95%;transition: .3s;display:none;";
// 			for(var k = 0;k<1;k++){
// 				primary[k].style = "display:block;width:95%;transition: .3s;"
//	   		}
//	   	}
//	   b=2
//	}else if(b == 2){
//		header_left.style = "width:15%;transition: .3s;";
//		sidebars.style = "width:15%;transition: .3s;";
//		for(var i = 0;i<nav_li.length;i++){
//	   		nav_li[i].style = "border-left: 3px solid transparent;";
//	   }
//	   for (var i = 0;i<nav_span01.length;i++){
//	   	 	nav_span01[i].style = "display:inline-block;"
//	   }
//	   click.style = "border-left: 3px solid #3c8dbc;"
//	   for(var i = 0;i<primary.length;i++){
//	   		primary[i].style = "width:85%;transition: .3s;display:none;"
//	   		for(var k = 0;k<1;k++){
// 				primary[k].style = "display:block;width:85%;transition: .3s;"
//	   		}
//	   }
//	   b=1
//	}
//}


var nav_p = document.getElementsByClassName("nav_p");
var but = document.getElementsByClassName("but");
var ul = document.getElementById("pageLimit");
var li = ul.children
console.log(li,ul)
for(var i = 0;i<nav_p.length;i++){
	nav_p[i].index = i
	if(i>4){
		nav_p[i].style.display = "none";
	}
	for(var n = 0;n<but.length;n++){
		but[n].index = n-1;
		if(n==1){
			but[n].onclick = function(){
			for(var k = 0;k<nav_p.length;k++){
				if(k<=4){
					nav_p[k].style.display = "none";
				}
				if(k>4 && k<=9){
					nav_p[k].style.display = "block";
				}
			}
			but[this.index].className = "";
			but[this.index].className = "active";
		}
		}
		if(n==0){
			but[n].onclick = function(){
			for(var k = 0;k<nav_p.length;k++){
				if(k<=4){
					nav_p[k].style.display = "block";
				}
				if(k>4){
					nav_p[k].style.display = "none";
				}
			}
			but[this.index].className = "";
			but[this.index].className = "active";
		}
		}
			
	}
}

//分页器
 $(function(){
$('#pageLimit').bootstrapPaginator({
      currentPage: 1,
      totalPages: 10,
      size:"normal",
      bootstrapMajorVersion: 3,
      alignment:"right",
      numberOfPages:5,//分页的内容
      itemTexts: function (type, page, current) {
          switch (type) {
         case "first": return "首页";
         case "prev": return "上一页";
         case "next": return "下一页";
         case "last": return "末页";
         case "page": return page;
         }//默认显示的是第一页。
     },
//       onPageClicked: function (event, originalEvent, type, page){//给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
//          $.ajax({
//               url:'/task_list_page/',
//               type:'POST',
//               data:{'page':page,'count':12},
//              dataType:'JSON',
//               success:function (callback) {
//                       $('tbody').empty();
//                       var page_count=callback.page_count;
//                       var page_cont=callback.page_content;
//                       $('tbody').append(page_cont);
//                       $('#last_page').text(page_count)
//                   }
//           })
//       }	
 });
})
