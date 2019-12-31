/*
 * 页面遮罩层
 */
define('common/bodyLoadMask/MyLoadMask',['bui/common'],function(r){
	var BUI = r('bui/common'),Component = BUI.Component;
	var UA = BUI.UA,
    CLS_MASK = 'my-ext-mask',
    CLS_MASK_MSG = CLS_MASK + '-msg';
	var MyLoadMask = Component.Controller.extend({
		initializer:function(){
			var _self=this;
			_self._load();
		},
		_load:function(element, msg, msgCls){
			var maskedEl = $(element),
            maskDiv = maskedEl.children('.' + CLS_MASK),
            tpl = null,
            msgDiv = null,
            top = null,
            left = null;
	        if (!maskDiv.length) {
	            maskDiv = $('<div class="' + CLS_MASK + '" style="height: 100%;left: 0;opacity: 0.25;filter: alpha(opacity=25);position: absolute;top: 0;width: 100%;z-index: 1040;background-color: #333333;"></div>').appendTo(maskedEl);
	            maskedEl.addClass('x-masked-relative x-masked');
	            //屏蔽整个窗口
	            if(element == 'body'){
	              if(UA.ie == 6){
	                maskDiv.height(BUI.docHeight());
	              }else{
	                maskDiv.css('position','fixed');
	              }
	            }else{
	              if (UA.ie === 6) {
	                  maskDiv.height(maskedEl.height());
	              }
	            }
	            if (msg) {
	                tpl = ['<div class="' + CLS_MASK_MSG + '"><div>', msg, '</div></div>'].join('');
	                msgDiv = $(tpl).appendTo(maskedEl);
	                if (msgCls) {
	                    msgDiv.addClass(msgCls);
	                }
	
	              try {
	                //屏蔽整个窗口
	                if(element == 'body' && UA.ie != 6){
	                  top = '50%',
	                  left = '50%';
	                  msgDiv.css('position','fixed');
	                }else{
	                  top = (maskDiv.height() - msgDiv.height()) / 2;
	                  left = (maskDiv.width() - msgDiv.width()) / 2;                      
	                }
	                msgDiv.css({ left:left, top:top });
	
	              } catch (ex) {
	                BUI.log('mask error occurred');
	              }
	            }
	        }
	        return maskDiv;
		},
		_relieve:function (element) {
            var maskedEl = $(element),
                msgEl = maskedEl.children('.' + CLS_MASK_MSG),
                maskDiv = maskedEl.children('.' + CLS_MASK);
            if (msgEl) {
                msgEl.remove();
            }
            if (maskDiv) {
                maskDiv.remove();
            }
            maskedEl.removeClass('x-masked-relative x-masked');

        },
		show:function(){
			var _self = this;
			_self._load(_self.get('el'),'<img id="my_mask_img" style="display:inline-block;margin-left:-30px;margin-top:-30px;" width="60" height="60" src="'+_self.get('contextPath')+'/resource/js_framework/bui_framework/common/bodyLoadMask/load.gif">',_self.get('msgCls'));
		},
		hide:function(){
			var _self = this;
			_self._relieve(_self.get('el'));
		}
	},{
		ATTRS:{
			elStyle:{value:{background:'none',border:'none'}},
			el:{},
			msgCls:{
	            value : 'x-mask-loading'
	        },
			contextPath:{}
		}
	});
	return MyLoadMask;
});