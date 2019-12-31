<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增停机要点计划</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	} 

	#selectSuggestAdd .bui-combox-input .bui-form-field{
		height:32px;
	}
</style>
</head>
<body style="overflow: hidden;">
	<!-- 弹出编辑框 -->
	<div id="content">
		<form class="form-horizontal" id="addForm">
			<table class="popUpTable">
				<tbody>
					<tr class="thTdPadding" style="height: 31px">
						<th><s>*</s>线路</th>
		            	<td>
			            	<div>
			            		<select name="rainLineAdd" id="rainLineAdd" style="width:100%;height:27px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
		            	<th style="width:95px;"><s>*</s>计划开始时间</th>
	            		<td>
	            			<div class="bui-form-group" data-rules="{dateRange : true}">
								<input type="text" id="startTimeAdd" class="calendar calendar-time"  style="width:95%;" 
								data-rules="{required:true}" readonly="readonly"/>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
	           			<th><s>*</s>所属局</th>
	            		<td>
	            			<div>
	            				<input type="text" name="railway" id="railwayAdd" data-rules="{required:true,maxlength:50}"  
	            				 style="width:95.3%;height:25px" value="昆铁">
	            			</div>
		            	</td>
	           			<th style="width:95px;"><s>*</s>计划结束时间</th>
	           			<td>
	            			<div class="bui-form-group" data-rules="{dateRange : true}">
								<input type="text" id="endTimeAdd" class="calendar calendar-time"  style="width:95%;" 
								data-rules="{required:true}" readonly="readonly"/>
							</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
						<th><s>*</s>工作内容</th>
		            	<td>
			            	<div>
			            		<select name="workContent" id="workContentAdd" style="width:100%;height:25px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
		            	<th><s>*</s>所属专业</th>
		            	<td>
			            	<div>
			            		<select name="major" id="majorAdd" style="width:100%;height:25px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th><s>*</s>施工类别</th>
	           			<td>
			            	<div>
			            		<select name="constructionType" id="constructionTypeAdd" style="width:100%;height:25px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
	           			<th><s>*</s>施工属性</th>
	           			<td>
			            	<div>
			            		<select name="constructionProperty" id="constructionPropertyAdd" style="width:100%;height:25px" data-rules="{sele:''}">
			            		</select>
			            	</div>
		            	</td>
		            </tr>
		            <tr class="thTdPadding">
		           		<th><s>*</s>施工地点</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="constructionAddress" id="constructionAddressAdd" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th><s>*</s>涉及骨干网<br>名称</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="BackboneNetwork" id="BackboneNetworkAdd" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th><s>*</s>涉及铁路局</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="relevantRailwayStation" id="relevantRailwayStationAdd" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th><s>*</s>计划原因<br>说明</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="planAndReason" id="planAndReasonAdd" data-rules="{required:true,maxlength:80}"  style="width:98%;height:50px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>附件</th>
	            		<td colspan="3" >
	            			<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
	            				<jsp:param name="width"  value="100%" />
								<jsp:param name="height"  value="90px" />
		            		</jsp:include>
		            	</td>
	          		</tr>
					<tr class="thTdPadding">
						<th>是否天窗</th>
						<td colspan="3">
							<select name="skyLight" id="skyLightAdd" style="width:100%;height:25px" data-rules="{sele:''}">
								<option value="false">否</option>
								<option value="true">是</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">
	
	var contextPath = '<%=contextPath%>' + '/';
	var addForm; //弹出新增窗口
	var addTips;
	
	/**
	* 初始化下拉选
	*/
	commNetworkStop_rainLine.listData("#rainLineAdd");
	commNetworkStop_workContent.listData("#workContentAdd");
	commNetworkStop_major.listData("#majorAdd");
	commNetworkStop_constructionType.listData("#constructionTypeAdd");
	commNetworkStop_constructionAttr.listData("#constructionPropertyAdd");
	
	//隐藏本页面单选框里的第一个空白框
	$("#addForm select option[value='']").hide();
	
	//获取所有参数，赋值给全局变量paramAdd
	function getParamAdd(){
		return {
				railLineName : $("#rainLineAdd").find("option:selected").val(),
				startDate : $("#startTimeAdd").val(),
				belongOffice : $("#railwayAdd").val(),
				endDate : $("#endTimeAdd").val(),
				workContent : $("#workContentAdd").find("option:selected").val(),
				belongCraft : $("#majorAdd").find("option:selected").val(),
				executionType : $("#constructionTypeAdd").find("option:selected").val(),
				executionAttr : $("#constructionPropertyAdd").find("option:selected").val(),
				executionAddr : $("#constructionAddressAdd").val(),
				mainNetName : $("#BackboneNetworkAdd").val(),
				railwaysBureau : $("#relevantRailwayStationAdd").val(),
				planCaption : $("#planAndReasonAdd").val(),
				skyLight : $("#skyLightAdd").find("option:selected").val()
			};
	}
	
	BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip'],
			function(Uploader, Calendar, Form, Tooltip){
		
		//再次点击清空时间
// 		$('#startTimeAdd').on('click',(function(){
// 			$('#startTimeAdd').val("");
// 		}));
// 		$('#endTimeAdd').on('click',(function(){
// 			$('#endTimeAdd').val(""); 
// 		}));
		//日历
		var datepickerStart = new Calendar.DatePicker({
			trigger : '#startTimeAdd',
			showTime : true,
			autoRender : true
		});
		var datepickerEnd = new Calendar.DatePicker({
			trigger : '#endTimeAdd',
			showTime : true,
			autoRender : true
		});
		//设置默认时间
		datepickerStart.on('show',function(){
			var c = datepickerStart.get('calendar');
			c.set('hour',0);
			c.set('minute',0);
			c.set('second',0);
		});
		datepickerEnd.on('show',function(){
			var c = datepickerEnd.get('calendar');
			c.set('hour',23);
			c.set('minute',59);
			c.set('second',59);
		});
		
		
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
		addForm = new Form.Form({
			srcNode : '#addForm',
			errorTpl : '<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'
		}).render();
		
		//自定义验证规则，选择框必须选值
        Form.Rules.add({
            name : 'sele',  //规则名称
            msg : '请选择一个值',//默认显示的错误信息
            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
              if(value==baseValue){
                return formatMsg;
              }
            }
        });
		
      //自定义验证规则，开始日期不能大于结束日期
        Form.Rules.add({
            name : 'dateCompare',  //规则名称
            msg : '开始时间不能大于结束时间',//默认显示的错误信息
            validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
            	baseValue=$("#startTimeAdd").val();
            	value=$("#endTimeAdd").val();
           		var timeRegExp=/\D/g;//正则表达式，替换所有非数字字符
	            var startTime=baseValue.replace(timeRegExp,"");
	            var endTime=value.replace(timeRegExp,"");
	            if(baseValue&&value&&(endTime-startTime<=0)){//比较大小
	            	return formatMsg;
	            }
            }
        });
			
	});

</script>
</body>
</html>