(window.webpackJsonp=window.webpackJsonp||[]).push([[34],{"0GPA":function(t,e,s){"use strict";e.__esModule=!0;var i=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var s in t)Object.prototype.hasOwnProperty.call(t,s)&&(e[s]=t[s]);return e.default=t,e}(s("mrSG")),a=s("YKMj"),n=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.level=0,e}return i.__extends(e,t),e.prototype.watchPassword=function(t,e){if(!t)return this.level=0;t.length>=6?/^[A-Za-z]+$/.test(t)||/^\d+$/.test(t)||/^[\W_]+$/.test(t)?this.level=1:(/[A-Za-z]+/g.test(t)&&/\d+/g.test(t)||/[A-Za-z]+/g.test(t)&&/[\W_]+/g.test(t)||/[0-9]+/g.test(t)&&/[\W_]+/g.test(t))&&(this.level=2,/[A-Za-z]+/g.test(t)&&/\d+/g.test(t)&&/[\W_]+/g.test(t)&&(this.level=3)):this.level=0,/\s+/g.test(t)?this.level=4:/^[A-Za-z0-9!@#\$%\^&\*\~\/{}|\(\)\'\\"\?\>\<,\.`+\-=_\[\]:;*\/]+$/g.test(t)||(this.level=5)},Object.defineProperty(e.prototype,"levelTexts",{get:function(){return this.$lang&&this.$lang.page?this.$lang.page.password.texts.passwordLevels:[]},enumerable:!0,configurable:!0}),i.__decorate([(0,a.Prop)([String]),i.__metadata("design:type",String)],e.prototype,"value",void 0),i.__decorate([(0,a.Watch)("value",{immediate:!0}),i.__metadata("design:type",Function),i.__metadata("design:paramtypes",[Object,Object]),i.__metadata("design:returntype",void 0)],e.prototype,"watchPassword",null),i.__decorate([a.Component],e)}(a.Vue);e.default=n},"1SUJ":function(t,e,s){"use strict";e.__esModule=!0;var i,a=(i=s("Kg7Q"))&&i.__esModule?i:{default:i};e.default=a.default},"9N56":function(t,e){},BwAu:function(t,e,s){"use strict";var i=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"form-tips"},[0===t.value.length||0===t.level?s("span",{staticClass:"text",domProps:{textContent:t._s(t.$lang.page.password.texts.firstTips)}}):s("span",{staticClass:"primary"},[t._v(t._s(t.levelTexts[t.level]))])])},a=[];s.d(e,"a",function(){return i}),s.d(e,"b",function(){return a})},Ir7D:function(t,e,s){"use strict";var i=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"View password-setting"},[s("input-group",[s("mt-input",{ref:"input",attrs:{type:"password",placeholder:t.placeholder||t.tr("placeholder.password","register"),minlength:t.minLength,maxlength:t.maxLength,clear:"",show:""},model:{value:t.password,callback:function(e){t.password=e},expression:"password"}})],1),t._v(" "),t.showLevel?s("password-level",{attrs:{value:t.password}}):t._e(),t._v(" "),t._t("append"),t._v(" "),s("mt-button",{attrs:{type:"primary",disabled:t.submitButtonDisabled},domProps:{textContent:t._s(t.submitButtonText)},on:{click:t.submit}}),t._v(" "),t._t("default")],2)},a=[];s.d(e,"a",function(){return i}),s.d(e,"b",function(){return a})},Kg7Q:function(t,e,s){"use strict";s.r(e);var i=s("BwAu"),a=s("Qzz4");for(var n in a)"default"!==n&&function(t){s.d(e,t,function(){return a[t]})}(n);var o=s("KHd+"),r=Object(o.a)(a.default,i.a,i.b,!1,null,null,null);r.options.__file="level.vue",e.default=r.exports},Lt2X:function(t,e,s){"use strict";s.r(e);var i=s("ZGAf"),a=s.n(i);for(var n in i)"default"!==n&&function(t){s.d(e,t,function(){return i[t]})}(n);e.default=a.a},Qzz4:function(t,e,s){"use strict";s.r(e);var i=s("0GPA"),a=s.n(i);for(var n in i)"default"!==n&&function(t){s.d(e,t,function(){return i[t]})}(n);e.default=a.a},ZGAf:function(t,e,s){"use strict";e.__esModule=!0;var i=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var s in t)Object.prototype.hasOwnProperty.call(t,s)&&(e[s]=t[s]);return e.default=t,e}(s("mrSG")),a=p(s("J+9/")),n=p(s("1SUJ")),o=s("X8Hg"),r=s("YKMj");function p(t){return t&&t.__esModule?t:{default:t}}var u=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.password="",e}return i.__extends(e,t),Object.defineProperty(e.prototype,"submitButtonText",{get:function(){return this.buttonText||this.$tr.text.submit},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"submitButtonDisabled",{get:function(){return this.password.trim().length<6||this.buttonDisabled},enumerable:!0,configurable:!0}),e.prototype.watchPassword=function(){this.$emit("input",this.password)},e.prototype.validatePassword=function(){return this.password=this.password.trim(),!(this.validate&&(!this.password||this.password.length<6||this.password.length>16?(this.$toast.show(this.tr("tips.passwordEmptyOrError","password")),1):(/\s+/g.test(this.password)||!/^[A-Za-z0-9!@#\$%\^&\*\~\/{}|\(\)\'\\"\?\>\<,\.`+\-=_\[\]*:;\/]+$/g.test(this.password))&&(this.$toast.show(this.tr("tips.passwordError","password")),1)))},e.prototype.submit=function(){this.validatePassword()&&this.$emit("submit")},i.__decorate([(0,r.Prop)({type:[String,Number],default:6}),i.__metadata("design:type",Object)],e.prototype,"minLength",void 0),i.__decorate([(0,r.Prop)({type:[String,Number],default:16}),i.__metadata("design:type",Object)],e.prototype,"maxLength",void 0),i.__decorate([(0,r.Prop)({type:[String],default:""}),i.__metadata("design:type",String)],e.prototype,"placeholder",void 0),i.__decorate([(0,r.Prop)({type:[Boolean],default:!0}),i.__metadata("design:type",Boolean)],e.prototype,"showLevel",void 0),i.__decorate([(0,r.Prop)({type:[String],default:""}),i.__metadata("design:type",String)],e.prototype,"buttonText",void 0),i.__decorate([(0,r.Prop)({type:[Boolean],default:!1}),i.__metadata("design:type",Boolean)],e.prototype,"buttonDisabled",void 0),i.__decorate([(0,r.Prop)({type:[Boolean],default:!0}),i.__metadata("design:type",Boolean)],e.prototype,"validate",void 0),i.__decorate([(0,r.Watch)("password"),i.__metadata("design:type",Function),i.__metadata("design:paramtypes",[]),i.__metadata("design:returntype",void 0)],e.prototype,"watchPassword",null),i.__decorate([(0,r.Component)({name:"password-setting-view",components:{MtInput:o.MtInput,MtButton:a.default,InputGroup:o.InputGroup,PasswordLevel:n.default}})],e)}((0,r.Mixins)());e.default=u},"j4R/":function(t,e,s){"use strict";s.r(e);var i=s("Ir7D"),a=s("Lt2X");for(var n in a)"default"!==n&&function(t){s.d(e,t,function(){return a[t]})}(n);s("nKMI");var o=s("KHd+"),r=Object(o.a)(a.default,i.a,i.b,!1,null,null,null);r.options.__file="password.setting.vue",e.default=r.exports},nKMI:function(t,e,s){"use strict";var i=s("9N56");s.n(i).a},wN2n:function(t,e,s){"use strict";e.__esModule=!0;var i=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var s in t)Object.prototype.hasOwnProperty.call(t,s)&&(e[s]=t[s]);return e.default=t,e}(s("mrSG")),a=s("YKMj"),n=l(s("lqyy")),o=l(s("j4R/")),r=s("Q+em"),p=s("KEQF"),u=s("uOKE");function l(t){return t&&t.__esModule?t:{default:t}}var d=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.password="",e.params={},e}return i.__extends(e,t),Object.defineProperty(e.prototype,"isClientDispatchSetPassword",{get:function(){return this.getTempData.isClientDispatch&&"set_password"===this.getTempData.clientDispatchAction},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isClientDispatchForget",{get:function(){return this.getTempData.isClientDispatch&&"forget"===this.getTempData.clientDispatchAction},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isClientDispatchForgetAutoLogin",{get:function(){return this.getTempData.isClientDispatch&&"forget_auto_login"===this.getTempData.clientDispatchAction},enumerable:!0,configurable:!0}),e.prototype.mounted=function(){var t=this.$route.params;t&&t.phone&&t.phone_cc||t.email&&t.verify_code?(this.params=t,this.$eventStats.event("7","1","C7A1L6")):this.$router.go(-1)},e.prototype.passwordInput=function(t){this.password=t||""},e.prototype.submit=function(){var t=this,e=this.params.phone;if(this.$eventStats.event("7","2","C7A2L6S1"),!this.password||""===this.password.trim())return!1;var s={password:this.password,auto_login:0,verify_code:this.params.verify_code};e?(s.phone=this.params.phone,s.phone_cc=this.params.phone_cc):s.email=this.params.email,this.isClientDispatchForgetAutoLogin&&(s.auto_login=1),this.$toast.showLoading(),this.$api.user[e?"passwordReset":"passwordResetByEmail"](s).then(function(e){t.$toast.hide();var s=e.data.response;t.showSuccessDialog(s)}).catch(function(e){e.data&&e.data.meta?t.$toast.show(e.data.meta.msg):t.$toast.show(t.tr("tips.ajaxError","binding"))})},e.prototype.showSuccessDialog=function(t){var e=this;this.$eventStats.event("7","1","C7A1L7"),this.isClientDispatchSetPassword?window.DispatchHandlers.backing=this.noticePasswordCompleteSet:this.isClientDispatchForget||this.isClientDispatchForgetAutoLogin?window.DispatchHandlers.backing=function(){e.noticePasswordReset(t,e.isClientDispatchForgetAutoLogin)}:window.DispatchHandlers.backing=null;var s=this.tr("tips.modifySuccess3"),i=this.tr("button.backToLogin");this.isClientDispatchForgetAutoLogin&&(s=this.tr("tips.modifySuccess2"),i=this.$tr.text.ok),this.$dialog.confirm({title:this.tr("texts.settingSuccess"),content:s,buttons:[{text:i,type:"primary",click:function(s){return e.isClientDispatchSetPassword?(e.noticePasswordCompleteSet(),!1):e.isClientDispatchForget||e.isClientDispatchForgetAutoLogin?(e.noticePasswordReset(t,e.isClientDispatchForgetAutoLogin),!1):(s.close(),void(0,r.openLoginPage)())}}]})},e.prototype.noticePasswordReset=function(t,e){void 0===t&&(t={}),void 0===e&&(e=!1);var s=u.NOTICE_PASSWORD_RESET;e&&(s=u.NOTICE_PASSWORD_RESET_AND_AUTO_LOGIN),this.$accountCommand("Notice",{code:s,data:t}),this.setTempData({isClientDispatch:!1,clientDispatchAction:""}),window.DispatchHandlers.backing=null,e&&(0,p.commandLoginConnect)(t,1)},e.prototype.noticePasswordCompleteSet=function(){this.$accountCommand("Notice",{code:u.NOTICE_PASSWORD_UNSET_AND_COMPLETE_SET}),this.setTempData({isClientDispatch:!1,clientDispatchAction:""}),window.DispatchHandlers.backing=null},i.__decorate([(0,a.Component)({data:function(){return{$trPage:"password"}},components:{PasswordSettingView:o.default},template:'<page class="forget-setting-password">\n                    <title-bar/>\n                    <page-view padding>\n                        <page-title :title="tr(\'titleOfForget\')"></page-title>\n                        <password-setting-view @input="passwordInput" @submit="submit"></password-setting-view>\n                    </page-view>\n                </page>'})],e)}((0,a.Mixins)(n.default));e.default=d}}]);