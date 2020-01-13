(window.webpackJsonp=window.webpackJsonp||[]).push([[42,49],{KNTo:function(t,e){},LFgm:function(t,e,n){"use strict";e.__esModule=!0;var o=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG")),i=n("YKMj"),r=c(n("lqyy")),s=c(n("PVy5")),a=n("AFph"),u=n("lzrX");function c(t){return t&&t.__esModule?t:{default:t}}var f=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.fetched=!1,e.submitting=!1,e.footerComponent="",e.pageClasses="",e}return o.__extends(e,t),Object.defineProperty(e.prototype,"icon",{get:function(){return"phone-passed"},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"viewTitle",{get:function(){return this.tr("titleOfMyBindPhone","accountProtect")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"phone",{get:function(){var t=this._userInfo.phone;return this._temp.phone&&(t=this._temp.phone),t||""},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"assocPhone",{get:function(){return this._userInfo.assoc_phone||""},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"desc",{get:function(){return this.tr("text.phoneDescTitle")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"title",{get:function(){return this._encodePhone(this.phone)},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"buttonText",{get:function(){return this.tr("button.changeBindPhone")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"listText",{get:function(){return[this.tr("text.phoneDesc1"),this.tr("text.phoneDesc2"),this.tr("text.phoneDesc3"),this.tr("text.phoneDesc4")]},enumerable:!0,configurable:!0}),e.prototype.created=function(){this.init()},e.prototype.init=function(){this._hasUserInfo()?this.fetched=!0:this.fetchUserInfo()},e.prototype.fetchUserInfo=function(){var t=this;this.$toast.showLoading(),this._requestUserInfo().then(function(){t.fetched=!0,t.$toast.hide()}).catch(function(){t.$toast.show(t.$tr.text.submitError,function(){t.goBackAccountPage()})})},e.prototype.goBackAccountPage=function(){this.$router.replace(u.ROUTE_ACCOUNT)},e.prototype.viewAllPhonesLinkClick=function(){this.$router.replace(u.ROUTE_ACCOUNT_PROTECT_CREDIBLE_PHONE)},e.prototype.buttonClick=function(){var t=this;this.submitting=!0,this.$toast.showLoading(),this.setSafetyActionCode(a.SAFETY_OP_TYPE_PHONE_CHANGE),this._safetyRequestCheckCredibilityDevice().then(function(){t.$toast.hide(),t.submitting=!1;var e=u.ROUTE_CHANGE_PHONE_CHECK_PASSWORD,n=t.$store.state.userInfo,o=t._safetyAppeal||n;o&&(void 0===o.has_password||o.has_password||(e=u.ROUTE_SAFETY_VERIFY)),t.setTempData({isCredibilityDevice:{changePhone:!0}}),t.$router.push(e)}).catch(function(){t.submitting=!1,t.$toast.hide()})},o.__decorate([(0,i.Component)({data:function(){return{$trPage:"safety"}},components:{PhoneStatusView:s.default},template:'<page class="change-phone" :class="pageClasses">\n                    <title-bar/>\n                    <page-view v-if="fetched">\n                        <page-title :title="viewTitle" padding style="margin-bottom:0;" />\n                        <phone-status-view :icon="icon"\n                                           style="width: 86%;"\n                                           :list-text="listText"\n                                           :desc="desc"\n                                           :title="title"\n                                           :button-text="buttonText"\n                                           @button-click="buttonClick">\n                            <a href="javascript:;"\n                               slot="fixed-footer"\n                               @click="viewAllPhonesLinkClick"\n                               v-text="tr(\'button.viewAllPhones\')">\n                            </a>\n                        </phone-status-view>\n                        <component :is="footerComponent" />\n                    </page-view>\n                </page>'})],e)}((0,i.Mixins)(r.default));e.default=f},PVy5:function(t,e,n){"use strict";n.r(e);var o=n("UXwX"),i=n("hX/0");for(var r in i)"default"!==r&&function(t){n.d(e,t,function(){return i[t]})}(r);n("xW/d");var s=n("KHd+"),a=Object(s.a)(i.default,o.a,o.b,!1,null,null,null);a.options.__file="phone.status.vue",e.default=a.exports},UXwX:function(t,e,n){"use strict";var o=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"View phone-status",class:{"bg-white":t.bgWhite,"full-width":t.fullWidth}},[t.icon?n("icon",{attrs:{name:t.icon}}):t._e(),t._v(" "),t.titleText?n("h2",{staticClass:"title",domProps:{innerHTML:t._s(t.titleText)}}):t._e(),t._v(" "),t.desc||t.listText?n("section",{staticClass:"message"},[t.desc?n("h3",{staticClass:"text",domProps:{textContent:t._s(t.desc)}}):t._e(),t._v(" "),t.listText?n("ul",{staticClass:"list-text"},t._l(t.listText,function(e,o){return n("li",{key:o,staticClass:"item",domProps:{textContent:t._s(e)}})})):t._e()]):t._e(),t._v(" "),t._t("default"),t._v(" "),t.buttonText?n("mt-button",{attrs:{type:"primary"},domProps:{textContent:t._s(t.buttonText)},on:{click:function(e){t.$emit("button-click")}}}):t._e(),t._v(" "),n("footer",{staticClass:"fixed-footer"},[t._t("fixed-footer")],2)],2)},i=[];n.d(e,"a",function(){return o}),n.d(e,"b",function(){return i})},"hX/0":function(t,e,n){"use strict";n.r(e);var o=n("iTC4"),i=n.n(o);for(var r in o)"default"!==r&&function(t){n.d(e,t,function(){return o[t]})}(r);e.default=i.a},iTC4:function(t,e,n){"use strict";e.__esModule=!0;var o=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG")),i=n("YKMj"),r=u(n("PzH0")),s=u(n("J+9/")),a=n("9Ess");function u(t){return t&&t.__esModule?t:{default:t}}var c=function(t){function e(){return null!==t&&t.apply(this,arguments)||this}return o.__extends(e,t),Object.defineProperty(e.prototype,"phoneNum",{get:function(){return this.phone?(0,a.encodePhone)(this.phone.toString()):""},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"titleText",{get:function(){return this.phoneNum||this.title},enumerable:!0,configurable:!0}),o.__decorate([(0,i.Prop)([String,Number]),o.__metadata("design:type",Object)],e.prototype,"phone",void 0),o.__decorate([(0,i.Prop)(String),o.__metadata("design:type",String)],e.prototype,"icon",void 0),o.__decorate([(0,i.Prop)(String),o.__metadata("design:type",String)],e.prototype,"desc",void 0),o.__decorate([(0,i.Prop)(String),o.__metadata("design:type",String)],e.prototype,"buttonText",void 0),o.__decorate([(0,i.Prop)(Array),o.__metadata("design:type",Array)],e.prototype,"listText",void 0),o.__decorate([(0,i.Prop)(String),o.__metadata("design:type",String)],e.prototype,"title",void 0),o.__decorate([(0,i.Prop)(Boolean),o.__metadata("design:type",Boolean)],e.prototype,"bgWhite",void 0),o.__decorate([(0,i.Prop)(Boolean),o.__metadata("design:type",Boolean)],e.prototype,"fullWidth",void 0),o.__decorate([(0,i.Component)({components:{Icon:r.default,MtButton:s.default}})],e)}(i.Vue);e.default=c},"vrz+":function(t,e,n){"use strict";e.__esModule=!0;var o,i=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG")),r=n("YKMj"),s=n("lzrX"),a=(o=n("LFgm"))&&o.__esModule?o:{default:o},u=n("k/HC"),c=function(t){function e(){return null!==t&&t.apply(this,arguments)||this}return i.__extends(e,t),Object.defineProperty(e.prototype,"icon",{get:function(){return this.isVerified?"email-pass":"email-unverified"},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"email",{get:function(){return this._hasUserInfo()?this._userInfo.email:""},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"viewTitle",{get:function(){return this.tr("texts.email","account")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"message",{get:function(){return""},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"title",{get:function(){var t=this.tr("text.yourEmail")+(this._isNonChinese?" ":"")+this._encodeEmail(this.email);return this.isVerified||(t+="<br/>"+this.tr("text.notYetVerified")),t},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"desc",{get:function(){var t=this.tr("text.verificationEmail");return this.isVerified||(t=this.tr("text.afterVerificationEmail")),t},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"listText",{get:function(){return[this.tr("text.phoneDesc1","safety"),this.tr("text.phoneDesc2","safety"),this.tr("text.phoneDesc3","safety")]},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isVerified",{get:function(){var t=!0;return this._hasUserInfo()&&(t=this._userInfo.email_verified),t},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"buttonText",{get:function(){var t=this.tr("button.gotoAccount","safety");return this.isVerified?this._temp.isClientDispatch&&(t=this.$tr.text.back):t=this.tr("button.verifyNow"),t},enumerable:!0,configurable:!0}),e.prototype.init=function(){if(!this._enableEmail)return this.goBackAccountPage(),!1;this._hasUserInfo()?this.fetched=!0:this.fetchUserInfo()},e.prototype.buttonClick=function(){this.isVerified?this.goBackAccountPage():this.submitVerify()},e.prototype.submitVerify=function(){var t=this;(0,u.online)(function(e){e?(t.setTempData({accountEmail:t.email}),t.$router.push(s.ROUTE_ACCOUNT_EMAIL_VERIFY)):t.$toast.networkDisconnect()})},i.__decorate([(0,r.Component)({data:function(){return{$trPage:"email"}}})],e)}(a.default);e.default=c},"xW/d":function(t,e,n){"use strict";var o=n("KNTo");n.n(o).a}}]);