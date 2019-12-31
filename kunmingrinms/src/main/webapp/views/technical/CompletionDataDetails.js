/**
 * 详情模块
 */
define('views/technical/CompletionDataDetails',[
	'bui/common',
	'common/form/FormContainer',,
	'common/data/PostLoad',
	'common/uploader/ViewUploader'],function(r){
	var BUI = r('bui/common'),
		FormContainer = r('common/form/FormContainer'),
		PostLoad = r('common/data/PostLoad'),
		ViewUploader = r('common/uploader/ViewUploader');
	var CompletionDataDetails = BUI.Overlay.Dialog.extend({
		/**
		 * 初始化
		 */
		initializer: function(){
			var _self = this;
			_self.addChild(_self._initFormContainer());	
		},
		/**
		 * 渲染
		 */
		renderUI: function(){
			var _self = this,contextPath = _self.get('contextPath');
			//定义按键
			var buttons = [];
			_self.set('buttons',buttons);
			_self._initShowData();//初始化要显示的数据(填充原始数据)
		},
		/**
		 * 初始化要显示的数据(填充原始数据)
		 */
		_initShowData:function(){
			var _self = this,
			contextPath = _self.get('contextPath'),
			CDataId = _self.get('CDataId');//获取被选中的竣工资料的id
			//使用PostLoad发起请求,获取选中的竣工资料信息
			var postLoad = new PostLoad({
				url:contextPath + 'completionAction/getCompletionById.cn',
				el:'#dataDetailDialog'
			});
			postLoad.load({id:CDataId},function(result){
				var data = result;
				$("#nameDetails").val(data.name);//填充图纸名称
				$("#departDetails").val(data.depart.name);
				$("#railLineDetails").val(data.railLineName);//填充线别名称
				var technicalInfoType = technicalInfo_type.typeName(data.technicalInfoType);//获取资料类别
				$("#technicalInfoTypeDetails").val(technicalInfoType);//填充资料类别
				$("#completionTimeDetails").val(data.completionDate);//填充竣工时间
				$("#createrDetails").val(data.createUser.name);//填充创建人
				$("#createDateDetails").val(data.createDate);//填充创建时间
				$("#addressDetails").val(data.address);//填充施工地址
				$("#remarkDetails").val(data.remark);//填充备注
				if(data.attachFile != null){//初始化上传附件
					if(data.attachFile.files.length>1){
						$("#filesDetails").css("height","auto");
					}
					_self._initUploadFiles(data.attachFile.id);
				}
			});
		},
		/**
		 * 根据附件ID,获取上传的附件
		 */
		 _initUploadFiles:function(attachFileId){
			 var _self = this,contextPath = _self.get('contextPath');
			 var pl = new PostLoad({
				url : contextPath + 'attachFile/getFilesByAttachFileId.cn',
				el : _self.get('el')
			 });
			 pl.load({attachFileId : attachFileId},function(result){
				 var attachFile = new ViewUploader({
						render: '#filesDetails',
						alreadyItems : result,
						previewUrl : contextPath+'views/common_page/commonPreview.jsp',
						servlet : "DownloadFileServlet"
					});
					attachFile.render();
			 });
		 },
		/**
		 * 初始化弹出框的表单
		 */
		_initFormContainer: function(){
			var _self = this,contextPath = _self.get('contextPath');
			var colNum = 2;
			var childs = [{
				label: '资料名称：',
				itemColspan: 2,
				item: '<input type="text" id="nameDetails" readOnly="readOnly"/>'
			},{
				label: '所属部门：',
				itemColspan: 1,
				item: '<input type="text" id="departDetails" readOnly="readOnly"/>'
			},{
				label: '线别名称：',
				itemColspan: 1,
				item: '<input type="text" id="railLineDetails" readOnly="readOnly"/>'
			},{
				label: '施工地点：',
				itemColspan : 2,
				item : '<input type="text" id="addressDetails" readOnly="readOnly">'
			},{
				label: '资料类别：',
				itemColspan: 1,
				item: '<input type="text" id="technicalInfoTypeDetails" readOnly="readOnly"/>'
			},{
				label: '竣工时间：',
				itemColspan: 1,
				item: '<input type="text" id="completionTimeDetails" readOnly="readOnly"/>'
			},{
				label: '创建人：',
				item: '<input type="text" id="createrDetails" readOnly="readOnly"/>'
			},{
				label: '创建时间：',
				item: '<input type="text" id="createDateDetails" readOnly="readOnly"/>'
			},{
				label: '附件：',
				itemColspan: 2,
				item: '<div id="filesDetails" style="height:30px" readOnly="readOnly"/>'
			},{
				label: '备注：',
				itemColspan : 2,
				item :'<textarea id="remarkDetails" style="width:99.5%;height:95px;" readOnly="readOnly"/>'
			}];
			var form = new FormContainer({
				id: 'dataFormDetails',
				colNum: colNum,
				formChildrens: childs
			});
			_self.set('formContainer',form);
			return form;
		},
		
	},{
		ATTRS: {
			id: {value : 'dataDetailDialog'},
			title: {value:'竣工资料详情'},
			width: {value:635},
	        height: {value:395},
	        CDataId: {},
	        contextPath: {},
	        closeAction: {value: 'destroy'},//关闭时销毁加载到主页面的HTML对象
	        mask: {value: true},
			events : {
				value : {
					/**
					 * 绑定关闭按钮事件
					 */
					'close' : false
				}
			}
		}
	
	});
	return CompletionDataDetails;
});
