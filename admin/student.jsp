<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("ul li:eq(2)").addClass("active");
});

	function studentDelete(studentId) {
		layer.confirm('您确定要删除这个学生吗？', {
			  btn: ['确定','取消'] //按钮
			}, function(){
				window.location="student?action=delete&studentId="+studentId;
			}, function(){
      close();
		});
	}
</script>
<style type="text/css">
	.span6 {
		width:0px;
		height: 0px;
		padding-top: 0px;
		padding-bottom: 0px;
		margin-top: 0px;
		margin-bottom: 0px;
	}

</style>
<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
			<font  size="5" >学生管理</font>
		</div>
		<form name="myForm" class="form-search" method="post" action="student?action=search" style="padding-bottom: 0px">
				
				<span class="data_search">
					<select id="buildToSelect" name="buildToSelect" style="width: 110px;">
					<option value="">全部宿舍楼</option>
					<c:forEach var="dormBuild" items="${dormBuildList }">
						<option value="${dormBuild.dormBuildId }" ${buildToSelect==dormBuild.dormBuildId?'selected':'' }>${dormBuild.dormBuildName }</option>
					</c:forEach>
					</select>
					<select id="searchType" name="searchType" style="width: 80px;">
					<option value="name">姓名</option>
					<option value="number" ${searchType eq "number"?'selected':'' }>学号</option>
					<option value="dorm" ${searchType eq "dorm"?'selected':'' }>寝室</option>
					</select>
					&nbsp;<input id="s_studentText" name="s_studentText" type="text"  style="width:120px;height: 30px;" class="input-medium search-query" value="${s_studentText }">
					&nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">搜索</button>
					&nbsp;<button class="btn btn-success" type="button" style="margin-right: 10px;" onclick="javascript:window.location='student?action=preSave'">添加</button>
				</span>
		</form>
		<div>
			<table class="table table-striped table-bordered table-hover datatable">
				<thead>
					<tr>
					<!-- <th>编号</th> -->
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>宿舍楼</th>
					<th>寝室</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach  varStatus="i" var="student" items="${studentList }">
					<tr>
						<%-- <td>${i.count+(page-1)*pageSize }</td> --%>
						<td>${student.userName }</td>
						<td>${student.name }</td>
						<td>${student.sex }</td>
						<td>${student.dormBuildName==null?"无":student.dormBuildName }</td>
						<td>${student.dormName }</td>
						<td>${student.tel }</td>
						<td><button class="btn btn-mini btn-info" type="button" onclick="javascript:window.location='student?action=preSave&studentId=${student.studentId }'">修改</button>&nbsp;
							<button class="btn btn-mini btn-danger" type="button" onclick="studentDelete(${student.studentId })">删除</button></td>
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
</div>