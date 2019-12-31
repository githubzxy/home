/**
 * validateIntNumber 验证单元格整数数
 * numCells 选择器（填数字的单元格）
 */
function validateIntNumber(numCells){
	var regInt=/^\d+$/;		//整数
	var regNum=/^\d+(\.\d+)?$/;//整数或浮点数
	
	var isPass=true;//开关
	
	for(var i=0;i<numCells.length;i++){
		$(numCells[i]).css('background-color','');//清除验证不通过的样式
		var cellText=$(numCells[i]).text()=='' ? '0' : $(numCells[i]).text();//若不输入，默认为0
		if(!regInt.test(cellText)){
			$(numCells[i]).css('background-color','#FF5151');
			isPass=false;
		}
	}
	return isPass;
}

/**
 * validateDoubleNumber 验证单元格浮点数
 * numCells 选择器（填数字的单元格）
 */
function validateDoubleNumber(numCells){
	var regInt=/^\d+$/;		//整数
	var regNum=/^\d+(\.\d+)?$/;//整数或浮点数
	var isPass=true;//开关
	
	for(var i=0;i<numCells.length;i++){
		$(numCells[i]).css('background-color','');//清除验证不通过的样式
		var cellText=$(numCells[i]).text()=='' ? '0' : $(numCells[i]).text();//若不输入，默认为0
		if(!regNum.test(cellText)){
			$(numCells[i]).css('background-color','#FF5151');
			isPass=false;
		}
	}
	return isPass;
}

//验证电话号码不能为空
function validatePhone(phoneCell){
	//固定电话（区号-电话号码-分机号）
	var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,4}))?$/;
	//手机号码
	var isMob=/^1[0-9]{10}$/;
	
	var phone=phoneCell.text();
	if(!phone){
		alert('联系电话不能为空！');
		return false;
	}
	if(!isPhone.test(phone)&&!isMob.test(phone)){
		alert('联系电话格式不正确！');
		return false;
	}
	
	return true;
}
/**
 * divisorAndDividendCheck 验证除数和被除数的大小是否符合场景
 * row 需要验证tr类（类名自定义）或者tr标签  例如".sheetTwo"或者"tr"
 * cell 可编辑类（类名自定义） 例如 ".editCell"
 * divisor 除数所在列的下标 rowArray[divisor]
 * dividend 被除数所在列的下标 rowArray[dividend]
 */
function divisorAndDividendCheck(row ,cell , divisor ,dividend){
	
	var isPass=true;//开关
	$(row).each(function(j){
		var rowArray = $(this).children(cell);
		if(rowArray && rowArray.length != 0) {
			$(rowArray[divisor]).css('background-color','');//清除验证不通过的样式
			$(rowArray[dividend]).css('background-color','');//清除验证不通过的样式
			
			var num1=$(rowArray[divisor]).text()=='' ? '0' : $(rowArray[divisor]).text();//若不输入，默认为0
			var num2=$(rowArray[dividend]).text()=='' ? '0' : $(rowArray[dividend]).text();//若不输入，默认为0
			//被除数（分子）大于除数（分母）时
			if(parseInt(num2)>parseInt(num1)){
				$(rowArray[divisor]).css('background-color','#FF5151');
				$(rowArray[dividend]).css('background-color','#FF5151');
				isPass=false;
			}
		}
			
	});
	return isPass;
}

/**
 * checkNumberIsOneOrZero 校验数字是1或者0
 * 
 * row 需要验证tr类（类名自定义）或者tr标签  例如".trClass"或者"tr"
 * numCells 可编辑数字类（类名自定义） 例如 ".numberCell"
 */
function checkNumberIsOneOrZero(row, numCells){
	var regZero = /^\+?(0)$/; // 是0
	var regOne = /^\+?(1)$/; // 是1
	//判断数据是否有错的开关
	var flag = true;
	$(row).each(function(j) {
		//获取一行numberCell类的数据
		var rowArray = $(this).children(numCells);
		if(rowArray && rowArray.length != 0) {
			//遍历一行numberCell类的单元格
			for(var i = 0; i < rowArray.length; i++){
				//清除设置的颜色
				$(rowArray[i]).css("background-color","");
				//获取单元格数据
				var numberCell = $(rowArray[i]).text()=='' ? '0' : $(rowArray[i]).text();//若不输入，默认为0
				//没填数据的单元格设置为0
				//$(rowArray[i]).html(cell);
				//验证输入的数据是否为0或1
				if(!regZero.test(numberCell) && !regOne.test(numberCell)){
					//输入的数据不是0或1时将单元格背景颜色设置为红色
					$(rowArray[i]).css("background-color","#FF5151");
					flag = false;
				}
			}
		}
	});
	return flag;
}

/**
 * checkDataLength 校验数据的长度
 * 
 * editCells 所有可编辑类（类名自定义） 例如 ".editCell"
 */
function checkDataLength(editCells){
	var regLength = /^.{0,250}$/; // 0-250
	//判断数据是否有错的开关
	var isPass = true;
	
	for(var i = 0; i < editCells.length; i++){
		$(editCells[i]).css('background-color','');//清除验证不通过的样式
		//获取单元格数据
		var editCell = $(editCells[i]).text();
		//验证输入的数据是否过长
		if(!regLength.test(editCell)){
			//输入的数据超过250字符时，将单元格背景颜色设置为红色
			$(editCells[i]).css('background-color','#FF5151');
			isPass = false;
		}
	}
	return isPass;
}


