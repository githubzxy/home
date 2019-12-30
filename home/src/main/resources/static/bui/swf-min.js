/**
 * @ignore
 * Flash UA \u63a2\u6d4b
 * @author oicuicu@gmail.com
 */define("bui/swf/ua",function(e){function i(){var e,t="ShockwaveFlash";if(navigator.plugins&&navigator.mimeTypes.length)e=(navigator.plugins["Shockwave Flash"]||0).description;else if(r.ActiveXObject)try{e=(new ActiveXObject(t+"."+t)).GetVariable("$version")}catch(n){BUI.log("getFlashVersion failed via ActiveXObject")}return e?s(e):undefined}function s(e){return e.match(/\d+/g).splice(0,3)}function o(e){var t=typeof e=="string"?s(e):e,n=e;return BUI.isArray(t)&&(n=parseFloat(t[0]+"."+u(t[1],3)+u(t[2],5))),n||0}function u(e,t){e=e||0,e+="";var n=t+1-e.length;return(new Array(n>0?n:0)).join("0")+e}function a(e){if(e||n)n=!1,t=i();return t}function f(e,t){return o(a(t))>=o(e)}var t,n=!0,r=window;return{fpv:a,fpvGTE:f}}),define("bui/swf",["bui/common","bui/swf/ua"],function(e){function x(e){for(var t in e)typeof e[t]=="function"&&(e[t]=null);e.parentNode.removeChild(e)}function T(e){var t="",n,r,i,s=[],o=e.nodeName.toLowerCase();if(o=="object"){t=$(e).attr("data"),t&&s.push(e),n=e.childNodes;for(r=0;r<n.length;r++)i=n[r],i.nodeType==1&&(($(i).attr("name")||"").toLowerCase()=="movie"?s.push(i):i.nodeName.toLowerCase()=="embed"?s.push(i):i.nodeName.toLowerCase()=="object"&&s.push(i))}else o=="embed"&&s.push(e);return s}function N(e){var n=a;return t.each(e,function(e,t){t=t.toLowerCase(),t in E?n+=_(t,e):t==u&&(n+=_(t,M(e)))}),n}function C(e,t,n){return L(e,t,n,r.ie)+h+"/"+y+p}function L(e,n,i,f){var l,c=a,d=a;f==undefined&&(f=r.ie);if(f)t.each(n,function(e,t){c+=D(t,e)}),c+=D("classid",o),d+=_("movie",e),d+=N(i),l=h+y+c+p+d;else{c+=D("src",e),t.each(n,function(e,t){c+=D(t,e)}),c+=D("data",e),c+=D("type",s);for(k in i)k in E&&(d+=D(k,i[k]));i[u]&&(d+=D(u,M(i[u]))),l=h+b+c+d+"/"+p}return l}function A(e,t,n,r){var i,s=a,o=a;return i}function O(e,t,n){var i,s;return r.ie?(i=L(e,t,n,1),delete t.id,delete t.style,s=L(e,t,n,0)):(s=L(e,t,n,0),delete t.id,delete t.style,i=L(e,t,n,1)),i+s+h+"/"+y+p+h+"/"+y+p}function M(e){var n=[],r;return t.each(e,function(e,t){typeof e!="string"&&(e=i.stringify(e)),e&&n.push(t+"="+w(e))}),r=n.join("&"),r}function _(e,t){return'<param name="'+e+'" value="'+t+'"></param>'}function D(e,t){return f+e+l+c+t+c}var t=e("bui/common"),n=e("bui/swf/ua"),r=t.UA,i=t.JSON,s="application/x-shockwave-flash",o="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000",u="flashvars",a="",f=" ",l="=",c='"',h="<",p=">",d=document,v=n.fpv,m=n.fpvGEQ,g=n.fpvGTE,y="object",b="embed",w=encodeURIComponent,E={wmode:a,allowscriptaccess:a,allownetworking:a,allowfullscreen:a,play:"false",loop:a,menu:a,quality:a,scale:a,salign:a,bgcolor:a,devicefont:a,hasPriority:a,base:a,swliveconnect:a,seamlesstabbing:a},S=function(e){S.superclass.constructor.call(this,e),this.initializer()};return t.extend(S,t.Base,{initializer:function(){var e=this,n=e.get("expressInstall"),i,s,o,u=e.get("htmlMode"),a,f=e.get("params"),l=e.get("attrs"),c=e.get("document"),h=$("<span>"),p=e.get("elBefore"),d=e.get("src"),m=e.get("version");o=l.id=l.id||t.guid("ks-swf-");if(!v()){e.set("status",S.Status.NOT_INSTALLED);return}if(m&&!g(m)){e.set("status",S.Status.TOO_LOW);if(n){d=n;if(!("width"in l)||!/%$/.test(l.width)&&parseInt(l.width,10)<310)l.width="310";if(!("height"in l)||!/%$/.test(l.height)&&parseInt(l.height,10)<137)l.height="137";a=f.flashVars=f.flashVars||{},t.mix(a,{MMredirectURL:location.href,MMplayerType:r.ie?"ActiveX":"PlugIn",MMdoctitle:c.title.slice(0,47)+" - Flash Player Installation"})}}u=="full"?s=O(d,l,f):s=C(d,l,f),e.set("html",s),p?h.insertBefore(p):h.appendTo(e.get("render")),"outerHTML"in h[0]?h[0].outerHTML=s:h.replaceWith($(s)),i=c.getElementById(o),e.set("swfObject",i),u=="full"&&(r.ie?e.set("swfObject",i):e.set("swfObject",i.parentNode)),e.set("el",i),e.get("status")||e.set("status",S.Status.SUCCESS)},callSWF:function(e,t){var n=this.get("el"),r,i;t=t||[];try{n[e]&&(r=n[e].apply(n,t))}catch(s){i="",t.length!==0&&(i="'"+t.join("', '")+"'"),r=(new Function("swf","return swf."+e+"("+i+");"))(n)}return r},destroy:function(){var e=this;e.detach();var t=e.get("swfObject");r.ie?(t.style.display="none",function(){t.readyState==4?x(t):setTimeout(arguments.callee,10)}()):t.parentNode.removeChild(t)}},{ATTRS:{expressInstall:{},src:{},version:{value:"9"},params:{value:{},shared:!1},attrs:{value:{},shared:!1},render:{setter:function(e){return typeof e=="string"&&(e=$(e)[0]),e},valueFn:function(){return document.body}},elBefore:{setter:function(e){return typeof e=="string"&&(e=$(e)[0]),e}},document:{value:d},status:{},el:{},swfObject:{},html:{},htmlMode:{value:"default"}},getSrc:function(e){var t=T(e)[0],n,r=t&&t.nodeName.toLowerCase();return r=="embed"?$(t).attr("src"):r=="object"?$(t).attr("data"):r=="param"?$(t).attr("value"):null},Status:{TOO_LOW:"flash version is too low",NOT_INSTALLED:"flash is not installed",SUCCESS:"success"},HtmlMode:{DEFAULT:"default",FULL:"full"},fpv:v,fpvGEQ:m,fpvGTE:g}),S});
