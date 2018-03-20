<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">
	function checkForm(){
		var userName=document.getElementById("userName").value;
		var password=document.getElementById("password").value;
		var rPassword=document.getElementById("rPassword").value;
		var name=document.getElementById("name").value;
		var sex=document.getElementById("sex").value;
		var tel=document.getElementById("tel").value;
		if(userName==""||userName==null){
			layer.tips('请填写用户名', "#userName", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
		} 
		if(name==null||name==""){
			layer.tips('请填写姓名', "#name", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
			}
		if(password==""||password==null){
			layer.tips('请填写密码', "#password", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;

			}
		 if(password!=rPassword){
			layer.tips('两次密码填写不一致！', "#rPassword", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
		}
		if(!(/^1[34578]\d{9}$/.test(tel))){
			layer.tips('手机格式错误，请重新输入', "#tel", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
			}
		if(sex==null||sex==""){
			layer.tips('请填写性别', "#sex", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;

			}	
		return true;
	}
	
	$(document).ready(function(){
		$("ul li:eq(1)").addClass("active");
	});
</script>
<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
		<c:choose>
			<c:when test="${dormManager.dormManagerId!=null }">
				<font  size="4" >修改管理员</font>
			</c:when>
			<c:otherwise>
				<font  size="4" >添加管理员</font>
			</c:otherwise>
		</c:choose>
		</div>
		<form action="dormManager?action=save" method="post" onsubmit="return checkForm()">
			<div class="data_form" >
				<input type="hidden" id="dormManagerId" name="dormManagerId" value="${dormManager.dormManagerId }"/>
					<table align="center">
						<tr>
							<td>用户名：</td>
							<td><input type="text" id="userName"  name="userName" value="${dormManager.userName }"  style="margin-top:5px;height:30px;width: 170px;" /></td>
							<td>&nbsp;&nbsp;<font color="red">*</font></td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>姓名：</td>
							<td><input type="text" id="name"  name="name" value="${dormManager.name }"  style="margin-top:5px;height:30px;width: 170px;" /></td>
							<td>&nbsp;&nbsp;<font color="red">*</font></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="password" id="password"  name="password" value="${dormManager.password }"  style="margin-top:5px;height:30px;width: 170px;" /></td>
							<td>&nbsp;&nbsp;<font color="red">*</font></td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>重复密码：</td>
							<td><input type="password" id="rPassword"  name="rPassword" value="${dormManager.password }"  style="margin-top:5px;height:30px;width: 170px;" /></td>
							<td>&nbsp;&nbsp;<font color="red">*</font></td>
						</tr>
						<tr>
							<td>联系电话：</td>
							<td><input type="text" id="tel"  name="tel" value="${dormManager.tel }"  style="margin-top:5px;height:30px;width: 170px;" /></td>
							<td>&nbsp;&nbsp;<font color="red">*</font></td>
							<td>&nbsp;&nbsp;&nbsp;</td>
							<td>性别：</td>
							<td>
								<select id="sex" name="sex" style="width: 170px;">
									<option value="">请选择...</option>
									<option value="男" ${dormManager.sex eq "男"?'selected':'' }>男</option>
									<option value="女" ${dormManager.sex eq "女"?'selected':'' }>女</option>
								</select>
							</td>
							<td>&nbsp;&nbsp;<font color="red">*</font></td>							
						</tr>	
					</table>
					<div align="center">
						<input type="submit" class="btn  btn-large btn-primary btn-primary" value="保存"/>
						&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn  btn-large btn-primary btn-primary" type="button" onclick="javascript:history.back()">返回</button>
					</div>
					<div align="center">
						<font id="error" color="red">${error }</font>
					</div> 
			</div>
		</form>
</div>