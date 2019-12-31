/**
 * 各类组织机构登录系统的次数柱状图
 */
define('system/loginChartPage',function(require,exports,module){
	var z = require('zrender/zrender'),
	ec = require('echarts/echarts'),
	bar = require('echarts/chart/bar'),
	tooltip = require('echarts/component/tooltip'),
	legend = require('echarts/component/legend'),
	title = require('echarts/component/title');
	dataZoom = require('echarts/component/dataZoom');
	
	//查询所有数据初始化页面
	function initPage(){
		$.ajax({
			url : contextPath + 'loginLogAction/getLoginCountOfOrg.cn',
			async : false, 
			data : {
				orgType : $("#orgType").val(),
				startTime : $("#startTime").val(),
				endTime : $("#endTime").val()
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
	    	xdatas.push(data[i].COUNT);
	    	ydatas.push(data[i].ORGNAME);
	    }
		// 基于准备好的dom，初始化echarts实例
	    var myChart = ec.init(document.getElementById('chartId'));
		var option = {
			grid:{
					x : 170
			},
		    title : {
		    	x: 'center',
		        text: "系统各组织机构登录次数柱状图"
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
		    dataZoom: [
	        	{
	                 show: true,
	                 yAxisIndex: 0,
	                 filterMode: 'empty',
	                 width: 30,
	                 height: '80%',
	                 showDataShadow: false,
	                 left: '93%'
	             }
	        ],
		    xAxis : [
		        {
		        	type : 'value',
		        }
		    ],
		    yAxis : [
		        {
		        	name : '组织结构名称',
		        	 type : 'category',
		        	 data : ydatas,
		        }
		    ],
		    xAxis : [{
		    	name : '登录次数',
            }],
		    height : $("#chartId").height() - 100,// 图表高度:越小,则收缩得越小;越大,则扩展得越大
		    series : [
		        {
		            type:'bar',
		            itemStyle: {normal: {color:'rgb(56,151,197)', label:{show:true}}},
		            data:xdatas
		        }
		    ]
		};
	    myChart.setOption(option);
	}
	
	module.exports = {
			initPage:initPage
	};
});
