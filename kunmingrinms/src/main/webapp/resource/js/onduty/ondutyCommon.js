function initWeek(id) {
	$("#" + id).append("<option value='' selected='selected'>请选择</option>");
	$("#" + id).append("<option value='0' >星期日</option>");
	$("#" + id).append("<option value='1' >星期一</option>");
	$("#" + id).append("<option value='2' >星期二</option>");
	$("#" + id).append("<option value='3' >星期三</option>");
	$("#" + id).append("<option value='4' >星期四</option>");
	$("#" + id).append("<option value='5' >星期五</option>");
	$("#" + id).append("<option value='6' >星期六</option>");
}

function initStatus(id) {
	
	$("#" + id).append("<option value='' selected='selected'>请选择</option>");
	$("#" + id).append("<option value='2' >是</option>");
	$("#" + id).append("<option value='1' >否</option>");
}

function weekToChinese(value) {
	switch(value) {
		case "0":
			return "星期日";
		case "1":
			return "星期一";
		case "2":
			return "星期二";
		case "3":
			return "星期三";
		case "4":
			return "星期四";
		case "5":
			return "星期五";
		case "6":
			return "星期六";
		default :
			return "";
	}
}

function statusToChinese(value) {
	switch(value) {
		case "1":
			return "否";
		case "2":
			return "是";
		default :
			return "";
	}
}
//模块化后用于显示弹出信息
function tooltip(msg,el){
	console.log(1234);
	BUI.Message.Show({
		msg : msg,
		zIndex:1070,
		closeable : false,
		buttons : [{
			text : '确定',
			elCls : 'button',
			handler : function(){
				BUI.Mask.unmaskElement(el[0]);
				this.close();
			}
		}]
	});
}








