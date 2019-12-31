/**
 * 各类组织机构登录系统的次数柱状图
 */
define('yearMonth/wiredMonthPlanChartWorkshop',function(require,exports,module){
	var z = require('zrender/zrender'),
	ec = require('echarts/echarts'),
	bar = require('echarts/chart/bar'),
	tooltip = require('echarts/component/tooltip'),
	legend = require('echarts/component/legend'),
	title = require('echarts/component/title');
	//查询所有数据初始化页面
	function initPage(){
		$.ajax({
			url : contextPath + 'wiredMonthPlanChartAction/getWorkShopChartData.cn',
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
	//综合同比图表
	function initCharts(data){
		var myChart = ec.init(document.getElementById('chartId'));
		var xdatas = [];//x轴
	    var ydatas = [];//y轴
	    for(var i = 0;i<data.length;i++){
	    	var b = {};
	    	b.value = data[i].completePercent?data[i].completePercent:'0';
	    	b.id = data[i].workShop.org;
	    	xdatas.push(data[i].workShop.orgName);
	    	ydatas.push(b);
	    }
		// 基于准备好的dom，初始化echarts实例
		var option = {
			grid:{
					x : 170
			},
		    title : {
		    	x: 'center',
		        text: "各个车间的计划完成比例柱状图"
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
		        	name : '车间名称',
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
		            name:'车间计划完成率',
		            type:'bar',
		            itemStyle: {normal: {color:'rgb(56,151,197)', label:{show:false}}},
		            label: {
		            	normal: {
		            		position: "top"
		            	}
		            },
		            data:ydatas
		        }
		    ]
		};
	    myChart.setOption(option);
	   
	    myChart.on('click', function (params) {
	    	console.log(params);
	    	if(params.name) {
	    		var url = contextPath + "views/yearMonth/wiredMonthPlanChart/wiredMonthPlanChartWorkArea.jsp?year="+year+"&month="+month+"&workshopId="+params.data.id;
	    		window.open(url, "_blank");
	    	} else {
	    		alert("车间必选");
	    	}
	    });
	}
	module.exports = {
			initPage:initPage
	};
});
