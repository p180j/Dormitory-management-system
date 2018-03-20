<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">
	function checkForm(){
		var studentNumber = document.getElementById("studentNumber").value;
		var detail = document.getElementById("detail").value;
		if(studentNumber==""){
			layer.tips('请填写学生学号', "#studentNumber", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
		}if(detail==""){
			layer.tips('请填写缺勤理由', "#detail", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
			}
		return true;
	}
	
	$(document).ready(function(){
		$("ul li:eq(2)").addClass("active");
	});
</script>
<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
		<c:choose>
			<c:when test="${record.recordId!=null }">
				<font  size="4" >修改缺勤记录</font>
			</c:when>
			<c:otherwise>
				<font  size="4" >添加缺勤记录</font>
			</c:otherwise>
		</c:choose>
		</div>
		<form action="record?action=save" method="post" onsubmit="return checkForm()">
			<div class="data_form" >
				<input type="hidden" id="recordId" name="recordId" value="${record.recordId }"/>
					<table align="center">
						<tr>
							<td>学号：<input type="text" id="studentNumber"  name="studentNumber" value="${record.studentNumber==null?studentNumber:record.studentNumber }"  style="margin-top:5px;height:30px;" ${studentNumber!=null?'readonly':'' }/></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td>日期：<input type="text" id="date"  name="date" value="${record.date==null?date:record.date }"  style="margin-top:5px;height:30px;" readonly="readonly" /></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td>备注：<input type="text" id="detail"  name="detail" value="${record.detail }"  style="margin-top:5px;height:30px;" /></td>
							<td><font color="red">*</font></td>
						</tr>
					</table>
					<div align="center">
						<input type="submit" class="btn  btn-large btn-primary btn-primary" value="保存" />
						&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn  btn-large btn-primary btn-primary" type="button" onclick="javascript:window.location='record'">返回</button>
					</div>
					<div align="center">
						<font id="error" color="red">${error }</font>
					</div>
			</div>
		</form>
</div>
