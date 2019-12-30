/**
 * 机房技术资料及台账详情
 * @author zhouxingyu
 * @date 19-3-27
 */
define('/dataStatisticsManage/dataStatisticsManageDetail', [
	'bui/common','bui/data','bui/grid','bui/overlay',
	'common/grid/GridBtn',
	'common/uploader/ViewUploader',
    'common/form/FormContainer',
    'common/data/PostLoad'
], function(r) {
    var BUI = r('bui/common'),Data = r('bui/data'),Grid = r('bui/grid'),Overlay = r('bui/overlay'),
    	GridBtn = r('common/grid/GridBtn'),
        ViewUploader = r('common/uploader/ViewUploader'),
        PostLoad = r('common/data/PostLoad'),
        FormContainer = r('common/form/FormContainer');
    var dataStatisticsManageDetail = Overlay.Dialog.extend({
        initializer: function() {
            var _self = this;
            _self.addChild(_self._initGridContainer());
//            _self.addChild(_self._initFormContainer());
        },
        renderUI: function() {
            var _self = this;
            $("#dataStatisticsManageDetail .bui-ext-close").css("display","none");
			$('.dataStatisticsManageDetailDialogClass .bui-stdmod-body').attr("style","overflow-y:hidden;overflow-x:hidden;");
			$('.dataStatisticsManageDetailDialogClass .bui-grid .bui-grid-body').attr("style","overflow-y:scroll;overflow-x:auto;height:300px;");
            var store = _self.get('dataStatisticsManageDetailStore');
			store.load();
            //显示数据
//            _self._getShowData();
        },
        bindUI: function() {
            var _self = this;
           
            //定义按键
            var buttons = [{
                text: '关闭',
                elCls: 'button',
                handler: function() {
                    if (this.onCancel() !== false) {
                        this.close();
                    }
                }
            }];
            _self.set('buttons', buttons);
        },
        
        
        _initGridContainer : function(){
			var _self = this;
			var replyDetailGrid = BUI.merge({
				id : 'dataStatisticsManageDetailGrid',
				columns : _self._initColumns(),
				store : _self._initGridData(),
				height:'auto',
				loadMask:true,
				useEmptyCell : false,
				elCls : 'dataStatisticsManageDetailGridClass',
				plugins : [Grid.Plugins.RowNumber],
			});
			var gridBtn = new GridBtn(replyDetailGrid);
			return gridBtn;
		},
		
		_initColumns : function(){
			return [
			        {
			        	title:'巡检日期',
			        	dataIndex:'dateStr',
			        	elCls:'center',
			        	width:'30%'
			        },
			        {
			        	title:'巡检人员',
			        	dataIndex:'userName',
			        	elCls:'center',
			        	width:'30%'
			        },
			        {
			        	title:'备注',
			        	dataIndex:'remark',
			        	elCls:'center',
			        	width:'40%',
			        }]
		},
		
		_initGridData : function(){
			var _self = this;
			var store = new Data.Store({
				url:'/dataStatisticsManageAction/findUploadFileById',
				pageSize:10,
				params:{
					docId:_self.get('shiftId'),
					yearStart : _self.get('yearStart'),
		        	yearEnd : _self.get('yearEnd'),
		        	monthStart : _self.get('monthStart'),
		        	monthEnd : _self.get('monthEnd'),
					collectionName : _self.get("collectionName"),
				},
				proxy:{
					method:'post',
					dataType:'json'
				},
			});
			_self.set('dataStatisticsManageDetailStore',store);
			return store;
		},
        
        
        /**
         * 获取显示数据
         */
        _getShowData: function() {
            var _self = this,
                shiftId = _self.get('shiftId'),
                form = _self.get("formContainer");
            $.ajax({
                url: '/uploadFileManageAction/findById',
                data: { id: shiftId, collectionName: _self.get('collectionName') },
                type: 'post',
                dataType: "json",
                success: function(reslut) {
                	var data = reslut.data;
                    if (data) {
                    	$("#formContainer #dateStr").val(data.dateStr);
                    	$("#formContainer #userName").val(data.userName);
                    	$("#formContainer #name").val(data.name);
                        $("#formContainer #orgName").val(data.orgName);
                        $("#formContainer #searchCycle").val(data.searchCycle);
                        $("#formContainer #remark").val(data.remark);
//                        var html = '<a href='+data.savePath+' target="_blank">查看</a>'
//                        $("#formContainer #uploadFileArr").html(html);
                        if(data.uploadFileArr) {
            				_self._initViewUploader(data.uploadFileArr);
            			}
                    }
                }
            });
        },
        /**
		 * 初始化上传文件（仅用于查看）
		 */
		_initViewUploader:function(uploadFiles){
			var _self = this;
			var viewFiles = new ViewUploader({
				render: '#formContainer #viewUploadfile',
				alreadyItems : uploadFiles,
				previewOnline : true
			});
			viewFiles.render();
		},
        /**
         * 初始化FormContainer
         */
        _initFormContainer: function() {
            var _self = this;
            var colNum = 2;
            var childs = [
				{
					label: '巡检日期：',
					itemColspan: 1,
					item: '<input type="text" name="dateStr" id="dateStr" data-rules="{required:true,maxlength:200}" readonly/>'
				},{
					label: '巡检人员：',
					itemColspan: 1,
					item : '<input type="text" id="userName" name="userName" data-rules="{maxlength:200}" readonly/>'
				},{
					label: '巡检地点：',
					itemColspan: 1,
					item : '<input type="text" id="name" name="name" data-rules="{maxlength:200}" readonly/>'
				},{
					label: '所属机构 ：',
					itemColspan: 1,
					item: '<input type="text" name="orgName" id="orgName" data-rules="{maxlength:200}" readonly/>'
				},{
					label: '巡检周期：',
					itemColspan : 1,
					item: '<input type="text" name="searchCycle" id="searchCycle" data-rules="{maxlength:200}" readonly/>'
				},{
					label: '备注：',
					itemColspan : 1,
					item: '<input type="text" name="remark" id="remark" data-rules="{maxlength:200}" readonly/>'
				},{
					label: 'APP上传资料：',
					itemColspan : 2,
//					item:'<div id="uploadFileArr"></div>'
					item: '<div name="viewUploadfile" id="viewUploadfile" style="height:100px;overflow-y:auto"></div>'
				}
            ];
            var form = new FormContainer({
                id: 'technicalDocumentShow',
                colNum: colNum,
                formChildrens: childs,
            });
            _self.set('formContainer', form);
            return form;
        },

    }, {
        ATTRS: {
            id: { value: 'dataStatisticsManageDetailDialog' },
            elAttrs:{value: {id:"dataStatisticsManageDetail"}},
            elCls : {value:'dataStatisticsManageDetailDialogClass'},
            title: { value: '巡检列表' },
            width: { value: 650 },
            height: { value: 400 },
            contextPath: {},
            shiftId: {},
            closeAction: { value: 'destroy' }, //关闭时销毁加载到主页面的HTML对象
            mask: { value: true },
            collectionName: {},
            userId: {},
            yearStart : {},
        	yearEnd : {},
        	monthStart : {},
        	monthEnd : {},
        }
    });
    return dataStatisticsManageDetail;
});