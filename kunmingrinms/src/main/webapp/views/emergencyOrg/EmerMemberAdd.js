/**
 * 新增成员模块
 */
define('views/emergencyOrg/EmerMemberAdd',[
	'bui/common','common/form/FormContainer',
	'common/data/PostLoad','bui/form','bui/data',
	'bui/tree','bui/extensions/treepicker'
],function(r){
	var BUI = r('bui/common'),
	FormContainer = r('common/form/FormContainer'),
	PostLoad = r('common/data/PostLoad'),
	Data = r('bui/data'),
	Form = r('bui/form'),
	Tree = r('bui/tree'),
	TreePicker = r('bui/extensions/treepicker');
	var EmerMemberAdd = BUI.Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());
		},
		bindUI : function(){
			var _self = this;
			//初始化应急机构职务类型下拉选
			_self._initDutyType();
			//回显应急部门
			_self._getOrgName();
			//岗位
			_self._initPosition();
			//应急部门树
			_self._getTreeList();
		},
		renderUI: function(){
			var _self = this;
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
		_initDutyType: function(){
			//初始化应急机构职务类型下拉选
			emergencyOrg_dutyType.listData("#dutyAdd");
		},
		/**
		 * 初始化应急部门树结构
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
				trigger : '#orgNameMemberAdd',
				valueField : '#orgIdMemberAdd', //如果需要列表返回的value，放在隐藏域，那么指定隐藏域
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
		/**
		 * 初始化应急部门
		 */
		_getOrgName: function(){
			var _self = this,contextPath = _self.get('contextPath'),orgId = _self.get('orgId');
			var postLoad =new PostLoad({
				url:contextPath +  'emergencyOrgAction/getOrgDataById.cn',
				el:'#emerMemberAddDialog',
				loadMsg:'保存中...'
			}); 
	    	var data = {id : orgId};
			postLoad.load(data,function(result){
				$('#orgNameMemberAdd').val(result.name),
				$('#orgIdMemberAdd').val(orgId)
			});
		},
		/**
		 * 初始化岗位下拉选
		 */
		_initPosition: function(){
			var _self = this,contextPath = _self.get('contextPath');
//			//隐藏本页面单选框里的第一个空白框
//			$(".bui-stdmod-body select option[value='']").hide();
			var postLoad =new PostLoad({
				url:contextPath +  'emergencyOrgAction/getPositionData.cn',
				el:'#emerMemberAddDialog',
				loadMsg:''
			}); 
			postLoad.load({},function(result){
				for(var i=0 ; i<result.length ; i++){
					$('#positionAdd').append('<option value='+result[i].id+'>'+result[i].name+'</option>');
				}
			});
		},
		_initFormContainer: function(){
			var _self = this;
			var colNum = 2;
			var childs = [
				{
					label : '姓名：',
					redStarFlag : true,
					item : '<input type="text" name="peopleName" id="peopleNameAdd" style="width:98% ; height:35px" data-rules="{required:true,nameNum:10}"/>'
				},{
					label : '应急部门：',
					redStarFlag : true,
					item : '<input type="text" name="emergencyOrg" id="orgNameMemberAdd" style="width:98% ; height:35px"/>'+
						'<input name="orgNameId" id="orgIdMemberAdd" style="display:none;"/>'
				},{
					label : '移动电话：',
					item : '<input type="text" name="mobileNumber" id="mobileNumberAdd" style="width:98% ; height:35px" data-rules="{mobileNum:11}"/>'
				},{
					label : '职务：',
					item : '<select name="duty" id="dutyAdd" style="width:100%;height:30px"><option value="">请选择</option></select>'
				},{
					label : '办公电话：',
					item : '<input type="text" name="officeTelephone" id="officeTelephoneAdd"  style="width:98% ; height:35px" data-rules="{officeNum:11}"/>'
				},{
					label : '岗位：',
					item : '<select name="position" id="positionAdd" style="width:100%;height:30px"><option value="">请选择</option></select>'
				}];
			var form = new FormContainer({
				id : 'EmerMemberAdd',
				colNum : colNum,
				formChildrens : childs
			});
			return form;
		}
	},{
		ATTRS : {
			id : {value : 'emerMemberAddDialog'},
			title:{value:'新增应急人员'},
            width:{value:650},
            height:{value:200},
            orgId :{},
            contextPath : {},
            closeAction : {value:'destroy'},//关闭时销毁加载到主页面的HTML对象
            mask : {value:true},
            success:{
            	value : function(){
            		var _self = this,contextPath = _self.get('contextPath');
            		var formAdd = _self.getChild('EmerMemberAdd');
					// 验证不通过
			    	if(!formAdd.isValid()) {
			    		return ;
			    	};
			    	var postLoad =new PostLoad({
						url:contextPath +  'emergencyOrgAction/addOrgPeople.cn',
						el:'#emerMemberAddDialog',
						loadMsg:'保存中...'
					}); 
			    	/*var data = {
		    			peopleName : $('#peopleNameAdd').val(),
						orgNameId : $('#orgIdMemberAdd').val(),
						mobileNumber : $('#mobileNumberAdd').val(),
						duty : $('#dutyAdd').val(),
						officeTelephone : $('#officeTelephoneAdd').val(),
						position : $('#positionAdd').val()
			    	};*/
			    	var data = formAdd.serializeToObject();
			    	
					postLoad.load(data,function(result){
							_self.fire("emerMemberAddSave",{
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
					'emerMemberAddSave' : true,
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	});
	return EmerMemberAdd;
});