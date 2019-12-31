<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>停机要点计划回复</title>
<link href="<%=contextPath%>/resource/css/innerRequest/popUpTable.css" rel="stylesheet" />
<style>
	s{
		color:red;
	} 

</style>
</head>
<body style="overflow: hidden;">
	<!-- 弹出编辑框 -->
	<div id="content" style="height: 100%;overflow-x: hidden;">
		<form class="form-horizontal" id="replyForm">
			<table class="popUpTable">
				<tbody>
		            <tr class="thTdPadding" style="height: 60px">
		           		<th>批复附件</th>
		            	<td colspan="3">
		            		<div>
								<jsp:include page="/views/common_page/attachFileDownLoad.jsp" flush="true">
									<jsp:param name="width"  value="100%" />
									<jsp:param name="height"  value="100%" />
								</jsp:include>
							</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
		           		<th><s>*</s>完成情况</th>
		            	<td colspan="3">
		            		<div>
		            			<textarea name="situationCaption" id="situationCaptionReply" data-rules="{required:true,maxlength:80}"  style="width:98%;height:60px;"></textarea>
		            		</div>
		            	</td>
	          		</tr>
	          		<tr class="thTdPadding">
	          			<th>回复附件</th>
	            		<td colspan="3" >
		            		<div>
		            			<jsp:include page="/views/common_page/attachFileUpload.jsp" flush="true">
		            				<jsp:param name="width"  value="100%" />
									<jsp:param name="height"  value="80px" />
			            		</jsp:include>
			            	</div>
		            	</td>
	          		</tr>
				</tbody>
			</table>
		</form>
	</div>
	
<script type="text/javascript">

var contextPath = '<%=contextPath%>' + '/';
var replyForm; //弹出窗口
var replyTips;
var id='${param.id}';

//根据id查询对象
$.ajax({
	url:contextPath +  'commNetStopAction/getCommNetStopById.cn',
	type:'post',
	data:{id:id},
	dataType:'json',
	success:function(result){
		if(result.status==1){
			var recordCns=result.data;//停机要点记录
			if(recordCns.examinFile != null){//初始化批复附件
				setAttachFileId(recordCns.examinFile.id);
			}
		}
	},
	error:function(){
		alert('加载数据异常！');
	}
});


BUI.use(['bui/uploader', 'bui/calendar', 'bui/form', 'bui/tooltip', 'bui/grid', 'bui/data', 'bui/overlay'],function(Uploader, Calendar, Form, Tooltip, Grid, Data, Overlay){
	//消息提示框
	if(replyTips == undefined) {
		replyTips = new Tooltip.Tips({
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
	replyForm = new Form.Form({
		srcNode : '#replyForm',
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
	});
	
	/*BUI结束*/
</script>
</body>
</html>