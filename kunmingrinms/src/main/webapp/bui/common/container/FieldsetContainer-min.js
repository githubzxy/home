define("common/container/FieldsetContainer",["bui/common"],function(r){var BUI=r("bui/common"),Component=BUI.Component;return Component.Controller.extend({initializer:function(){var _self=this,legend=_self._initLegend();_self.addChild(legend),BUI.each(_self.get("items"),function(e){_self.addChild(e)})},_initLegend:function(){var title=this.get("title");return new Component.Controller({elTagName:"legend",elAttrs:{style:"padding:0;margin:0 0 0 10px;font-size: 10px;font-weight:bold;border:none;width:auto;"},content:title})}},{ATTRS:{elAttrs:{value:{style:"margin : 2px 10px 2px 10px;border : 2px solid;-moz-border-radius:8px;border-radius:8px;padding : 2px 10px 10px 10px;"}},elTagName:{value:"fieldset"},items:{value:[]},title:{}}})});