(window.webpackJsonp=window.webpackJsonp||[]).push([[62],{"5R23":function(t,e,i){"use strict";var n=i("KEbZ");i.n(n).a},B3ZO:function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("page",{staticClass:"page-protect page-credible-device",attrs:{"bg-color":!0}},[i("title-bar"),t._v(" "),t.fetched?i("page-view",[i("page-title",{attrs:{title:t.tr("titleOfCredibleDevice","accountProtect")}}),t._v(" "),i("div",{staticClass:"Tips interval",domProps:{textContent:t._s(t.tr("tips.deviceRemoveText","credibilityDevice"))}}),t._v(" "),i("list",t._l(t.deviceList,function(e,n){return i("list-item",{key:n,attrs:{title:e.device_name||t.$tr.text.nothing,arrow:"true",border:"bottom",description:t._f("textFormat")(e)},on:{click:function(i){t.goToDetail(e)}}},[1===e.is_me?i("span",{staticClass:"offside-is-me",attrs:{slot:"offside"},domProps:{textContent:t._s(t.tr("text.isMe","credibilityDevice"))},slot:"offside"}):t._e()])})),t._v(" "),t.loadEnd?t._e():i("div",{staticClass:"Tips interval text-center"},[i("mt-button",{attrs:{type:"text"},domProps:{textContent:t._s(t.tr("text.loadMore","credibilityDevice"))},on:{click:t.loadMore}})],1)],1):t._e()],1)},o=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return o})},KEbZ:function(t,e){},"L+1x":function(t,e,i){"use strict";i.r(e);var n=i("B3ZO"),o=i("WK7D");for(var r in o)"default"!==r&&function(t){i.d(e,t,function(){return o[t]})}(r);i("5R23");var a=i("KHd+"),s=Object(a.a)(o.default,n.a,n.b,!1,null,null,null);s.options.__file="protect.credible.device.vue",e.default=s.exports},WK7D:function(t,e,i){"use strict";i.r(e);var n=i("wXvX"),o=i.n(n);for(var r in n)"default"!==r&&function(t){i.d(e,t,function(){return n[t]})}(r);e.default=o.a},wXvX:function(t,e,i){"use strict";e.__esModule=!0;var n=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var i in t)Object.prototype.hasOwnProperty.call(t,i)&&(e[i]=t[i]);return e.default=t,e}(i("mrSG")),o=i("YKMj"),r=d(i("lqyy")),a=i("BXJC"),s=d(i("J+9/")),c=i("iFk+"),u=i("9Ess");function d(t){return t&&t.__esModule?t:{default:t}}var l=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.fetched=!1,e.page=1,e.count=0,e.deviceList=[],e.listLoading=!1,e}return n.__extends(e,t),e.prototype.created=function(){var t=this;this.getDeviceList(function(){if(0===t.count)return t.$router.go(-1),!1;t.fetched=!0})},e.prototype.getDeviceList=function(t){var e=this,i={page:this.page,count:10};this.listLoading=!0,this.$toast.showLoading(this.$tr.text.loading),this.$http.get(this.$api.$paths.credDeviceList,i).then(function(i){var n=i.data.response,o=n.data;e.count=n.count,e.listLoading=!1,e.$toast.hide(),o.length&&(e.deviceList=e.deviceList.concat(n.data),e.page++),t&&t(n)}).catch(function(t){e.listLoading=!1,t.data&&t.data.meta?e.$toast.show(t.data.meta.msg):e.$toast.show(e.tr("tips.ajaxError","binding"))})},e.prototype.loadMore=function(){this.listLoading||this.getDeviceList()},e.prototype.goToDetail=function(t){this.setTempData({credibilityDevice:t}),this.$router.push({path:t.device_id,append:!0})},Object.defineProperty(e.prototype,"loadEnd",{get:function(){return this.count===this.deviceList.length},enumerable:!0,configurable:!0}),n.__decorate([(0,o.Component)({components:{List:a.List,ListItem:a.ListItem,MtButton:s.default,Page:c.Page},filters:{textFormat:function(t){return(0,u.formatDate)(t.updated_at)+" "+t.country+" "+t.province+" "+t.city}}})],e)}((0,o.Mixins)(r.default));e.default=l}}]);