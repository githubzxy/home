/**
 * 各类组织机构登录系统的次数柱状图
 */
define('yearMonth/wiredMonthPlanChartLinkRelative',function(require,exports,module){
	var z = require('zrender/zrender'),
	ec = require('echarts/echarts'),
	bar = require('echarts/chart/bar'),
	tooltip = require('echarts/component/tooltip'),
	legend = require('echarts/component/legend'),
	title = require('echarts/component/title');
	//查询所有数据初始化页面
	function initPage(){
		$.ajax({
			url : contextPath + 'wiredMonthPlanChartAction/getLinkRelativeDatas.cn',
			async : false, 
			data : {
				year : year,
				months : months
			},
			type : 'POST',
			dataType : "json",
			success : function(data){
				if(data.length>5){
					 var height = $("#chartId").height();
					 var heightNew = height + 80*(data.length-6);
					 $("#chartId").height(heightNew);
				}
				initCharts(data);
			}
		});
	}
	//综合同比图表
	function initCharts(data){
		var monthArr = months.split(",");//根据月份的字符串得到月份数组
		var xdatas = [];//x轴
	    var ydatasMonth1 = [];//y轴 (monthArr[0]完成率)
	    var ydatasMonth2 = [];//y轴（monthArr[1]完成率）
	    var ydatasMonth3 = [];//y轴 (monthArr[2]完成率)
	    for(var i = 0;i<data.length;i++){
	    	xdatas.push(data[i].requipmentName);
	    	var monthDatas = data[i].monthDatas;
	    	var monthData1 = 0;
	    	var monthData2 = 0; 
	    	var monthData3 = 0;
	    	for (var int = 0; int < monthDatas.length; int++) {
	    		var month = monthDatas[int].month;
	    		var completeRate =(monthDatas[int].completeRate)*100;
	    		if(month == monthArr[0]){
	    			monthData1 = completeRate;
	    		}else if(month == monthArr[1]){
	    			monthData2 = completeRate;
	    		}else{
	    			monthData3 = completeRate;
	    		}
			}
	    	ydatasMonth1.push(monthData1);
	    	ydatasMonth2.push(monthData2);
	    	ydatasMonth3.push(monthData3);
	    }
		// 基于准备好的dom，初始化echarts实例
	    var myChart = ec.init(document.getElementById('chartId'));
		var option = {
			grid:{
					x : 170
			},
		    title : {
		    	x: 'center',
		        text: "各设备环比的完成率柱状图"
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		    	x: 'right',
		        data:[monthArr[0]+'月',monthArr[1]+'月',monthArr[2]+'月']
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
		    yAxis : [
		        {
		        	name : '工区名称',
		        	type : 'category',
		        	data : xdatas
		        }
		    ],
		    xAxis : [
		        {
		        	name : '完成率',
		            type : 'value',
		        	axisLabel:{formatter:'{value}% '},
		        }
		    ],
		    height : $("#chartId").height() - 100,// 图表高度:越小,则收缩得越小;越大,则扩展得越大
		    series : [
		        {
		            name:monthArr[0]+'月',
		            type:'bar',
//		            itemStyle: {normal: {color:'rgb(56,151,197)', label:{show:false}}},
		            data:ydatasMonth1
		        },
		        {
		            name:monthArr[1]+'月',
		            type:'bar',
//		            itemStyle: {normal: {color:'green', label:{show:false}}},
		            data:ydatasMonth2
		        },
		        {
		            name:monthArr[2]+'月',
		            type:'bar',
//		            itemStyle: {normal: {color:'red', label:{show:false}}},
		            data:ydatasMonth3
		        },
		    ]
		};
	    myChart.setOption(option);
	}
	
	module.exports = {
			initPage:initPage
	};
});
