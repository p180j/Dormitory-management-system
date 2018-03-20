<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">
	function checkForm(){
		var dormBuildName=document.getElementById("dormBuildName").value;
		if(dormBuildName==null||dormBuildName==""){
			layer.tips('名称不能为空，请填写', "#dormBuildName", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
		}
		return true;
	}
	
	$(document).ready(function(){
		$("ul li:eq(3)").addClass("active");
	});
</script>
<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
		<c:choose>
			<c:when test="${dormBuild.dormBuildId!=null }">
				<font  size="4" >修改宿舍楼</font>
			</c:when>
			<c:otherwise>
				<font  size="4" >添加宿舍楼</font>
			</c:otherwise>
		</c:choose>
		</div>
		<form action="dormBuild?action=save" method="post" onsubmit="return checkForm()">
			<div class="data_form" >
				<input type="hidden" id="dormBuildId" name="dormBuildId" value="${dormBuild.dormBuildId }"/>
					<table align="center">
						<tr>
							<td>名称：<input type="text" id="dormBuildName"  name="dormBuildName" value="${dormBuild.dormBuildName }"  style="margin-top:5px;height:30px;" /></td>
							<td>&nbsp;&nbsp;<font color="red">*</font></td>
						</tr>
						<tr>
							<td>简介：<textarea id="detail" name="detail" rows="10">${dormBuild.detail }</textarea></td>
						</tr>
					</table>
					<div align="center">
						<input type="submit" class="btn  btn-large btn-primary btn-primary" value="保存"/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn  btn-large btn-primary btn-primary" type="button" onclick="javascript:history.back()">返回</button>
					</div>
					<div align="center">
						<font id="error" color="red">${error }</font>
					</div>
			</div>
		</form>
</div>