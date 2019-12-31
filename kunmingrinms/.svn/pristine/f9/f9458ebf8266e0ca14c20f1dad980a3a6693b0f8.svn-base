/**
*首页展示JS，包含信息发布，值班信息，待办信息三个横向排列模块
*/

var ondutyStore;
var dutyDialog;

BUI.use(['bui/layout','bui/grid','bui/data','bui/list','bui/calendar','bui/overlay'],function (Layout,Grid,Data,List,Calendar,Overlay) {
	alert = BUI.Message.Alert;//使用bui的消息提示框
	//布局容器
	var container = new Layout.Viewport({
		render : '#homeContainer',
		elCls : 'ext-border-layout',
		plugins : [Layout.Border]
	});
	//左侧信息发布数据源
	var messageStore = new Data.Store({
		url : contextPath + 'homeAction/getHomeMessage.cn',
		autoLoad : true,
		proxy : {
			method : 'post'
		}
	});
	messageStore.on('load',function(e){
//		var data = messageStore.getResult();
//		console.log(data);
//		for(var i = 0;i < data.length;i++){
//			//将类型替换为类型名称以供显示
//			var m = data[i];
//			m.type = m.type.name;
//		}
	});
	
	
	var dialog = new Overlay.Dialog({
		   
		   width:600,
//	       height:337,
	       height:297,
	       title:'信息发布详细信息',
	       mask:true,     
	       loader:{
	    	   
	    	   url : contextPath + 'views/home/messageDetail.jsp',   
	    	   dataType : 'html',
	    	   autoLoad : false,          
	           lazyLoad : false
	       },
	       buttons:[]
	});
	
	
	//左侧信息发布列表
	var messageList = new List.SimpleList({
	    render : '#message',
	    layout : {
			title : '信息发布',
			region : 'west',
			fit : 'both',
			collapsable : true,
			width : 450
		},
		idField : 'id',
		itemTplRender : function(item){	
			return '<li id="{id}"><b>['+message_type.typeName(item.type)+']</b>    ' + item.theme + '    ' + item.createTime + '</li>';
			
		},
		listeners : {
			itemclick : function(ev){
				
				dialog.show();
				
				var params={
						
					"id":ev.item.id			
						
				};				
				dialog.get('loader').load(params);
//				alert(ev.item.attachFile);
			}
		},
		store : messageStore,
		children:[{
			
			xclass : 'controller',
			content:'<div style="margin:10px;padding-right:50px;float:right;"><a onclick="moreFunction();" href="javascript:;">......更多>>></a></div>'
		}]

	});

	
	//右侧值班信息3列流布局
	var flowLayout = new Layout.Flow({
	      columns : 3
	});
	
	
	
	//右侧值班信息列表表头定义 
	var ondutyColumns = [
	                     {title : '所属部门',dataIndex :'orgName',width:'14%'}, 
	                     {title : '值班人',dataIndex :'user',width:'14%'},
	                     {title : '值班日期',dataIndex :'dutyDate',width:'14%'},
	                     {title : '星期',dataIndex :'week',width:'14%',renderer:function(value) {
	             			return returnDay(value);
	             			}
	                     },
	                     {title : '固定电话',dataIndex :'fixedNum',width:'14%'},
	                     {title : '手机',dataIndex :'cellPhoneNum',width:'14%'},
	                     {title : '值班情况汇报',dataIndex :'situation',width:'16%'}
	                ];
	
	//右铡值班信息列表数据源
	ondutyStore = new Data.Store({
		url : contextPath + 'homeAction/getOnduty.cn',
		proxy : {
			method : 'post'
		},
		params : {'dutyDate' : ''},
        autoLoad:true
	 });
	ondutyStore.on('load',function(){
		var data = ondutyStore.getResult();
		for(var i = 0;i < data.length;i++){
			var m = data[i];
			//如果没指定值班人，用颜色标识
			if(m.user == null){
				m['checked'] = true;
			}//如果当天晚上8点后未填写值班日志，则用颜色标识
			else if(m.situation == null || m.situation == ''){
				
				  var severtime = tomcatSeverTime;
				  var dutyDate = new Date(m.dutyDate);				
					
//				  var reportStartDate = new Date(dutyDate.getFullYear(),dutyDate.getMonth(),dutyDate.getDate(),17);
				  var reportEndDate = new Date(dutyDate.getFullYear(),dutyDate.getMonth(),dutyDate.getDate(),20);
					
				  if(severtime < reportEndDate){
						
					  m['nosituation'] = false;

				  }else{
					  
					  m['nosituation'] = true;
				  }
				
			}else{
				m['nosituation'] = false;
				m['checked'] = false;
			}
		}
	});
	//右铡值班信息
	var ondutyinfo = new BUI.Component.Controller({
		render : '#ondutyinfo', 
		layout : {
	    	title : '值班信息',
			region : 'center',
			fit : 'both'
		},
		width : '100%',
		height:20,
		children :[
		    	   {
		    		   layout : {
		                   width : '40%',
		                   height:30
		                	   
		               },
		               xclass : 'controller',
		               content : '&nbsp<button type="button" id="btnSearch" class="button button-small" onclick="writeDuty()">个人情况汇报填写</button>'
		    	   },
		    	   {
		    		   layout : {
		                   width :'20%',
		                   height:30
		               },
		               xclass : 'controller',
		               content : '<input value="值班日期：" readonly="readonly"  style="width:100%;text-align:right;border: 0px solid;"></input>'
		    	   },
		    	   {
		    		   layout : {
		                   width :'20%',
		                   height:30
		               },
		               xclass : 'controller',
		              content : '<input id="dutyDate" type="text" class="calendar" />'
		    	   },
		    	   {
		    		   layout : {
		                   width :'20%',
		                   height:30
		               },
		               xclass : 'controller',
		              content : '<button id="btnQuery" class="button button-small" onclick="dataSearch()">查询</button>'
		    	   },
		    	   {
		    		 layout : {
		    			 width : '100%',
		    			 height:20
		    				 
		    		 },
		    		 xclass : 'controller',
		    		 content : '<div style="float:left;">&nbsp当天值班人列表</div><div style="float:left;width:30px;height:6px;"/><div style="float:left;padding-top:5.5px;"><div style="float:left;width:6px;height:6px;background-color:#1E90FF;border:1px solid #1E90FF;"/></div><div style="float:left;">&nbsp未设置值班人</div><div style="float:left;width:10px;height:6px;"/><div style="float:left;padding-top:5.5px;"><div style="float:left;width:6px;height:6px;background-color:red;border:1px solid red;"/></div><div style="float:left;">&nbsp未值班</div>' //TODO 添加HTML代码加上样式和刷新按钮
		    	   },		    	   
		    	   {
		    		  layout : {
		    			  width : '100%',
		    				  height : '100%'
		    		  },
		    		  xclass : 'grid',
		    		  columns : ondutyColumns,
		    		  store : ondutyStore,
		    		  itemStatusFields : {
		    			checked : 'checked',
		    			nosituation : 'nosituation'
		    		  },
		    		  loadMask : true,
		    		  width : '100%',
		    		  height:$(window).height()-100
//		    		  height: '100%'
		    			  
		    	   }
		    	],
		    	plugins : [flowLayout]
		    });
	container.addChild(messageList);
	container.addChild(ondutyinfo);
	container.render();
	var datepicker = new Calendar.DatePicker({
		trigger:'.calendar',
		autoRender : true
	});
	
	
	dutyDialog =  new Overlay.Dialog({
		   
		   width:600,
	       height:230,
	       title:'值班情况汇报',
	       mask:true,     
	       loader:{
	    	   
	    	   url : contextPath + 'views/home/dutyReturn.jsp',   
	    	   dataType : 'html',
	    	   autoLoad : false,          
	           lazyLoad : false
	       },
	       buttons : [ 
	                   {text:'保存',
	                   	elCls : 'button', 
	                   	handler : function(){
	       					
	                   		if(!dutyForm.isValid()) {
               					return ;
               				}
	                   		
	                   		$.ajax({
	                   			
	                   			type:"POST",
	                   			url: contextPath + 'homeAction/updateOnDuty.cn',
	                   			dataType:"json",
	                   			data:{
	                   				
	                   				"dutyId":dutyId,
	                   				"content":$("#dutyContent").val()
	                   				
	                   			},
	                   			success: function(response){
	                   				if(response.status == 1){
	                   					dialogClose(dutyDialog);
	                   					alert("值班汇报完成");
	                   					$("#btnQuery").click();
	                   					
	                   				}else{
	                   					
	                   					alert("值班汇报失败!");
	                   				}
	                   				
	                   			}
	                   			
	                   		});	                   		
	       					 
	      				     }
	                       },
	                       { text:'关闭', 
	                   	  elCls : 'button', 
	                   	  handler : function(){ 
	                   		dutyDialog.hide();
	                   		  }
	                       }
	                   ]
	});
	
	/**
	 * 关闭弹出框并解除引用
	 * param:d 待关闭的弹出框
	 */
	function dialogClose(d){
		d.close();
		d = null;
	}
	
});

function moreFunction(){
	
	var threePerName="信息发布";
	var threeModulePath="../views/message/messagePage.jsp";
	var threePerId="4028811c41a001630141a13812120539";
	
	var mainContainer = window.parent;	
	mainContainer.menuClick(threePerName,threeModulePath,threePerId);	
	
}
//个人情况汇报填写
function writeDuty(){
	
	$.ajax({
		
		type:"POST",
		url : contextPath + 'homeAction/getTodayOndutyByUser.cn',
		dataType:"json",
		data: {
			"userId":userId
		},
		success: function(response){
			
		   if(response.length == 0){
			   
			   alert("当前用户当天没有值班信息，不必填写情况汇报！");
			   return;
		   }
		   if(response.length ==1){
			   
			 //已汇报不能再汇报
				if(response[0].status == "2"){
					alert("当前用户当天值班信息汇报已填写！");
					return;
				}
				var org = response[0].user.organization;
				if(org.name.length == 0){
					alert("当前用户组织机构为空，请设置组织机构后再进行情况汇报！");
					return;
				}
				if(org.type != 4){
					alert("只有车间用户可以填写值班情况汇报！");
					return;
				}
				 			  
			    var severtime = tomcatSeverTime; 
			  
				var dutyDate = new Date(response[0].dutyDate);				
				
				var reportStartDate = new Date(dutyDate.getFullYear(),dutyDate.getMonth(),dutyDate.getDate(),17);
				var reportEndDate = new Date(dutyDate.getFullYear(),dutyDate.getMonth(),dutyDate.getDate(),20);
				
				if(severtime < reportStartDate ||  severtime > reportEndDate){
					alert("应在17:00-20:00填写!");
				}else{
					
					dutyDialog.show();
					var params={
							
							"dutyDepart":escape(response[0].user.organization.name),
							"dutyUser":escape(response[0].user.name),
							"dutyDate":returnFormatDate(response[0].dutyDate,"yyyy-MM-dd"),
							"dutyDay":escape(returnDay(response[0].week)),
							"dutyId":response[0].id
					};
					
		            dutyDialog.get('loader').load(params);
					
					
				}
			   
		   }else{
			   alert("当前值班人当天有多条值班信息，请删除至只剩一条后进行情况汇报填写！");
			   return;
		   }
		}
	});
}

function dataSearch(){
	
	var dutyDate =$("#dutyDate").val();
	
	ondutyStore.load({'dutyDate' : dutyDate});
}