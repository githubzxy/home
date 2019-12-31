<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%             
	String contextPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>转派公共组件</title>
<style type="text/css">
	.userMask {
		z-index: 1100 !important;
	}
</style>
</head>
<body>
	<div class="form-horizontal" style="margin-top: 20px;">
		<div class="row" >
				<div class="control-group span8" >
		  			<label class="control-label">接收部门：</label>
		  			<div class="controls">
		  				<input class="input-normal control-text" type="text"  id="receiveOrg"  disabled="disabled"/>
					</div>
		  		</div>
		</div>
		<div class="row" >
				<div class="control-group span8" >
		  			<label class="control-label"><font color="red">*</font>接收人：</label>
		  			<div class="controls">
		  				<select id="receiveUser" ></select>
					</div>
		  		</div>
		</div>
	</div>
</body>

<script type="text/javascript">

   var contextPath = '<%=contextPath%>' + '/';
   var orgId = "${sessionScope.user.organization.id}";
   var orgName = "${sessionScope.user.organization.name}";
   $(document).ready(function(){
   		initOrg();	
   		initUsers();
   });
   
   function initOrg(){
	   $("#receiveOrg").val(orgName);
   }
   function initUsers(){
	   $.ajax({
			type: "POST",
			url: contextPath+"userAction/getUsersByOrgId.cn",
			dataType: "json",
			data : {
				"orgId" : orgId
			},
			success:function(data) {
				var receiveUsers="";
				for(var p in data){
					receiveUsers += "<option value='" + data[p].id + "' >" + data[p].name + "</option>";
				}
				$("#receiveUser").html(receiveUsers);
			},
			failure:function(res){
				alert(res);
			}
		});
   }

</script>

</html>