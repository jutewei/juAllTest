(window.webpackJsonp=window.webpackJsonp||[]).push([[37],{"+CIO":function(t,e,n){"use strict";var o;e.__esModule=!0;var i=/^1\d{10}$/;o=i,e.default={username:/^[a-zA-Z]\w{4,15}$/,password:/^[a-zA-Z][a-zA-Z0-9\.\-\_]{5,15}$/,enName:/^[a-zA-Z]{2,}$/,uppercase:/^[A-Z]+$/,lowercase:/^[a-z]+$/,chinese:/^[\u4e00-\u9fa5]+$/,chineseName:/^[\u4e00-\u9fa5·]+$/,emoji:/\ud83c[\udf00-\udfff]|\ud83d[\udc00-\ude4f]|\ud83d[\ude80-\udeff]/g,email:/^[0-9a-z][_.0-9a-z-]{0,31}@([0-9a-z][0-9a-z-]{0,30}[0-9a-z]\.){1,3}[a-z]{2,4}$/,tel:/^\d{3}-\d{8}|\d{4}-\d{7,8}$/,telExt:/^\d{3}-\d{8}|\d{4}-\d{7,8}-?\d+?$/,mobile:o,mobileI18n:/^\d{6,18}$/,zipCode:/^[1-9]\d{5}$/,qq:/^[1-9]\\d{4,10}$/,domain:/^([a-zA-Z0-9\-]+)\.([a-zA-Z0-9\-]+)\.(com|net|cn|jp|tw|hk|edu|biz|gov|org|info|asia|mobi|co|cc|tt|me|tv|name|de)\.?(cn|hk|tw|jp)?$/,url:/^(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#]*[\w\-\@?^=%&amp;\/~\+#])?$/,ipv4:/^((?:(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d))))$/,idCard:/^\d{17}([0-9]|X)$/,idCard1518:/(^\d{15}$)|(^\d{17}([0-9]|X)$)/,phone:i,passport:/^[a-zA-Z0-9]{5,17}$/,passportName:/^[\s\u4e00-\u9fa5A-Za-z·]+$/,integer:/^\d+$/,verifyCode:/^\d{6}$/,number:function(t){return!isNaN(t)},image:function(t,e){return e.indexOf(t)>=0},notAllowPasswordChars:/^[A-Za-z0-9!@#\$%\^&\*\~\/{}|\(\)\'\\"\?\>\<,\.`+\-=_\[\]:;*\/]+$/g}},"7FWv":function(t,e,n){"use strict";var o=n("soVk");n.n(o).a},BpKI:function(t,e,n){"use strict";e.__esModule=!0;var o,i=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG")),r=(o=n("MgzW"))&&o.__esModule?o:{default:o},a=n("kWpp"),s=function(){function t(t,e,n,o){void 0===n&&(n={});var a=this;this.time=0,this.type="phone",this.captcha="",this.sending=!1,this.countDownText="",this.requestOptions={onAccountStatusAbnormal:function(){var t=a.$vm;t._safetyCheckApplyRequest({op_type:13}).then(function(e){t.setTempData({safetyMessageAppeal:e}),t.$router.push({name:"AppealStart",params:i.__assign({},a.params,{account_status_abnormal:!0})})}).catch(function(e){if(e.failure){var n=e.data||{};t.$toast.show(n.meta.msg)}else t.$toast.show(t.$tr.text.submitError)})}},this.params={},this.type=e,this.$vm=t,this.params=(0,r.default)(this.params,n),this.requestOptions=(0,r.default)(this.requestOptions,o),this.clear()}return Object.defineProperty(t.prototype,"isPhone",{get:function(){return"phone"===this.type},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isEmail",{get:function(){return"email"===this.type},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"lang",{get:function(){var t=this.$vm;return t.$tr?t.$tr.text:""},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"defaultCountDownText",{get:function(){var t=this.$vm;return t?t.tr("button.send2","register"):""},enumerable:!0,configurable:!0}),t.prototype.clear=function(){return this.countDown(0),this.countDownText=this.defaultCountDownText,this.countDownEventEmit(),this},t.prototype.changeParams=function(t){this.params=(0,r.default)(this.params,t)},t.prototype.countDown=function(t,e){var n=this;return void 0===t&&(t=59),void 0===e&&(e=function(){}),e=e.bind(this),clearTimeout(this.countDownTimer),t>0?(this.sending=!0,this.countDownText=t+"s",this.countDownTimer=setTimeout(function(){n.countDown(t-1,e)},1e3)):(this.sending=!1,this.countDownText=this.lang.resend1),this.time=t,e(t,this.countDownText),this.countDownEventEmit(),this},t.prototype.countDownEventEmit=function(){this.$vm&&this.$vm.$emit("count-down",this.time,this.countDownText)},t.prototype.setCountDownText=function(t){t&&(this.countDownText=t)},t.prototype.resend=function(){this.sending=!1,this.send()},t.prototype.send=function(t){var e=this,n=this,o=this.$vm;if(this.sending)return!1;t&&(this.params.captcha=this.captcha),this.sending=!0;var i=o.$toast,r=this.isPhone?"send":"sendEmail";o.$api.verifyCode[r](this.params,this.requestOptions).then(function(){e.countDown(59),t&&t.close(),"function"==typeof o.sendSuccess&&o.sendSuccess()}).catch(function(r){e.countDown(0);var s=function(){"function"==typeof o.sendFailure&&o.sendFailure(r)};if(r.data&&r.data.meta){var p=r.data.meta,c=p.code;return t&&(20171===c||c===a.ERROR_CAPTCHA_WRONGS||c===a.ERROR_PHONE_HAS_BEEN_BOUND||c===a.ERROR_EMAIL_VERIFY_CODE_SEND_LIMITED||c===a.ERROR_EMAIL_NOT_REGISTERED||c===a.ERROR_PHONE_UNREGISTERED?t.close():t.reload()),c===a.ERROR_SHOW_CAPTCHA||c===a.ERROR_NEED_CAPTCHA||c===a.ERROR_CAPTCHA?e.requestOptions&&"function"==typeof e.requestOptions.captchaErrorHandle?(e.requestOptions.captchaErrorHandle(r),!1):(o.$dialog.captcha({title:p.msg.replace("。",""),placeholder:o.tr("placeholder.captcha","password"),countDownText:o.tr("texts.refreshCaptcha","binding"),reloadText:o.tr("texts.refreshCaptcha","binding"),buttons:[{type:"primary",text:e.lang.enter,close:!1,click:function(t){if(void 0!==t.captcha&&!t.captcha.trim())return o.$toast.show(o.tr("placeholder.captcha","password")),!1;n.captcha=t.captcha,n.sending=!1,n.send(t)}},{type:"default",text:e.lang.cancel}]}),s(),!1):(i.show(p.msg),"reset_password"!==e.params.type.trim()||e.requestOptions.notBack||p.code!==a.ERROR_EMAIL_NOT_REGISTERED&&p.code!==a.ERROR_PHONE_UNREGISTERED||o.$router.go(-1),e.clear(),s(),!1)}i.show(o.tr("tips.ajaxError","binding")),t&&t.close(),"function"==typeof o.sendError&&o.sendError(r)})},t.prototype.setBackingDispatchHandler=function(t,e){var n=this;void 0===t&&(t=null),void 0===e&&(e=!1);var o=this.$vm;window.DispatchHandlers.backing=function(){if(!n.sending)return o.$accountCommand("Backing"),!1;var i=o.$tr.text;o.$accountCommand("BackingStop"),o.$dialog.confirm({title:o.$tr.text.attention,content:e?i.sentBackingConfirm2:i.sentBackingConfirm,buttons:[{type:"primary",text:i.wait},{text:i.back,click:function(){t&&"function"==typeof t?t(o.$dialog):o.$accountCommand("Backing"),window.DispatchHandlers.backing=null,o.$dialog.close()}}]})}},t}();e.default=s},Pxo9:function(t,e,n){"use strict";var o=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"View form-verify",class:{padding:t.padding}},["phone"===t.type?n("input-group",[n("area-code",{model:{value:t.phone_cc,callback:function(e){t.phone_cc=e},expression:"phone_cc"}}),t._v(" "),n("mt-input",{attrs:{type:"tel",clear:"",placeholder:t.placeholder,maxlength:86==+t.phone_cc?11:18},model:{value:t.phone,callback:function(e){t.phone=e},expression:"phone"}})],1):t._e(),t._v(" "),"email"===t.type?n("input-group",[n("mt-input",{attrs:{type:"email",clear:"",placeholder:t.placeholder},model:{value:t.email,callback:function(e){t.email=e},expression:"email"}})],1):t._e(),t._v(" "),t.vCode?n("input-group",{staticClass:"space-between"},[n("mt-input",{staticClass:"captcha-input",attrs:{type:"text",maxlength:"6",placeholder:t.tr("placeholder.captcha","password"),clear:""},model:{value:t.captcha,callback:function(e){t.captcha=e},expression:"captcha"}}),t._v(" "),t.vCode&&t.captchaUrl?n("img",{ref:"vcode",staticClass:"captcha-img",attrs:{src:t.captchaUrl},on:{click:t.reloadVCode}}):t._e()],1):t._e(),t._v(" "),t.sendCode?n("input-group",{staticClass:"space-between"},[n("mt-input",{staticClass:"verify-code-input",attrs:{type:"text",maxlength:"6",placeholder:t.tr("placeholder.vcode","register"),clear:""},model:{value:t.verifyCode,callback:function(e){t.verifyCode=e},expression:"verifyCode"}}),t._v(" "),n("mt-button",{staticClass:"send-button",attrs:{type:"text"},domProps:{textContent:t._s(t.countDownText)},on:{click:t.send}})],1):t._e(),t._v(" "),t.showButtonTopTips?n("div",{staticClass:"form-tips text-right"},[t._t("buttonTopTips",[t.vCode?n("mt-button",{attrs:{type:"text"},domProps:{textContent:t._s(t.tr("texts.refreshCaptcha","binding"))},on:{click:t.reloadVCode}}):t._e()])],2):t._e(),t._v(" "),n("mt-button",{staticClass:"submit",class:{disabled:!t.canSubmit},attrs:{type:"primary"},domProps:{textContent:t._s(t.buttonText)},on:{click:t.submit}}),t._v(" "),n("div",{staticClass:"form-tips text-right"},[t._t("buttonBottomTips")],2)],1)},i=[];n.d(e,"a",function(){return o}),n.d(e,"b",function(){return i})},RQxJ:function(t,e,n){},i1CL:function(t,e,n){"use strict";n.r(e);var o=n("kUOa"),i=n.n(o);for(var r in o)"default"!==r&&function(t){n.d(e,t,function(){return o[t]})}(r);e.default=i.a},jqo8:function(t,e,n){"use strict";n.r(e);var o=n("Pxo9"),i=n("i1CL");for(var r in i)"default"!==r&&function(t){n.d(e,t,function(){return i[t]})}(r);n("7FWv");var a=n("KHd+"),s=Object(a.a)(i.default,o.a,o.b,!1,null,null,null);s.options.__file="form.verify.vue",e.default=s.exports},kUOa:function(t,e,n){"use strict";e.__esModule=!0;var o=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG")),i=n("YKMj"),r=u(n("BpKI")),a=n("RQxJ"),s=u(n("+CIO")),p=u(n("J+9/")),c=n("X8Hg");function u(t){return t&&t.__esModule?t:{default:t}}var d=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.phone="",e.email="",e.captcha="",e.verifyCode="",e.phone_cc="86",e.captchaUrl="",e.countDownText="",e.sender=null,e}var n;return o.__extends(e,t),e.prototype.created=function(){this.vCode&&this.reloadVCode()},e.prototype.beforeDestroy=function(){this.sendCode&&this.sender&&this.sender.clear()},Object.defineProperty(e.prototype,"placeholder",{get:function(){return"phone"===this.type?this.phonePlaceholder||this.tr("placeholder.phone","binding"):"email"===this.type?this.emailPlaceholder||this.tr("placeholder.email","email"):""},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"canSubmit",{get:function(){return!0===this.verifyForm()},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"emitData",{get:function(){return{phone:this.phone,phone_cc:this.phone_cc,email:this.email,captcha:this.captcha,verify_code:this.verifyCode}},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"emitDataTrim",{get:function(){var t={};for(var e in this.emitData)this.emitData.hasOwnProperty(e)&&(this.emitData[e]?t[e]=this.emitData[e].toString().trim():t[e]="");return t},enumerable:!0,configurable:!0}),e.prototype.mounted=function(){var t=this;this.countDownText=this.tr("button.send2","register"),this.$on("count-down",function(e,n){t.countDownText=n}),this.$emit("init",this)},e.prototype.setData=function(t){for(var e in t)t.hasOwnProperty(e)&&(this[e]=t[e])},e.prototype.send=function(){var t=this.verifyForm(!0);if(!0!==t)return this.$toast.show(t),!1;var e={type:this.sendCode};"phone"===this.type&&(e.phone=this.phone,e.phone_cc=this.phone_cc),"email"===this.type&&(e.email=this.email),null===this.sender?(this.sender=new r.default(this,this.type,e,this.sendRequestOptions),this.$emit("send-init",this.sender)):this.sender.changeParams(e),this.verifyCode="",this.sender.send()},e.prototype.sendSuccess=function(){this.verifyCode="",this.$emit("send-success",this)},e.prototype.sendFailure=function(){this.verifyCode="",this.$emit("send-failure",this)},e.prototype.verifyForm=function(t){var e=this.$tr.page.register.tips;if("phone"===this.type){if(this.phone||(this.phone=""),""===this.phone.trim())return e.phoneEmpty;if("86"===this.phone_cc){if(!/^1\d{10}$/.test(this.phone))return e.phoneError}else if(!/^\d{6,18}$/.test(this.phone))return e.phoneError}if("email"===this.type){if(""===this.email.trim())return this.placeholder;if(!s.default.email.test(this.email))return this.tr("tips.emailError","login")}if(!t){if(this.vCode&&""===this.captcha.trim())return this.tr("tips.captchaEmpty","login");if(this.sendCode){if(""===this.verifyCode.trim())return this.tr("placeholder.vcode","binding");if(!s.default.verifyCode.test(this.verifyCode))return this.tr("tips.vcodeError","binding")}}return!0},e.prototype.submit=function(){var t=this.verifyForm();this.$emit("submit-all-click",this.emitData),!0!==t&&this.$toast.show(t),this.canSubmit&&this.$emit("submit",this.emitData)},e.prototype.changeGR=function(t){t&&(this.phone_cc=t)},e.prototype.watchInput=function(){this.$emit("input",this.emitDataTrim)},e.prototype.reloadVCode=function(){var t=this.$http.clientInfo,e=this.$http.getRequestUrl({url:this.$api.$paths.captchaShow});this.captcha="",this.captchaUrl=e+"?t="+(new Date).getTime()+"&unlogin_token="+t.unlogin_token+"&client_id="+t.client_id+"&zip_version="+(t.zip_version||t.web_version)},o.__decorate([(0,i.Prop)([String]),o.__metadata("design:type",String)],e.prototype,"type",void 0),o.__decorate([(0,i.Prop)([Boolean]),o.__metadata("design:type",Boolean)],e.prototype,"vCode",void 0),o.__decorate([(0,i.Prop)([String]),o.__metadata("design:type",String)],e.prototype,"sendCode",void 0),o.__decorate([(0,i.Prop)([String,Number]),o.__metadata("design:type",Object)],e.prototype,"areaCode",void 0),o.__decorate([(0,i.Prop)([String]),o.__metadata("design:type",String)],e.prototype,"buttonText",void 0),o.__decorate([(0,i.Prop)([String]),o.__metadata("design:type",String)],e.prototype,"phonePlaceholder",void 0),o.__decorate([(0,i.Prop)([String]),o.__metadata("design:type",String)],e.prototype,"emailPlaceholder",void 0),o.__decorate([(0,i.Prop)({default:function(){}}),o.__metadata("design:type","function"==typeof(n=void 0!==a.HttpOptions&&a.HttpOptions)&&n||Object)],e.prototype,"sendRequestOptions",void 0),o.__decorate([(0,i.Prop)({type:[Boolean],default:!1}),o.__metadata("design:type",Boolean)],e.prototype,"padding",void 0),o.__decorate([(0,i.Prop)({type:[Boolean],default:!0}),o.__metadata("design:type",Boolean)],e.prototype,"showButtonTopTips",void 0),o.__decorate([(0,i.Watch)("areaCode",{immediate:!0}),o.__metadata("design:type",Function),o.__metadata("design:paramtypes",[Object]),o.__metadata("design:returntype",void 0)],e.prototype,"changeGR",null),o.__decorate([(0,i.Watch)("email"),(0,i.Watch)("phone"),(0,i.Watch)("phone_cc"),(0,i.Watch)("captcha"),(0,i.Watch)("verifyCode"),o.__metadata("design:type",Function),o.__metadata("design:paramtypes",[]),o.__metadata("design:returntype",void 0)],e.prototype,"watchInput",null),o.__decorate([(0,i.Component)({components:{InputGroup:c.InputGroup,MtInput:c.MtInput,AreaCode:c.AreaCode,MtButton:p.default}})],e)}(i.Vue);e.default=d},o19o:function(t,e,n){"use strict";e.__esModule=!0;var o=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG")),i=n("YKMj"),r=c(n("lqyy")),a=c(n("jqo8")),s=c(n("BpKI")),p=n("yI22");function c(t){return t&&t.__esModule?t:{default:t}}var u=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.phone="",e.phoneCC="86",e.submitting=!1,e.sendType=p.SEND_TYPE_FOR_BIND_PHONE,e}return o.__extends(e,t),Object.defineProperty(e.prototype,"title",{get:function(){return this.tr("titleOfEnterPhone")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"description",{get:function(){return this.tr("tips.newPhone")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"placeholder",{get:function(){return this.tr("placeholder.newPhone")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"buttonText",{get:function(){var t=this.$tr.text.next;return this.submitting&&(t=this.tr("button.nextSubmitting")),t},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"submitNextPath",{get:function(){return""},enumerable:!0,configurable:!0}),e.prototype.input=function(t){this.phone=t.phone,this.phoneCC=t.phone_cc},e.prototype.submit=function(){var t=this;this._sendVerifyCodeBeforeConfirm(this.phone,this.phoneCC,{buttons:[{type:"primary",text:this.$tr.text.enter,click:function(){t.sendVerifyCode()}},{text:this.$tr.text.cancel}]})},e.prototype.sendVerifyCode=function(){var t=this;this.$toast.showLoading();var e={type:this.sendType,phone:this.phone,phone_cc:this.phoneCC};new s.default(this,"phone",e,{success:function(n){t.$toast.hide(),t.$router.push({name:t.submitNextPath,params:e})},failure:function(e){t.$toast.hide()},error:function(e){t.$toast.hide()}}).send()},o.__decorate([(0,i.Component)({data:function(){return{$trPage:"binding"}},components:{FormVerifyView:a.default},template:'<page class="binding-phone-enter">\n                    <title-bar/>\n                    <page-view padding>\n                        <page-title :title="title" :description="description"/>\n                        <form-verify-view type="phone"\n                                          :phone-placeholder="placeholder"\n                                          :area-code="phoneCC"\n                                          :show-button-top-tips="false"\n                                          :button-text="buttonText"\n                                          @input="input"\n                                          @submit="submit">\n                        </form-verify-view>\n                    </page-view>\n                </page>'})],e)}((0,i.Mixins)(r.default));e.default=u},pBcI:function(t,e,n){"use strict";e.__esModule=!0;var o,i=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG")),r=n("YKMj"),a=(o=n("o19o"))&&o.__esModule?o:{default:o},s=n("lzrX"),p=function(t){function e(){return null!==t&&t.apply(this,arguments)||this}return i.__extends(e,t),Object.defineProperty(e.prototype,"title",{get:function(){return this.tr("titleOfEnterPhone")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"description",{get:function(){return this.tr("tips.newPhone")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"placeholder",{get:function(){return this.tr("placeholder.newPhone")},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"buttonText",{get:function(){var t=this.$tr.text.next;return this.submitting&&(t=this.tr("button.nextSubmitting")),t},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"submitNextPath",{get:function(){return s.ROUTE_CHANGE_PHONE_SUBMIT},enumerable:!0,configurable:!0}),e.prototype.created=function(){this.init()},e.prototype.init=function(){if(!this._temp.verifiedPassword)return this.$router.replace(s.ROUTE_CHANGE_PHONE_CHECK_PASSWORD),!1},i.__decorate([r.Component],e)}(a.default);e.default=p},soVk:function(t,e){},yI22:function(t,e,n){"use strict";e.__esModule=!0,e.SEND_TYPE_FOR_IDCARD_CHECK_PHONE="idcard_check_phone",e.SEND_TYPE_FOR_SAFETY_CHECK_NEW_PHONE="safety_check_new_phone",e.SEND_TYPE_FOR_SAFETY_CHECK_OLD_PHONE="safety_check_old_phone",e.SEND_TYPE_FOR_SAFETY_CHECK_OLD_EMAIL="safety_check_old_email",e.SEND_TYPE_FOR_VERIFY_EMAIL="verify_email",e.SEND_TYPE_FOR_RESET_PASSWORD="reset_password",e.SEND_TYPE_FOR_BIND_PHONE="bind_phone",e.SEND_TYPE_FOR_REGISTER="register",e.SEND_TYPE_FOR_LOGIN="login",e.SEND_TYPE_FOR_LOGIN_PROTECTED="login_protected"}}]);