/**
 * 各类组织机构登录系统的次数柱状图
 */
define('yearMonth/wiredMonthPlanChartDeviceYOY.js',function(require,exports,module){
	var z = require('zrender/zrender'),
	ec = require('echarts/echarts'),
	bar = require('echarts/chart/bar'),
	tooltip = require('echarts/component/tooltip'),
	legend = require('echarts/component/legend'),
	title = require('echarts/component/title');
	//查询所有数据初始化页面
	function initPage(){
		$.ajax({
			url : contextPath + 'wiredMonthPlanChartAction/getDeviceDataByYOY.cn',
			async : false, 
			data : {
				year : year,
				month : month
			},
			type : 'POST',
			dataType : "json",
			success : function(data){
				
				initCharts(data);
			}
		});
	}
	//去重方法
	function unique(arr) {
		  var result = [], hash = {};
		  for (var i = 0, elem; (elem = arr[i]) != null; i++) {
		    if (!hash[elem]) {
		      result.push(elem);
		      hash[elem] = true;
		    }
		  }
		  return result;
	}
	//综合同比图表
	function initCharts(data){
		var xdatas = [];//x轴--设备名cell2
	    //设备名去重
	    for(var i in data){
	    	xdatas.push(data[i].cell2);
	    }
	    xdatas = unique(xdatas);
	    
	    //设置柱状图高度
	    if(data.length>5){
			 var height = $("#chartId").height();
			 var heightNew = height + 30*(data.length-6);
			 $("#chartId").height(heightNew);
		}

	    //TODO 外部传入年份 往前推三年
	    var y1datas =  new Array(xdatas.length);//y轴--传入年份-2数据
	    var y2datas =  new Array(xdatas.length);//y轴--传入年份-1数据
	    var y3datas =  new Array(xdatas.length);//y轴--传入年份数据
	    for(var i in data){
	    	for(var j in xdatas){
	    		if(data[i].cell2==(xdatas[j])&&parseInt(data[i].year)==(year-2)){//指定年指定设备
	    			y1datas[j] = data[i].totalPercent*100;  //与设备名同样顺序取出完成率
	    		}
	    		if(data[i].cell2==(xdatas[j])&&parseInt(data[i].year)==(year-1)){//指定年指定设备
	    			y2datas[j] = data[i].totalPercent*100;  //与设备名同样顺序取出完成率
	    		}
	    		if(data[i].cell2==(xdatas[j])&&parseInt(data[i].year)==year){//指定年指定设备
	    			y3datas[j] = data[i].totalPercent*100;  //与设备名同样顺序取出完成率
	    		}
	    		
	    	}
	    }
		// 基于准备好的dom，初始化echarts实例
	    var myChart = ec.init(document.getElementById('chartId'));
		var option = {
			grid:{
				left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
			},
		    title : {
		    	x: 'center',
		        text: "各设备同比的完成率柱状图"
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data:[(year-2)+'年完成率',(year-1)+'年完成率',year+'年完成率'],
		        align: 'right',
		        right: 10
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {show: true, type: ['line', 'bar']},
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    xAxis : 
		        {
			    	name : '完成率',
		        	type : 'value',
		        	axisLabel:{formatter:'{value}% '}
		        }
		    ,
		    yAxis :
		        {
		        	name : '设备名称',
		        	data : xdatas,
		        	type : 'category'
		        }
		    ,
		    width : '90%',
		    series : [
		        {
		            name:(year-2)+'年完成率',
		            type:'bar',
		            data:y1datas
		        },{
		            name:(year-1)+'年完成率',
		            type:'bar',
		            data:y2datas
		        },{
		            name:year+'年完成率',
		            type:'bar',
		            data:y3datas
		        }
		    ]
		};
	    myChart.setOption(option);
	};
	module.exports = {
			initPage:initPage
	}
});
