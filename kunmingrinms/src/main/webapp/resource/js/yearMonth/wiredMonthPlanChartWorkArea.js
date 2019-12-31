/**
 * 各类组织机构登录系统的次数柱状图
 */
define('yearMonth/wiredMonthPlanChartWorkArea',function(require,exports,module){
	var z = require('zrender/zrender'),
	ec = require('echarts/echarts'),
	bar = require('echarts/chart/bar'),
	tooltip = require('echarts/component/tooltip'),
	legend = require('echarts/component/legend'),
	title = require('echarts/component/title');
	//查询所有数据初始化页面
	function initPage(){
		$.ajax({
			url : contextPath + 'wiredMonthPlanChartAction/getWorkAreaChartData.cn',
			async : false, 
			data : {
				year : year,
				month : month,
				workShopId :workshopId
			},
			type : 'POST',
			dataType : "json",
			success : function(data){
				initCharts(data);
			}
		});
	}
	//综合同比图表
	function initCharts(data){
		var xdatas = [];//x轴
	    var ydatas = [];//y轴
	    for(var i = 0;i<data.length;i++){
	    	xdatas.push(data[i].wiredMonthPlanWorkArea.orgName);
	    	ydatas.push(data[i].workAreaCompletePercent);
	    }
		// 基于准备好的dom，初始化echarts实例
	    var myChart = ec.init(document.getElementById('chartId'));
		var option = {
			grid:{
					x : 170
			},
		    title : {
		    	x: 'center',
		        text: "各个工区的计划完成比例柱状图"
		    },
		    tooltip : {
		        trigger: 'axis'
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
		    xAxis : [
		        {
		        	name : '工区名称',
		        	type : 'category',
		        	data : xdatas,
		        }
		    ],
		    yAxis : [
		        {
		        	name : '完成率',
		        	 type : 'value'
		        }
		    ],
		    height : $("#chartId").height() - 100,// 图表高度:越小,则收缩得越小;越大,则扩展得越大
		    series : [
		        {
		            name:'工区计划完成率',
		            type:'bar',
		            itemStyle: {normal: {color:'rgb(56,151,197)', label:{show:false}}},
		            data:ydatas
		        }
		    ]
		};
	    myChart.setOption(option);
	}
	
	module.exports = {
			initPage:initPage
	};
});
