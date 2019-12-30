/**
 * 登陆用户修改自己密码的弹出框
 */
define('/frame/ChangeProfile',['bui/common','bui/overlay','bui/mask','bui/form',
	'common/form/FormContainer','common/data/PostLoad'],function(r){
	var BUI = r('bui/common'),Overlay = r('bui/overlay'),Mask = r('bui/mask'),Form = r('bui/form'),
	FormContainer = r('common/form/FormContainer'),PL = r('common/data/PostLoad'),
	PROFILE_FORM_ID = 'pfChangeForm';
	Form.Rules.add({
        name : 'verifyPwd',  //规则名称
        msg : '两次密码输入不一致，请检查后重新输入。',//默认显示的错误信息
        validator : function(value,baseValue,formatMsg){ //验证函数，验证值、基准值、格式化后的错误信息
          var pass = $('#password').val();
          if(value != pass){
        	  return formatMsg;
          }
        }
	}); 
	var ChangeProfile = Overlay.Dialog.extend({
		initializer : function(){
			var _self = this;
			var pswForm = _self._geForm();
			_self.addChild(pswForm);
		},
		renderUI : function(){
			var _self = this,phone = _self.get('userPhone');
			$('#userPhone').val(phone);
		},
		_geForm : function(){
			var form = new FormContainer({
				id : PROFILE_FORM_ID,
				formChildrens : [
					{
						label : '电话号码：',
						redStarFlag : true,
						item : '<input type="text" id="userPhone" name="userPhone" style="height:50px;" data-rules="{required : true}" />'
					},
					{
						label : '密码：',
						redStarFlag : true,
						item : '<input type="password" id="password" name="password" style="height:50px;" data-rules="{required : true}" />'
					},
					{
						label : '确认密码：',
						redStarFlag : true,
						item : '<input type="password" id="verifyPassword" style="height:50px;" data-rules="{required : true,verifyPwd : true}" />'
					}
				]
			});
			return form;
		}
	},{
		ATTRS : {
			userPhone : {},
			title : {value : '个人资料修改'},
			width : {value : 700},
			height : {value : 450},
			success : {
			      value : function(){
			    	  var _self = this,form = _self.getChild(PROFILE_FORM_ID),
			    	  data = form.serializeToObject();
			    	  if(form.isValid()){
			    		  var post = new PL({
			    			  url : '/user/profile',
			    			  el : _self.get('el'),
			    			  loadMsg : '个人资料修改保存中...'
			    		  });
			    		  post.load(data,function(result){
			    			  if(result.status == '1'){
			    				  BUI.Message.Alert('个人资料修改成功','success');
			    			  }else{
			    				  BUI.Message.Alert('个人资料修改失败，请联系管理员。','error');
			    			  }
			    			  _self.close();
			    		  });
			    	  }
			      }
			},
			closeAction : {
				value : 'destroy'
			},
		},
		PROFILE_FORM_ID : PROFILE_FORM_ID
	});
	return ChangeProfile;
});