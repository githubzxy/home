////////////////////////////////////////组织机构类型开始/////////////////////////////////////
var organization_type = {
    segment: ORG_TYPE_KS,
    workshop: ORG_TYPE_CJ,
    workArea: ORG_TYPE_GQ,
    typeName: function (value) {
        switch (value) {
            case this.segment:
                return "科室";
            case this.workshop:
                return "车间";
            case this.workArea:
                return "工区";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.segment + "' >" + this.typeName(this.segment) + "</option>");
        $(id).append("<option value='" + this.workshop + "' >" + this.typeName(this.workshop) + "</option>");
        $(id).append("<option value='" + this.workArea + "' >" + this.typeName(this.workArea) + "</option>");
    }
};
////////////////////////////////////////组织机构类型结束/////////////////////////////////////

////////////////////////////////////////文件系统类型开始//////////////////////////////////////
var fileSystem_fileType = {
//    groupFile: 3110109,// 集团电务处文件
    groupOtherFile: 3110110,// 集团其他处室文件
    comprehensiveFile: 3110111,// 段级－综合管理文件
//		safeFile : 10072,// 段级－安全管理文件
//		wiredFile : 3110106,// 段级－技术管理（普铁）文件
//		highFile : 3110108,// 段级－技术管理（高铁）文件
//		other : 3110107,// 段级－其它
    typeName: function (value) {
        switch (value) {
//            case this.groupFile:
//                return "安全规章";
            case this.groupOtherFile:
                return "技术规章";
            case this.comprehensiveFile:
                return "管理制度";

//				case this.groupFile:
//					return "集团电务处文件";
//				case this.groupOtherFile:
//					return "集团其他处室文件";
//				case this.comprehensiveFile:
//					return "段级－综合管理文件";
//				case this.safeFile:
//					return "段级－安全管理文件";
//				case this.wiredFile:
//					return "段级－技术管理（普铁）文件";
//				case this.highFile:
//					return "段级－技术管理（高铁）文件";
//				case this.other:
//					return "段级－其它";
        }
    },
    listData: function (id) {
//        $(id).append("<option value='" + this.groupFile + "' >" + this.typeName(this.groupFile) + "</option>");
        $(id).append("<option value='" + this.groupOtherFile + "' >" + this.typeName(this.groupOtherFile) + "</option>");
        $(id).append("<option value='" + this.comprehensiveFile + "' >" + this.typeName(this.comprehensiveFile) + "</option>");
//			$(id).append("<option value='" + this.safeFile + "' >" + this.typeName(this.safeFile) + "</option>");
//			$(id).append("<option value='" + this.wiredFile + "' >" + this.typeName(this.wiredFile) + "</option>");
//			$(id).append("<option value='" + this.highFile + "' >" + this.typeName(this.highFile) + "</option>");
//			$(id).append("<option value='" + this.other + "' >" + this.typeName(this.other) + "</option>");
    }
};
////////////////////////////////////////文件系统类型结束//////////////////////////////////////

////////////////////////////////////////文件适用范围开始//////////////////////////////////////
var fileSystem_fileSuitableRange = {
    all: 12010,
    wired: 12012,
    wireless: 12013,
    highRail: 12011,
    typeName: function (value) {
        switch (value) {
            case this.all:
                return "全段";
            case this.wired:
                return "普铁有线";
            case this.wireless:
                return "普铁无线";
            case this.highRail:
                return "高铁技术科";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.all + "' >" + this.typeName(this.all) + "</option>");
        $(id).append("<option value='" + this.wired + "' >" + this.typeName(this.wired) + "</option>");
        $(id).append("<option value='" + this.wireless + "' >" + this.typeName(this.wireless) + "</option>");
        $(id).append("<option value='" + this.highRail + "' >" + this.typeName(this.highRail) + "</option>");
    }
};
////////////////////////////////////////文件适用范围结束//////////////////////////////////////

////////////////////////////////////////文件有效时间开始//////////////////////////////////////
var fileSystem_fileValidTime = {
    long: 12100,
    short: 12101,
    typeName: function (value) {
        switch (value) {
            case this.long:
                return "长效";
            case this.short:
                return "短效";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.long + "' >" + this.typeName(this.long) + "</option>");
        $(id).append("<option value='" + this.short + "' >" + this.typeName(this.short) + "</option>");
    }
};
////////////////////////////////////////文件有效时间结束//////////////////////////////////////

////////////////////////////////////////文件是否细化开始//////////////////////////////////////
var fileSystem_isDetailing = {
    yes: 1,
    no: 0,
    typeName: function (value) {
        switch (value) {
            case this.yes:
                return "是";
            case this.no:
                return "否";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.yes + "' >" + this.typeName(this.yes) + "</option>");
        $(id).append("<option value='" + this.no + "' >" + this.typeName(this.no) + "</option>");
    }
};
////////////////////////////////////////文件是否细化结束//////////////////////////////////////

////////////////////////////////////////资料类型开始//////////////////////////////////////
var technicalInfo_type = {
    communic: 12200,
    technology: 12201,
    technologyWireless: 12204,
    finitude: 12202,
    infinite: 12203,
    imageSpeech: 12205,
    
    timeClock: 31100,
    metting: 31101,
    communicationPower: 31102,
    emergencySystem: 31103,
    mathMove: 31104,
    wireless: 31105,
    
    telegram: 41100,
    integratedNetwork: 42201,
    broadcast: 42202,
    nature: 42203,
    machineRoom: 42204,
    passengerTransport: 42205,
    typeName: function (value) {
        switch (value) {
            case this.communic:
                return "通信线路及附属设备";
            case this.technology:
                return "传输与接入网系统";
            case this.technologyWireless:
                return "数据通信系统";
            case this.finitude:
                return "调度通信系统";
            case this.infinite:
                return "综合视频监控系统";
            case this.imageSpeech:
                return "图像与语音监控系统";
            case this.timeClock:
                return "时间与时钟同步系统";
            case this.metting:
                return "会议系统";
            case this.communicationPower:
                return "通信电源及环境监控系统";
            case this.emergencySystem:
                return "应急通信系统";
            case this.mathMove:
                return "GSM-R数字移动通信系统";
            case this.wireless:
                return "无线列调通信系统";
            case this.telegram:
                return "电报及电话系统";
            case this.integratedNetwork:
                return "综合网管系统";
            case this.broadcast:
                return "广播与站场通信系统";
            case this.nature:
                return "自然灾害及异物侵限系统";
            case this.machineRoom:
                return "机房空调及防雷接地系统";
            case this.passengerTransport:
                return "客运引导系统";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.communic + "' >" + this.typeName(this.communic) + "</option>");
        $(id).append("<option value='" + this.technology + "' >" + this.typeName(this.technology) + "</option>");
        $(id).append("<option value='" + this.technologyWireless + "' >" + this.typeName(this.technologyWireless) + "</option>");
        $(id).append("<option value='" + this.finitude + "' >" + this.typeName(this.finitude) + "</option>");
        $(id).append("<option value='" + this.infinite + "' >" + this.typeName(this.infinite) + "</option>");
        $(id).append("<option value='" + this.imageSpeech + "' >" + this.typeName(this.imageSpeech) + "</option>");
        
        $(id).append("<option value='" + this.timeClock + "' >" + this.typeName(this.timeClock) + "</option>");
        $(id).append("<option value='" + this.metting + "' >" + this.typeName(this.metting) + "</option>");
        $(id).append("<option value='" + this.communicationPower + "' >" + this.typeName(this.communicationPower) + "</option>");
        $(id).append("<option value='" + this.emergencySystem + "' >" + this.typeName(this.emergencySystem) + "</option>");
        $(id).append("<option value='" + this.mathMove + "' >" + this.typeName(this.mathMove) + "</option>");
        $(id).append("<option value='" + this.wireless + "' >" + this.typeName(this.wireless) + "</option>");
        
        $(id).append("<option value='" + this.telegram + "' >" + this.typeName(this.telegram) + "</option>");
        $(id).append("<option value='" + this.integratedNetwork + "' >" + this.typeName(this.integratedNetwork) + "</option>");
        $(id).append("<option value='" + this.broadcast + "' >" + this.typeName(this.broadcast) + "</option>");
        $(id).append("<option value='" + this.nature + "' >" + this.typeName(this.nature) + "</option>");
        $(id).append("<option value='" + this.machineRoom + "' >" + this.typeName(this.machineRoom) + "</option>");
        $(id).append("<option value='" + this.passengerTransport + "' >" + this.typeName(this.passengerTransport) + "</option>");
    }
};
////////////////////////////////////////资料类型结束//////////////////////////////////////

/////////////////////////////////状态开始-通信网停机要点///////////////////////////////
var commNetworkStop_old_status = {
    wait_examine: 0,	//待审核
    wait_reply: 1,	//待回复
    finish: 2,	//完成
    unfinish: 3,	//未完成
    cancel: 4, //已取消
    typeName: function (value) {
        switch (value) {
            case this.wait_examine:
                return "待审核";
            case this.wait_reply:
                return "待回复";
            case this.finish:
                return "完成";
            case this.unfinish:
                return "未完成";
            case this.cancel:
                return "已取消";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + "" + "'>" + "请选择" + "</option>");
        $(id).append("<option value='" + this.wait_examine + "' >" + this.typeName(this.wait_examine) + "</option>");
        $(id).append("<option value='" + this.wait_reply + "' >" + this.typeName(this.wait_reply) + "</option>");
        $(id).append("<option value='" + this.finish + "' >" + this.typeName(this.finish) + "</option>");
        $(id).append("<option value='" + this.unfinish + "' >" + this.typeName(this.unfinish) + "</option>");
        $(id).append("<option value='" + this.cancel + "' >" + this.typeName(this.cancel) + "</option>");
    }
};
// ldt 2018-1-25 新需求改变 新增科室、科长、行政领导审核，取消"已取消"状态
var commNetworkStop_status = {
    wait_examine: 0,//待审核
    wait_reply: 1,	//待回复
    finish: 2,	//完成
    unfinish: 3,	//未完成
    checkFalse: 4, //审核不通过
    kssh: 5,//科室待审核
    kzsh: 6,//科长待审核
    ldsh: 7,//行政领导待审核
    daizhuanfa: 8,//待转发
    typeName: function (value) {
        switch (value) {
            case this.daizhuanfa:
                return "待转发";
            case this.kssh:
                return "科室待审核";
            case this.kzsh:
                return "科长待审核";
            case this.ldsh:
                return "行政领导待审核";
            case this.checkFalse:
                return "审核不通过";
            case this.wait_reply:
                return "待回复";
            case this.finish:
                return "完成";
            case this.unfinish:
                return "未完成";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + "" + "'>" + "请选择" + "</option>");
        $(id).append("<option value='" + this.daizhuanfa + "' >" + this.typeName(this.daizhuanfa) + "</option>");
        $(id).append("<option value='" + this.kssh + "' >" + this.typeName(this.kssh) + "</option>");
        $(id).append("<option value='" + this.kzsh + "' >" + this.typeName(this.kzsh) + "</option>");
        $(id).append("<option value='" + this.ldsh + "' >" + this.typeName(this.ldsh) + "</option>");
        $(id).append("<option value='" + this.checkFalse + "' >" + this.typeName(this.checkFalse) + "</option>");
        $(id).append("<option value='" + this.wait_reply + "' >" + this.typeName(this.wait_reply) + "</option>");
        $(id).append("<option value='" + this.finish + "' >" + this.typeName(this.finish) + "</option>");
        $(id).append("<option value='" + this.unfinish + "' >" + this.typeName(this.unfinish) + "</option>");
    }
};
/////////////////////////////////状态结束-通信网停机要点////////////////////////////////

///////////////////////////////线路开始-通信网停机要点////////////////////////////
var commNetworkStop_rainLine = {

    anning: 1,//'安宁'
    baozhong: 2,//'宝中'
    caoguan: 3,//'草官'
    chengkun: 4,//'成昆'
    chudaxian: 5,//'楚大线'
    dali: 6,//'大丽'
    dongchuan: 7,//'东川'
    dongwang: 8,//'东王'
    guangda: 9,//'广大'
    guangkun: 10,//'广昆'
    hukun: 11,//'沪昆'
    hukungaotie: 12,//'沪昆高铁'
    kunhe: 13,//'昆河'
    kunxiao: 14,//'昆小'
    kunyang: 15,//'昆阳'
    kunyu: 16,//'昆玉'
    mengbao: 17,//'蒙宝'
    menghe: 18,//'蒙河'
    nankun: 19,//'南昆'
    nankunkezhuan: 20,//'南昆客专'
    panxixian: 21,//'盘西线'
    shilin: 22,//'石林'
    shuihong: 23,//'水红'
    weihong: 24,//'威红'
    yumeng: 25,//'玉蒙'
    yunzhi: 26,//'云支'
    rainLineName: function (value) {
        switch (value) {
            case this.anning:
                return '安宁';
            case this.baozhong:
                return '宝中';
            case this.caoguan:
                return '草官';
            case this.chengkun:
                return '成昆';
            case this.chudaxian:
                return '楚大线';
            case this.dali:
                return '大丽';
            case this.dongchuan:
                return '东川';
            case this.dongwang:
                return '东王';
            case this.guangda:
                return '广大';
            case this.guangkun:
                return '广昆';
            case this.hukun:
                return '沪昆';
            case this.hukungaotie:
                return '沪昆高铁';
            case this.kunhe:
                return '昆河';
            case this.kunxiao:
                return '昆小';
            case this.kunyang:
                return '昆阳';
            case this.kunyu:
                return '昆玉';
            case this.mengbao:
                return '蒙宝';
            case this.menghe:
                return '蒙河';
            case this.nankun:
                return '南昆';
            case this.nankunkezhuan:
                return '南昆客专';
            case this.panxixian:
                return '盘西线';
            case this.shilin:
                return '石林';
            case this.shuihong:
                return '水红';
            case this.weihong:
                return '威红';
            case this.yumeng:
                return '玉蒙';
            case this.yunzhi:
                return '云支';
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + "" + "'>" + "请选择" + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.anning) + "' >" + this.rainLineName(this.anning) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.baozhong) + "' >" + this.rainLineName(this.baozhong) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.caoguan) + "' >" + this.rainLineName(this.caoguan) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.chengkun) + "' >" + this.rainLineName(this.chengkun) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.chudaxian) + "' >" + this.rainLineName(this.chudaxian) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.dali) + "' >" + this.rainLineName(this.dali) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.dongchuan) + "' >" + this.rainLineName(this.dongchuan) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.dongwang) + "' >" + this.rainLineName(this.dongwang) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.guangda) + "' >" + this.rainLineName(this.guangda) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.guangkun) + "' >" + this.rainLineName(this.guangkun) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.hukun) + "' >" + this.rainLineName(this.hukun) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.hukungaotie) + "' >" + this.rainLineName(this.hukungaotie) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.kunhe) + "' >" + this.rainLineName(this.kunhe) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.kunxiao) + "' >" + this.rainLineName(this.kunxiao) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.kunyang) + "' >" + this.rainLineName(this.kunyang) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.kunyu) + "' >" + this.rainLineName(this.kunyu) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.mengbao) + "' >" + this.rainLineName(this.mengbao) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.menghe) + "' >" + this.rainLineName(this.menghe) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.nankun) + "' >" + this.rainLineName(this.nankun) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.nankunkezhuan) + "' >" + this.rainLineName(this.nankunkezhuan) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.panxixian) + "' >" + this.rainLineName(this.panxixian) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.shilin) + "' >" + this.rainLineName(this.shilin) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.shuihong) + "' >" + this.rainLineName(this.shuihong) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.weihong) + "' >" + this.rainLineName(this.weihong) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.yumeng) + "' >" + this.rainLineName(this.yumeng) + "</option>");
        $(id).append("<option value='" + this.rainLineName(this.yunzhi) + "' >" + this.rainLineName(this.yunzhi) + "</option>");
    }
};
///////////////////////////////线路结束-通信网停机要点////////////////////////////

///////////////////////////////工作内容开始-通信网停机要点////////////////////////////
var commNetworkStop_workContent;
commNetworkStop_workContent = {
    circuitAdjustment: 0,	//电路调整
    cableCutover: 1,	//光缆割接
    cableJointBox: 2,	//光缆接头盒
    jointCutover: 3,	//接头割接
    boxFault: 4, //开盒确认故障点
    equipment: 5,	//设备计表
    equipmentFiberReplace: 6,//设备尾纤更换
    typeName: function (value) {
        // if (parseInt(value) || parseInt(value)==0) {
        switch (value) {
            case 0:
            case '0':
                return "电路调整";
            case this.cableCutover:
            case '1':
                return "光缆割接";
            case this.cableJointBox:
            case '2':
                return "光缆接头盒";
            case this.jointCutover:
            case '3':
                return "接头割接";
            case this.boxFault:
            case '4':
                return "开盒确认故障点";
            case this.equipment:
            case '5':
                return "设备计表"
            case this.equipmentFiberReplace:
            case '6':
                return "设备尾纤更换";
            default:
                return value;
        }
        // } else {
        //     return value;
        // }
    },
    listData: function (id) {
        $(id).append("<option value='" + "" + "'>" + "请选择" + "</option>");
        $(id).append("<option value='" + this.circuitAdjustment + "' >" + this.typeName(this.circuitAdjustment) + "</option>");
        $(id).append("<option value='" + this.cableCutover + "' >" + this.typeName(this.cableCutover) + "</option>");
        $(id).append("<option value='" + this.cableJointBox + "' >" + this.typeName(this.cableJointBox) + "</option>");
        $(id).append("<option value='" + this.jointCutover + "' >" + this.typeName(this.jointCutover) + "</option>");
        $(id).append("<option value='" + this.boxFault + "' >" + this.typeName(this.boxFault) + "</option>");
        $(id).append("<option value='" + this.equipment + "' >" + this.typeName(this.equipment) + "</option>");
        $(id).append("<option value='" + this.equipmentFiberReplace + "' >" + this.typeName(this.equipmentFiberReplace) + "</option>");
    }
};
///////////////////////////////工作内容结束-通信网停机要点////////////////////////////

/////////////////////////////////所属专业开始-通信网停机要点///////////////////////////////
var commNetworkStop_major = {
    gsm_r: 0,	//GSM-R
    transNetwork_equipment: 1,	//传输网（设备）
    transNetwork_line: 2,	//传输网（线路）
    dangerAttr: 3,	//隐患属性
    typeName: function (value) {
        switch (value) {
            case this.gsm_r:
                return "GSM-R";
            case this.transNetwork_equipment:
                return "传输网（设备）";
            case this.transNetwork_line:
                return "传输网（线路）";
            case this.dangerAttr:
                return "隐患属性";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + "" + "'>" + "请选择" + "</option>");
        $(id).append("<option value='" + this.gsm_r + "' >" + this.typeName(this.gsm_r) + "</option>");
        $(id).append("<option value='" + this.transNetwork_equipment + "' >" + this.typeName(this.transNetwork_equipment) + "</option>");
        $(id).append("<option value='" + this.transNetwork_line + "' >" + this.typeName(this.transNetwork_line) + "</option>");
        $(id).append("<option value='" + this.dangerAttr + "' >" + this.typeName(this.dangerAttr) + "</option>");
    }
};
///////////////////////////////所属专业结束-通信网停机要点////////////////////////////

/////////////////////////////////所属专业开始-通信网停机要点///////////////////////////////
//////////////2018-1-25 ldt 新需求改变///////////////////
var commNetworkStop_specialty = {
    device: 1,	// 设备
    line: 2,	// 线路
    typeName: function (value) {
        switch (value) {
            case this.device:
                return "设备";
            case this.line:
                return "线路";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.device + "' >" + this.typeName(this.device) + "</option>");
        $(id).append("<option value='" + this.line + "' >" + this.typeName(this.line) + "</option>");
    }
};
///////////////////////////////所属专业结束-通信网停机要点////////////////////////////

////////////////////////////////////////////////////////专业为设备的施工属性开始-通信网停机要点////////////////////////////////////////////////////////////////////
//////////////2018-1-24 ldt 新需求改变///////////////////
var commNetworkStop_executionAttr_device = {
    //所属专业“设备”
    circuitAdjustment: 1,	//电路调整
    deviceProjectExecution: 2,	//设备工程施工
    equipmentTest: 3,	//设备计表测试
    devicePerformanceImprove: 4,	//设备性能提高
    deviceObstacleDispose: 5, //设备障碍处理
    networkUpgrade: 6,	//网络升级
    typeName: function (value) {
        switch (value) {
            case this.circuitAdjustment:
                return "电路调整";
            case this.deviceProjectExecution:
                return "设备工程施工";
            case this.equipmentTest:
                return "设备计表测试";
            case this.devicePerformanceImprove:
                return "设备性能提高";
            case this.deviceObstacleDispose:
                return "设备障碍处理";
            case this.networkUpgrade:
                return "网络升级";
        }
    },
    listData: function (id, belongCraft) {
        //所属专业“设备”
        $(id).append("<option value='" + this.circuitAdjustment + "' >" + this.typeName(this.circuitAdjustment) + "</option>");
        $(id).append("<option value='" + this.deviceProjectExecution + "' >" + this.typeName(this.deviceProjectExecution) + "</option>");
        $(id).append("<option value='" + this.equipmentTest + "' >" + this.typeName(this.equipmentTest) + "</option>");
        $(id).append("<option value='" + this.devicePerformanceImprove + "' >" + this.typeName(this.devicePerformanceImprove) + "</option>");
        $(id).append("<option value='" + this.deviceObstacleDispose + "' >" + this.typeName(this.deviceObstacleDispose) + "</option>");
        $(id).append("<option value='" + this.networkUpgrade + "' >" + this.typeName(this.networkUpgrade) + "</option>");
    },
};
/////////////////////////////////////////////////////////////专业为设备的施工属性结束-通信网停机要点////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////专业为线路的施工属性开始-通信网停机要点////////////////////////////////////////////////////////////////////
//////////////2018-1-24 ldt 新需求改变///////////////////
var commNetworkStop_executionAttr_line = {
    //所属专业“线路”
    opticalRenovate: 1,	//光缆整治
    municipalChange: 2,	//市政迁改
    railwayChange: 3,	//铁路迁改
    railwayExecution: 4,	//线路工程施工
    lineTest: 5, //线路计表测试
    lineFaultHandling: 6,	//线路障碍处理
    typeName: function (value) {
        switch (value) {
            case this.opticalRenovate:
                return "光缆整治";
            case this.municipalChange:
                return "市政迁改";
            case this.railwayChange:
                return "铁路迁改";
            case this.railwayExecution:
                return "线路工程施工";
            case this.lineTest:
                return "线路计表测试";
            case this.lineFaultHandling:
                return "线路障碍处理";
        }
    },
    listData: function (id) {
        //所属专业“线路”
        $(id).append("<option value='" + this.opticalRenovate + "' >" + this.typeName(this.opticalRenovate) + "</option>");
        $(id).append("<option value='" + this.municipalChange + "' >" + this.typeName(this.municipalChange) + "</option>");
        $(id).append("<option value='" + this.railwayChange + "' >" + this.typeName(this.railwayChange) + "</option>");
        $(id).append("<option value='" + this.railwayExecution + "' >" + this.typeName(this.railwayExecution) + "</option>");
        $(id).append("<option value='" + this.lineTest + "' >" + this.typeName(this.lineTest) + "</option>");
        $(id).append("<option value='" + this.lineFaultHandling + "' >" + this.typeName(this.lineFaultHandling) + "</option>");
    },
};
/////////////////////////////////////////////////////////////专业为线路的施工属性结束-通信网停机要点////////////////////////////////////////////////////////////////////

///////////////////////////////施工类别开始-通信网停机要点////////////////////////////
var commNetworkStop_constructionType = {
    constOne: 0,	//施工Ⅰ级
    constTwo: 1,	//施工Ⅱ级
    constThree_General: 2,	//施工Ⅲ级（一般）
    constThree_important: 3,	//施工Ⅲ级（重点）
    repairOne: 4, //维修Ⅰ级
    repairtwo: 5,	//维修Ⅱ级
    typeName: function (value) {
        switch (value) {
            case this.constOne:
                return "施工Ⅰ级";
            case this.constTwo:
                return "施工Ⅱ级";
            case this.constThree_General:
                return "施工Ⅲ级（一般）";
            case this.constThree_important:
                return "施工Ⅲ级（重点）";
            case this.repairOne:
                return "维修Ⅰ级";
            case this.repairtwo:
                return "维修Ⅱ级"
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + "" + "'>" + "请选择" + "</option>");
        $(id).append("<option value='" + this.constOne + "' >" + this.typeName(this.constOne) + "</option>");
        $(id).append("<option value='" + this.constTwo + "' >" + this.typeName(this.constTwo) + "</option>");
        $(id).append("<option value='" + this.constThree_General + "' >" + this.typeName(this.constThree_General) + "</option>");
        $(id).append("<option value='" + this.constThree_important + "' >" + this.typeName(this.constThree_important) + "</option>");
        $(id).append("<option value='" + this.repairOne + "' >" + this.typeName(this.repairOne) + "</option>");
        $(id).append("<option value='" + this.repairtwo + "' >" + this.typeName(this.repairtwo) + "</option>");
    }
};
/////////////////////////////////////////////////////////////施工类别结束-通信网停机要点/////////////////////////////////////////////////////////////////////

///////////////////////////////施工类别开始-通信网停机要点////////////////////////////
//////////////2018-1-25 ldt 新需求改变///////////////////
var commNetworkStop_construcType = {
    constThree_General: 1,	//施工Ⅲ级（一般）
    constThree_important: 2,	//施工Ⅲ级（重点）
    typeName: function (value) {
        switch (value) {
            case this.constThree_General:
                return "三级（一般）";
            case this.constThree_important:
                return "三级（重点）";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.constThree_General + "' >" + this.typeName(this.constThree_General) + "</option>");
        $(id).append("<option value='" + this.constThree_important + "' >" + this.typeName(this.constThree_important) + "</option>");
    }
};
/////////////////////////////////////////////////////////////施工类别结束-通信网停机要点/////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////施工属性开始-通信网停机要点////////////////////////////////////////////////////////////////////
var commNetworkStop_constructionAttr = {
    circuitAdjustment: 0,	//电路调整
    standardConst: 1,	//机房标准化建设
    equipmentTest: 2,	//设备计表测试
    municipalChange: 3,	//市政改迁
    railwayChange: 4, //铁路迁改
    lineFaultHandling: 5,	//线路故障处理
    dangerRingNetwork: 6,	//隐患环网
    typeName: function (value) {
        switch (value) {
            case this.circuitAdjustment:
                return "电路调整";
            case this.standardConst:
                return "机房标准化建设";
            case this.equipmentTest:
                return "设备计表测试";
            case this.municipalChange:
                return "市政改迁";
            case this.railwayChange:
                return "铁路迁改";
            case this.lineFaultHandling:
                return "线路故障处理"
            case this.dangerRingNetwork:
                return "隐患环网";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + "" + "'>" + "请选择" + "</option>");
        $(id).append("<option value='" + this.circuitAdjustment + "' >" + this.typeName(this.circuitAdjustment) + "</option>");
        $(id).append("<option value='" + this.standardConst + "' >" + this.typeName(this.standardConst) + "</option>");
        $(id).append("<option value='" + this.equipmentTest + "' >" + this.typeName(this.equipmentTest) + "</option>");
        $(id).append("<option value='" + this.municipalChange + "' >" + this.typeName(this.municipalChange) + "</option>");
        $(id).append("<option value='" + this.railwayChange + "' >" + this.typeName(this.railwayChange) + "</option>");
        $(id).append("<option value='" + this.lineFaultHandling + "' >" + this.typeName(this.lineFaultHandling) + "</option>");
        $(id).append("<option value='" + this.dangerRingNetwork + "' >" + this.typeName(this.dangerRingNetwork) + "</option>");
    }
};
/////////////////////////////////////////////////////////////施工属性结束-通信网停机要点////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////施工属性开始-通信网停机要点////////////////////////////////////////////////////////////////////
var commNetworkStop_executionAttr = {
    // （1）	所属专业“设备”
    circuitAdjustment: 11,	//电路调整
    deviceProjectExecution: 12,	//设备工程施工
    equipmentTest: 13,	//设备计表测试
    devicePerformanceImprove: 14,	//设备性能提高
    deviceObstacleDispose: 15, //设备障碍处理
    networkUpgrade: 16,	//网络升级
    // （2）	所属专业“线路”
    opticalRenovate: 21,	//光缆整治
    municipalChange: 22,	//市政迁改
    railwayChange: 23,	//铁路迁改
    railwayExecution: 24,	//线路工程施工
    lineTest: 25, //线路计表测试
    lineFaultHandling: 26,	//线路障碍处理
    typeName: function (value) {
        switch (value) {
            case this.circuitAdjustment:
                return "电路调整";
            case this.deviceProjectExecution:
                return "设备工程施工";
            case this.equipmentTest:
                return "设备计表测试";
            case this.devicePerformanceImprove:
                return "设备性能提高";
            case this.deviceObstacleDispose:
                return "设备障碍处理";
            case this.networkUpgrade:
                return "网络升级";

            case this.opticalRenovate:
                return "光缆整治";
            case this.municipalChange:
                return "市政迁改";
            case this.railwayChange:
                return "铁路迁改";
            case this.railwayExecution:
                return "线路工程施工";
            case this.lineTest:
                return "线路计表测试";
            case this.lineFaultHandling:
                return "线路障碍处理";
        }
    },
    listData: function (id, belongCraft) {
        // （1）	所属专业“设备”
        if (belongCraft == 1) {
            $(id).append("<option value='" + this.circuitAdjustment + "' >" + this.typeName(this.circuitAdjustment) + "</option>");
            $(id).append("<option value='" + this.deviceProjectExecution + "' >" + this.typeName(this.deviceProjectExecution) + "</option>");
            $(id).append("<option value='" + this.equipmentTest + "' >" + this.typeName(this.equipmentTest) + "</option>");
            $(id).append("<option value='" + this.devicePerformanceImprove + "' >" + this.typeName(this.devicePerformanceImprove) + "</option>");
            $(id).append("<option value='" + this.deviceObstacleDispose + "' >" + this.typeName(this.deviceObstacleDispose) + "</option>");
            $(id).append("<option value='" + this.networkUpgrade + "' >" + this.typeName(this.networkUpgrade) + "</option>");
        }
        // （2）	所属专业“线路”
        if (belongCraft == 2) {
            $(id).append("<option value='" + this.opticalRenovate + "' >" + this.typeName(this.opticalRenovate) + "</option>");
            $(id).append("<option value='" + this.municipalChange + "' >" + this.typeName(this.municipalChange) + "</option>");
            $(id).append("<option value='" + this.railwayChange + "' >" + this.typeName(this.railwayChange) + "</option>");
            $(id).append("<option value='" + this.railwayExecution + "' >" + this.typeName(this.railwayExecution) + "</option>");
            $(id).append("<option value='" + this.lineTest + "' >" + this.typeName(this.lineTest) + "</option>");
            $(id).append("<option value='" + this.lineFaultHandling + "' >" + this.typeName(this.lineFaultHandling) + "</option>");
        }
    },
};
/////////////////////////////////////////////////////////////施工属性结束-通信网停机要点////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////涉及骨干网开始-通信网停机要点////////////////////////////////////////////////////////////////////
var commNetworkStop_mainNetNameAttr = {
    one: "1号环",
    three: "3号环",
    four: "4号环",
    secondJHH: "第二京沪穗",
    southwest: "西南环",
    southeast: "东南环"
}
/////////////////////////////////////////////////////////////涉及骨干网结束-通信网停机要点////////////////////////////////////////////////////////////////////

////////////////////////////////////////发布信息类型开始//////////////////////////////////////
var message_type = {
    bureau: 10022,
    paragraph: 10023,
    department: 10024,
//    safety: 10025,
//    shifts: 10026,
//    malfunction: 10027,
    typeName: function (value) {
        switch (value) {
            case this.bureau:
                return "最新通知";//局发布信息
            case this.paragraph:
                return "新闻";//段发布信息
            case this.department:
                return "公示公告";//处发布信息
//            case this.safety:
//                return "安全通报信息";
//            case this.shifts:
//                return "值班信息";
//            case this.malfunction:
//                return "故障通报消息";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.bureau + "' >" + this.typeName(this.bureau) + "</option>");
        $(id).append("<option value='" + this.paragraph + "' >" + this.typeName(this.paragraph) + "</option>");
        $(id).append("<option value='" + this.department + "' >" + this.typeName(this.department) + "</option>");
//        $(id).append("<option value='" + this.safety + "' >" + this.typeName(this.safety) + "</option>");
//        $(id).append("<option value='" + this.shifts + "' >" + this.typeName(this.shifts) + "</option>");
//        $(id).append("<option value='" + this.malfunction + "' >" + this.typeName(this.malfunction) + "</option>");
    }
};
////////////////////////////////////////发布信息类型结束//////////////////////////////////////

////////////////////////////////////////预案类型开始//////////////////////////////////////
var emergency_type = {
    workshop: 3110176,
    electricService: 3110175,
    HighRailTech: 3110150,
    RailWireless: 3110149,
    RailWired: 3110148,
    typeName: function (value) {
        switch (value) {
            case this.workshop:
                return "车间";
            case this.electricService:
                return "电务处";
            case this.HighRailTech:
                return "高铁技术科";
            case this.RailWireless:
                return "普铁无线科";
            case this.RailWired:
                return "普铁有线科";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.workshop + "' >" + this.typeName(this.workshop) + "</option>");
        $(id).append("<option value='" + this.electricService + "' >" + this.typeName(this.electricService) + "</option>");
        $(id).append("<option value='" + this.HighRailTech + "' >" + this.typeName(this.HighRailTech) + "</option>");
        $(id).append("<option value='" + this.RailWireless + "' >" + this.typeName(this.RailWireless) + "</option>");
        $(id).append("<option value='" + this.RailWired + "' >" + this.typeName(this.RailWired) + "</option>");
    }
};
////////////////////////////////////////预案类型结束//////////////////////////////////////

////////////////////////////////////////调令状态开始//////////////////////////////////////
var dispathRoot_status = {
    caogao: 1,
    daijieshou: 3,
   // yijieshou: 3.5,//新增解状态--已接收
    chulizhong: 4,
    yiguidang: 8,
    statusName: function (value) {
        switch (value) {
            case this.caogao:
                return "草稿";
            case this.daijieshou:
                return "待接收";
           /* case this.yijieshou:
                return "已接收";*/
            case this.chulizhong:
                return "处理中";
            case this.yiguidang:
                return "已归档";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.caogao + "' >" + this.statusName(this.caogao) + "</option>");
        $(id).append("<option value='" + this.daijieshou + "' >" + this.statusName(this.daijieshou) + "</option>");
       /* $(id).append("<option value='" + this.yijieshou + "' >" + this.statusName(this.yijieshou) + "</option>");*/
        $(id).append("<option value='" + this.chulizhong + "' >" + this.statusName(this.chulizhong) + "</option>");
        $(id).append("<option value='" + this.yiguidang + "' >" + this.statusName(this.yiguidang) + "</option>");
    }
};
////////////////////////////////////////调令状态结束//////////////////////////////////////

////////////////////////////////////////待办调令状态开始//////////////////////////////////////
var dispathBacklog_status = {
    daijieshou: 3,
    yijieshou: 3.5,
    daihuifu: 5,
    yihuifu: 6,
    yiguidang: 8,
    yifenpai: 7,
    chulizhong: 4,
    statusName: function (value) {
        switch (value) {
            case this.daijieshou:
                return "待接收";
            case this.yijieshou:
                return "已接收";
            case this.daihuifu:
                return "待回复";
            case this.yihuifu:
                return "已回复";
            case this.yiguidang:
                return "已归档";
            case this.yifenpai:
                return "已分派";
            case this.chulizhong:
                return "处理中";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.daijieshou + "' >" + this.statusName(this.daijieshou) + "</option>");
        $(id).append("<option value='" + this.yijieshou + "' >" + this.statusName(this.yijieshou) + "</option>");
        $(id).append("<option value='" + this.daihuifu + "' >" + this.statusName(this.daihuifu) + "</option>");
        $(id).append("<option value='" + this.yihuifu + "' >" + this.statusName(this.yihuifu) + "</option>");
        $(id).append("<option value='" + this.yiguidang + "' >" + this.statusName(this.yiguidang) + "</option>");
        $(id).append("<option value='" + this.yifenpai + "' >" + this.statusName(this.yifenpai) + "</option>");
        $(id).append("<option value='" + this.chulizhong + "' >" + this.statusName(this.chulizhong) + "</option>");
    }
};
////////////////////////////////////////待办调令状态结束//////////////////////////////////////

/////////////////////////////////////////////////////////////设备类别开始-应急备品////////////////////////////////////////////////////////////////////
var emergency_speciality = {
    // universalWirelessEmergency: 310115,	//普铁无线应急设备
    // universalWireEmergency: 310116,	//普铁有线应急设备
    // highSpeedEmergency: 310117,	//高铁应急设备
    universalWirelessEmergency: 115,	//普速应急设备
    universalWireEmergency: 116,	//高速应急设备
    highSpeedEmergency: 117,	//应急中心设备
    typeName: function (value) {
        switch (value) {
            // case this.universalWirelessEmergency:
            //     return "普铁无线应急设备";
            // case this.universalWireEmergency:
            //     return "普铁有线应急设备";
            // case this.highSpeedEmergency:
            //     return "高铁应急设备";
            case this.universalWirelessEmergency:
                return "普速应急设备";
            case this.universalWireEmergency:
                return "高速应急设备";
            case this.highSpeedEmergency:
                return "应急中心设备";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.universalWirelessEmergency + "' >" + this.typeName(this.universalWirelessEmergency) + "</option>");
        $(id).append("<option value='" + this.universalWireEmergency + "' >" + this.typeName(this.universalWireEmergency) + "</option>");
        $(id).append("<option value='" + this.highSpeedEmergency + "' >" + this.typeName(this.highSpeedEmergency) + "</option>");
    }
};
var emergency_speciality_type = {
		emergencyDeviceB: 1,	//应急现场B类设备
		emergencyDeviceC: 2,	//应急现场C类设备
		emergencyDeviceD: 3,	//应急现场D类设备
		emergencyDeviceCenter: 4,	//应急中心设备
		emergencyDevicePublicNet: 5,	//公网应急设备
		typeName: function (value) {
			switch (value) {
			case this.emergencyDeviceB:
				return "应急现场B类设备";
			case this.emergencyDeviceC:
				return "应急现场C类设备";
			case this.emergencyDeviceD:
				return "应急现场D类设备";
			case this.emergencyDeviceCenter:
				return "应急中心设备";
			case this.emergencyDevicePublicNet:
				return "公网应急设备";
			}
		},
		listData: function (id) {
			$(id).append("<option value='" + this.emergencyDeviceB + "' >" + this.typeName(this.emergencyDeviceB) + "</option>");
			$(id).append("<option value='" + this.emergencyDeviceC + "' >" + this.typeName(this.emergencyDeviceC) + "</option>");
			$(id).append("<option value='" + this.emergencyDeviceD + "' >" + this.typeName(this.emergencyDeviceD) + "</option>");
			$(id).append("<option value='" + this.emergencyDeviceCenter + "' >" + this.typeName(this.emergencyDeviceCenter) + "</option>");
			$(id).append("<option value='" + this.emergencyDevicePublicNet + "' >" + this.typeName(this.emergencyDevicePublicNet) + "</option>");
		}
};
/////////////////////////////////////////////////////////////设备类别结束-应急备品////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////设备属性开始-应急备品////////////////////////////////////////////////////////////////////
var emergency_attribute = {
    communicationLineSystem: 1,	//通信线路系统
    transmissionSystem: 2,	//传输系统
    accessNetworkSystem: 3,	//接入网系统
    synchronizingSystem: 4,//同步系统
    dataSignalingSystem: 5, //数据通信系统
    dispatchCommunicationSystem: 6, //调度通信系统
    conferenceCommunicationSystem: 7, //会议通信系统
    broadcastAndStationCommunicationSystem: 8, //广播与站场通信系统
    telegraphTelephoneSystem: 9, //报话系统
    emergencyCommunicationSystem: 10, //应急通信系统
    integratedVideoMonitoringSystem: 11,//综合视频监控系统
    communicationPowerSystem: 12, //通信电源系统
    ringSystem: 13, //动环系统
    integrationNetworkManagementSystem: 14, //综合网管系统
    radioTrainDispatchingSystem: 15, //无线列调系统
    GSMRSystem: 16, //GSM-R系统
    hazardPreventingSystem: 17, //防灾系统
    specialLineCircuitAccessEquipment: 18, //专线电路接入设备
    groundAndMine: 19, //机房设备-地线及防雷
    airCondition: 20, //机房设备-空调
    fireProtection: 21, //机房设备-消防
    otherThings: 22, //机房设备-其他
    instrumentAndMeter: 23, //仪器仪表
    typeName: function (value) {
        switch (value) {
            case this.communicationLineSystem:
                return "通信线路系统";
            case this.transmissionSystem:
                return "传输系统";
            case this.accessNetworkSystem:
                return "接入网系统";
            case this.synchronizingSystem:
                return "同步系统";
            case this.dataSignalingSystem:
                return "数据通信系统";
            case this.dispatchCommunicationSystem:
                return "调度通信系统";
            case this.conferenceCommunicationSystem:
                return "会议通信系统";
            case this.broadcastAndStationCommunicationSystem:
                return "广播与站场通信系统";
            case this.telegraphTelephoneSystem:
                return "报话系统";
            case this.emergencyCommunicationSystem:
                return "应急通信系统";
            case this.integratedVideoMonitoringSystem:
                return "综合视频监控系统";
            case this.communicationPowerSystem:
                return "通信电源系统";
            case this.ringSystem:
                return "动环系统";
            case this.integrationNetworkManagementSystem:
                return "综合网管系统";
            case this.radioTrainDispatchingSystem:
                return "无线列调系统";
            case this.GSMRSystem:
                return "GSM-R系统";
            case this.hazardPreventingSystem:
                return "防灾系统";
            case this.specialLineCircuitAccessEquipment:
                return "专线电路接入设备";
            case this.groundAndMine:
                return "机房设备-地线及防雷";
            case this.airCondition:
                return "机房设备-空调";
            case this.fireProtection:
                return "机房设备-消防";
            case this.otherThings:
                return "机房设备-其他";
            case this.instrumentAndMeter:
                return "仪器仪表";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.typeName(this.communicationLineSystem) + "' >" + this.typeName(this.communicationLineSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.transmissionSystem) + "' >" + this.typeName(this.transmissionSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.accessNetworkSystem) + "' >" + this.typeName(this.accessNetworkSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.synchronizingSystem) + "' >" + this.typeName(this.synchronizingSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.dataSignalingSystem) + "' >" + this.typeName(this.dataSignalingSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.dispatchCommunicationSystem) + "' >" + this.typeName(this.dispatchCommunicationSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.conferenceCommunicationSystem) + "' >" + this.typeName(this.conferenceCommunicationSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.broadcastAndStationCommunicationSystem) + "' >" + this.typeName(this.broadcastAndStationCommunicationSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.telegraphTelephoneSystem) + "' >" + this.typeName(this.telegraphTelephoneSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.emergencyCommunicationSystem) + "' >" + this.typeName(this.emergencyCommunicationSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.integratedVideoMonitoringSystem) + "' >" + this.typeName(this.integratedVideoMonitoringSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.communicationPowerSystem) + "' >" + this.typeName(this.communicationPowerSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.ringSystem) + "' >" + this.typeName(this.ringSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.integrationNetworkManagementSystem) + "' >" + this.typeName(this.integrationNetworkManagementSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.radioTrainDispatchingSystem) + "' >" + this.typeName(this.radioTrainDispatchingSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.GSMRSystem) + "' >" + this.typeName(this.GSMRSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.hazardPreventingSystem) + "' >" + this.typeName(this.hazardPreventingSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.specialLineCircuitAccessEquipment) + "' >" + this.typeName(this.specialLineCircuitAccessEquipment) + "</option>");
        $(id).append("<option value='" + this.typeName(this.groundAndMine) + "' >" + this.typeName(this.groundAndMine) + "</option>");
        $(id).append("<option value='" + this.typeName(this.airCondition) + "' >" + this.typeName(this.airCondition) + "</option>");
        $(id).append("<option value='" + this.typeName(this.fireProtection) + "' >" + this.typeName(this.fireProtection) + "</option>");
        $(id).append("<option value='" + this.typeName(this.otherThings) + "' >" + this.typeName(this.otherThings) + "</option>");
        $(id).append("<option value='" + this.typeName(this.instrumentAndMeter) + "' >" + this.typeName(this.instrumentAndMeter) + "</option>");

    }
};
/////////////////////////////////////////////////////////////设备属性结束-应急备品////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////单位开始-应急备品////////////////////////////////////////////////////////////////////
var emergency_unit = {
    ta: 3110156,	//他
    tai: 10044,	//台
    gongli: 10045,	//公里
    tao: 10046,	//套
    kuai: 10047,	//块
    ge: 10048,	//个
    tiao: 10049,	//条
    mi: 310118,	//米
    ba: 310119,	//把
    jian: 310120,	//件
    sheng: 310121,	//升
    ding: 310122,	//顶
    gen: 310123,	//根
    KM: 310124,	//KM
    M: 310125,	//M
    zuo: 310126,	//座
    typeName: function (value) {
        switch (value) {
            case this.ta:
                return "他";
            case this.tai:
                return "台";
            case this.gongli:
                return "公里";
            case this.tao:
                return "套";
            case this.kuai:
                return "块";
            case this.ge:
                return "个";
            case this.tiao:
                return "条";
            case this.mi:
                return "米";
            case this.ba:
                return "把";
            case this.jian:
                return "件";
            case this.sheng:
                return "升";
            case this.ding:
                return "顶";
            case this.gen:
                return "根";
            case this.KM:
                return "KM";
            case this.M:
                return "M";
            case this.zuo:
                return "座";
        }
    }
};
/////////////////////////////////////////////////////////////单位结束-应急备品////////////////////////////////////////////////////////////////////

////////////////////////////////////////应急机构职务类型开始//////////////////////////////////////
var emergencyOrg_dutyType = {
    member: 10031,
    commander: 10032,
    posthead: 10033,
    head: 10034,
    typeName: function (value) {
        switch (value) {
            case this.member:
                return "成员";
            case this.commander:
                return "总指挥";
            case this.posthead:
                return "副组长";
            case this.head:
                return "组长";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.member + "' >" + this.typeName(this.member) + "</option>");
        $(id).append("<option value='" + this.posthead + "' >" + this.typeName(this.posthead) + "</option>");
        $(id).append("<option value='" + this.head + "' >" + this.typeName(this.head) + "</option>");
        $(id).append("<option value='" + this.commander + "' >" + this.typeName(this.commander) + "</option>");
    }
};
////////////////////////////////////////应急机构职务类型结束//////////////////////////////////////

/////////////////////////////////////////////////////////////设备类别开始-日常维护备品////////////////////////////////////////////////////////////////////
var dailySpare_speciality = {
    shiPinJianKong: 10003,	//视屏监控设备
    chuanShuWangJiJieRu: 10004,	//传输及接入网设备
    tongXinXianLu: 10005,	//通信线路设备
    huiYi: 10006,	//会议设备
    tongXinDianYuan: 10007,	//通信电源设备
    shuTiao: 10008,	//数调设备

    xianluAndFushu: 20001,	//通信线路及附属设备
    chuangshuwang: 20002,	//传输网设备
    jieruwang: 20003,	//接入网设备
    tongbu: 20004,	//同步设备
    shujuwang: 20005,	//数据网设备
    diaodutongxin: 20006,	//调度通信设备
    huiyitongxin: 20007,	//会议通信设备

    guangboAndzctongxin: 20008,	//广播与站场通信设备
    baohua: 20009,	//报话设备
    yinjitongxin: 200010,	//应急通信设备
    zongheSpjk: 200011,	//综合视频监控设备
    TxdyAndJfhjjk: 200012,	//通信电源及机房环境监控设备
    zhuangxianDljr: 200013,	//专线电路接入设备
    zonghewangguan: 200014,	//综合网管设备

    jifang: 200015,	//机房设备
    wuxianlietiao: 200016,	//无线列调设备
    GSM_R: 200017,	//GSM-R设备


    typeName: function (value) {
        switch (value) {
            case this.shiPinJianKong:
                return "视屏监控设备";
            case this.chuanShuWangJiJieRu:
                return "传输及接入网设备";
            case this.tongXinXianLu:
                return "通信线路设备";
            case this.huiYi:
                return "会议设备";
            case this.tongXinDianYuan:
                return "通信电源设备";
            case this.shuTiao:
                return "数调设备";

            case this.xianluAndFushu:
                return "通信线路及附属设备";
            case this.chuangshuwang:
                return "传输网设备";
            case this.jieruwang:
                return "接入网设备";
            case this.tongbu:
                return "同步设备";
            case this.shujuwang:
                return "数据网设备";
            case this.diaodutongxin:
                return "调度通信设备";
            case this.huiyitongxin:
                return "会议通信设备";

            case this.guangboAndzctongxin:
                return "广播与站场通信设备";
            case this.baohua:
                return "报话设备";
            case this.yinjitongxin:
                return "应急通信设备";
            case this.zongheSpjk:
                return "综合视频监控设备";
            case this.TxdyAndJfhjjk:
                return "通信电源及机房环境监控设备";
            case this.zhuangxianDljr:
                return "专线电路接入设备";
            case this.zonghewangguan:
                return "综合网管设备";

            case this.jifang:
                return "机房设备";
            case this.wuxianlietiao:
                return "无线列调设备";
            case this.GSM_R:
                return "GSM-R设备";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.shiPinJianKong + "' >" + this.typeName(this.shiPinJianKong) + "</option>");
        $(id).append("<option value='" + this.chuanShuWangJiJieRu + "' >" + this.typeName(this.chuanShuWangJiJieRu) + "</option>");
        $(id).append("<option value='" + this.tongXinXianLu + "' >" + this.typeName(this.tongXinXianLu) + "</option>");
        $(id).append("<option value='" + this.huiYi + "' >" + this.typeName(this.huiYi) + "</option>");
        $(id).append("<option value='" + this.tongXinDianYuan + "' >" + this.typeName(this.tongXinDianYuan) + "</option>");
        $(id).append("<option value='" + this.shuTiao + "' >" + this.typeName(this.shuTiao) + "</option>");

        $(id).append("<option value='" + this.xianluAndFushu + "' >" + this.typeName(this.xianluAndFushu) + "</option>");
        $(id).append("<option value='" + this.chuangshuwang + "' >" + this.typeName(this.chuangshuwang) + "</option>");
        $(id).append("<option value='" + this.jieruwang + "' >" + this.typeName(this.jieruwang) + "</option>");
        $(id).append("<option value='" + this.tongbu + "' >" + this.typeName(this.tongbu) + "</option>");
        $(id).append("<option value='" + this.shujuwang + "' >" + this.typeName(this.shujuwang) + "</option>");
        $(id).append("<option value='" + this.diaodutongxin + "' >" + this.typeName(this.diaodutongxin) + "</option>");
        $(id).append("<option value='" + this.huiyitongxin + "' >" + this.typeName(this.huiyitongxin) + "</option>");

        $(id).append("<option value='" + this.guangboAndzctongxin + "' >" + this.typeName(this.guangboAndzctongxin) + "</option>");
        $(id).append("<option value='" + this.baohua + "' >" + this.typeName(this.baohua) + "</option>");
        $(id).append("<option value='" + this.yinjitongxin + "' >" + this.typeName(this.yinjitongxin) + "</option>");
        $(id).append("<option value='" + this.zongheSpjk + "' >" + this.typeName(this.zongheSpjk) + "</option>");
        $(id).append("<option value='" + this.TxdyAndJfhjjk + "' >" + this.typeName(this.TxdyAndJfhjjk) + "</option>");
        $(id).append("<option value='" + this.zhuangxianDljr + "' >" + this.typeName(this.zhuangxianDljr) + "</option>");
        $(id).append("<option value='" + this.zonghewangguan + "' >" + this.typeName(this.zonghewangguan) + "</option>");

        $(id).append("<option value='" + this.jifang + "' >" + this.typeName(this.jifang) + "</option>");
        $(id).append("<option value='" + this.wuxianlietiao + "' >" + this.typeName(this.wuxianlietiao) + "</option>");
        $(id).append("<option value='" + this.GSM_R + "' >" + this.typeName(this.GSM_R) + "</option>");
    }
};
/////////////////////////////////////////////////////////////设备类别结束-日常维护备品////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////电路工单类别开始-任务管理////////////////////////////////////////////////////////////////////
var taskManage_orderType = {
    trans: 167000,	//传输工单
    dataNet: 167001,	//数据网工单
    gwang: 167002,	//G网工单
    ciruit: 167003,	//CIR工单
    other: 167004,	//其他工单
    typeName: function (value) {
        switch (value) {
            case this.trans:
                return "传输工单";
            case this.dataNet:
                return "数据网工单";
            case this.gwang:
                return "G网工单";
            case this.ciruit:
                return "CIR工单";
            case this.other:
                return "其他工单";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.trans + "' >" + this.typeName(this.trans) + "</option>");
        $(id).append("<option value='" + this.dataNet + "' >" + this.typeName(this.dataNet) + "</option>");
        $(id).append("<option value='" + this.gwang + "' >" + this.typeName(this.gwang) + "</option>");
        $(id).append("<option value='" + this.ciruit + "' >" + this.typeName(this.ciruit) + "</option>");
        $(id).append("<option value='" + this.other + "' >" + this.typeName(this.other) + "</option>");
    }
};
/////////////////////////////////////////////////////////////电路工单类别结束-任务管理///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////任务类别开始-任务管理////////////////////////////////////////////////////////////////////
var taskManage_taskType = {
    telegraph: 3110115,	//电报
    wireless: 10040,	//无线
    wire: 10041,	//有线
    highRail: 10042,	//高铁
    universal: 10043,	//通用
    autumn: 31101,	//秋鉴
    typeName: function (value) {
        switch (value) {
            case this.telegraph:
                return "电报";
            case this.wireless:
                return "无线";
            case this.wire:
                return "有线";
            case this.highRail:
                return "高铁";
            case this.universal:
                return "通用";
            case this.autumn:
                return "秋鉴";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.telegraph + "' >" + this.typeName(this.telegraph) + "</option>");
        $(id).append("<option value='" + this.wireless + "' >" + this.typeName(this.wireless) + "</option>");
        $(id).append("<option value='" + this.wire + "' >" + this.typeName(this.wire) + "</option>");
        $(id).append("<option value='" + this.highRail + "' >" + this.typeName(this.highRail) + "</option>");
        $(id).append("<option value='" + this.universal + "' >" + this.typeName(this.universal) + "</option>");
        $(id).append("<option value='" + this.autumn + "' >" + this.typeName(this.autumn) + "</option>");
    }
};
/////////////////////////////////////////////////////////////任务类别结束-任务管理////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////任务等级（紧急程度）开始-任务管理////////////////////////////////////////////////////////////////////
var taskManage_taskLevel = {
    urgent: 10038,	//紧急
    common: 10039,	//普通
    typeName: function (value) {
        switch (value) {
            case this.urgent:
                return "紧急";
            case this.common:
                return "普通";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.urgent + "' >" + this.typeName(this.urgent) + "</option>");
        $(id).append("<option value='" + this.common + "' >" + this.typeName(this.common) + "</option>");
    }
};
/////////////////////////////////////////////////////////////任务等级（紧急程度）结束-任务管理////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////任务状态开始-任务管理////////////////////////////////////////////////////////////////////
var taskManage_status = {
    caoGao: '1',	//草稿
    daiJieShou: '2',	//待接收
    chuLiZhong: '3',	//处理中
    daiGuiDang: '4',	//待归档
//  daiHuiFu:'6',  // 待回复， 因客户流程需要，已取消此状态
    yiGuiDang: '5',	//已归档
    yiHuiFu: "7",//已回复
    yiTuiHui: "8",//已回退
    yiFenPai: "9",//已分派
//    daiShenHe: '10',	//待审核
//    shenHeTongGuo: '11',	//审核通过
//    shenHeBuTongGuo: '12',	//审核不通过

    typeName: function (value) {
        switch (value) {
            case this.caoGao:
                return "草稿";
            case this.daiJieShou:
                return "待接收";
            case this.chuLiZhong:
                return "处理中";
            case this.daiGuiDang:
                return "待归档";
            case this.yiGuiDang:
                return "已归档";
         // case this.daiHuiFu:
         //     return "待回复";   
            case this.yiHuiFu:
                return "已回复";
            case this.yiTuiHui:
                return "已退回";
            case this.yiFenPai:
                return "已分派";
//            case this.daiShenHe:
//                return "待审核";
//            case this.shenHeTongGuo:
//                return "审核通过";
//            case this.shenHeBuTongGuo:
//                return "审核不通过";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.caoGao + "' >" + this.typeName(this.caoGao) + "</option>");
        $(id).append("<option value='" + this.daiJieShou + "' >" + this.typeName(this.daiJieShou) + "</option>");
        $(id).append("<option value='" + this.chuLiZhong + "' >" + this.typeName(this.chuLiZhong) + "</option>");
        $(id).append("<option value='" + this.yiGuiDang + "' >" + this.typeName(this.yiGuiDang) + "</option>");
//			$(id).append("<option value='" + this.daiHuiFu + "' >" + this.typeName(this.daiHuiFu) + "</option>");
//			$(id).append("<option value='" + this.yiHuiFu + "' >" + this.typeName(this.yiHuiFu) + "</option>");
//			$(id).append("<option value='" + this.yiTuiHui + "' >" + this.typeName(this.yiTuiHui) + "</option>");
//			$(id).append("<option value='" + this.yiFenPai + "' >" + this.typeName(this.yiFenPai) + "</option>");
//        $(id).append("<option value='" + this.daiShenHe + "' >" + this.typeName(this.daiShenHe) + "</option>");
//        $(id).append("<option value='" + this.shenHeTongGuo + "' >" + this.typeName(this.shenHeTongGuo) + "</option>");
//        $(id).append("<option value='" + this.shenHeBuTongGuo + "' >" + this.typeName(this.shenHeBuTongGuo) + "</option>");
    },

    listData_check: function (id) {
//        $(id).append("<option value='" + this.daiShenHe + "' >" + this.typeName(this.daiShenHe) + "</option>");
//        $(id).append("<option value='" + this.shenHeTongGuo + "' >" + this.typeName(this.shenHeTongGuo) + "</option>");
//        $(id).append("<option value='" + this.shenHeBuTongGuo + "' >" + this.typeName(this.shenHeBuTongGuo) + "</option>");
    },

    listData_toDo: function (id) {
        $(id).append("<option value='" + this.daiJieShou + "' >" + this.typeName(this.daiJieShou) + "</option>");
//        $(id).append("<option value='" + this.daiHuiFu + "' >" + this.typeName(this.daiHuiFu) + "</option>");
        $(id).append("<option value='" + this.yiHuiFu + "' >" + this.typeName(this.yiHuiFu) + "</option>");
        $(id).append("<option value='" + this.yiGuiDang + "' >" + this.typeName(this.yiGuiDang) + "</option>");
        $(id).append("<option value='" + this.yiTuiHui + "' >" + this.typeName(this.yiTuiHui) + "</option>");
        $(id).append("<option value='" + this.yiFenPai + "' >" + this.typeName(this.yiFenPai) + "</option>");
//			$(id).append("<option value='" + this.shenHeTongGuo + "' >" + this.typeName(this.shenHeTongGuo) + "</option>");
//			$(id).append("<option value='" + this.shenHeBuTongGuo + "' >" + this.typeName(this.shenHeBuTongGuo) + "</option>");
    },

};
/////////////////////////////////////////////////////////////任务状态结束-任务管理////////////////////////////////////////////////////////////////////


////////////////////////////////////////应急日常设备类型开始//////////////////////////////////////
var deviceConfig_type = {
    RailWirelessDevice: 115,//310115,
    RailWiredDevice: 116,//310116,
    HighRailDevice: 117,//310117,
    VideoMonitoring: 10003,
    TransmissionAndAccessNetwork: 10004,
    CommunicationLine: 10005,
    Meeting: 10006,
    CommunicationPowerSupply: 10007,
    DigitalControl: 10008,

    xianluAndFushu: 20001,	//通信线路及附属设备
    chuangshuwang: 20002,	//传输网设备
    jieruwang: 20003,	//接入网设备
    tongbu: 20004,	//同步设备
    shujuwang: 20005,	//数据网设备
    diaodutongxin: 20006,	//调度通信设备
    huiyitongxin: 20007,	//会议通信设备

    guangboAndzctongxin: 20008,	//广播与站场通信设备
    baohua: 20009,	//报话设备
    yinjitongxin: 200010,	//应急通信设备
    zongheSpjk: 200011,	//综合视频监控设备
    TxdyAndJfhjjk: 200012,	//通信电源及机房环境监控设备
    zhuangxianDljr: 200013,	//专线电路接入设备
    zonghewangguan: 200014,	//综合网管设备

    jifang: 200015,	//机房设备
    wuxianlietiao: 200016,	//无线列调设备
    GSM_R: 200017,	//GSM-R设备
    typeName: function (value) {
        switch (value) {
            case this.RailWirelessDevice:
                // return "普铁无线应急设备";
                return "普速应急设备";
            case this.RailWiredDevice:
                // return "普铁有线应急设备";
                return "高速应急设备";
            case this.HighRailDevice:
                // return "高铁应急设备";
                return "应急中心设备";
            case this.VideoMonitoring:
                return "视屏监控设备";
            case this.TransmissionAndAccessNetwork:
                return "传输及接入网设备";
            case this.CommunicationLine:
                return "通信线路设备";
            case this.Meeting:
                return "会议设备";
            case this.CommunicationPowerSupply:
                return "通信电源设备";
            case this.DigitalControl:
                return "数调设备";

            case this.xianluAndFushu:
                return "通信线路及附属设备";
            case this.chuangshuwang:
                return "传输网设备";
            case this.jieruwang:
                return "接入网设备";
            case this.tongbu:
                return "同步设备";
            case this.shujuwang:
                return "数据网设备";
            case this.diaodutongxin:
                return "调度通信设备";
            case this.huiyitongxin:
                return "会议通信设备";

            case this.guangboAndzctongxin:
                return "广播与站场通信设备";
            case this.baohua:
                return "报话设备";
            case this.yinjitongxin:
                return "应急通信设备";
            case this.zongheSpjk:
                return "综合视频监控设备";
            case this.TxdyAndJfhjjk:
                return "通信电源及机房环境监控设备";
            case this.zhuangxianDljr:
                return "专线电路接入设备";
            case this.zonghewangguan:
                return "综合网管设备";

            case this.jifang:
                return "机房设备";
            case this.wuxianlietiao:
                return "无线列调设备";
            case this.GSM_R:
                return "GSM-R设备";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.RailWirelessDevice + "' >" + this.typeName(this.RailWirelessDevice) + "</option>");
        $(id).append("<option value='" + this.RailWiredDevice + "' >" + this.typeName(this.RailWiredDevice) + "</option>");
        $(id).append("<option value='" + this.HighRailDevice + "' >" + this.typeName(this.HighRailDevice) + "</option>");
        $(id).append("<option value='" + this.VideoMonitoring + "' >" + this.typeName(this.VideoMonitoring) + "</option>");
        $(id).append("<option value='" + this.TransmissionAndAccessNetwork + "' >" + this.typeName(this.TransmissionAndAccessNetwork) + "</option>");
        $(id).append("<option value='" + this.CommunicationLine + "' >" + this.typeName(this.CommunicationLine) + "</option>");
        $(id).append("<option value='" + this.Meeting + "' >" + this.typeName(this.Meeting) + "</option>");
        $(id).append("<option value='" + this.CommunicationPowerSupply + "' >" + this.typeName(this.CommunicationPowerSupply) + "</option>");
        $(id).append("<option value='" + this.DigitalControl + "' >" + this.typeName(this.DigitalControl) + "</option>");

        $(id).append("<option value='" + this.xianluAndFushu + "' >" + this.typeName(this.xianluAndFushu) + "</option>");
        $(id).append("<option value='" + this.chuangshuwang + "' >" + this.typeName(this.chuangshuwang) + "</option>");
        $(id).append("<option value='" + this.jieruwang + "' >" + this.typeName(this.jieruwang) + "</option>");
        $(id).append("<option value='" + this.tongbu + "' >" + this.typeName(this.tongbu) + "</option>");
        $(id).append("<option value='" + this.shujuwang + "' >" + this.typeName(this.shujuwang) + "</option>");
        $(id).append("<option value='" + this.diaodutongxin + "' >" + this.typeName(this.diaodutongxin) + "</option>");
        $(id).append("<option value='" + this.huiyitongxin + "' >" + this.typeName(this.huiyitongxin) + "</option>");

        $(id).append("<option value='" + this.guangboAndzctongxin + "' >" + this.typeName(this.guangboAndzctongxin) + "</option>");
        $(id).append("<option value='" + this.baohua + "' >" + this.typeName(this.baohua) + "</option>");
        $(id).append("<option value='" + this.yinjitongxin + "' >" + this.typeName(this.yinjitongxin) + "</option>");
        $(id).append("<option value='" + this.zongheSpjk + "' >" + this.typeName(this.zongheSpjk) + "</option>");
        $(id).append("<option value='" + this.TxdyAndJfhjjk + "' >" + this.typeName(this.TxdyAndJfhjjk) + "</option>");
        $(id).append("<option value='" + this.zhuangxianDljr + "' >" + this.typeName(this.zhuangxianDljr) + "</option>");
        $(id).append("<option value='" + this.zonghewangguan + "' >" + this.typeName(this.zonghewangguan) + "</option>");

        $(id).append("<option value='" + this.jifang + "' >" + this.typeName(this.jifang) + "</option>");
        $(id).append("<option value='" + this.wuxianlietiao + "' >" + this.typeName(this.wuxianlietiao) + "</option>");
        $(id).append("<option value='" + this.GSM_R + "' >" + this.typeName(this.GSM_R) + "</option>");
    }
};
////////////////////////////////////////应急日常设备类型结束//////////////////////////////////////

////////////////////////////////////////应急日常设备类型开始（标准配置）//////////////////////////////////////
var deviceNormConfig_type = {
    // HighRailDevice: 310117,
    // RailWirelessDevice: 310115,
    // RailWiredDevice: 310116,
    HighRailDevice: 117,
    RailWirelessDevice: 115,
    RailWiredDevice: 116,
    typeName: function (value) {
        switch (value) {
            case this.HighRailDevice:
                // return "高铁应急设备";
                return "应急中心设备";
            case this.RailWirelessDevice:
                // return "普铁无线应急设备";
                return "普速应急设备";
            case this.RailWiredDevice:
                // return "普铁有线应急设备";
                return "高速应急设备";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.HighRailDevice + "' >" + this.typeName(this.HighRailDevice) + "</option>");
        $(id).append("<option value='" + this.RailWirelessDevice + "' >" + this.typeName(this.RailWirelessDevice) + "</option>");
        $(id).append("<option value='" + this.RailWiredDevice + "' >" + this.typeName(this.RailWiredDevice) + "</option>");
    }
};
////////////////////////////////////////应急日常设备类型结束//////////////////////////////////////

////////////////////////////////////////计量单位类型开始//////////////////////////////////////
var unit_type = {
    ta: 3110156,
    tai: 10044,
    metre: 310118,
    ba: 310119,
    ding: 310122,
    M: 310125,
    kilometre: 10045,
    tao: 10046,
    kuai: 10047,
    ge: 10048,
    tiao: 10049,
    jian: 310120,
    sheng: 310121,
    gen: 310123,
    KM: 310124,
    zuo: 310126,
    typeName: function (value) {
        switch (value) {
            case this.ta:
                return "他";
            case this.tai:
                return "台";
            case this.metre:
                return "米";
            case this.ba:
                return "把";
            case this.ding:
                return "顶";
            case this.M:
                return "M";
            case this.kilometre:
                return "公里";
            case this.tao:
                return "套";
            case this.kuai:
                return "块";
            case this.ge:
                return "个";
            case this.tiao:
                return "条";
            case this.jian:
                return "件";
            case this.sheng:
                return "升";
            case this.gen:
                return "根";
            case this.KM:
                return "KM";
            case this.zuo:
                return "座";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.ta + "' >" + this.typeName(this.ta) + "</option>");
        $(id).append("<option value='" + this.tai + "' >" + this.typeName(this.tai) + "</option>");
        $(id).append("<option value='" + this.metre + "' >" + this.typeName(this.metre) + "</option>");
        $(id).append("<option value='" + this.ba + "' >" + this.typeName(this.ba) + "</option>");
        $(id).append("<option value='" + this.ding + "' >" + this.typeName(this.ding) + "</option>");
        $(id).append("<option value='" + this.M + "' >" + this.typeName(this.M) + "</option>");
        $(id).append("<option value='" + this.kilometre + "' >" + this.typeName(this.kilometre) + "</option>");
        $(id).append("<option value='" + this.tao + "' >" + this.typeName(this.tao) + "</option>");
        $(id).append("<option value='" + this.kuai + "' >" + this.typeName(this.kuai) + "</option>");
        $(id).append("<option value='" + this.ge + "' >" + this.typeName(this.ge) + "</option>");
        $(id).append("<option value='" + this.tiao + "' >" + this.typeName(this.tiao) + "</option>");
        $(id).append("<option value='" + this.jian + "' >" + this.typeName(this.jian) + "</option>");
        $(id).append("<option value='" + this.sheng + "' >" + this.typeName(this.sheng) + "</option>");
        $(id).append("<option value='" + this.gen + "' >" + this.typeName(this.gen) + "</option>");
        $(id).append("<option value='" + this.KM + "' >" + this.typeName(this.KM) + "</option>");
        $(id).append("<option value='" + this.zuo + "' >" + this.typeName(this.zuo) + "</option>");
    }
};
////////////////////////////////////////计量单位类型结束//////////////////////////////////////

////////////////////////////////////////计量单位类型开始//////////////////////////////////////
var deviceUnit_type = {
    typeName: function (contextPath, value) {
        var result = null;
        $.ajax({
            url: contextPath + "deviceUnitConfigAction/getUnitById.cn",
            type: "post",
            dataType: "json",
            data: {
                id: value
            },
            async: false,
            success: function (data, status) {
                if (status) {
                    result = data.unit;
                } else {
                    result = "";
                }
            }
        });
        console.log(result);
        return result;
    }
};
////////////////////////////////////////计量单位类型结束//////////////////////////////////////

////////////////////////////////////////计量单位类型开始//////////////////////////////////////
var unit_ = {
    unitName: function (units, value) {
        for (var i = 0; i < units.length; i++) {
            if (units[i].id == value) {
                return units[i].unit;
            }
        }
    },
    listData: function (units, id) {
        for (var i = 0; i < units.length; i++) {
            $(id).append("<option value='" + units[i].id + "' >" + units[i].unit + "</option>");
        }
    }
};
////////////////////////////////////////计量单位类型结束//////////////////////////////////////

/////////////////////////////////状态开始-车间问题库///////////////////////////////
var workShopProblemLib_status = {
    wait_examine: 0,	//待审核
    wait_reply: 1,	//待回复
    finish: 2,	//完成
    unfinish: 3,	//未完成
    typeName: function (value) {
        switch (value) {
            case this.wait_examine:
                return "待审核";
            case this.wait_reply:
                return "待回复";
            case this.finish:
                return "完成";
            case this.unfinish:
                return "未完成";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.wait_examine + "' >" + this.typeName(this.wait_examine) + "</option>");
        $(id).append("<option value='" + this.wait_reply + "' >" + this.typeName(this.wait_reply) + "</option>");
        $(id).append("<option value='" + this.finish + "' >" + this.typeName(this.finish) + "</option>");
        $(id).append("<option value='" + this.unfinish + "' >" + this.typeName(this.unfinish) + "</option>");
    }
};
/////////////////////////////////状态结束-车间问题库////////////////////////////////


////////////////////////////////////////年开始//////////////////////////////////////
var year_ = {
    a: 2012,
    b: 2013,
    c: 2014,
    d: 2015,
    e: 2016,
    f: 2017,
    g: 2018,
    h: 2019,
    i: 2020,
    j: 2021,
    k: 2022,
    typeName: function (value) {
        switch (value) {
            case this.a:
                return "2012";
            case this.b:
                return "2013";
            case this.c:
                return "2014";
            case this.d:
                return "2015";
            case this.e:
                return "2016";
            case this.f:
                return "2017";
            case this.g:
                return "2018";
            case this.h:
                return "2019";
            case this.i:
                return "2020";
            case this.j:
                return "2021";
            case this.k:
                return "2022";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.a + "' >" + this.typeName(this.a) + "</option>");
        $(id).append("<option value='" + this.b + "' >" + this.typeName(this.b) + "</option>");
        $(id).append("<option value='" + this.c + "' >" + this.typeName(this.c) + "</option>");
        $(id).append("<option value='" + this.d + "' >" + this.typeName(this.d) + "</option>");
        $(id).append("<option value='" + this.e + "' >" + this.typeName(this.e) + "</option>");
        $(id).append("<option value='" + this.f + "' >" + this.typeName(this.f) + "</option>");
        $(id).append("<option value='" + this.g + "' >" + this.typeName(this.g) + "</option>");
        $(id).append("<option value='" + this.h + "' >" + this.typeName(this.h) + "</option>");
        $(id).append("<option value='" + this.i + "' >" + this.typeName(this.i) + "</option>");
        $(id).append("<option value='" + this.j + "' >" + this.typeName(this.j) + "</option>");
        $(id).append("<option value='" + this.k + "' >" + this.typeName(this.k) + "</option>");
    }
};
////////////////////////////////////////年结束//////////////////////////////////////

////////////////////////////////////////月开始//////////////////////////////////////
var month_ = {
    a: 1,
    b: 2,
    c: 3,
    d: 4,
    e: 5,
    f: 6,
    g: 7,
    h: 8,
    i: 9,
    j: 10,
    k: 11,
    l: 12,
    typeName: function (value) {
        switch (value) {
            case this.a:
                return "1";
            case this.b:
                return "2";
            case this.c:
                return "3";
            case this.d:
                return "4";
            case this.e:
                return "5";
            case this.f:
                return "6";
            case this.g:
                return "7";
            case this.h:
                return "8";
            case this.i:
                return "9";
            case this.j:
                return "10";
            case this.k:
                return "11";
            case this.l:
                return "12";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.a + "' >" + this.typeName(this.a) + "</option>");
        $(id).append("<option value='" + this.b + "' >" + this.typeName(this.b) + "</option>");
        $(id).append("<option value='" + this.c + "' >" + this.typeName(this.c) + "</option>");
        $(id).append("<option value='" + this.d + "' >" + this.typeName(this.d) + "</option>");
        $(id).append("<option value='" + this.e + "' >" + this.typeName(this.e) + "</option>");
        $(id).append("<option value='" + this.f + "' >" + this.typeName(this.f) + "</option>");
        $(id).append("<option value='" + this.g + "' >" + this.typeName(this.g) + "</option>");
        $(id).append("<option value='" + this.h + "' >" + this.typeName(this.h) + "</option>");
        $(id).append("<option value='" + this.i + "' >" + this.typeName(this.i) + "</option>");
        $(id).append("<option value='" + this.j + "' >" + this.typeName(this.j) + "</option>");
        $(id).append("<option value='" + this.k + "' >" + this.typeName(this.k) + "</option>");
        $(id).append("<option value='" + this.l + "' >" + this.typeName(this.l) + "</option>");
    }
};
////////////////////////////////////////月结束//////////////////////////////////////

////////////////////////////////////////应急救援命令开始//////////////////////////////////////
var emerRescue_status = {
    caogao: 1,
    daijieshou: 2,
    chulizhong: 3,
    yiguidang: 4,
    undoStatus: 5,
    statusName: function (value) {
        switch (value) {
            case this.caogao:
                return "草稿";
            case this.daijieshou:
                return "待接收";
            case this.chulizhong:
                return "处理中";
            case this.yiguidang:
                return "已归档";
            case this.undoStatus:
                return "撤销中";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.caogao + "' >" + this.statusName(this.caogao) + "</option>");
        $(id).append("<option value='" + this.daijieshou + "' >" + this.statusName(this.daijieshou) + "</option>");
        $(id).append("<option value='" + this.chulizhong + "' >" + this.statusName(this.chulizhong) + "</option>");
        $(id).append("<option value='" + this.yiguidang + "' >" + this.statusName(this.yiguidang) + "</option>");
        $(id).append("<option value='" + this.undoStatus + "' >" + this.statusName(this.undoStatus) + "</option>");
    },
    toBeDoneListData: function (id) {
        $(id).append("<option value='" + this.daijieshou + "' >" + this.statusName(this.daijieshou) + "</option>");
        $(id).append("<option value='" + this.chulizhong + "' >" + this.statusName(this.chulizhong) + "</option>");
        $(id).append("<option value='" + this.undoStatus + "' >" + this.statusName(this.undoStatus) + "</option>");
        $(id).append("<option value='" + this.yiguidang + "' >" + this.statusName(this.yiguidang) + "</option>");
    }
};
////////////////////////////////////////应急救援命令结束//////////////////////////////////////

///////////////////////////////////状态开始-年月报表///////////////////////////////
//var workShopProblemLib_status = {
//		gq_add : 1,	    	//工区新增
//		gq_reported : 2,	//工区已上报
//		cj_checked : 3,		//车间审核通过
//		cj_uncheck : 4, 	//车间审核不通过
//		duan_checked : 5,	//段审核通过
//		duan_uncheck : 6, 	//段审核不通过
//		
//		typeName : function(value) {
//			switch(value) {
//				case this.wait_examine:
//					return "待审核";
//				case this.wait_reply:
//					return "待回复";
//				case this.finish:
//					return "完成";
//				case this.unfinish:
//					return "未完成";
//			}
//		},
//		listData : function(id) {
//			$(id).append("<option value='" + this.wait_examine + "' >" + this.typeName(this.wait_examine) + "</option>");
//			$(id).append("<option value='" + this.wait_reply + "' >" + this.typeName(this.wait_reply) + "</option>");
//			$(id).append("<option value='" + this.finish + "' >" + this.typeName(this.finish) + "</option>");
//			$(id).append("<option value='" + this.unfinish + "' >" + this.typeName(this.unfinish) + "</option>");
//		}
//	};
///////////////////////////////////状态结束-年月报表////////////////////////////////

////////////////////////////////////////年月报表命令开始//////////////////////////////////////
var YearMonthWorkAreaStatus = {
    //工区年月表编制流程的状态
    WRITE_WORKAREA_NOTWRITED: "-1",         //工区未填报
    WRITE_WORKAREA_UNLOCK: "0",             //段科室已解锁
    WRITE_WORKAREA_DRAFT: "1",              //工区_草稿
    WRITE_WORKAREA_REPORT: "2",     		 //工区_上报
    WRITE_WORKAREA_WORKSHOP_PASS: "3",      //工区_车间通过
    WRITE_WORKAREA_WORKSHOP_FAIL: "4",      //工区_车间不通过
    WRITE_WORKAREA_SEGMENT_FAIL: "6",       //工区_段科室不通过
    WRITE_WORKAREA_SEGMENT_PASS: "7",		 //工区_段科室通过

    WRITE_WORKAREA_NOTWRITED_NAME: "工区未填报",             //工区未填报
    WRITE_WORKAREA_UNLOCK_NAME: "段科室已解锁_编制",             //段科室已解锁
    WRITE_WORKAREA_DRAFT_NAME: "草稿_编制",              //工区_草稿
    WRITE_WORKAREA_REPORT_NAME: "工区上报_编制",     		 //工区_上报
    WRITE_WORKAREA_WORKSHOP_PASS_NAME: "车间审核通过_编制",      //工区_车间通过
    WRITE_WORKAREA_WORKSHOP_FAIL_NAME: "车间审核不通过_编制",      //工区_车间不通过
    WRITE_WORKAREA_SEGMENT_FAIL_NAME: "段科室审核不通过_编制",       //工区_段科室不通过
    WRITE_WORKAREA_SEGMENT_PASS_NAME: "段科室审核通过_编制",		 //工区_段科室通过


    //工区年月表执行流程的状态
    WORKAREA_EXECUTE_REPORT: "102",     		 //工区_上报
    WORKAREA_WORKSHOP_EXECUTE_PASS: "103",      //工区_车间通过
    WORKAREA_WORKSHOP_EXECUTE_FAIL: "104",      //工区_车间不通过
    WORKAREA_SEGMENT_EXECUTE_FAIL: "106",       //工区_段科室不通过
    WORKAREA_SEGMENT_EXECUTE_PASS: "107",		 //工区_段科室通过

    WORKAREA_EXECUTE_REPORT_NAME: "工区上报_执行",     		 //工区_上报
    WORKAREA_WORKSHOP_EXECUTE_PASS_NAME: "车间审核通过_执行",      //工区_车间通过
    WORKAREA_WORKSHOP_EXECUTE_FAIL_NAME: "车间审核不通过_执行",      //工区_车间不通过
    WORKAREA_SEGMENT_EXECUTE_FAIL_NAME: "段科室审核不通过_执行",       //工区_段科室不通过
    WORKAREA_SEGMENT_EXECUTE_PASS_NAME: "段科室审核通过_执行",		 //工区_段科室通过


    //车间年月表编制流程的状态
    WRITE_WORKSHOP_AUDIT: "32",				 //车间_车间待审核
    WRITE_WORKSHOP_FAIL: "33",				 //车间_车间不通过
    WRITE_WORKSHOP_PASS: "34",				 //车间_车间通过
    WRITE_WORKSHOP_REPORT: "35",			 //车间_上报
    WRITE_WORKSHOP_SEGMENT_FAIL: "36",      //车间_段不通过
    WRITE_WORKSHOP_SEGMENT_PASS: "37",		 //车间_段通过

    WRITE_WORKSHOP_AUDIT_NAME: "车间待审核_编制",				 //车间_车间待审核
    WRITE_WORKSHOP_FAIL_NAME: "车间审核不通过_编制",				 //车间_车间不通过
    WRITE_WORKSHOP_PASS_NAME: "车间审核通过_编制",				 //车间_车间通过
    WRITE_WORKSHOP_REPORT_NAME: "车间上报_编制",			 //车间_上报
    WRITE_WORKSHOP_SEGMENT_FAIL_NAME: "段科室审核不通过_编制",      //车间_段不通过
    WRITE_WORKSHOP_SEGMENT_PASS_NAME: "段科室审核通过_编制",		 //车间_段通过

    //车间年月表执行流程的状态
    WORKSHOP_EXECUTE_AUDIT: "302",				 //车间_车间待审核
    WORKSHOP_EXECUTE_FAIL: "303",				 //车间_车间不通过
    WORKSHOP_EXECUTE_PASS: "304",				 //车间_车间通过
    WORKSHOP_EXECUTE_REPORT: "305",			 //车间_上报
    WORKSHOP_SEGMENT_EXECUTE_FAIL: "306",      //车间_段不通过
    WORKSHOP_SEGMENT_EXECUTE_PASS: "307",		 //车间_段通过

    WORKSHOP_EXECUTE_AUDIT_NAME: "车间待审核_执行",				 //车间_车间待审核
    WORKSHOP_EXECUTE_FAIL_NAME: "车间审核不通过_执行",				 //车间_车间不通过
    WORKSHOP_EXECUTE_PASS_NAME: "车间审核通过_执行",				 //车间_车间通过
    WORKSHOP_EXECUTE_REPORT_NAME: "车间上报_执行",			 //车间_上报
    WORKSHOP_SEGMENT_EXECUTE_FAIL_NAME: "段科室审核不通过_执行",      //车间_段不通过
    WORKSHOP_SEGMENT_EXECUTE_PASS_NAME: "段科室审核通过_执行",		 //车间_段通过
    statusName: function (value) {
        switch (value) {
            case this.WRITE_WORKAREA_NOTWRITED:
                return this.WRITE_WORKAREA_NOTWRITED_NAME;
            case this.WRITE_WORKAREA_UNLOCK:
                return this.WRITE_WORKAREA_UNLOCK_NAME;
            case this.WRITE_WORKAREA_DRAFT:
                return this.WRITE_WORKAREA_DRAFT_NAME;
            case this.WRITE_WORKAREA_REPORT:
                return this.WRITE_WORKAREA_REPORT_NAME;
            case this.WRITE_WORKAREA_WORKSHOP_PASS:
                return this.WRITE_WORKAREA_WORKSHOP_PASS_NAME;
            case this.WRITE_WORKAREA_WORKSHOP_FAIL:
                return this.WRITE_WORKAREA_WORKSHOP_FAIL_NAME;
            case this.WRITE_WORKAREA_SEGMENT_PASS:
                return this.WRITE_WORKAREA_SEGMENT_PASS_NAME;
            case this.WRITE_WORKAREA_SEGMENT_FAIL:
                return this.WRITE_WORKAREA_SEGMENT_FAIL_NAME;
            case this.WRITE_WORKSHOP_AUDIT:
                return this.WRITE_WORKSHOP_AUDIT_NAME;
            case this.WRITE_WORKSHOP_FAIL:
                return this.WRITE_WORKSHOP_FAIL_NAME;
            case this.WRITE_WORKSHOP_PASS:
                return this.WRITE_WORKSHOP_PASS_NAME;
            case this.WRITE_WORKSHOP_REPORT:
                return this.WRITE_WORKSHOP_REPORT_NAME;
            case this.WRITE_WORKSHOP_SEGMENT_PASS:
                return this.WRITE_WORKSHOP_SEGMENT_PASS_NAME;
            case this.WRITE_WORKSHOP_SEGMENT_FAIL:
                return this.WRITE_WORKSHOP_SEGMENT_FAIL_NAME;


            case this.WORKAREA_EXECUTE_REPORT:
                return this.WORKAREA_EXECUTE_REPORT_NAME;
            case this.WORKAREA_WORKSHOP_EXECUTE_PASS:
                return this.WORKAREA_WORKSHOP_EXECUTE_PASS_NAME;
            case this.WORKAREA_WORKSHOP_EXECUTE_FAIL:
                return this.WORKAREA_WORKSHOP_EXECUTE_FAIL_NAME;
            case this.WORKAREA_SEGMENT_EXECUTE_PASS:
                return this.WORKAREA_SEGMENT_EXECUTE_PASS_NAME;
            case this.WORKAREA_SEGMENT_EXECUTE_FAIL:
                return this.WORKAREA_SEGMENT_EXECUTE_FAIL_NAME;
            case this.WORKSHOP_EXECUTE_AUDIT:
                return this.WORKSHOP_EXECUTE_AUDIT_NAME;
            case this.WORKSHOP_EXECUTE_FAIL:
                return this.WORKSHOP_EXECUTE_FAIL_NAME;
            case this.WORKSHOP_EXECUTE_PASS:
                return this.WORKSHOP_EXECUTE_PASS_NAME;
            case this.WORKSHOP_EXECUTE_REPORT:
                return this.WORKSHOP_EXECUTE_REPORT_NAME;
            case this.WORKSHOP_SEGMENT_EXECUTE_PASS:
                return this.WORKSHOP_SEGMENT_EXECUTE_PASS_NAME;
            case this.WORKSHOP_SEGMENT_EXECUTE_FAIL:
                return this.WORKSHOP_SEGMENT_EXECUTE_FAIL_NAME;
        }
    }
};
////////////////////////////////////////年月报表命令结束//////////////////////////////////////
////////////////////////////////////////技术支持中心年月表命令开始/////////////////////////////////
var YearMonthTechStatus = {
    //工区年月表编制流程的状态
    WRITE_WORKAREA_NOTWRITED: "-1",         //工区未填报
    WRITE_WORKAREA_UNLOCK: "0",             //段科室已解锁
    WRITE_WORKAREA_DRAFT: "1",              //工区_草稿
    WRITE_WORKAREA_REPORT: "2",     		 //工区_上报
    WRITE_WORKAREA_SEGMENT_PASS: "3",      //工区_段科室通过
    WRITE_WORKAREA_SEGMENT_FAIL: "4",      //工区_段科室不通过

    WRITE_WORKAREA_NOTWRITED_NAME: "工区未填报",             //工区未填报
    WRITE_WORKAREA_UNLOCK_NAME: "段科室已解锁_编制",             //段科室已解锁
    WRITE_WORKAREA_DRAFT_NAME: "草稿_编制",              //工区_草稿
    WRITE_WORKAREA_REPORT_NAME: "工区上报_编制",     		 //工区_上报
    WRITE_WORKAREA_SEGMENT_PASS_NAME: "段科室审核通过_编制",      //工区_段科室通过
    WRITE_WORKAREA_SEGMENT_FAIL_NAME: "段科室审核不通过_编制",      //工区_段科室不通过


    //工区年月表执行流程的状态
    WORKAREA_EXECUTE_REPORT: "102",     		 //工区_上报
    WORKAREA_SEGMENT_EXECUTE_PASS: "103",      //工区_段科室通过
    WORKAREA_SEGMENT_EXECUTE_FAIL: "104",      //工区_段科室不通过

    WORKAREA_EXECUTE_REPORT_NAME: "工区上报_执行",     		 //工区_上报
    WORKAREA_SEGMENT_EXECUTE_PASS_NAME: "段科室审核通过_执行",      //工区_段科室通过
    WORKAREA_SEGMENT_EXECUTE_FAIL_NAME: "段科室审核不通过_执行",      //工区_段科室不通过


    //车间年月表编制流程的状态
    WRITE_SEGMENT_AUDIT: "32",				 //段科室_段科室待审核
    WRITE_SEGMENT_FAIL: "33",				 //段科室_段科室不通过
    WRITE_SEGMENT_PASS: "34",				 //段科室_段科室通过

    WRITE_SEGMENT_AUDIT_NAME: "段科室待审核_编制",				 //段科室_段科室待审核
    WRITE_SEGMENT_FAIL_NAME: "段科室审核不通过_编制",				 //段科室_段科室不通过
    WRITE_SEGMENT_PASS_NAME: "段科室审核通过_编制",				 //段科室_段科室通过

    //车间年月表执行流程的状态
    SEGMENT_EXECUTE_AUDIT: "302",				 //段科室_段科室待审核
    SEGMENT_EXECUTE_FAIL: "303",				 //段科室_段科室不通过
    SEGMENT_EXECUTE_PASS: "304",				 //段科室_段科室通过

    SEGMENT_EXECUTE_AUDIT_NAME: "段科室待审核_执行",				 //段科室_段科室待审核
    SEGMENT_EXECUTE_FAIL_NAME: "段科室审核不通过_执行",				 //段科室_段科室不通过
    SEGMENT_EXECUTE_PASS_NAME: "段科室审核通过_执行",				 //段科室_段科室通过
    statusName: function (value) {
        switch (value) {
            case this.WRITE_WORKAREA_NOTWRITED:
                return this.WRITE_WORKAREA_NOTWRITED_NAME;
            case this.WRITE_WORKAREA_UNLOCK:
                return this.WRITE_WORKAREA_UNLOCK_NAME;
            case this.WRITE_WORKAREA_DRAFT:
                return this.WRITE_WORKAREA_DRAFT_NAME;
            case this.WRITE_WORKAREA_REPORT:
                return this.WRITE_WORKAREA_REPORT_NAME;
            case this.WRITE_WORKAREA_SEGMENT_PASS:
                return this.WRITE_WORKAREA_SEGMENT_PASS_NAME;
            case this.WRITE_WORKAREA_SEGMENT_FAIL:
                return this.WRITE_WORKAREA_SEGMENT_FAIL_NAME;
            case this.WRITE_SEGMENT_AUDIT:
                return this.WRITE_SEGMENT_AUDIT_NAME;
            case this.WRITE_SEGMENT_FAIL:
                return this.WRITE_SEGMENT_FAIL_NAME;
            case this.WRITE_SEGMENT_PASS:
                return this.WRITE_SEGMENT_PASS_NAME;
            case this.WORKAREA_EXECUTE_REPORT:
                return this.WORKAREA_EXECUTE_REPORT_NAME;
            case this.WORKAREA_SEGMENT_EXECUTE_PASS:
                return this.WORKAREA_SEGMENT_EXECUTE_PASS_NAME;
            case this.WORKAREA_SEGMENT_EXECUTE_FAIL:
                return this.WORKAREA_SEGMENT_EXECUTE_FAIL_NAME;
            case this.SEGMENT_EXECUTE_AUDIT:
                return this.SEGMENT_EXECUTE_AUDIT_NAME;
            case this.SEGMENT_EXECUTE_FAIL:
                return this.SEGMENT_EXECUTE_FAIL_NAME;
            case this.SEGMENT_EXECUTE_PASS:
                return this.SEGMENT_EXECUTE_PASS_NAME;
        }
    }
};
///////////////////////////////////////技术支持中心年月表命令结束////////////////////////////////
////////////////////////////////////////告警通知单类型开始//////////////////////////////////////
/*告警通知单状态*/
var warnNotice_status = {
    draft: "1",
    send: "2",
    reply: "3",
    affirm: "4",
    typeName: function (value) {
        switch (value) {
            case this.draft:
                return "草稿";
            case this.send:
                return "已下发";
            case this.reply:
                return "已回复";
            case this.affirm:
                return "已确认";
        }
    },
    typeNameReply: function (value) {
        switch (value) {
            case this.send:
                return "待回复";
            case this.reply:
                return "已回复";
            case this.affirm:
                return "已确认";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.draft + "' >" + this.typeName(this.draft) + "</option>");
        $(id).append("<option value='" + this.send + "' >" + this.typeName(this.send) + "</option>");
        $(id).append("<option value='" + this.reply + "' >" + this.typeName(this.reply) + "</option>");
        $(id).append("<option value='" + this.affirm + "' >" + this.typeName(this.affirm) + "</option>");
    },
    listDataReply: function (id) {
        $(id).append("<option value='" + this.send + "' >" + this.typeNameReply(this.send) + "</option>");
        $(id).append("<option value='" + this.reply + "' >" + this.typeNameReply(this.reply) + "</option>");
        $(id).append("<option value='" + this.affirm + "' >" + this.typeNameReply(this.affirm) + "</option>");
    }
}
/*告警通知单网络类别*/
var warnNotice_networkType = {
    otn: "1",
    transmission: "2",
    access: "3",
    data: "4",
    gsmr: "5",
    rpt: "6",
    scheduling: "7",
    ggg: "8",
    ecology: "9",
    power: "10",
    synchronous: "11",
    other: "12",
    typeName: function (value) {
        switch (value) {
            case this.otn:
                return "OTN";
            case this.transmission:
                return "传输网";
            case this.access:
                return "接入网";
            case this.data:
                return "数据网";
            case this.gsmr:
                return "GSM-R";
            case this.rpt:
                return "直放站";
            case this.scheduling:
                return "调度系统";
            case this.ggg:
                return "综合视频";
            case this.ecology:
                return "防灾";
            case this.power:
                return "动环监控";
            case this.synchronous:
                return "同步时钟";
            case this.other:
                return "其它";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.otn + "' >" + this.typeName(this.otn) + "</option>");
        $(id).append("<option value='" + this.transmission + "' >" + this.typeName(this.transmission) + "</option>");
        $(id).append("<option value='" + this.access + "' >" + this.typeName(this.access) + "</option>");
        $(id).append("<option value='" + this.data + "' >" + this.typeName(this.data) + "</option>");
        $(id).append("<option value='" + this.gsmr + "' >" + this.typeName(this.gsmr) + "</option>");
        $(id).append("<option value='" + this.rpt + "' >" + this.typeName(this.rpt) + "</option>");
        $(id).append("<option value='" + this.scheduling + "' >" + this.typeName(this.scheduling) + "</option>");
        $(id).append("<option value='" + this.ggg + "' >" + this.typeName(this.ggg) + "</option>");
        $(id).append("<option value='" + this.ecology + "' >" + this.typeName(this.ecology) + "</option>");
        $(id).append("<option value='" + this.power + "' >" + this.typeName(this.power) + "</option>");
        $(id).append("<option value='" + this.synchronous + "' >" + this.typeName(this.synchronous) + "</option>");
        $(id).append("<option value='" + this.other + "' >" + this.typeName(this.other) + "</option>");
    }
};
/*告警通知单告警类型*/
var warnNotice_warnType = {
    urgency: "1",
    importance: "2",
    major: "3",
    minor: "4",
    ordinary: "5",
    other: "6",
    typeName: function (value) {
        switch (value) {
            case this.urgency:
                return "紧急告警";
            case this.importance:
                return "重要告警";
            case this.major:
                return "主要告警";
            case this.minor:
                return "次要告警";
            case this.ordinary:
                return "一般告警";
            case this.other:
                return "其它";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.urgency + "' >" + this.typeName(this.urgency) + "</option>");
        $(id).append("<option value='" + this.importance + "' >" + this.typeName(this.importance) + "</option>");
        $(id).append("<option value='" + this.major + "' >" + this.typeName(this.major) + "</option>");
        $(id).append("<option value='" + this.minor + "' >" + this.typeName(this.minor) + "</option>");
        $(id).append("<option value='" + this.ordinary + "' >" + this.typeName(this.ordinary) + "</option>");
        $(id).append("<option value='" + this.other + "' >" + this.typeName(this.other) + "</option>");
    }
};
////////////////////////////////////////告警通知单类型结束//////////////////////////////////////
/*日记录报表*/
var dailyReport_drType = {
    jjzxdr: "jjzxdr",
    gsmrdr: "gsmrdr",
    typeName: function (value) {
        switch (value) {
            case this.jjzxdr:
                return "技术支持中心安全日分析记录";
            case this.gsmrdr:
                return "技术支持中心GSM-R室安全日分析记录";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.jjzxdr + "' >" + this.typeName(this.jjzxdr) + "</option>");
        $(id).append("<option value='" + this.gsmrdr + "' >" + this.typeName(this.gsmrdr) + "</option>");
    }
};
////////////////////////////////////////日记录报表结束//////////////////////////////////////


/////////////////////////////////////////////////////////////设备类别开始-日常备品////////////////////////////////////////////////////////////////////
var daily_speciality = {
    universalWirelessEmergency: 310115,	//普铁无线日常设备
    universalWireEmergency: 310116,	//普铁有线日常设备
    highSpeedEmergency: 310117,	//高铁日常设备
    typeName: function (value) {
        switch (value) {
            case this.universalWirelessEmergency:
                return "普铁无线日常设备";
            case this.universalWireEmergency:
                return "普铁有线日常设备";
            case this.highSpeedEmergency:
                return "高铁日常设备";
        }
    },
    listData: function (id) {
        $(id).append("<option value='" + this.universalWirelessEmergency + "' >" + this.typeName(this.universalWirelessEmergency) + "</option>");
        $(id).append("<option value='" + this.universalWireEmergency + "' >" + this.typeName(this.universalWireEmergency) + "</option>");
        $(id).append("<option value='" + this.highSpeedEmergency + "' >" + this.typeName(this.highSpeedEmergency) + "</option>");
    }
};
/////////////////////////////////////////////////////////////设备类别结束-日常备品////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////设备属性开始-日常备品////////////////////////////////////////////////////////////////////
var daily_attribute = {
    communicationLineSystem: 1,	//通信线路系统
    transmissionAccessNetworkSystem: 2,	//传输与接入网系统
    gsmRSystem: 3,	//GSM-R数字移动通信系统
    dataSignalingSystem: 4, //数据通信系统
    dispatchCommunicationSystem: 5, //调度通信系统
    integratedVideoMonitoringSystem: 6,//综合及其它视频监控系统
    telegraphTelephoneSystem: 7, //电报及电话系统
    synchronizingNetworkManagementSystem: 8, //同步及综合网管系统
    conferenceSystem: 9, //会议系统
    communicationPowerSystem: 10, //通信电源、电源及机房环境监控系统
    broadcastAndStationCommunicationSystem: 11, //广播与站场通信系统
    radioTrainDispatchingSystem: 12, //无线列调通信系统
    emergencySystem: 13, //应急通信系统
    otherSystem: 14, //其他
    typeName: function (value) {
        switch (value) {
            case this.communicationLineSystem:
                return "通信线路系统";
            case this.transmissionAccessNetworkSystem:
                return "传输与接入网系统";
            case this.gsmRSystem:
                return "GSM-R数字移动通信系统";
            case this.dataSignalingSystem:
                return "数据通信系统";
            case this.dispatchCommunicationSystem:
                return "调度通信系统";
            case this.integratedVideoMonitoringSystem:
                return "综合及其它视频监控系统";
            case this.telegraphTelephoneSystem:
                return "电报及电话系统";
            case this.synchronizingNetworkManagementSystem:
                return "同步及综合网管系统";
            case this.conferenceSystem:
                return "会议系统";
            case this.communicationPowerSystem:
                return "通信电源、电源及机房环境监控系统";
            case this.broadcastAndStationCommunicationSystem:
                return "广播与站场通信系统";
            case this.radioTrainDispatchingSystem:
                return "无线列调通信系统";
            case this.emergencySystem:
                return "应急通信系统";
            case this.otherSystem:
                return "其他设备";
        }
    },
    listData: function (id) {
    	$(id).append("<option value='"+""+"' >"+"请选择"+"</option>");
        $(id).append("<option value='" + this.typeName(this.communicationLineSystem) + "' >" + this.typeName(this.communicationLineSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.transmissionAccessNetworkSystem) + "' >" + this.typeName(this.transmissionAccessNetworkSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.gsmRSystem) + "' >" + this.typeName(this.gsmRSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.dataSignalingSystem) + "' >" + this.typeName(this.dataSignalingSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.dispatchCommunicationSystem) + "' >" + this.typeName(this.dispatchCommunicationSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.integratedVideoMonitoringSystem) + "' >" + this.typeName(this.integratedVideoMonitoringSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.telegraphTelephoneSystem) + "' >" + this.typeName(this.telegraphTelephoneSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.synchronizingNetworkManagementSystem) + "' >" + this.typeName(this.synchronizingNetworkManagementSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.conferenceSystem) + "' >" + this.typeName(this.conferenceSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.communicationPowerSystem) + "' >" + this.typeName(this.communicationPowerSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.broadcastAndStationCommunicationSystem) + "' >" + this.typeName(this.broadcastAndStationCommunicationSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.radioTrainDispatchingSystem) + "' >" + this.typeName(this.radioTrainDispatchingSystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.emergencySystem) + "' >" + this.typeName(this.emergencySystem) + "</option>");
        $(id).append("<option value='" + this.typeName(this.otherSystem) + "' >" + this.typeName(this.otherSystem) + "</option>");
    }
};
/////////////////////////////////////////////////////////////设备属性结束-日常备品////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////单位开始-日常备品////////////////////////////////////////////////////////////////////
var daily_unit = {
    ta: 3110156,	//他
    tai: 10044,	//台
    gongli: 10045,	//公里
    tao: 10046,	//套
    kuai: 10047,	//块
    ge: 10048,	//个
    tiao: 10049,	//条
    mi: 310118,	//米
    ba: 310119,	//把
    jian: 310120,	//件
    sheng: 310121,	//升
    ding: 310122,	//顶
    gen: 310123,	//根
    KM: 310124,	//KM
    M: 310125,	//M
    zuo: 310126,	//座
    typeName: function (value) {
        switch (value) {
            case this.ta:
                return "他";
            case this.tai:
                return "台";
            case this.gongli:
                return "公里";
            case this.tao:
                return "套";
            case this.kuai:
                return "块";
            case this.ge:
                return "个";
            case this.tiao:
                return "条";
            case this.mi:
                return "米";
            case this.ba:
                return "把";
            case this.jian:
                return "件";
            case this.sheng:
                return "升";
            case this.ding:
                return "顶";
            case this.gen:
                return "根";
            case this.KM:
                return "KM";
            case this.M:
                return "M";
            case this.zuo:
                return "座";
        }
    }
};
/////////////////////////////////////////////////////////////单位结束-日常备品////////////////////////////////////////////////////////////////////
