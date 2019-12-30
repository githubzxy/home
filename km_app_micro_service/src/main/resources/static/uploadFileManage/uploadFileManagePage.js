/**
 * 巡检上传资料管理主页
 */
define('/uploadFileManage/uploadFileManagePage',
	[
	 	'bui/common',
	 	'bui/data',
	 	'bui/grid',
	 	'bui/calendar',
	 	'common/data/PostLoad',
	 	'common/org/OrganizationPicker',
	 	'common/grid/SearchGridContainer',
	 	'/uploadFileManage/uploadFileManageDetail',
	],function (r) {
    var BUI = r('bui/common'),
    	  Data = r('bui/data'),
          Grid = r('bui/grid'),
          Calendar = r('bui/calendar'),
          PostLoad = r('common/data/PostLoad'),
          OrganizationPicker = r('common/org/OrganizationPicker'),
          uploadFileManageDetail = r('/uploadFileManage/uploadFileManageDetail'),
          SearchGridContainer = r('common/grid/SearchGridContainer');
    		
    var SEARCH_FORM_ID = 'searchForm';
    var uploadFileManagePage = BUI.Component.Controller.extend(
        {
            initializer : function(){
                var _self = this;
                _self.addChild(_self._initSearchGridContainer());
            },
            renderUI:function(){
                var _self=this;
                _self._initDate();
//              	_self._getLines();//获取线名下拉选数据
             	_self._getWorkShop();//获取车间下拉选数据
//                _self._initOrganizationPicker();
            },
            bindUI:function(){
                var _self = this,store = _self.get('store');
//                var orgPicker=_self.get('orgPicker');
                var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
                var tbar = table.get('tbar');
                /**
                 * 组织机构选择
                 */
                //重写重置按钮的点击事件
    			$("button[type='reset']").on('click',function(event){
    				event.preventDefault();
    				$("#startUploadDateSearch").val("");
    				$("#endUploadDateSearch").val("");
    				$("#name").val("");
    				$("#orgName").val("");

    			});
    			 //导出Excel
				$('#export').on('click',function(e){
					_self._exportExcel();

				});
                /**
                 * 操作按钮
                 */
                table.on('cellclick',function(ev){
                    var record = ev.record, //点击行的记录
                    	  target = $(ev.domTarget),
                    	  docId = record.docId; //点击的元素（数据库主键的值String）
                    	  busiId = record.busiId;//自定义的业务ID
                    	  /**
                           * 详情
                           */
                          if(target.hasClass('infoBtn')){
                          	var infoDialog = new uploadFileManageDetail({
                                  collectionName:_self.get('collectionName'),
                          			shiftId:docId
                              });
                              infoDialog.show();
                          }
                    	  /**
                    	   * 删除
      	              	   */
      	          	  if(target.hasClass('delBtn')){
      	               	   BUI.Message.Confirm('确认要删除吗？',function(){
      		                       var postLoad = new PostLoad({
      		                           url : '/uploadFileManageAction/removeDoc',
      		                           el : _self.get('el'),
      		                           loadMsg : '删除中...'
      		                       });
      		                       postLoad.load({id:docId,collectionName:_self.get('collectionName')},function (res) {
      		                    	   tbar.msg(res);
      		                    	   store.load();
      		                       });
      	               	   },'question');
      	                }	  
                });
            },
            /**
             * 初始化上查询下列表
             * @private
             */
            _initSearchGridContainer:function(){
                var _self = this;
                var searchGridContainer = new SearchGridContainer({
                    searchForm : _self._initSearchForm(),
                    columns : _self._initColumns(),
                    store : _self._initStore(),
                    searchGrid : _self._initSearchGrid()
                });
                return searchGridContainer;
            },
//          //导出本页数据
//    		_exportData: function(){
//    			var _self = this;
//    			var store=_self.get('store');
//    			console.log(store.getResult());
//
//    			// 导出本页数据
//    			var records = store.getResult();	
//     			var json = '[';
//    			for(var i = 0 ; i < records.length ; i++){
//    				var row = records[i];
//    				json += '{'
//    					+'"obstacleType":'+'"'+row.obstacleType+'",'
//    					+'"obstacleDuty":'+'"'+row.obstacleDuty+'",'
//    					+'"obstacleDate":'+'"'+row.obstacleDate+'",'
//    					+'"obligationDepart":'+'"'+row.obligationDepart+'",'
//    					+'"obstaclePlace":'+'"'+row.obstaclePlace+'",'
//    					+'"obstacleDeviceType":'+'"'+row.obstacleDeviceType+'",'
//    					+'"obstacleDeviceName":'+'"'+row.obstacleDeviceName+'",'
//    					+'"obstacleOccurDate":'+'"'+row.obstacleOccurDate+'",'
//    					+'"obstacleRecoverDate":'+'"'+row.obstacleRecoverDate+'",'
//    					+'"obstacleDelayMinutes":'+'"'+row.obstacleDelayMinutes+'",'
//    					
//    					+'"obstacleReceiver":'+'"'+row.obstacleReceiver+'"'
//    					+'},';
//    			}
//    			json = json.substring(0, json.length - 1);
//    			json += ']';
//    			$("#exportXlsJson").val(json);
//    			if(json != ']'){
//    				$("#exportForm").submit();
//    			}else{
//    				commonFailure("导出失败！");
//    			}
//    		},
            /**
			 * 导出本页数据
			 */
            _exportExcel:function(){
				var _self = this;
				$("#exportXlsJson").val("");//清空值
				$("#exportXlsJson").val(JSON.stringify(_self._getFormObject()));
				$("#exportForm").submit();
			},
			 /**
			 * 查询表单对象
			 */
			_getFormObject: function(){
				var _self = this;
				var form = _self.getChild(SEARCH_FORM_ID,true);
				var data = form.serializeToObject();
				data.collectionName = _self.get('collectionName');
				data.userId = _self.get('userId');
				return data;
			},
//    	    /**
//             * 获取线别
//             */
//            _getLines:function(){
//            	var _self=this;
//           	 $.ajax({
//    	                url:'/kmms/networkManageInfoAction/getLines',
//    	                type:'post',
//    	                dataType:"json",
//    	                success:function(res){
//    	               	 $("#accidentLineName").append("<option  value=''>请选择</option>");
//    	               	 for(var i=0;i<res.length;i++){
//    	               		 $("#accidentLineName").append("<option  value="+res[i]+">"+res[i]+"</option>");
//    	               	 }
//                    }
//                });
//            },
            /**
             * 获取车间下拉选数据
             */
            _getWorkShop:function(){
            	 var _self = this;
                 $.ajax({
                     url:'/kmms/networkManageInfoAction/getWorkShop',
                     type:'post',
                     dataType:"json",
                     success:function(res){
                    	 $("#accidentObligationDepart").append("<option  value=''>请选择</option>");
                    	 for(var i=0;i<res.length;i++){
                    		 $("#accidentObligationDepart").append("<option  value="+res[i].orgName+">"+res[i].orgName+"</option>");
                    	 }
                     }
                 })
            }, 
            /**
             * 初始化查询表单
             * @private
             */
            _initSearchForm:function(){
                return {
                    items : [
                        {label : '巡检日期起始',item : '<input type="text" name="startUploadDate" id="startUploadDateSearch" class="calendar" style="width: 175px;" readonly/>'},
                        {label : '巡检日期终止',item : '<input type="text" name="endUploadDate" id="endUploadDateSearch" class="calendar" style="width: 175px;" readonly/>'},
                        {label : '巡检地点',item : '<input type="text" name="name" id="name" style="width: 175px;" >'},
//                        {label : '所属机构',item : '<select name="orgName" id="orgName" style="width: 200px;" ></select>'}
                        {label : '所属机构',item : '<input type="text" id="orgName" name="orgName" style="width: 175px;"/>'}
                    ]};
            },
            /**
             * 初始化时间查询
             * @private
             */
            _initDate: function () {
                var _self = this;
                var startUploadDate = new Calendar.DatePicker({//加载日历控件
                    trigger: '#startUploadDateSearch',
                    showTime: true,
                    autoRender: true,
                    textField:'#startUploadDateSearch'
                });
                var endUploadDate = new Calendar.DatePicker({//加载日历控件
                    trigger: '#endUploadDateSearch',
                    showTime: true,
                    autoRender: true,
                    textField:'#endUploadDateSearch'
                });
                _self.set('startUploadDate', startUploadDate);
                _self.set('endUploadDate', endUploadDate);
            },
            /**
             * 初始化列表字段
             * @private
             */
            _initColumns:function () {
                var columns = [
                   {
                        title:'巡检日期',
                        dataIndex:'dateStr',
                        elCls : 'center',
                        width:'15%',
                        renderer:Grid.Format.datetimeRenderer
                    },{
                        title:'巡检人员',
                        dataIndex:'userName',
                        elCls : 'center',
                        width:'15%'
                    },{
                        title:'巡检地点',
                        dataIndex:'name',
                        elCls : 'center',
                        width:'15%'
                    }, {
                        title:'所属机构',
                        dataIndex:'orgName',
                        elCls : 'center',
                        width:'15%'
                    },{
                    	title:'巡检周期',
                    	dataIndex:'searchCycle',
                    	elCls : 'center',
                    	width:'15%'
                    },{
                        title:'备注',
                        dataIndex:'remark',
                        elCls : 'center',
                        width:'15%'
                    },{
                        title:'操作',
                        dataIndex:'status',
                        elCls : 'center',
                        width:'10%',
                        renderer:function (value) {
                            var button = '';
                            button += '<span class="grid-command infoBtn">详情</span>';
                            button += '<span class="grid-command delBtn">删除</span>';
                            return button;
                        }
                    }
                ];
                return columns;
            },
            /**
             * 初始化列表数据对象
             * @private
             */
            _initStore:function () {
                var _self = this;
                var store = new Data.Store({
                    url : "/uploadFileManageAction/findAll",
                    autoLoad : true ,
                    pageSize : 20,
                    proxy : {
                        method : 'post',
                        dataType : 'json'
                    },
                    params : {collectionName:_self.get('collectionName')}
                });
                _self.set('store',store);
                return store;
            },
            
            
            /**
             * 初始化列表展示对象
             * @private
             */
            _initSearchGrid:function () {
            	var _self = this;
                var searchGrid = {
				   tbarItems : [
//					   {
//					      id : 'export',
//					      btnCls : 'button button-small',
//					      text : '<i class="icon-download"></i>导出Excel'
//	                            +'<form action="/kmms/accidentQueryAction/exportXls" id="exportForm" method="post">'
//	    						+'<input type="hidden" name="exportXlsJson" id="exportXlsJson" />'
//	    						+'</form>',
//					   }
				   ],
				   plugins : [
					   Grid.Plugins.CheckSelection,
					   Grid.Plugins.RowNumber
					   ],
                };
                return searchGrid;
            }
        },
        {
            ATTRS : {
//                perId : {},
//                userId : {},//登录用户ID
//                userName : {},//登录用户名称
//                orgId : {},//登录用户组织机构ID
//                orgName : {},//登录用户组织机构名称
//                rootOrgId:{value:'8affa073533aa3d601533bbef63e0010'},
//                rootOrgText:{value:'昆明通信段'},
                collectionName : {value:'uploadFileManage'}//存储表名
            }
        });
    return uploadFileManagePage;
});