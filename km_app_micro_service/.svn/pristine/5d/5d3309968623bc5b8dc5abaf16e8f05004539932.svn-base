/**
 * 巡检数据统计管理主页
 */
define('/dataStatisticsManage/dataStatisticsManagePage',
	[
	 	'bui/common',
	 	'bui/data',
	 	'bui/grid',
	 	'bui/calendar',
	 	'common/date/YearPicker',
	 	'common/data/PostLoad',
	 	'common/org/OrganizationPicker',
	 	'common/grid/SearchGridContainer',
	 	'/dataStatisticsManage/dataStatisticsManageDetail',
	],function (r) {
    var BUI = r('bui/common'),
    	  Data = r('bui/data'),
          Grid = r('bui/grid'),
          Calendar = r('bui/calendar'),
          PostLoad = r('common/data/PostLoad'),
          YearPicker = r('common/date/YearPicker'),
          OrganizationPicker = r('common/org/OrganizationPicker'),
          dataStatisticsManageDetail = r('/dataStatisticsManage/dataStatisticsManageDetail'),
          SearchGridContainer = r('common/grid/SearchGridContainer');
    		
    var SEARCH_FORM_ID = 'searchForm';
    var dataStatisticsManagePage = BUI.Component.Controller.extend(
        {
            initializer : function(){
                var _self = this;
                _self.addChild(_self._initSearchGridContainer());
            },
            renderUI:function(){
                var _self=this;
//                _self._initDate();
                _self._initSelect();
                _self._initYearPicker();
//              	_self._getLines();//获取线名下拉选数据
//             	_self._getWorkShop();//获取车间下拉选数据
//                _self._initOrganizationPicker();
                
                
                _self.get('store').load({
                	yearStart : $('#yearStart').val(),
                	yearEnd : $('#yearEnd').val(),
                	monthStart : $('#monthStart').val(),
                	monthEnd : $('#monthEnd').val(),
                	searchCycle : $('#searchCycle').val(),
                });
                
            },
            bindUI:function(){
                var _self = this,store = _self.get('store');
//                var orgPicker=_self.get('orgPicker');
                var table = _self.getChild(SearchGridContainer.SEARCH_GRID_ID,true);
                var tbar = table.get('tbar');
                
                $("#searchCycle").on('change',function(e){
                	var searchCycle = $("#searchCycle").val();
                	if(searchCycle=="1月/次"){
//                		var month = new Date().getMonth()+1;
                		$("#monthStart").empty();
            			$("#monthStart").append("<option  value='1月'>1月</option>");
            			$("#monthStart").append("<option  value='2月'>2月</option>");
            			$("#monthStart").append("<option  value='3月'>3月</option>");
            			$("#monthStart").append("<option  value='4月'>4月</option>");
            			$("#monthStart").append("<option  value='5月'>5月</option>");
            			$("#monthStart").append("<option  value='6月'>6月</option>");
            			$("#monthStart").append("<option  value='7月'>7月</option>");
            			$("#monthStart").append("<option  value='8月'>8月</option>");
            			$("#monthStart").append("<option  value='9月'>9月</option>");
            			$("#monthStart").append("<option  value='10月'>10月</option>");
            			$("#monthStart").append("<option  value='11月'>11月</option>");
            			$("#monthStart").append("<option  value='12月'>12月</option>");
            			
//            			$("#monthStart option[value='"+month+"月"+"']").attr("selected",true)
            			
            			var monthStart = $("#monthStart").val();
            			monthStart = monthStart.substring(0, monthStart.indexOf("月"));
            			$("#monthEnd").empty();
                    	for(var i = monthStart; i <= 12; i++){
                    		$("#monthEnd").append("<option  value='"+i+"月"+"'>"+i+"月"+"</option>");
                    	}
                	}
                	if(searchCycle=="3月/次"){
                		$("#monthStart").empty();
                		$("#monthStart").append("<option  value='1月'>1月</option>");
            			$("#monthStart").append("<option  value='4月'>4月</option>");
            			$("#monthStart").append("<option  value='7月'>7月</option>");
            			$("#monthStart").append("<option  value='10月'>10月</option>");
            			$("#monthEnd").empty();
            			$("#monthEnd").append("<option  value='3月'>3月</option>");
            			$("#monthEnd").append("<option  value='6月'>6月</option>");
            			$("#monthEnd").append("<option  value='9月'>9月</option>");
            			$("#monthEnd").append("<option  value='12月'>12月</option>");
                	}
                	if(searchCycle=="6月/次"){
                		$("#monthStart").empty();
                		$("#monthStart").append("<option  value='1月'>1月</option>");
            			$("#monthStart").append("<option  value='7月'>7月</option>");
            			$("#monthEnd").empty();
            			$("#monthEnd").append("<option  value='6月'>6月</option>");
            			$("#monthEnd").append("<option  value='12月'>12月</option>");
                	}
                	if(searchCycle=="1年/次"){
                		$("#monthStart").empty();
                		$("#monthStart").append("<option  value='1月'>1月</option>");
            			$("#monthEnd").empty();
            			$("#monthEnd").append("<option  value='12月'>12月</option>");
                	}
                });
                
                $("#monthStart").on('change',function(e){
                	if($("#searchCycle").val()=="1月/次"){
                		var monthStart = $("#monthStart").val();
        				monthStart = monthStart.substring(0, monthStart.indexOf("月"));
                    	$("#monthEnd").empty();
                    	for(var i = monthStart; i <= 12; i++){
                    		$("#monthEnd").append("<option  value='"+i+"月"+"'>"+i+"月"+"</option>");
                    	}
                	}
                	
                	if($("#searchCycle").val()=="3月/次"){
                		var monthStart = $("#monthStart").val();
//                		console.log(monthStart);
//        				monthStart = monthStart.substring(0, monthStart.indexOf("月"));
//        				var monthEnd = parseInt(monthStart)+2;
////        				monthEnd = monthEnd.toString();
//        				console.log(monthStart);
//        				console.log(monthEnd);
//                    	$("#monthEnd").empty();
//                    	for(var i = monthEnd; i <= 12; i++){
//                    		$("#monthEnd").append("<option  value='"+i+"月"+"'>"+i+"月"+"</option>");
//                    	}
                		if(monthStart=="1月"){
                			$("#monthEnd").empty();
                			$("#monthEnd").append("<option  value='3月'>3月</option>");
                			$("#monthEnd").append("<option  value='6月'>6月</option>");
                			$("#monthEnd").append("<option  value='9月'>9月</option>");
                			$("#monthEnd").append("<option  value='12月'>12月</option>");
                		}
                		if(monthStart=="4月"){
                			$("#monthEnd").empty();
                			$("#monthEnd").append("<option  value='6月'>6月</option>");
                			$("#monthEnd").append("<option  value='9月'>9月</option>");
                			$("#monthEnd").append("<option  value='12月'>12月</option>");
                		}
                		if(monthStart=="7月"){
                			$("#monthEnd").empty();
                			$("#monthEnd").append("<option  value='9月'>9月</option>");
                			$("#monthEnd").append("<option  value='12月'>12月</option>");
                		}
                		if(monthStart=="10月"){
                			$("#monthEnd").empty();
                			$("#monthEnd").append("<option  value='12月'>12月</option>");
                		}
                	}
                	if($("#searchCycle").val()=="6月/次"){
                		var monthStart = $("#monthStart").val();
                		if(monthStart=="1月"){
                			$("#monthEnd").empty();
                			$("#monthEnd").append("<option  value='6月'>6月</option>");
                			$("#monthEnd").append("<option  value='12月'>12月</option>");
                		}
                		if(monthStart=="7月"){
                			$("#monthEnd").empty();
                			$("#monthEnd").append("<option  value='12月'>12月</option>");
                		}
                	}
    			});
                
                /**
                 * 组织机构选择
                 */
                //重写重置按钮的点击事件
    			$("button[type='reset']").on('click',function(event){
    				event.preventDefault();
//    				$("#startUploadDateSearch").val("");
//    				$("#endUploadDateSearch").val("");
//    				$("#searchCycle").val("1月/次");
    				$("#name").val("");
    				$("#orgName").val("");

    			});
    			 //导出Excel
				$('#export').on('click',function(e){
					_self._exportExcel();

				});
				 //按页面查询条件导出Excel
	            $('#exportBy').on('click', function(e) {
	                var records = store.getResult();
	                if (records.length != 0) {
	                    _self._exportXls(records);
	                } else {
	                    tbar.msg({ msg: '没有数据可以导出！', status: '0' });
	                }
	            });
                /**
                 * 操作按钮
                 */
                table.on('cellclick',function(ev){
                    var record = ev.record, //点击行的记录
                    	  target = $(ev.domTarget),
                    	  docId = record.docId; //点击的元素（数据库主键的值String）
                    	  busiId = record.busiId;//自定义的业务ID
//                    console.log(record);
                    	  /**
                           * 详情
                           */
                          if(target.hasClass('infoBtn')){
                          	var infoDialog = new dataStatisticsManageDetail({
                          		collectionName:_self.get('uploadFileManage'),
                          		shiftId:docId,
                          		yearStart : $('#yearStart').val(),
                            	yearEnd : $('#yearEnd').val(),
                            	monthStart : $('#monthStart').val(),
                            	monthEnd : $('#monthEnd').val(),
                          	});
                          	infoDialog.show();
                          }
                    	  /**
                    	   * 删除
      	              	   */
//      	          	  if(target.hasClass('delBtn')){
//      	               	   BUI.Message.Confirm('确认要删除吗？',function(){
//      		                       var postLoad = new PostLoad({
//      		                           url : '/uploadFileManageAction/removeDoc',
//      		                           el : _self.get('el'),
//      		                           loadMsg : '删除中...'
//      		                       });
//      		                       postLoad.load({id:docId,collectionName:_self.get('collectionName')},function (res) {
//      		                    	   tbar.msg(res);
//      		                    	   store.load();
//      		                       });
//      	               	   },'question');
//      	                }	  
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
//            _exportExcel:function(){
//				var _self = this;
//				$("#exportXlsJson").val("");//清空值
//				$("#exportXlsJson").val(JSON.stringify(_self._getFormObject()));
//				$("#exportForm").submit();
//			},
			 /**
	         * 导出本页数据
	         */
	        _exportXls: function(records) {
	            $('#exportXlsJson').val(''); //清空值
	            // 拼接导出数据的JSON字符串
	            var json = '[';
	            for (var i = 0; i < records.length; i++) {
	                var row = records[i];
	                json += '{' +
	                    '"name":' + '"' + row.name + '",' +
	                    '"orgName":' + '"' + row.orgName + '",' +
	                    '"searchCycle":' + '"' + row.searchCycle + '",' +
	                    '"searchNumber":' + '"' + row.searchNumber + '",' +
	                    '"finishRate":' + '"' + row.finishRate + '"' +
	                   // '"date":' + '"' + Grid.Format.datetimeRenderer(row.date) + '"' +
	                    '},';
	            }
	            json = json.substring(0, json.length - 1);
	            json += ']';
	            $('#exportXlsJson').val(json);
	            $('#exportForm').submit();
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
//                        {label : '巡检日期起始',item : '<input type="text" name="startUploadDate" id="startUploadDateSearch" class="calendar" style="width: 175px;" readonly/>'},
//                        {label : '巡检日期终止',item : '<input type="text" name="endUploadDate" id="endUploadDateSearch" class="calendar" style="width: 175px;" readonly/>'},
                        {label : '巡检日期起始',item : '<input name="yearStart" type="text" id="yearStart" style="width: 71px; readonly="readonly"/>'+'-'+'<select name="monthStart" id="monthStart" style="width:100px;"/></select>'},
                        {label : '巡检日期终止',item : '<input name="yearEnd" type="text" id="yearEnd" style="width: 71px; readonly="readonly"/>'+'-'+'<select name="monthEnd" id="monthEnd" style="width:100px;"/></select>'},
                        {label : '巡检周期',item : '<select name="searchCycle" id="searchCycle" style="width: 200px;" ></select>'},
                        {label : '巡检地点',item : '<input type="text" name="name" id="name" style="width: 175px;" >'},
//                        {label : '所属机构',item : '<select name="orgName" id="orgName" style="width: 200px;" ></select>'}
                        {label : '所属机构',item : '<input type="text" id="orgName" name="orgName" style="width: 175px;"/>'}
                    ]};
            },
            
            _initYearPicker : function(){
    			var _self = this;
    			var yearPickerStart = new YearPicker({
    				trigger : '#yearStart',
    				year : new Date().getFullYear(),
    				autoHide : true,
    				align : {
    					points:['bl','tl']
    				},
    				success:function(){
    					var year = this.get('year');
    					$('#yearStart').val(year);
    					$('#yearEnd').val(year);
    					this.hide();
    				},
    				cancel:function(){
    					this.hide();
    				},
    			});
    			yearPickerStart.render();
    			// 默认选中当前年份
    			$('#yearStart').val((new Date).getFullYear());
    			//加载表格数据
//    			_self.get('store').load({year : $('#yearStart').val()});
    			
    			
    			var yearPickerEnd = new YearPicker({
    				trigger : '#yearEnd',
    				year : new Date().getFullYear(),
    				autoHide : true,
    				align : {
    					points:['bl','tl']
    				},
    				success:function(){
    					var year = this.get('year');
    					$('#yearStart').val(year);
    					$('#yearEnd').val(year);
    					this.hide();
    				},
    				cancel:function(){
    					this.hide();
    				},
    			});
    			yearPickerEnd.render();
    			// 默认选中当前年份
    			$('#yearEnd').val((new Date).getFullYear());
    			
    			
    		},
    		
    		_initSelect: function(){
    			var month = new Date().getMonth()+1;
    			
    			$("#monthStart").append("<option  value='1月'>1月</option>");
    			$("#monthStart").append("<option  value='2月'>2月</option>");
    			$("#monthStart").append("<option  value='3月'>3月</option>");
    			$("#monthStart").append("<option  value='4月'>4月</option>");
    			$("#monthStart").append("<option  value='5月'>5月</option>");
    			$("#monthStart").append("<option  value='6月'>6月</option>");
    			$("#monthStart").append("<option  value='7月'>7月</option>");
    			$("#monthStart").append("<option  value='8月'>8月</option>");
    			$("#monthStart").append("<option  value='9月'>9月</option>");
    			$("#monthStart").append("<option  value='10月'>10月</option>");
    			$("#monthStart").append("<option  value='11月'>11月</option>");
    			$("#monthStart").append("<option  value='12月'>12月</option>");
    			
    			$("#monthStart option[value='"+month+"月"+"']").attr("selected",true)
    			
    			var monthStart = $("#monthStart").val();
    			monthStart = monthStart.substring(0, monthStart.indexOf("月"));
            	for(var i = monthStart; i <= 12; i++){
            		$("#monthEnd").append("<option  value='"+i+"月"+"'>"+i+"月"+"</option>");
            	}
    			
//    			$("#monthEnd").append("<option  value='1月'>1月</option>");
//    			$("#monthEnd").append("<option  value='2月'>2月</option>");
//    			$("#monthEnd").append("<option  value='3月'>3月</option>");
//    			$("#monthEnd").append("<option  value='4月'>4月</option>");
//    			$("#monthEnd").append("<option  value='5月'>5月</option>");
//    			$("#monthEnd").append("<option  value='6月'>6月</option>");
//    			$("#monthEnd").append("<option  value='7月'>7月</option>");
//    			$("#monthEnd").append("<option  value='8月'>8月</option>");
//    			$("#monthEnd").append("<option  value='9月'>9月</option>");
//    			$("#monthEnd").append("<option  value='10月'>10月</option>");
//    			$("#monthEnd").append("<option  value='11月'>11月</option>");
//    			$("#monthEnd").append("<option  value='12月'>12月</option>");
    			
//    			$("#monthEnd option[value='"+month+"月"+"']").attr("selected",true)
    			
    			
    			$("#searchCycle").append("<option  value='1月/次'>1月/次</option>");
                $("#searchCycle").append("<option  value='3月/次'>3月/次</option>");
                $("#searchCycle").append("<option  value='6月/次'>6月/次</option>");
                $("#searchCycle").append("<option  value='1年/次'>1年/次</option>");
            },
            
            /**
             * 初始化时间查询
             * @private
             */
            _initDate: function () {
                var _self = this;
                var startUploadDate = new Calendar.DatePicker({//加载日历控件
                    trigger: '#startUploadDateSearch',
//                    showTime: true,
                    autoRender: true,
                    textField:'#startUploadDateSearch'
                });
                var endUploadDate = new Calendar.DatePicker({//加载日历控件
                    trigger: '#endUploadDateSearch',
//                    showTime: true,
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
//                   {
//                        title:'巡检日期',
//                        dataIndex:'dateStr',
//                        elCls : 'center',
//                        width:'15%',
//                        renderer:Grid.Format.datetimeRenderer
//                    },{
//                        title:'巡检人员',
//                        dataIndex:'userName',
//                        elCls : 'center',
//                        width:'15%'
//                    },
                    {
                        title:'巡检地点',
                        dataIndex:'name',
                        elCls : 'center',
                        width:'20%'
                    }, {
                        title:'所属机构',
                        dataIndex:'orgName',
                        elCls : 'center',
                        width:'20%'
                    },{
                    	title:'巡检周期',
                    	dataIndex:'searchCycle',
                    	elCls : 'center',
                    	width:'15%'
                    },
                    {
                    	title:'巡检次数',
                    	dataIndex:'searchNumber',
                    	elCls : 'center',
                    	width:'15%'
                    },
                    {
                    	title:'完成率（%）',
                    	dataIndex:'finishRate',
                    	elCls : 'center',
                    	width:'15%'
                    },
//                    {
//                        title:'备注',
//                        dataIndex:'remark',
//                        elCls : 'center',
//                        width:'15%'
//                    },
                    {
                        title:'操作',
                        dataIndex:'status',
                        elCls : 'center',
                        width:'15%',
                        renderer:function (value) {
                        	console.log(value);
                            var button = '';
                            button += '<span class="grid-command infoBtn">详情</span>';
//                            button += '<span class="grid-command delBtn">删除</span>';
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
                    url : "/dataStatisticsManageAction/findAll",
                    autoLoad : true ,
                    pageSize : 20,
                    proxy : {
                        method : 'post',
                        dataType : 'json'
                    },
                    params : {basicInformation:_self.get('basicInformation'),uploadFileManage:_self.get('uploadFileManage')}
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
					   {
	                        id: 'exportBy',
	                        btnCls: 'button button-small exportBtn',
	                        text: '<i class="icon-download "></i>导出' +
	                            '<form action="/dataStatisticsManageAction/exportXlsBy" id="exportForm" method="post">' +
	                            '<input type="hidden" name="exportXlsJson" id="exportXlsJson" />' +
	                            '</form>',
	                    }
//					   {
//					      id : 'export',
//					      btnCls : 'button button-small',
//					      text : '<i class="icon-download"></i>导出Excel'
//	                            +'<form action="/kmms/accidentQueryAction/exportXls" id="exportForm" method="post">'
//	    						+'<input type="hidden" name="exportXlsJson" id="exportXlsJson" />'
//	    						+'</form>',
//					   }
				   ],
				   itemStatusFields : {
					    red : 'red',
					    yellow : 'yellow'
				   },
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
            	basicInformation : {value:'basicInformation'},//存储表名
        		uploadFileManage : {value:'uploadFileManage'}//存储表名
            }
        });
    return dataStatisticsManagePage;
});