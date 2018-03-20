<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>

<script type="text/javascript">
	function dormManagerMove(dormManagerId, dormBuildId) {
		layer.confirm('您确定要删除这个宿管吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				window.location="dormBuild?action=move&dormBuildId="+dormBuildId+"&dormManagerId="+dormManagerId;
			}, function(){
      close();
			});
	}
	
	$(document).ready(function(){
		$("ul li:eq(3)").addClass("active");
	}); 
</script>

<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
			<font  size="4" >宿舍管理员设置</font>
		</div>
		<form class="select_form" name="myForm" method="post" action="dormBuild?action=addManager">
				
				<span class="data_select">
					<input type="hidden" id="dormBuildId" name="dormBuildId" value="${dormBuildId }"/>
					<select id="dormManagerId" name="dormManagerId" style="width: 150px;">
					<option value="">请选择管理员...</option>
					<c:forEach var="managerToSelect" items="${managerListToSelect }">
						<option value="${managerToSelect.dormManagerId }">${managerToSelect.name }</option>
					</c:forEach>
					</select>
					<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()" style="margin-bottom: 10px">添加</button>
					<button class="btn btn-success" type="button"  onclick="javascript:history.back()" style="margin-bottom: 10px">返回</button>
				</span>
		</form>
		<div>
			<table class="table table-hover table-striped table-bordered">
				<tr>
					<th>姓名</th>
					<th>性别</th>
					<th>电话</th>
					<th>用户名</th>
					<th>操作</th>
				</tr>
				<c:forEach  varStatus="i" var="managerWithId" items="${managerListWithId }">
					<tr>
						<td>${managerWithId.name }</td>
						<td>${managerWithId.sex }</td>
						<td>${managerWithId.tel }</td>
						<td>${managerWithId.userName }</td>
						<td><button class="btn btn-mini btn-danger" type="button" onclick="dormManagerMove(${managerWithId.dormManagerId},${managerWithId.dormBuildId})">移除</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div align="center"><font color="red">${error }</font></div>
		<div class="pagination pagination-centered">
			<ul>
				${pageCode }
			</ul>
		</div>
</div>