(window.webpackJsonp=window.webpackJsonp||[]).push([[33],{"+CIO":function(t,e,i){"use strict";var n;e.__esModule=!0;var r=/^1\d{10}$/;n=r,e.default={username:/^[a-zA-Z]\w{4,15}$/,password:/^[a-zA-Z][a-zA-Z0-9\.\-\_]{5,15}$/,enName:/^[a-zA-Z]{2,}$/,uppercase:/^[A-Z]+$/,lowercase:/^[a-z]+$/,chinese:/^[\u4e00-\u9fa5]+$/,chineseName:/^[\u4e00-\u9fa5·]+$/,emoji:/\ud83c[\udf00-\udfff]|\ud83d[\udc00-\ude4f]|\ud83d[\ude80-\udeff]/g,email:/^[0-9a-z][_.0-9a-z-]{0,31}@([0-9a-z][0-9a-z-]{0,30}[0-9a-z]\.){1,3}[a-z]{2,4}$/,tel:/^\d{3}-\d{8}|\d{4}-\d{7,8}$/,telExt:/^\d{3}-\d{8}|\d{4}-\d{7,8}-?\d+?$/,mobile:n,mobileI18n:/^\d{6,18}$/,zipCode:/^[1-9]\d{5}$/,qq:/^[1-9]\\d{4,10}$/,domain:/^([a-zA-Z0-9\-]+)\.([a-zA-Z0-9\-]+)\.(com|net|cn|jp|tw|hk|edu|biz|gov|org|info|asia|mobi|co|cc|tt|me|tv|name|de)\.?(cn|hk|tw|jp)?$/,url:/^(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:\/~\+#]*[\w\-\@?^=%&amp;\/~\+#])?$/,ipv4:/^((?:(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d)))\.){3}(?:25[0-5]|2[0-4]\d|((1\d{2})|([1-9]?\d))))$/,idCard:/^\d{17}([0-9]|X)$/,idCard1518:/(^\d{15}$)|(^\d{17}([0-9]|X)$)/,phone:r,passport:/^[a-zA-Z0-9]{5,17}$/,passportName:/^[\s\u4e00-\u9fa5A-Za-z·]+$/,integer:/^\d+$/,verifyCode:/^\d{6}$/,number:function(t){return!isNaN(t)},image:function(t,e){return e.indexOf(t)>=0},notAllowPasswordChars:/^[A-Za-z0-9!@#\$%\^&\*\~\/{}|\(\)\'\\"\?\>\<,\.`+\-=_\[\]:;*\/]+$/g}},"/Kdw":function(t,e,i){"use strict";var n=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("page",{staticClass:"age-13"},[i("title-bar"),t._v(" "),t.fetched?i("page-view",{attrs:{padding:""}},[i("account-logo",{directives:[{name:"show",rawName:"v-show",value:t.fetched,expression:"fetched"}]}),t._v(" "),i("p",{staticClass:"Tips align-left"},[i("span",{staticClass:"text",domProps:{innerHTML:t._s(t.text)}})]),t._v(" "),t.isStepBirth?i("input-group",[i("input-item",{attrs:{label:t.tr("label.birthday","profile")}},[t.$isApp?i("mt-input",{attrs:{value:t.birthday,"show-arrow-icon":!0,placeholder:t.birthday?"":t.tr("placeholder.select","profile"),maxlength:"10",readonly:""},on:{click:t.selectBirthday}}):t._e()],1)],1):t._e(),t._v(" "),t.isStepEmail?i("input-group",[i("input-item",{attrs:{label:t.tr("texts.email","account")}},[i("mt-input",{attrs:{placeholder:"Enter email address",clear:""},model:{value:t.email,callback:function(e){t.email=e},expression:"email"}})],1)],1):t._e(),t._v(" "),t.isStepFirst||t.isStepBirth?i("mt-button",{class:{disabled:t.sending1||t.isStepBirth&&!t.birthday},attrs:{type:"primary"},domProps:{textContent:t._s(t.buttonText1)},on:{click:t.submitBirthday}}):t._e(),t._v(" "),t.isStepFirst||t.isStepEmail?i("mt-button",{class:{disabled:t.sending2||t.isStepEmail&&!t.email},attrs:{type:t.isStepEmail?"primary":""},domProps:{textContent:t._s(t.buttonText2)},on:{click:t.sendEmail}}):t._e()],1):t._e()],1)},r=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return r})},"2IKy":function(t,e,i){"use strict";i.r(e);var n=i("/Kdw"),r=i("YMAv");for(var o in r)"default"!==o&&function(t){i.d(e,t,function(){return r[t]})}(o);i("3TS7");var a=i("KHd+"),s=Object(a.a)(r.default,n.a,n.b,!1,null,null,null);s.options.__file="age.13.vue",e.default=s.exports},"3TS7":function(t,e,i){"use strict";var n=i("Tgoo");i.n(n).a},C1f3:function(t,e,i){"use strict";e.__esModule=!0;var n=a(i("oCYn")),r=a(i("PzH0")),o=i("k/HC");function a(t){return t&&t.__esModule?t:{default:t}}var s=n.default.extend({name:"mt-account-logo",props:{classes:{type:Object,default:function(){return{}}}},components:{Icon:r.default},template:'\n        <header class="header-logo" :class="classes">\n            <icon name="logo" :class="classes"></icon>\n        </header>\n    '});e.default={name:"account-logo",data:function(){return{}},props:{hr:{type:Boolean,default:!0}},components:{MtAccountLogo:s},computed:{theme:function(){return""},appConfig:function(){return{}},isNonChinese:function(){return(0,o.nonChinese)()},inApp:function(){return window.inAppWebView},isMeipai:function(){return this.inApp&&"meipai"===this.theme},isOAuth:function(){var t=!1;return this.isEnableAutoOAuth&&(t=!1),t},isEnableAutoOAuth:function(){return!1},oauthQueries:function(){return{}},oauthClientName:function(){return decodeURIComponent(this.oauthQueries.oauth_client_name)},oauthClientIcon:function(){return decodeURIComponent(this.oauthQueries.oauth_client_icon)},classes:function(){return{hr:!this.isOAuth&&this.hr,en:this.isNonChinese,"no-logo-text":this.isOAuth,"zh-hant":"zh-hant"===this.$tr.name,"zh-hant-hk":"zh-hant-hk"===this.$tr.name,white:this.isMeipai}}}}},KMbQ:function(t,e,i){"use strict";var n=i("knf7");i.n(n).a},Tgoo:function(t,e){},UYOh:function(t,e,i){"use strict";e.__esModule=!0;var n=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var i in t)Object.prototype.hasOwnProperty.call(t,i)&&(e[i]=t[i]);return e.default=t,e}(i("mrSG")),r=i("YKMj"),o=m(i("+CIO")),a=m(i("lqyy")),s=m(i("ZXPt")),u=m(i("J+9/")),c=m(i("3Z+A")),h=m(i("4+wJ")),d=m(i("Tl4t")),p=m(i("ca/V")),l=i("kWpp"),f=i("uOKE");function m(t){return t&&t.__esModule?t:{default:t}}var b=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.fetched=!0,e.step="step-first",e.email="",e.birthday="",e.queryObj={},e.sending1=!1,e.sending2=!1,e.text1="For you to continue to use {name}, we need to verify your age.  Please choose your age below.",e.text2="Please confirm your age by entering your date of birth below.",e.text3="Your date of birth information has been updated. Please continue enjoying {name}.",e.text4="You do not meet the age requirement for an account on {name}. To continue using your account, your parent or guardian must sign the parental consent form and email it to legal@meitu.com within 10 days after your read this message. Please enter your parent's or guardian's email address below.",e.text5="Thank you!<br/><br/>Please make sure your parent or guardian send back an executed parental consent form within 10 days. If we do not receive the form within 10 days, we have to delete your account in order to best protect your privacy.",e.text6="Your age information has been verified.",e}return n.__extends(e,t),Object.defineProperty(e.prototype,"isStepFirst",{get:function(){return/^\/age-13$/.test(this.$route.path.split("?")[0])&&!this.$route.query.step},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isVerified",{get:function(){return this.$route.query&&"verified"===this.$route.query.step},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isStepBirth",{get:function(){return this.$route.query&&"birth"===this.$route.query.step},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isStepBirthUpdated",{get:function(){return this.$route.query&&"birth_updated"===this.$route.query.step},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isStepEmail",{get:function(){return this.$route.query&&"email"===this.$route.query.step},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"isStepEmailSent",{get:function(){return this.$route.query&&"email_sent"===this.$route.query.step},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"getConfirmAgeInfoApi",{get:function(){var t=this.$apiPaths.getConfirmAgeInfo.replace("/api","");return this.queryObj.token,t},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"submitApiUrl",{get:function(){var t=this.$apiPaths.submitConfirmAgeInfo.replace("/api","");return this.queryObj.token,t},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"text",{get:function(){var t="";return this.isStepFirst?t=this.text1:this.isVerified?t=this.text6:this.isStepBirth?t=this.text2:this.isStepBirthUpdated?t=this.text3:this.isStepEmail?t=this.text4:this.isStepEmailSent&&(t=this.text5),t.replace("{name}",this.queryObj.app_name)},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"buttonText1",{get:function(){return this.isStepBirth?this.sending1?this.tr("button.sending","binding"):this.$tr.text.next:"≥ 13"},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"buttonText2",{get:function(){return this.isStepEmail?this.sending2?this.tr("button.sending","binding"):"Send":"< 13"},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"maxBirthday",{get:function(){var t=new Date;return t.getFullYear()-13+"-"+(t.getMonth()+1+100).toString().substring(1)+"-"+(t.getDate()+100).toString().substring(1)},enumerable:!0,configurable:!0}),e.prototype.created=function(){this.$setTitle("Age Verification"),this.checkSubmitStatus()},e.prototype.checkSubmitStatus=function(){var t=this;if(this.isVerified&&(this.fetched=!0),this.isStepFirst)this.requestConfirmInfo();else{if(void 0===this.getTempData.age13)return this.$router.replace("/"),!1;this.getTempData.isClientDispatch&&(this.isStepBirthUpdated||this.isStepEmailSent)&&(this.sendVerifiedNotice(),this.$setAppBackingHandler(function(){t.$accountCommand("BackingStop"),t.sendVerifiedBackNotice(),t.setTempData({isClientDispatch:!1,clientDispatchAction:""}),t.$removeAppBackingHandler(),t.$accountCommand("Backing")})),this.queryObj=this.getTempData.age13,this.fetched=!0}},e.prototype.sendVerifiedNotice=function(){this.$accountCommand("Notice",{code:f.NOTICE_CLIENT_VERIFIED})},e.prototype.sendVerifiedBackNotice=function(){this.$accountCommand("Notice",{code:f.NOTICE_CLIENT_VERIFIED_BACK})},e.prototype.requestConfirmInfo=function(){var t=this;if(this.fetched=!1,this.email="",this.birthday="",this.queryObj=this.$route.query,this.$toast.showLoading(),!this.queryObj.token&&this.$isWeb)return this.$router.replace("/"),!1;if(this.$isApp&&!this._isLogin())return this.$router.replace("/"),!1;if(void 0===this.queryObj.app_name){var e=this._getAppClientConfigs();this.queryObj.app_name=e.en_name}this.setTempData({age13:this.queryObj});var i={confirm_age_token:this.queryObj.token||""};this.$http.post(this.getConfirmAgeInfoApi,i).then(function(e){t.$toast.hide();var i=e.data.response.is_submit;if(t.fetched=!0,1===i)return t.$router.replace({query:{step:"verified"}}),!1}).catch(function(e){if(t.$toast.hide(),e.failure){var i=e.data.meta,n=i.code;t.$toast.show(i.msg,function(){40501===n&&t.getTempData.isClientDispatch&&t.sendVerifiedBackNotice()})}else e.offline?t.$toast.show(t.$tr.text.networkDisconnected):t.$toast.show(t.$tr.text.submitError)})},e.prototype.selectBirthday=function(){var t=this;this._selectDate(this.birthday,function(e){t.birthday=e.data.date})},e.prototype.submitBirthday=function(){if(this.isStepFirst)return this.$router.push({query:{step:"birth"}}),!1;this.isStepBirth&&this.requestSubmitBirthday()},e.prototype.requestSubmitBirthday=function(){var t=this;if(this.sending1)return!1;var e=new Date(this.birthday).getTime(),i=new Date(this.maxBirthday).getTime();if(!this.birthday)return this.$toast.show("Please select your birthday"),!1;if(e>i)return this.$toast.show("You have to be older than 13."),!1;var n={confirm_age_token:this.queryObj.token,app_id:this.queryObj.app_id,age_status:2,birthday:this.birthday};this.sending1=!0,this.$http.post(this.submitApiUrl,n).then(function(){t.sending1=!1,t.$router.replace({query:{step:"birth_updated"}})}).catch(function(e){if(t.sending1=!1,e.failure){var i=e.data.meta;if(i.code===l.ERROR_INFORMATION_BEEN_VERIFIED)return t.$router.replace({query:{step:"verified"}}),!1;t.$toast.show(i.msg)}else e.offline?t.$toast.show(t.$tr.text.networkDisconnected):t.$toast.show(t.$tr.text.submitError)})},e.prototype.sendEmail=function(){var t=this;if(this.isStepFirst)return this.$router.push({query:{step:"email"}}),!1;var e=this.$tr.text,i=this.email.trim();if(!o.default.email.test(i))return this.$toast.show(this.tr("tips.emailError","login")),!1;this.$dialog.confirm({title:"Confirm email address",content:"The parental consent form will be sent to the following email address : "+i,buttons:[{type:"enter",text:"Confirm",click:function(e){t.submitSendEmail(),e.close()}},{type:"cancel",text:e.cancel,click:function(t){t.close()}}]})},e.prototype.submitSendEmail=function(){var t=this,e={confirm_age_token:this.queryObj.token,app_id:this.queryObj.app_id,age_status:1,parent_email:this.email.trim()};this.sending2=!0,this.$http.post(this.submitApiUrl,e).then(function(){t.sending2=!1,t.email="",t.$router.replace({query:{step:"email_sent"}})}).catch(function(e){if(t.sending2=!1,e.failure){var i=e.data.meta;if(i.code===l.ERROR_INFORMATION_BEEN_VERIFIED)return t.$router.replace({query:{step:"verified"}}),!1;t.$toast.show(i.msg)}else e.offline?t.$toast.show(t.$tr.text.networkDisconnected):t.$toast.show(t.$tr.text.submitError)})},n.__decorate([(0,r.Component)({components:{MtInput:c.default,MtButton:u.default,InputItem:h.default,InputGroup:d.default,AccountLogo:p.default},data:function(){return{$tr:s.default,$trPage:"profile"}}})],e)}((0,r.Mixins)(a.default));e.default=b},YMAv:function(t,e,i){"use strict";i.r(e);var n=i("UYOh"),r=i.n(n);for(var o in n)"default"!==o&&function(t){i.d(e,t,function(){return n[t]})}(o);e.default=r.a},"ca/V":function(t,e,i){"use strict";i.r(e);var n=i("udOV"),r=i("iZTA");for(var o in r)"default"!==o&&function(t){i.d(e,t,function(){return r[t]})}(o);i("KMbQ");var a=i("KHd+"),s=Object(a.a)(r.default,n.a,n.b,!1,null,null,null);s.options.__file="account.logo.vue",e.default=s.exports},iZTA:function(t,e,i){"use strict";i.r(e);var n=i("C1f3"),r=i.n(n);for(var o in n)"default"!==o&&function(t){i.d(e,t,function(){return n[t]})}(o);e.default=r.a},knf7:function(t,e){},udOV:function(t,e,i){"use strict";var n=function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"Component account-logo"},[this.isOAuth?this._e():e("mt-account-logo",{attrs:{classes:this.classes}})],1)},r=[];i.d(e,"a",function(){return n}),i.d(e,"b",function(){return r})}}]);