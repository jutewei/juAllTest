(window.webpackJsonp=window.webpackJsonp||[]).push([[71],{"+Qll":function(e,t,i){"use strict";t.__esModule=!0;var n=function(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var i in e)Object.prototype.hasOwnProperty.call(e,i)&&(t[i]=e[i]);return t.default=e,t}(i("mrSG")),o=_(i("MgzW")),r=i("YKMj"),a=i("Q+em"),s=_(i("lqyy")),c=_(i("/XIY")),u=_(i("b64o")),p=_(i("Umpy")),l=i("lzrX"),h=i("AFph"),d=i("uOKE"),f=i("I8AB");function _(e){return e&&e.__esModule?e:{default:e}}var A=function(e){function t(){return null!==e&&e.apply(this,arguments)||this}return n.__extends(t,e),t.prototype.beforeRouteEnter=function(e,t,i){i(function(e){e.clientDispatchRouter()})},t.prototype.beforeRouteUpdate=function(e,t,i){i(),this.clientDispatchRouter()},t.prototype.beforeRouteLeave=function(e,t,i){this.$toast.hide(),i()},Object.defineProperty(t.prototype,"queries",{get:function(){return this.$route.query||{}},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"action",{get:function(){return this.queries.action||""},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"routeTargetInfo",{get:function(){var e=0,t="";switch(this.queries.action){case p.default.verify:t=l.ROUTE_SAFETY_APPEAL,e=parseInt(this.queries.op_type,10);break;case p.default.login:t=l.ROUTE_INDEX;break;case p.default.account:t=l.ROUTE_ACCOUNT;break;case p.default.loginProtectVerify:t=l.ROUTE_LOGIN_PROTECT_SELECT_PHONE;break;case p.default.bindPhone:t=l.ROUTE_ACCOUNT_BINDING_PHONE,e=h.SAFETY_OP_TYPE_PHONE_BINDING;break;case p.default.changePhone:t=l.ROUTE_CHANGE_PHONE_START,e=h.SAFETY_OP_TYPE_PHONE_CHANGE;break;case p.default.forget:case p.default.forgetAutoLogin:t=l.ROUTE_FORGET;break;case p.default.setPassword:t=l.ROUTE_LOGIN_SET_PASSWORD;break;case p.default.modifyPassword:t=l.ROUTE_PASSWORD_VERIFY_MODIFY,e=h.SAFETY_OP_TYPE_PASSWORD_MODIFY;break;case p.default.verifyEmail:t=l.ROUTE_ACCOUNT_EMAIL_VERIFY_START;break;case p.default.profile:var i=parseInt(this.queries.profile_type,10);t=1===i?l.ROUTE_REGISTER_PROFILE:2===i?l.ROUTE_LOGIN_PROFILE:3===i?l.ROUTE_BINDING_PROFILE:l.ROUTE_PROFILE;break;case"id_auth":t="";break;case p.default.identityAuth:t=l.ROUTE_SAFETY_IDENTITY_AUTH,e=h.SAFETY_OP_TYPE_IDENTITY_AUTH;break;case p.default.identityAuthenticated:t=l.ROUTE_SAFETY_IDENTITY_AUTHENTICATED,e=h.SAFETY_OP_TYPE_IDENTITY_AUTH;break;case p.default.identityAuthApplying:t=l.ROUTE_SAFETY_ID_AUTH_APPLYING,e=h.SAFETY_OP_TYPE_IDENTITY_AUTH;break;case p.default.thirdPartyBind:t="/third_party/bind",e=h.SAFETY_OP_TYPE_THIRD_PARTY_BINDING;break;case p.default.age13:t=l.ROUTE_AGE_13;break;case p.default.accountAppeal:t=l.ROUTE_SAFETY_APPEAL_START,e=h.SAFETY_OP_TYPE_FORGET;break;case p.default.accountCancellation:t=l.ROUTE_CANCELLATION;break;case p.default.serviceAgreement:t=l.ROUTE_SERVICE_AGREEMENT}return{path:t,opType:e}},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isVerifyAction",{get:function(){return this.action===p.default.verify},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isThirdPartyBindAction",{get:function(){return this.action===p.default.thirdPartyBind},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isBindPhoneAction",{get:function(){return this.action===p.default.bindPhone},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isChangePhoneAction",{get:function(){return this.action===p.default.changePhone},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isVerifyEmailAction",{get:function(){return this.action===p.default.verifyEmail},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isProfileAction",{get:function(){return this.action===p.default.profile},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isLoginAction",{get:function(){return this.action===p.default.login},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isForgetAction",{get:function(){return this.action===p.default.forget},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isForgetAutoLoginAction",{get:function(){return this.action===p.default.forgetAutoLogin},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isSetPasswordAction",{get:function(){return this.action===p.default.setPassword},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isServiceAgreementAction",{get:function(){return this.action===p.default.serviceAgreement},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isAge13Action",{get:function(){return this.action===p.default.age13},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isLoginProtectVerifyAction",{get:function(){return this.action===p.default.loginProtectVerify},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isAccountAction",{get:function(){return this.action===p.default.account},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isAccountAppealAction",{get:function(){return this.action===p.default.accountAppeal},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isAccountCancellation",{get:function(){return this.action===p.default.accountCancellation},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isIdentityAuthAction",{get:function(){return this.action===p.default.identityAuth},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isIdentityAuthenticatedAction",{get:function(){return this.action===p.default.identityAuthenticated},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"isIdentityAuthApplyingAction",{get:function(){return this.action===p.default.identityAuthApplying},enumerable:!0,configurable:!0}),Object.defineProperty(t.prototype,"identityAuthOptions",{get:function(){var e={},t=this.queries;if(this.isIdentityAuthAction)try{var i=h.SAFETY_IDENTITY_AUTH_TYPE_REAL_PERSON;t.auth_type===h.SAFETY_IDENTITY_AUTH_TYPE_REAL_NAME&&(i=h.SAFETY_IDENTITY_AUTH_TYPE_REAL_NAME),e={auth_type:i,identity_type:t.identity_type,need_live_check:parseInt(t.need_live_check,10),need_identity_pic:parseInt(t.need_identity_pic,10),need_handheld_pic:parseInt(t.need_handheld_pic,10)}}catch(t){e={}}return e},enumerable:!0,configurable:!0}),t.prototype.clientDispatchRouter=function(){var e=this,t=this.queries;if(this.$toast.showLoading(this.$tr.text.loading),void 0===t.action||!t.action)return this.errorToast("无效的操作请求，无法获取 action 参数"),!1;var i=this.routeTargetInfo.opType,n=this.routeTargetInfo.path,o=this.action;if(!n)return this.errorToast("未知路径，无效的操作请求"),"id_auth"===o&&this.errorToast("SDK v2.9 及以上版本已重构了身份认证流程，请更新为新的调用方式，即 action=identity_auth"),!1;if((this.isBindPhoneAction||this.isChangePhoneAction)&&this._isAbroad&&!this._getAppClientConfigs("abroad_enable_phone"))return this.errorToast("当前应用未开启手机登录与注册，不能进行手机绑定"),!1;if(this.isVerifyEmailAction&&!this._enableEmail)return this.errorToast("当前应用未开启邮箱登录与注册，不能进行邮箱验证"),!1;if(this.isProfileAction&&!this._useSDKProfileMode)return this.errorToast("当前应用不是统一资料模式，不能打开个人资料页"),!1;if(void 0!==t.phone_cc&&this._setGlobalRoaming(t.phone_cc),this.setTempData({isClientDispatch:!0,clientDispatchAction:o,clientDispatchQueryStrings:t}),this.isServiceAgreementAction)return"1"===t.hideBusiness?this.$router.replace(n+"?hideBusiness=1"):this.$router.replace(n),!1;if(this.isLoginAction||this.isForgetAction||this.isForgetAutoLoginAction||this.isSetPasswordAction){if(void 0!==t.phone?this.setTempData({phoneFromLogin:t.phone}):void 0!==t.email&&this.setTempData({emailFromLogin:t.email}),!(0,a.isLogin)()||"set_password"===o){if(this.isForgetAction||this.isForgetAutoLoginAction||"set_password"===o){var r={};for(var s in t)t.hasOwnProperty(s)&&t[s]&&"action"!==s&&(r[s]=t[s]);this.$router.replace({path:n,query:r})}else this.$router.replace(n);return!1}(this.isForgetAction||this.isForgetAutoLoginAction)&&(i=h.SAFETY_OP_TYPE_PASSWORD_MODIFY,n=l.ROUTE_SAFETY_APPEAL)}else{if(this.isChangePhoneAction||this.isBindPhoneAction)return!!this.checkLogin()&&(this.isBindPhoneAction&&(t.allow_switch||(t.allow_switch="0"),t.allow_assoc||(t.allow_assoc="0")),this.setTempData({phone:t.phone||""}),this.$router.replace(n),!1);if(this.isVerifyEmailAction)this.setTempData({accountEmail:t.email||""});else if(this.isThirdPartyBindAction){if(void 0===t.platform||!t.platform)return this.errorToast("platform=？未知的第三方帐号平台"),!1;if(!this.checkLogin())return!1;n="/third_party/bind/"+t.platform,this.setThirdPartyBinding({type:1,name:t.platform})}else if(this.isVerifyAction)return this.$setTitle(this.tr("title2","safety")),i?(this.$toast.hide(),this.setSafetyActionCode(i),u.default.show({content:t.message},0,"1"===t.ignore,function(){e.setTempData({isSafetyDispatch:!0}),e._appNoticeCommand(d.NOTICE_SAFETY_VERIFY_ENTER)},function(){e._appNoticeCommand(d.NOTICE_SAFETY_VERIFY_IGNORE),e.setTempData({isSafetyDispatch:!1})}),!1):(this.errorToast("op_type=？未知的安全验证操作类型"),!1)}if(this.isVerifyEmailAction||this.isProfileAction||this.isAge13Action){if(this.isVerifyEmailAction&&!this.checkLogin())return!1;var c=parseInt(this.queries.profile_type,10);return!(this.isProfileAction&&1!==c&&2!==c&&3!==c&&!this.checkLogin()||(this.$router.replace(n),1))}return this.isLoginProtectVerifyAction?(this.setTempData({loginProtectedAuth:!0}),void 0!==t.sid&&t.sid&&(this.setTempData({loginProtectedSid:t.sid}),this.$store.commit(f.SET_SESSION_ID,t.sid)),void 0!==t.email&&t.email&&this.setTempData({loginEmail:t.email}),void 0!==t.platform&&t.platform&&this.setTempData({loginProtectedPlatform:t.platform}),this.$router.replace(n),!1):this.isAccountAppealAction?(this.accountAppealAction(n,t),!1):!!this.checkLogin()&&(this.isAccountCancellation||this.isAccountAction?(this.$router.replace(n),!1):(this.setSafetyActionCode(i),this.setTempData({isSafetyDispatch:!0}),this.isIdentityAuthAction?(this._safetyIdentityAuthStart(this.identityAuthOptions),!1):this.isIdentityAuthenticatedAction||this.isIdentityAuthApplyingAction?(this.$router.replace(n),!1):void this._safetyRequestCheckCredibilityDevice().then(function(){e.setTempData({dispatchClientIsCredibilityDevice:!0}),e.$router.replace(n)}).catch(function(i){i.failure?(e.setTempData({dispatchClientIsCredibilityDevice:!1}),e._needSafetyVerifyNotice({action:o}),e.isThirdPartyBindAction&&e._needShowWebViewCommand()):e.isThirdPartyBindAction&&e._thirdPartyBindFailedNotice(t.platform,{errorCode:0,message:e.$tr.text.submitError})})))},t.prototype.checkLogin=function(){var e=this;return!!(0,a.isLogin)()||(this._needShowWebViewCommand(),this.setTempData({isClientDispatch:!1}),this.$toast.show(this.$tr.text.pleaseLoginFirst),setTimeout(function(){e.$router.replace("/")},2500),!1)},t.prototype.errorToast=function(e,t,i){void 0===t&&(t="/"),void 0===i&&(i=2e3),this.$toast.show(e)},t.prototype.accountAppealAction=function(e,t){var i=this;void 0===t&&(t={});var n={op_type:h.SAFETY_OP_TYPE_FORGET};"1"===(t=(0,o.default)({phone:"",phone_cc:"",email:"",appeal_by:"1",appeal_scene:"2"},t)).appeal_scene?(this.getTempData.loginProtectedSid&&(n.sid=this.getTempData.loginProtectedSid),n.op_type=1):"13"===t.appeal_scene&&(n.op_type=h.SAFETY_OP_TYPE_ACCOUNT_STATUS_ABNORMAL_APPEAL),void 0!==t.sid&&t.sid&&(n.sid=t.sid),"2"===t.appeal_by?n.email=t.email:(n.phone=t.phone,n.phone_cc=t.phone_cc),this.setSafetyActionCode(0),this._safetyAppealInfoRequest(n).then(function(n){i.setTempData({safetyMessageAppeal:n}),i.$router.replace(i.getAccountAppealUrl(e,t))}).catch(function(e){e.failure&&i.$toast.show(e.data.meta.msg)})},t.prototype.getAccountAppealUrl=function(e,t){void 0===t&&(t={});var i=[];return"2"===t.appeal_by&&i.push("email=1"),"1"===t.appeal_scene?i.push("login_protect=1"):"13"===t.appeal_scene&&i.push("account_status_abnormal=1"),e+(i.length>0?"?"+i.join("&"):"")},n.__decorate([(0,r.Component)({name:"page-client-dispatch",template:'<page class="client-dispatch"><title-bar/></page>'})],t)}((0,r.Mixins)(s.default,c.default));t.default=A},Umpy:function(e,t,i){"use strict";t.__esModule=!0;var n=function(){function e(){}return e.verify="verify",e.login="login",e.account="account",e.loginProtectVerify="login_protect_verify",e.profile="profile",e.bindPhone="bind_phone",e.changePhone="change_phone",e.changePhoneQueryRequired=["phone","phone_cc"],e.forget="forget",e.forgetAutoLogin="forget_auto_login",e.setPassword="set_password",e.modifyPassword="modify_password",e.verifyEmail="verify_email",e.verifyEmailQueryRequired=["email"],e.identityAuth="identity_auth",e.identityAuthQueryRequired=["auth_type","identity_type","need_live_check","need_identity_pic","need_handheld_pic"],e.identityAuthenticated="id_authed",e.identityAuthApplying="id_auth_applying",e.thirdPartyBind="third_party_bind",e.thirdPartyBindQueryRequired=["platform"],e.age13="age_13",e.accountAppeal="account_appeal",e.accountCancellation="cancellation",e.serviceAgreement="service_agreement",e}();t.default=n}}]);