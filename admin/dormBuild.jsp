<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">
	function dormBuildDelete(dormBuildId) {
		layer.confirm('您确定要删除这个宿舍楼吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				window.location="dormBuild?action=delete&dormBuildId="+dormBuildId;
			}, function(){
                    close();
			});
	}
	/* $(document).ready(function(){
	$("ul li:eq(3)").addClass("active");		
	}); */
</script>
<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
			<font  size="5" >宿舍楼管理</font>
		</div>
		<form name="myForm" class="form-search" method="post" action="dormBuild?action=search">
				
				<span class="data_search">
					名称:&nbsp;&nbsp;<input id="s_dormBuildName" name="s_dormBuildName" type="text"  style="width:120px;height: 30px;" class="input-medium search-query" value="${s_dormBuildName }">
					&nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">搜索</button>
					&nbsp;<button class="btn btn-success" type="button" style="margin-right: 10px;" onclick="javascript:window.location='dormBuild?action=preSave'">添加</button>
				</span>
		</form>
		<div>
			<table class="table table-hover table-striped table-bordered datatable">
				<thead>
					<tr>
						<th width="15%">编号</th>
						<th>名称</th>
						<th>简介</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach  varStatus="i" var="dormBuild" items="${dormBuildList }">
					<tr>
						<td>${i.count+(page-1)*pageSize }</td>
						<td>${dormBuild.dormBuildName }</td>
						<td>${dormBuild.detail==null||dormBuild.detail==""?"无":dormBuild.detail }</td>
						<td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='dormBuild?action=manager&dormBuildId=${dormBuild.dormBuildId }'">管理员</button>&nbsp;
							<button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='dormBuild?action=preSave&dormBuildId=${dormBuild.dormBuildId }'">修改</button>&nbsp;
							<button class="btn btn-mini btn-danger" type="button" onclick="dormBuildDelete(${dormBuild.dormBuildId})">删除</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center"><font color="red">${error }</font></div>
		<div class="pagination pagination-centered">
			<ul>
				${pageCode }
			</ul> 
		</div>  
		<div style="padding-right: 50px;float: right;">
				<font color="white" size="3" >${pageCode1 }</font>
		</div>
</div>