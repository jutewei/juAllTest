(window.webpackJsonp=window.webpackJsonp||[]).push([[77],{"yb+F":function(t,e,i){"use strict";e.__esModule=!0;var o,n=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var i in t)Object.prototype.hasOwnProperty.call(t,i)&&(e[i]=t[i]);return e.default=t,e}(i("mrSG")),s=i("Q+em"),r=i("YKMj"),a=(o=i("gy6z"))&&o.__esModule?o:{default:o},c=i("yI22"),p=i("lzrX"),u=i("KEQF"),h=i("kWpp"),l=function(t){function e(){return null!==t&&t.apply(this,arguments)||this}return n.__extends(e,t),Object.defineProperty(e.prototype,"phone",{get:function(){return this._temp.phoneFromLogin},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"phone_cc",{get:function(){return this._temp.phone_cc},enumerable:!0,configurable:!0}),Object.defineProperty(e.prototype,"sendViewInitParams",{get:function(){return{type:c.SEND_TYPE_FOR_LOGIN_PROTECTED}},enumerable:!0,configurable:!0}),e.prototype.start=function(){if(!this.phone)return this.$router.back(),!1;this.send()},e.prototype.otherWay=function(){this._safetyAccountAppealRequest({op_type:1,login_protect:!0,sid:this._temp.loginProtectedSid},!0)},e.prototype.submit=function(t){var e=this;if(this.submitting)return!1;this.code=t,this.submitting=!0;var i={phone:this.phone,verify_code:t,phone_cc:this.phone_cc};this.$toast.showLoading(),this.$api.safety.verifyLoginProtected(i).then(function(t){e.$toast.success("验证成功！",function(){e.onSubmitSuccess(t)})}).catch(function(t){if(e.submitting=!1,t.failure){var i=t.data.meta,o=i.code;if(o===h.ERROR_VERIFY_CODE_LIMITED)e.view.sender.clear();else if(o===h.ERROR_LOGIN_PROTECTED_VERIFY_ABNORMAL)return e.$toast.hide(),e.$dialog.alert({content:i.msg,buttons:[{type:"primary",text:e.tr("button.backToLogin","password"),click:function(){e.backToHomePage()}}]}),!1;e.$toast.show(i.msg)}else e.$toast.show(e.$tr.text.submitError)})},e.prototype.onSubmitSuccess=function(t){var e="",i=t.data.response;if(this.$store.state.isThirdPartyLoginCallback?e=this._loginCallbackResponse.platform:this._temp.loginProtectedPlatform?e=this._temp.loginProtectedPlatform:this._temp.loginEmail&&(e="email",this.setTempData({loginEmail:""})),this.$toast.hide(),this.submitting=!1,this._isRequireFillProfile(i))return this.setTempData({registerResponse:i}),this.$router.replace(p.ROUTE_LOGIN_PROFILE),!1;this._temp.isClientDispatch&&this.setTempData({isClientDispatch:!1,clientDispatchAction:"",clientDispatchQueryStrings:{}}),this._temp.loginProtectedAuth&&this.setTempData({loginProtectedSid:"",loginProtectedAuth:""}),(0,u.commandLoginConnect)(n.__assign({},i,{platform:e}),1)},e.prototype.backToHomePage=function(){(0,s.openLoginPage)()},n.__decorate([r.Component],e)}(a.default);e.default=l}}]);