<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="${ctx}/js/jquery-1.4.4.min.js"></script>
<script src="${ctx}/js/jquery.pager.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/css/pager.css" />
<title>漕河泾e服务</title>
<script type="text/javascript">

function showPage(page) {
// 分页
//var pageCount = newCounts%4==0?newCounts/4:Math.ceil(newCounts/4); //总页码(共几页)
var pageCount = 290;
var showCount=10;
pageNo = page;
var prevPage = pageNo - 1;
var nextPage = pageNo + 1;
var strHtml = '';
strHtml += '<ul>';
if (prevPage < 1) {
	strHtml +='<li title="上页"><a href="javascript:void(0)" ><</a></li>';
} else {
	strHtml += '<li title="上页"><a href="javascript:void(0)" onclick="gotoPage('+prevPage+')"><</a></li>';
}
if(pageCount==0) {
	strHtml += '<li title="Page0"></li>';
}else if(pageCount>0&&pageCount<=showCount) {
	for (var i = 1; i <= pageCount; i++) {
		if (i == pageNo) {
			strHtml += '<li title="Page ' + i + '">' + i + '</li>';
		} else {
			strHtml += '<li title="Page ' + i + '"><a href="#" onclick="gotoPage('+i+')">'+i+'</a>';
		}
	}
}else{
	if(pageNo<=showCount-1) {
		for (var i = 1; i <= showCount; i++) {
			if (i == pageNo) {
				strHtml += '<li title="Page ' + i + '">' + i + '</li>';
			} else {
				strHtml += '<li title="Page ' + i + '"><a href="#" onclick="gotoPage('+i+')">'+i+'</a>';
			}
		}
		strHtml += '&nbsp;...&nbsp;<a href="#" onclick="gotoPage('+pageCount+')">'+pageCount+'</a></li>'
	}else if(pageNo>(showCount-1)&&pageNo<pageCount-(showCount-showCount/2)) {
		strHtml += '<li title="Page1"><a href="#" onclick="gotoPage(1)">1</a>&nbsp;...</li>'
		for (var i = pageNo-showCount/2; i <= pageNo+showCount/2; i++) {
			if (i == pageNo) {
				strHtml += '<li title="Page ' + i + '">' + i + '</li>';
			} else {
				strHtml += '<li title="Page ' + i + '"><a href="#" onclick="gotoPage('+i+')">'+i+'</a>';
			}
		}
		strHtml += '&nbsp;...&nbsp;<a href="#" onclick="gotoPage('+pageCount+')">'+pageCount+'</a></li>'
	}else {
		strHtml += '<li title="Page1"><a href="#" onclick="gotoPage(1)">1</a>&nbsp;...</li>'
		for (var i = pageCount-(showCount-1); i <= pageCount; i++) {
			if (i == pageNo) {
				strHtml += '<li title="Page ' + i + '">' + i + '</li>';
			} else {
				strHtml += '<li title="Page ' + i + '"><a href="#" onclick="gotoPage('+i+')">'+i+'</a>';
			}
		}
	}
}
if (nextPage > pageCount) {
	strHtml += '<li title="下页"><a href="javascript:void(0)" >></a></li>';
} else {
	strHtml += '<li title="下页"><a href="#" onclick="gotoPage('+nextPage+')">></a></li>';
}
strHtml += '<li>&nbsp;&nbsp;&nbsp;&nbsp;共'+pageCount+'页</li>'
strHtml += '</ul>';
$("#pager").append(strHtml);

}

function gotoPage(pageNo) {
	$("#pager").html("");
	showPage(pageNo);
} 

$(document).ready(function(){
	//showPage(1);	
	$("#pager").pager({ pagenumber: 1, pagecount: 30, buttonClickCallback: PageClick });
	
});
PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: 30, buttonClickCallback: PageClick });
    findActivityList(pageclickednumber);
}
</script>

</head>
<body>
	<div id="pager">
	</div>
</body>
</html>