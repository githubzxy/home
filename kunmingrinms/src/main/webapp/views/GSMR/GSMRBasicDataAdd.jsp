<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>导入GSM-R</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	}
</style>
</head>
<body style="overflow: hidden;">
	<div id="content">
		<form class="form-horizontal" id="uploadForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding">
	           			<th><s>*</s>线路名称：</th>
	            		<td>
	            			<div>
	            				<select name="railLineName" id="railLineName" style="width:100%;height:30px" data-rules="{select:-1}">
			            			<option value="-1">请选择线路</option>
			            		</select>
	            			</div>
		            	</td>
		            	<th><s>*</s>报表年月：</th>
		            	<td>
			            	<div>
			            		<select name="year" id="year" style="width:49%;height:30px" data-rules="{select:-1}">
			            			<option value="-1">请选择年份</option>
			            			<option value="2012">2012年</option>
			            			<option value="2013">2013年</option>
			            			<option value="2014">2014年</option>
			            			<option value="2015">2015年</option>
			            			<option value="2016">2016年</option>
			            			<option value="2017">2017年</option>
			            			<option value="2018">2018年</option>
			            			<option value="2019">2019年</option>
			            			<option value="2020">2020年</option>
			            			<option value="2021">2021年</option>
			            			<option value="2022">2022年</option>
			            			<option value="2019">2023年</option>
			            			<option value="2020">2024年</option>
			            			<option value="2021">2025年</option>
			            			<option value="2022">2026年</option>
			            		</select>
			            		<select name="month" id="month" style="width:49%;height:30px" data-rules="{select:-1}">
			            			<option value="-1">请选择月份</option>
			            			<option value="1">1月</option>
			            			<option value="2">2月</option>
			            			<option value="3">3月</option>
			            			<option value="4">4月</option>
			            			<option value="5">5月</option>
			            			<option value="6">6月</option>
			            			<option value="7">7月</option>
			            			<option value="8">8月</option>
			            			<option value="9">9月</option>
			            			<option value="10">10月</option>
			            			<option value="11">11月</option>
			            			<option value="12">12月</option>
			            		</select>
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th>标准模板：</th>
		            	<td>
	            			<div>
	            				<input id="downLoad" type = "button"  value="GSM-R模板下载" style="width:100%;height:30px">
	            			</div>
		            	</td>
		            	<td colspan="2">
	            			<div>
	            				<input id="infor" type="text" value="注：请按GSM-R模板导入" 
	            				style="color:red;width:96.8%;height:30px;text-align: center;" readonly>
	            			</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th><s>*</s>附件：</th>
	            		<td colspan="3">
	            			<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
		            			<jsp:param name="width"  value="100%" />
								<jsp:param name="height" value="100px" />
	            			</jsp:include>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>

<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var uploadForm; //弹出新增窗口
	var addTips;
	
	$("#uploadForm #railLineName option[value='-1']").hide();
	$("#uploadForm #year option[value='-1']").hide();
	$("#uploadForm #month option[value='-1']").hide();
	
	$(document).ready(function () {
		getRailLine();
	});
	
	function getRailLine(){
		$.post(contextPath + 'GSMRAction/getAllRailLine.cn',
				function(data,status){
			
					if(status){
						
						var selectRailLine = document.getElementById('railLineName');
						
						for(var i = 0 ; i < data.length ; i++){
						
							var s = data[i].name;
							
							var id = data[i].id;
							
							selectRailLine.options[i+1] = new Option(s,id);
							
						}
						
					}else{
// 						console.log("error");
					}
				},'json');
	}
	
	$("#downLoad").on('click',function(){
		
		window.location.href = contextPath+'GSM-RExcelTemplate/GSM-R.xls';
		
	});
	
	BUI.use(['bui/uploader', 'bui/form', 'bui/tooltip'],
			function(Uploader, Form, Tooltip){
		//消息提示框
		if(addTips == undefined) {
			addTips = new Tooltip.Tips({
		        tip : {
		          trigger : '.x-icon-error', //出现此样式的元素显示tip
		          alignType : 'right', //默认方向
		          elCls : 'tips tips-warning tips-no-icon tip1',
		          zIndex : '2000',
		          offset : 10 //距离左边的距离
		        }
		      }).render();
		}
		
		// 渲染BUIForm，用于表单元素验证
		uploadForm = new Form.Form({
			srcNode : '#uploadForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
				
		//开始上传时
		uploader.on('start',function(e){
			$(".btn-save").attr("disabled","disabled");
		});
		
		//上传成功时
		uploader.on('success',function(e){
			$(".btn-save").removeAttr("disabled");
		});
		
		//取消上传时
		uploader.on('cancel',function(e){
			$(".btn-save").removeAttr("disabled");
		});
		
		//自定义验证规则，选择框必须选值
		Form.Rules.add({
		    name : 'select',  //规则名称
		    msg : '请选择',//默认显示的错误信息
		    validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
		      if(value==baseValue){
		        return formatMsg;
		      }
		    }
		});
			
	});

</script>
</body>
</html>