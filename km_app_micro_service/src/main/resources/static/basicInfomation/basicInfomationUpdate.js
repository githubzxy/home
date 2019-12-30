/**
 * @author zhouxingyu
 * @date 19-10-10
 */
define('/basicInfomation/basicInfomationUpdate',
    ['bui/common', 'common/form/FormContainer', 'bui/data',
        'common/uploader/UpdateUploader', 'common/data/PostLoad', 'bui/form'
    ],
    function(r) {
        var BUI = r('bui/common'),
            FormContainer = r('common/form/FormContainer'),
            UpdateUploader = r('common/uploader/UpdateUploader'),
            Data = r('bui/data'),
            PostLoad = r('common/data/PostLoad'),
            Form = r('bui/form');
        var basicInfomationUpdate = BUI.Overlay.Dialog.extend({
            initializer: function() {
                var _self = this;
                _self.addChild(_self._initFormContainer());
            },
            renderUI: function() {
                var _self = this;
//                $("#formContainer #special").append("<option  value=''>请选择</option>");
                $("#formContainer #special").append("<option  value='1'>是</option>");
                $("#formContainer #special").append("<option  value='0'>否</option>");
                
                $("#formContainer #searchCycle").append("<option  value='1月/次'>1月/次</option>");
                $("#formContainer #searchCycle").append("<option  value='3月/次'>3月/次</option>");
                $("#formContainer #searchCycle").append("<option  value='6月/次'>6月/次</option>");
                $("#formContainer #searchCycle").append("<option  value='1年/次'>1年/次</option>");
                
                _self._getShowData();
            },
            bindUI: function() {
                var _self = this;
//                $("input[name='railLineEditDialog']").on('change', function() {
//                    $("#machineRoomEditDialog").html("");
//                    var railLine = $("input[name='railLineEditDialog']").val();
//
//                    _self._initMachineRoom(railLine);
//                });
                //定义按键
                var buttons = [{
                    text: '保存',
                    elCls: 'button',
                    handler: function() {
                        var success = _self.get('success');
                        if (success) {
                            success.call(_self);
                        }
                    }
                }, {
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
            
            _getLines:function(lineName){
            	var _self=this;
            	var nameData = [];
            	$.ajax({
            		url:'/kmms/networkManageInfoAction/getLines',
            		type:'post',
            		dataType:"json",
            		success:function(res){
            			for(var i=0;i<res.length;i++){
            				nameData.push(res[i]);
            			}
            		}
            	});
            	
            	var suggest = new SelectSuggest({
                    renderName: '#formContainer #railLineEditDialog',
                    inputName: 'railLineEditDialog',
                    renderData: nameData,
                    width: 222
                });
            	
            	$("input[name='railLineEditDialog']").val(lineName);
            	
            },
            
            _getStation:function(station){
            	var _self=this;
            	var nameData = [];
            	$.ajax({
            		url:'/kmms/networkManageInfoAction/getStationNoCondition',
            		type:'post',
            		dataType:"json",
            		success:function(res){
            			for(var i=0;i<res.length;i++){
            				nameData.push(res[i]);
            			}
            		}
            	});
            	
            	var suggest = new SelectSuggest({
                    renderName: '#formContainer #machineRoomEditDialog',
                    inputName: 'machineRoomEditDialog',
                    renderData: nameData,
                    width: 222
                });
            	
            	$("input[name='machineRoomEditDialog']").val(station);
            	
            },
            
            /**
             * 初始化线别
             */
//            _initRailAndRoom: function() {
//                var _self = this;
//                var nameData = [];
//                var postLoad = new PostLoad({
//                    url: '/kmms/constructCooperateAction/getLines',
//                });
//                postLoad.load({}, function(result) {
//                    if (result == null) {
//                        return;
//                    }
//                    for (var i = 0; i < result.length; i++) {
//                        nameData.push(result[i]);
//                    }
//                });
//                /**
//                 * 初始化线别
//                 */
//                var suggest = new SelectSuggest({
//                    renderName: '#railLineEditDialog',
//                    inputName: 'railLineEditDialog',
//                    renderData: nameData,
//                    width: 510
//                });
//                var railLineStr = _self.get('railLine');
//                $("input[name='railLineEditDialog']").val(railLineStr);
//                /**
//                 * 初始化机房
//                 */
//                var suggest2 = new SelectSuggest({
//                    renderName: '#machineRoomEditDialog',
//                    inputName: 'machineRoomEditDialog',
//                    renderData: [],
//                    width: 510
//                });
//                var machineRoomStr = _self.get('machineRoom');
//                $("input[name='machineRoomEditDialog']").val(machineRoomStr);
//            },
            /**
             * 选择线别_initRoom初始化机房数据
             */
//            _initMachineRoom: function(railLine) {
//                var nameData = [];
//                var postLoad = new PostLoad({
//                    url: '/kmms/technicalDocumentAction/getMachineRooms',
//                });
//                postLoad.load({ railLine: "" }, function(result) {
//                    if (result == null) {
//                        return;
//                    }
//                    for (var i = 0; i < result.length; i++) {
//                        nameData.push(result[i]);
//                    }
//                });
//                var suggest = new SelectSuggest({
//                    renderName: '#machineRoomEditDialog',
//                    inputName: 'machineRoomEditDialog',
//                    renderData: nameData,
//                    width: 510
//                });
//
//
//            },

//            _delFile: function(e, self) {
//                var delData = self.get('delData'),
//                    tdata = e.target.dataset;
//                delData[tdata.col].push(tdata.id);
//                $(e.target).parents('.success').remove();
//            },

            /**
             * 获取显示数据
             */
            _getShowData: function() {
                var _self = this,
                    shiftId = _self.get('shiftId'),
                    form = _self.get("formContainer");
//                    delData = {};
                $.ajax({
                    url: '/basicInformationAction/findById',
                    data: { id: shiftId, collectionName: _self.get('collectionName') },
                    type: 'post',
                    async: false,
                    dataType: "json",
                    success: function(reslut) {
                    	var data = reslut.data;
                        if (data) {
                            $("#formContainer #name").val(data.name);
                            $("#formContainer #orgName").val(data.orgName);
                            $("#formContainer #latitude").val(data.latitude);
                            $("#formContainer #longitude").val(data.longitude);
                            $("#formContainer #special").val(data.special);
                            $("#formContainer #code").val(data.code);
                            $("#formContainer #searchCycle").val(data.searchCycle);
                        }
                    }
                });
            },

            /**
             * 初始化上传文件
             */
            _initUploader: function(uploadFiles) {
                var _self = this;
                var uploader = new UpdateUploader({
                    render: '#formContainer #uploadFile',
                    url: '/zuul/kmms/atachFile/upload.cn',
                    alreadyItems: uploadFiles,
                    isSuccess: function(result) {
                        return true;
                    },
                });
                uploader.render();
                _self.set('uploader', uploader);
            },
            /**
             * 获取上传文件数据(上传的)
             */
            _getUploadFileData: function() {
                var _self = this,
                uploader = _self.get('uploader');
                var arr = new Array(); //声明数组,存储数据发往后台
                //获取上传文件的队列
                var fileArray = uploader.getSucFiles();
                for (var i in fileArray) {
                    var dto = new _self._UploadFileDto(fileArray[i].name, fileArray[i].path); //声明对象
                    arr[i] = dto; // 向集合添加对象
                };
                return arr;
            },
            /**
             * 声明上传文件对象
             * @param name 上传文件名
             * @param path 上传文件路径
             */
            _UploadFileDto: function(name, path) {
                this.name = name;
                this.path = path;
            },


            /**
             * 初始化FormContainer
             */
            _initFormContainer: function() {
                var _self = this;
                var colNum = 2;
                var childs =  [
    				{
    					label: '机房名称：',
    					redStarFlag: true,
    					itemColspan: 1,
    					item: '<input type="text" name="name" id="name" data-rules="{required:true,maxlength:200}"/>'
    				},{
    					label: '所属机构：',
    					redStarFlag: true,
    					itemColspan: 1,
    					item : '<input type="text" id="orgName" name="orgName" data-rules="{required:true,maxlength:200}"/>'
    				},{
    					label: '纬度：',
    					redStarFlag: true,
    					itemColspan: 1,
    					item : '<input type="text" id="latitude" name="latitude" data-rules="{required:true,maxlength:200}"/>'
    				},{
    					label: '经度：',
    					redStarFlag: true,
    					itemColspan: 1,
    					item: '<input type="text" name="longitude" id="longitude"  data-rules="{required:true,maxlength:200}"/>'
    				},{
    					label: '是否为特殊地点：',
    					redStarFlag: true,
    					itemColspan : 1,
    					item:'<select type="text" name="special" id="special" data-rules="{required:true,maxlength:200}"/>'
    				},{
    					label: '巡检周期：',
    					redStarFlag: true,
    					itemColspan : 1,
    					item:'<select type="text" name="searchCycle" id="searchCycle" data-rules="{required:true,maxlength:200}"/>'
    				},{
    					label: '特殊地点需要扫码的二维码：',
    					itemColspan : 2,
    					item:'<input type="text" name="code" id="code" data-rules="{maxlength:200}"/>'
    				}
                ];
                var form = new FormContainer({
                    id: 'TechnicalPageNewUpdateForm',
                    colNum: colNum,
                    formChildrens: childs,
//                    elStyle: { overflowY: 'scroll'}
                });
                _self.set('formContainer', form);
                return form;
            }
        }, {
            ATTRS: {
                id: { value: 'technicalPageNewUpdateFormDialog' },
                elAttrs: { value: { id: "constructRepairEditEdit" } },
                title: { value: '修改' },
                downloadUrl: { value: '/kmms/commonAction/download?path=' },
                width: { value: 650 },
                height: { value: 280 },
                contextPath: {},
                closeAction: { value: 'destroy' }, //关闭时销毁加载到主页面的HTML对象
                mask: { value: true },
                collectionName: {},
                userId: {}, //登录用户ID
                userName: {}, //登录用户名称
                orgId: {}, //登录用户组织机构ID
                orgName: {}, //登录用户组织机构名称
                shiftId: {},
                //            userId:{},
                success: {
                    value: function() {
                        var _self = this;
                        var formAdd = _self.getChild('TechnicalPageNewUpdateForm');
//                            delData = _self.get('delData');
                        //获取上传文件
//                        var uploadFile = _self._getUploadFileData();
                        //验证不通过
                        if (!formAdd.isValid()) {
                            return;
                        }
                        //序列化表单成对象，所有的键值都是字符串
                        var data = formAdd.serializeToObject();
//                        data.uploadFile = JSON.stringify(uploadFile);
                        data.collectionName = _self.get('collectionName');
                        data.id = _self.get('shiftId');
                        var pl = new PostLoad({
                            url: '/basicInformationAction/modifyDoc',
                            el: _self.get('el'),
                            loadMsg: '上传中...'
                        });
                        pl.load(data, function(e) {
                        	if(e.status==2){
            					//消息提示框
            					BUI.Message.Confirm(e.msg,null,'error');
            				}else if (e) {
                                _self.fire("completeAddSave", {
                                    result: e
                                });
                            }
                        });

                    }
                },
                events: {
                    value: {
                        'completeAddSave': true,
                    }
                },
            }
        });
        return basicInfomationUpdate;
    });