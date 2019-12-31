define('yearMonth/wiredMonthPlanChartDevice.js',function(require,exports,module){
	
  var inputEl = $('#J_Month'),
  Calendar = require('bui/calendar'),
  monthpicker;
  
  function initPage(){
	  $('#content').load('wiredMonthPlanChartDeviceYOY.jsp?year='+2017+'&month='+3);
	  monthpicker = new Calendar.MonthPicker({
		    trigger : inputEl,
		   // month:1, //月份从0开始，11结束
		    autoHide : true,
		    align : {
		      points:['bl','tl']
		    },
		    //year:2000,
		    success:function(){
		    	 month = this.get('month')+1;//月份从0开始，11结束
		    	year = this.get('year');
		    	inputEl.val(year + '年' + month + '月');
		    	this.hide();
		    }
	  });
	  monthpicker.render();
	  
	  monthpicker.on('show',function(ev){
	      monthpicker.set('year',2017);
	      monthpicker.set('month',2);
	  });
  }

  
   module.exports = {
			initPage:initPage
	}
});