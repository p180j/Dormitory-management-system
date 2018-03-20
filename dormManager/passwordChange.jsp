<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">
function checkForm(){
	var oldPassword=document.getElementById("oldPassword").value;
	var newPassword=document.getElementById("newPassword").value;
	var rPassword=document.getElementById("rPassword").value;
	if(oldPassword==""||oldPassword==null){
		layer.tips('请填写原密码', "#oldPassword", {
      		 tips: [2, '#F70909'],
      		 time: 2000,
				  tipsMore: true
			         });
		return false;
	} 
	if(newPassword==null||newPassword==""){
		layer.tips('请填写新密码', "#newPassword", {
     		 tips: [2, '#F70909'],
     		 time: 2000,
				  tipsMore: true
			         });
		return false;

		}
	if(rPassword==null||rPassword==""){
		layer.tips('请填再次填写新密码', "#rPassword", {
    		 tips: [2, '#F70909'],
    		 time: 2000,
				  tipsMore: true
			         });
		return false;

		}
	if(newPassword!=rPassword){
		layer.tips('两次密码填写不一致', "#rPassword", {
     		 tips: [2, '#F70909'],
     		 time: 2000,
				  tipsMore: true
			         });
		return false;
	}
	$.ajax({  
        type : "POST",  //提交方式  
        url : "password?action=change",//路径  
        data : {  
            "oldPassword" : oldPassword,
            "newPassword":newPassword,
            "rPassword":rPassword   
        },//数据，这里使用的是Json格式进行传输  
        dataType:'json',
        success : function(data) {//返回数据根据结果进行相应的处理  
         if(data.msg=="修改成功"){
           layer.alert(data.msg);
           window.location.href="login.jsp";
              }else{
            		layer.tips(data.msg, "#oldPassword", {
                    tips: [2, '#F70909'],
                 	time: 2000,
           			tipsMore: true
           	  });
            }
        },
        error:function (XMLHttpRequest, textStatus, errorThrown) { 
        	  layer.alert(XMLHttpRequest.status);
              layer.alert(XMLHttpRequest.readyState);
              layer.alert(textStatus);
        }   
    });  
	return true;
}
	
	$(document).ready(function(){
		$("ul li:eq(3)").addClass("active");
	});
</script>
<div class="data_list">
		<div class="data_list_title" style="text-align:center;">
			<font  size="5" >修改密码</font>
		</div>
		<form >
			<div class="data_form" >
		<div style="text-align:center;margin-top:3px;margin-left:50px;">
			  <font id="error" color="red" >${error }</font></div>
				<input type="hidden" id="studentId" name="studentId" value="${student.studentId }"/>
					<table style="margin:auto;">
						<tr>
							<td>&nbsp;&nbsp;&nbsp;原密码：<input type="password" id="oldPassword"  name="oldPassword" value="${oldPassword }"  style="margin-top:5px;height:30px;" /></td>
                            <td><font color="red">*</font></td>   							
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;新密码：<input type="password" id="newPassword"  name="newPassword" value="${newPassword }" style="margin-top:5px;height:30px;" /></td>
							<td><font color="red">*</font></td>
						</tr>
						<tr>
							<td>重复密码：<input type="password" id="rPassword"  name="rPassword" value="${rPassword }" style="margin-top:5px;height:30px;" /></td>
							<td><font color="red">*</font></td>
						</tr>
					</table>
					
					<div style="position:relative ; left:44%; ">
			<input type="button" class="btn btn-large btn-primary" value="提交" onclick="checkForm()"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn  btn-large btn-primary btn-primary" type="button" onclick="javascript:window.location='student'">返回</button>
					</div>
			</div>
		</form>
</div>