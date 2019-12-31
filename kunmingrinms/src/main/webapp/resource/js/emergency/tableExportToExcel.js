
/**
 * 页面表格内容导出值Excel
 * @param id 标签<a id="？？？" style="display: none;"></a>的id
 * @param fileName 文件名
 * @param sheetName 工作表名
 * @param tableContent 表格内容（html字符串：<table>...</table>）
 */
function tableExportToExcel(id,fileName,sheetName,tableContent){
	var tableToExcel = (function() {  
	    var uri = 'data:application/vnd.ms-excel;base64,',  
	            template = '{table}',  
	            base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))); },  
	            format = function(s, c) {
	                return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; });
	             };  
	    return function(fileName,sheetName,tableContent) {  
	        var ctx = {worksheet: sheetName || 'Worksheet', table: tableContent}; 
			document.getElementById(id).href = uri + base64(format(template, ctx));
	        document.getElementById(id).download = fileName;
	        document.getElementById(id).click();
	    };  
	})();
	tableToExcel(fileName,sheetName,tableContent);
}