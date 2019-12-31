/**
 * 修改成员模块
 */
define('views/emergencyOrg/EmerMemberUpdate',[
	'bui/common','common/form/FormContainer','bui/data',
	'common/data/PostLoad','bui/extensions/treepicker',
	'bui/tree','bui/form',
],function(r){
	var BUI = r('bui/common'),
	Data = r('bui/data'),
	Tree = r('bui/tree'),
	TreePicker = r('bui/extensions/treepicker'),
	FormContainer = r('common/form/FormContainer'),
	PostLoad = r('common/data/PostLoad'),
	Form = r('bui/form');
	var EmerMemberUpdate = BUI.Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		bindUI : function(){
			var _self = this;
			//隐藏本页面单选框里的第一个空白框
//			$(".bui-stdmod-body select option[value='']").hide();
			
			//回显应急部门
//			_self._getOrgName();
			//初始化应急机构职务类型下拉选
			_self._initDutyType();
			//初始化应急部门树
			_self._getTreeList();
		},
		renderUI: function(){
			var _self = this;
			//获取表格显示数据
			_self._getShowData();
			//定义按键
			var buttons = [
                {
                  text:'保存',
                  elCls : 'button',
                  handler : function(){
                	  var success = _self.get('success');
			            if(success){
			              success.call(_self);
			            }
                  }
                },{
                  text:'关闭',
                  elCls : 'button',
                  handler : function(){
                	  if(this.onCancel() !== false){
				        	this.close();
				        }
                  }
                }
              ];
			_self.set('buttons',buttons);
			
			//自定义验证规则，姓名限制字数
			Form.Rules.add({
				name : 'nameNum',  //规则名称
		        msg : '字数不能大于10个',//默认显示的错误信息
		        validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
		            if(value.length>baseValue){
		              return formatMsg;
		            }
		          }
			});
			Form.Rules.add({
		         name : 'officeNum',  //规则名称
		         msg : '办公电话位数不能大于11个',//默认显示的错误信息
		         validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
		             if(value.length>baseValue){
		               return formatMsg;
		             }
		           }
		        });
			Form.Rules.add({
		         name : 'mobileNum',  //规则名称
		         msg : '手机位数不能大于11个',//默认显示的错误信息
		         validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
		             if(value.length>baseValue){
		               return formatMsg;
		             }
		           }
		        });
		},
		/*_getOrgName: function(){
			var _self = this,contextPath = _self.get('contextPath'),orgId = _self.get('orgId');
			var postLoad =new PostLoad({
				url:contextPath +  'emergencyOrgAction/getOrgDataById.cn',
				el:'#emerMemberUpdateDialog',
				loadMsg:''
			}); 
	    	var data = {id : orgId};
			postLoad.load(data,function(result){
//				console.log(result);
				$('#orgNameMemberUpdate').val(result.name),
				$('#orgIdMemberUpdate').val(orgId)
			});
		},*/
		/**
		 * 获取表格显示数据
		 */
		_getShowData: function(){
			var _self = this,peopleId = _self.get('peopleId');
			var postLoad =new PostLoad({
				url:contextPath + 'emergencyOrgAction/getPeopleDataById.cn',
				el:'#emerMemberUpdateDialog',
				loadMsg:'保存中...'
			}); 
	    	var data = {id : peopleId};
			postLoad.load(data,function(result){
//				console.log(result[0]);
				$('#peopleNameUpdate').val(result[0].name);
				$('#orgNameMemberUpdate').val(result[0].emergencyOrg);
				$('#orgIdMemberUpdate').val(result[0].orgId);
				$('#mobileNumberUpdate').val(result[0].mobileNumber);
				$('#dutyUpdate').val(result[0].duty),
				$('#officeTelephoneUpdate').val(result[0].officeTelephone);
//				console.log(result[0].user);
				
				//当数据有User的时候
				if(result[0].user!=null){
					//电话号码设置为不可修改 岗位默认将select设置为的display:none
					$("#mobileNumberUpdate").attr("disabled","disabled");
					$("#officeTelephoneUpdate").attr("disabled","disabled");
//					console.log(result[0].position);
					if(result[0].position==""){
	 					$("#positionName").val("");
	 				}else{ 						
	 					$("#positionName").val(" "+result[0].position);
	 				}
	 			//当数据User为空的时候
				}else{
					//将岗位的select激活
					$("#positionUpdate").css("display","block");
					$("#positionName").css("display","none");
					//result[0].positionId岗位的id用于给option的value赋值从而获取前端映射对应的岗位名称 
					if(result[0].positionId==""){
	 					$("#positionUpdate").val("");
	 				}else{ 						
	 					$("#positionUpdate").val(result[0].positionId);
	 				}
				}
				//初始化岗位下拉选
				_self._initPosition(result[0].positionId);
			});
		},
		/**
		 * 初始化职务类型下拉选
		 */
		_initDutyType: function(){
			emergencyOrg_dutyType.listData("#dutyUpdate");
		},
		/**
		 * 初始化岗位下拉选
		 */
		_initPosition: function(positionId){
			var _self = this,contextPath = _self.get('contextPath');
			var postLoad =new PostLoad({
				url:contextPath + 'emergencyOrgAction/getPositionData.cn',
				el:'#emerMemberUpdateDialog',
				loadMsg:''
			}); 
			postLoad.load({},function(result){
				for(var i=0 ; i<result.length ; i++){
					if(result[i].id != positionId){
						$('#positionUpdate').append('<option value='+result[i].id+'>'+result[i].name+'</option>');
					}else{
						$('#positionUpdate').append('<option selected="selected" value='+result[i].id+'>'+result[i].name+'</option>');
					}
				}
			});
		},
		/**
		 * 初始化应急部门树
		 */
		_getTreeList: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var treeStore = new Data.TreeStore({
				root : {
					id : '4028816038c12a4a0138c16b400b000a',
					text : '昆明通信段'
				},
				url : contextPath+'emergencyOrgAction/getOrgChildrenByPid.cn',
				proxy : {
					method : 'post',
					dataType : 'json'
				},
				map : {	// 节点映射
					'name' : 'text',	// 节点显示文本
					'isLeaf' : 'leaf'	// 是否为叶子节点
				}
			});
			treeStore.load({id : '4028816038c12a4a0138c16b400b000a'});
			var tree = new Tree.TreeList({
				store : treeStore,
				showRoot : true,
				checkType : 'custom',
				showLine : true,	//显示连接线
				cascadeCheckd : false, //不级联勾选
				width : 223, 
				height : 230
			});
			var treePicker = new TreePicker({
				trigger : '#orgNameMemberUpdate',
				valueField : '#orgIdMemberUpdate', //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
				selectStatus : 'selected',//设置勾选作为状态改变的事件
				align:{
					node:'window' ,
					points: ['bl', 'tl'],	// 弹出窗口在文本框的正上方
					offset : [0,0]
				},
				autoRender : true,
				children : [ tree ] //配置picker内的列表
			});
			return treePicker;
		},
		_initFormContainer: function(){
			var _self = this;
			var colNum = 2;
			var childs = [
				{
					label : '姓名：',
					redStarFlag : true,
					item : '<input type="text" name="peopleName" id="peopleNameUpdate" style="width:98% ; height:35px" data-rules="{required:true,nameNum:10}"/>'
				},{
					label : '应急部门：',
					redStarFlag : true,
					item : '<input type="text" name="emergencyOrg" id="orgNameMemberUpdate" style="width:98% ; height:35px" data-rules="{required:true}" readonly="readonly"/>'+
						'<input name="orgNameId" id="orgIdMemberUpdate" style="display:none;"/>'
				},{
					label : '移动电话：',
					item : '<input type="text" name="mobileNumber" id="mobileNumberUpdate" style="width:98% ; height:35px" data-rules="{mobileNum:11}"/>'
				},{
					label : '职务：',
					item : '<select name="duty" id="dutyUpdate" style="width:100%;height:30px"><option value="">请选择</option></select>'
				},{
					label : '办公电话：',
					item : '<input type="text" name="officeTelephone" id="officeTelephoneUpdate"  style="width:98% ; height:35px" data-rules="{officeNum:11}"/>'
				},{
					label : '岗位：',
					item : '<input type="text" id="positionName" readonly="readonly" style="height:35px;background-color: rgb(235, 235, 228);"/>'+
								'<select name="position" id="positionUpdate" style="width:100%;height:30px;display:none;"><option value="">请选择</option></select>'
				}];
			var form = new FormContainer({
				id : 'EmerMemberUpdate',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		},
	},{
		ATTRS : {
			id : {value : 'emerMemberUpdateDialog'},
			title:{value:'修改应急人员'},
            width:{value:650},
            height:{value:210},
            orgId :{},
            peopleId: {},
            contextPath : {},
            closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success: {
            	value : function(){
            		var _self = this,contextPath = _self.get('contextPath'),peopleId=_self.get('peopleId');
            		var formUpdate = _self.getChild('EmerMemberUpdate');
					// 验证不通过
			    	if(!formUpdate.isValid()) {
			    		return;
			    	};
			    	var postLoad =new PostLoad({
						url:contextPath +  'emergencyOrgAction/updateOrgPeople.cn',
						el:'#emerMemberUpdateDialog',
						loadMsg:'保存中...'
					});
			    	/*var data = {
			    		peopleId: peopleId,
			    		peopleName : $('#peopleNameUpdate').val(),
						orgNameId : $('#orgIdMemberUpdate').val(),
						mobileNumber : $('#mobileNumberUpdate').val(),
						duty : $('#dutyUpdate').val(),
						officeTelephone : $('#officeTelephoneUpdate').val(),
						position : $('#positionUpdate').val()
			    	};*/
			    	var data = formUpdate.serializeToObject();
			    	data.peopleId = peopleId;
			    	//quyy 2018-4-27 设置为disabled的input，采用serializeToObject()方法获取不到它的value值
			    	data.mobileNumber = $('#mobileNumberUpdate').val();
			    	data.officeTelephone =  $('#officeTelephoneUpdate').val();
			    	postLoad.load(data,function(result){
						_self.fire("emerMemberUpdateSave",{
							result : result
					})
				});
            	}
            },
            cancel : {
				value : function(){
					var _self = this;
					_self.fire("close");
				}
			},
			events : {
				value : {
					/**
					 * 绑定保存按钮事件
					 */
					'emerMemberUpdateSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return EmerMemberUpdate;
});