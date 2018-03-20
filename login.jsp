<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.dorm.model.Admin" %>
<%@ page import="com.dorm.model.DormManager" %>
<%@ page import="com.dorm.model.Student" %>
<%
	if(request.getAttribute("user")==null){
		String userName=null;
		String password=null;
		String userType=null;
		String remember=null;
		
		Cookie[] cookies=request.getCookies();
		for(int i=0;cookies!=null && i<cookies.length;i++){
			if(cookies[i].getName().equals("dormuser")){
				userName=cookies[i].getValue().split("-")[0];
				password=cookies[i].getValue().split("-")[1];
				userType=cookies[i].getValue().split("-")[2];
				remember=cookies[i].getValue().split("-")[3];
			}
		}
		
		if(userName==null){
			userName="";
		}
		
		if(password==null){
			password="";
		}
		
		if(userType==null){
			userType="";
		} else if("admin".equals(userType)){
			pageContext.setAttribute("user", new Admin(userName,password));
			pageContext.setAttribute("userType", 1);
		} else if("dormManager".equals(userType)) {
			pageContext.setAttribute("user", new DormManager(userName,password));
			pageContext.setAttribute("userType", 2);
		} else if("student".equals(userType)) {
			pageContext.setAttribute("user", new Student(userName,password));
			pageContext.setAttribute("userType", 3);
		}
		
		if("yes".equals(remember)) {
			pageContext.setAttribute("remember", 1);
		}
		
	}
%>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>宿舍管理系统登录</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/layer/skin/layer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/layer/layer.js"></script>
<script type="text/javascript">
	function checkForm() {
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		var userTypes = document.getElementById("select").value;
		var userType = null;
		for(var i=0;i<userTypes.length;i++) {
			if(userTypes[i].checked) {
				userType=userTypes[i].value;
				break;
			}
		} 
		if (userName == null || userName == "") {
			/* document.getElementById("error").innerHTML = "用户名不能为空"; */
			layer.tips('账号不能为空,请输入账号', "#userName", {
       		 tips: [2, '#F70909'],
       		 time: 2000,
				  tipsMore: true
			         });
			return false;
		}
		if (password == null || password == "") {
			/* document.getElementById("error").innerHTML = "密码不能为空"; */
			layer.tips('密码不能为空,请输入密码', "#password", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
		}
		if (userTypes==0) {
			/* document.getElementById("error").innerHTML = "请选择用户类型"; */
			layer.tips('身份不能为空,请输入账号', "#select", {
	       		 tips: [2, '#F70909'],
	       		 time: 2000,
					  tipsMore: true
				         });
			return false;
		}
		return true;
	}
</script>

<style type="text/css">
	  body {
        padding-top: 200px;
        padding-bottom: 40px;
        background-image: url('images/d.jpg');
        background-position: center;
		background-repeat: no-repeat;
		background-attachment: fixed;
      }
      
      .radio {
      	padding-top: 10px;
       	padding-bottom:10px;
      }
      
      .form-signin-heading{
      	text-align: center;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 0px;
        margin: 0 auto 20px;
      /*  background-color:grey; */
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
      #select {
      width:28%;
      height:7%;
      
      }
  #span{
  text-align:center;
  position:relative;
  top:4px;
  font-size:16px;
  }  
    #span1{
  text-align:center;
  position:relative;
  top:-4px;
  font-size:16px;
  } 
  #title{
position:relative;;
 top:-100px;

}
.container{
position:relative;;
 top:-60px;
}
</style>
</head>
<body>
<div id="title" style="text-align:center"><font color=grey  size="8">东华理工大学宿舍管理</font></div>
<div class="container">
      <form name="myForm"  id="myForm" class="form-signin" action="login" method="post" onsubmit="return checkForm()">
        <h2 class="form-signin-heading"><font color="gray" size="6">宿舍管理系统</font></h2>
        <div id="error" style="color:red;text-align:center;font-weight:bold;">${error }</div>
        <input id="userName" name="userName" value="${userName }" type="text" class="input-block-level" placeholder="请输入用户名">
        <input id="password" name="password" value="${password }" type="password" class="input-block-level" placeholder="请输入密码" >
       <!--  <label class="radio inline">
      	  	<input id="admin" type="radio" name="userType" value="admin"  checked/> 系统管理员
		</label> -->
		<span id="span1"><font  color=grey >身份：</font></span><select id="select" name="userType" >
	 <option value="0" selected="selected">请选择...</option>
      <option   value="1" >系统管理员</option>
      <option   value="2">宿舍管理员</option>
      <option   value="3"  >学生</option>
     </select>
<%-- 	<label class="radio inline">
			<input id="dormManager" type="radio" name="userType" value="dormManager" ${userType==2?'checked':''} /> 宿舍管理员
		</label>
		<label class="radio inline">
			<input id="student" type="radio" name="userType" value="student"  ${userType==3?'checked':''}/> 学生
		</label> --%>
       <label> 
        <button class="btn btn-large btn-info " type="submit" >登录</button>
        <button class="btn btn-large btn-info pull-right" type="reset"  >重置</button>  
       </label>
		 <p align="center" style="padding-top: 15px;">  </p>
      </form>
</div>
</body>
</html>