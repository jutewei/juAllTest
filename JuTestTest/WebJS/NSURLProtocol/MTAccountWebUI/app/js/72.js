(window.webpackJsonp=window.webpackJsonp||[]).push([[72],{"5aFW":function(t,e){},QDxq:function(t,e,n){"use strict";e.__esModule=!0;var r=d(n("EJiy")),a=function(t){if(t&&t.__esModule)return t;var e={};if(null!=t)for(var n in t)Object.prototype.hasOwnProperty.call(t,n)&&(e[n]=t[n]);return e.default=t,e}(n("mrSG"));n("5aFW");var i=n("YKMj"),o=d(n("lqyy")),l=n("lzrX");function d(t){return t&&t.__esModule?t:{default:t}}var s=function(t){function e(){var e=null!==t&&t.apply(this,arguments)||this;return e.identityAuthInfo=[],e.otherIdentityAuthInfo=[],e.fetched=!1,e}return a.__extends(e,t),e.prototype.beforeRouteLeave=function(t,e,n){this.$actionSheet.close(),n()},e.prototype.created=function(){var t=this;this.$toast.showLoading(this.$tr.text.loading),this.$api.safety.identityInfo().then(function(e){var n=e.data.response;if(!n.realname||!n.id_number)return t.$router.replace(l.ROUTE_ACCOUNT),!1;t.identityAuthInfo=[{label:t.tr("label.realName"),type:"name",text:n.realname},{label:t.tr("label.certType"),type:"type",text:t.getCertTypeName(n.idcard_type)},{label:t.tr("label.certNumber"),type:"number",text:n.id_number}],"object"===(0,r.default)(n.other)&&(t.otherIdentityAuthInfo=[{label:t.tr("label.realName"),type:"name",text:n.other.realname},{label:t.tr("label.certType"),type:"type",text:t.getCertTypeName(n.other.idcard_type)},{label:t.tr("label.certNumber"),type:"number",text:n.other.id_number}]),t.fetched=!0,t.$toast.hide()})},Object.defineProperty(e.prototype,"hasOther",{get:function(){return this.otherIdentityAuthInfo.length>0},enumerable:!0,configurable:!0}),e.prototype.getCertTypeName=function(t){"string"==typeof t&&(t=parseInt(t,10));var e="";return 1===t?e=this.tr("text.chinaIdcard"):2===t&&(e=this.tr("text.passport")),e},a.__decorate([(0,i.Component)({name:"page-identity-authenticated",data:function(){return{$trPage:"safety"}},components:{},template:'<page class="safety-identity-authenticated">\n                    <title-bar/>\n                    <page-view>\n                        <page-title :title="tr(\'titleOfIdAuth\')" :description="fetched ? tr(\'text.authedTips1\') : \'......\'"/>\n                        <list :header="hasOther ? identityAuthInfo[1].text : \'\'">\n                            <list-item v-for="id in identityAuthInfo"\n                                       :key="id.label"\n                                       :title="id.label"\n                                       :text="id.text"\n                                       border="bottom">\n                            </list-item>\n                        </list>\n                        <list v-if="hasOther" class="other" :header="otherIdentityAuthInfo[1].text">\n                            <list-item v-for="id in otherIdentityAuthInfo"\n                                       :key="id.label"\n                                       :title="id.label"\n                                       :text="id.text"\n                                       border="bottom">\n                            </list-item>\n                        </list>\n                        <footer v-if="fetched">\n                            <span class="text" v-text="tr(\'text.authedTips2\')"></span>\n                            <span class="link" @click="_contactServiceActionSheet" v-text="$tr.text.contactService"></span>\n                        </footer>\n                    </page-view>\n                </page>'})],e)}((0,i.Mixins)(o.default));e.default=s}}]);