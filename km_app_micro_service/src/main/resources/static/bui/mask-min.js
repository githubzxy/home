/**
 * @fileOverview Mask\u7684\u5165\u53e3\u6587\u4ef6
 * @ignore
 */define("bui/mask",["bui/common","bui/mask/mask","bui/mask/loadmask"],function(e){var t=e("bui/common"),n=e("bui/mask/mask");return n.LoadMask=e("bui/mask/loadmask"),n}),define("bui/mask/mask",["bui/common"],function(e){var t=e("bui/common"),n=t.namespace("Mask"),r=t.UA,i=t.prefix+"ext-mask",s=i+"-msg";return t.mix(n,{maskElement:function(e,n,o){var u=$(e),a=u.children("."+i),f=null,l=null,c=null,h=null;if(!a.length){a=$('<div class="'+i+'"></div>').appendTo(u),u.addClass("x-masked-relative x-masked"),e=="body"?r.ie==6?a.height(t.docHeight()):a.css("position","fixed"):r.ie===6&&a.height(u.height());if(n){f=['<div class="'+s+'"><div>',n,"</div></div>"].join(""),l=$(f).appendTo(u),o&&l.addClass(o);try{e=="body"&&r.ie!=6?(c="50%",h="50%",l.css("position","fixed")):(c=(a.height()-l.height())/2,h=(a.width()-l.width())/2),l.css({left:h,top:c})}catch(p){t.log("mask error occurred")}}}return a},unmaskElement:function(e){var t=$(e),n=t.children("."+s),r=t.children("."+i);n&&n.remove(),r&&r.remove(),t.removeClass("x-masked-relative x-masked")}}),n}),define("bui/mask/loadmask",["bui/mask/mask"],function(e){function n(e){var t=this;n.superclass.constructor.call(t,e)}var t=e("bui/mask/mask");return BUI.extend(n,BUI.Base),n.ATTRS={el:{},msg:{value:"Loading..."},msgCls:{value:"x-mask-loading"},disabled:{value:!1}},BUI.augment(n,{disable:function(){this.set("disabled",!0)},onLoad:function(){t.unmaskElement(this.get("el"))},onBeforeLoad:function(){var e=this;e.get("disabled")||t.maskElement(e.get("el"),e.get("msg"),this.get("msgCls"))},show:function(){this.onBeforeLoad()},hide:function(){this.onLoad()},destroy:function(){this.hide(),this.clearAttrVals(),this.off()}}),n});
