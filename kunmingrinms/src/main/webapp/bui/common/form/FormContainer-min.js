define("common/form/FormContainer",["bui/common","bui/form","bui/tooltip","common/form/TableLayout"],function(require){var Controller=require("bui/common").Component.Controller,HForm=require("bui/form").HForm,Tooltip=require("bui/tooltip"),TableLayout=require("common/form/TableLayout");return Controller.extend({initializer:function(){var _self=this;_self.set("elTagName","form"),_self.set("elAttrs",{id:"formContainer"}),_self.addChild(_self._initTableLayout())},renderUI:function(){var _self=this;_self._initHForm(),_self._initValidTooltip()},_initTableLayout:function(){var _self=this;return new TableLayout({colNum:_self.get("colNum"),formChildrens:_self.get("formChildrens")})},_initHForm:function(){var _self=this,form=new HForm({srcNode:"#formContainer",errorTpl:'<span class="x-icon x-icon-small x-icon-error" data-title="{error}">!</span>'}).render();_self.set("common-formcontainer",form)},serializeToObject:function(){return this.get("common-formcontainer").serializeToObject()},isValid:function(){return this.get("common-formcontainer").isValid()},valid:function(){this.get("common-formcontainer").valid()},_initValidTooltip:function(){new Tooltip.Tips({tip:{trigger:".x-icon-error",alignType:"left",elCls:"tips tips-warning tips-no-icon tip1",elStyle:{"border-color":"#EEEBEB","background-color":"#FCFCFC"},zIndex:"2000",offset:10}}).render()}},{ATTRS:{colNum:{value:1},formChildrens:{}}})});