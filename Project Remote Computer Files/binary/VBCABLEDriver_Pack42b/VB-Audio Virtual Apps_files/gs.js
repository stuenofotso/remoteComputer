/*! Gstat marker v10.4.0 */
var GSTAT_VERSION="10.4.0",BLUEKAI_SRC="://tags.bkrtx.com/js/bk-coretag.js",BLUEKAI_SITE_ID=23302,_gsrc_smo=[];function smo(a,b){this.code=a;this.regex=b}_gsrc_smo[0]=new smo("FBO","^.*\\.facebook\\.com");_gsrc_smo[1]=new smo("TWI","^(t\\.co|twitter\\.com)");_gsrc_smo[2]=new smo("GPL","^(plus.*)\\.google\\.com");_gsrc_smo[3]=new smo("DAI","^.*\\.dailymotion\\.com");_gsrc_smo[4]=new smo("PIN","^.*pinterest\\.com");_gsrc_smo[5]=new smo("LIN","^.*\\.linkedin\\.com");_gsrc_smo[6]=new smo("FLK","^.*\\.flickr\\.(com|fr)");
_gsrc_smo[7]=new smo("VIA","^.*\\.viadeo\\.com");_gsrc_smo[8]=new smo("MYS","^.*\\.myspace\\.com");_gsrc_smo[9]=new smo("YOU","^.*\\.youtube\\.com");_gsrc_smo[10]=new smo("TUM","^.*\\.tumblr\\.com");_gsrc_smo[11]=new smo("FOU","^.*\\.foursquare\\.com");var _gsrc_seo=[];function seo(a,b,c,e){this.code=a;this.regex=b;this.param=c;this.paramLien=e}
_gsrc_seo[0]=new seo("LMT","(.*\\.ke\\.voila.fr)|(www\\.lemoteur\\.fr)|(lemoteur\\.fr)|(lemoteur\\.orange\\.fr)|(presse\\.lemoteur\\.fr)|(moteur\\.voila\\.fr/S/(orange|wanadoo|voila))","rdata=|kw=|qw=","");_gsrc_seo[1]=new seo("ASS","^assistance\\.orange\\.fr/recherche\\.php","kw=","");_gsrc_seo[2]=new seo("GOO","^(images\\.|news\\.|blogsearch\\.|directory\\.|www\\.|ww\\.|w\\.)?google\\.","q=|search=","goo");_gsrc_seo[3]=new seo("BIN","^www\\.bing\\.com","q=","bin");
_gsrc_seo[4]=new seo("YAH","(search|search\\.tw|search\\.espanol)\\.yahoo\\.com","p=","yah");_gsrc_seo[5]=new seo("ASK","^(fr|es|de|it|nl|uk|web)\\.ask\\.com","q=|ask=","");_gsrc_seo[6]=new seo("AOL","^(aolbusqueda|aolsearch|aolsearcht|recherche|search|suche|www\\.recherche)\\.aol\\.(ca|com|fr|de|co\\.uk|com\\.mx)","q=|query=","aol");_gsrc_seo[7]=new seo("ALT","^((...|..)\\.altavista\\.com)","q=","");
_gsrc_seo[8]=new seo("MWS","^(kf\\.mysearch|ki\\.mysearch|ms114|ms146|search|mysearch|searchfr|www)\\.(myway|mysearch|mywebsearch)\\.com","searchfor=","");_gsrc_seo[9]=new seo("EXA","^(partner|www)\\.exalead\\.(com|fr|es)","q=","");_gsrc_seo[10]=new seo("BAI","^(www|www1)\\.baidu\\.com","wd=|word=","");
for(var END_OF_INPUT=-1,base64Chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".split(""),reverseBase64Chars=[],i=0;i<base64Chars.length;i++)reverseBase64Chars[base64Chars[i]]=i;var base64Str,base64Count;function setBase64Str(a){base64Str=a;base64Count=0}function readBase64(){if(!base64Str||base64Count>=base64Str.length)return END_OF_INPUT;var a=base64Str.charCodeAt(base64Count)&255;base64Count++;return a}
function encodeBase64(a){setBase64Str(a);a="";for(var b=[3],c=0,e=!1;!e&&(b[0]=readBase64())!=END_OF_INPUT;)b[1]=readBase64(),b[2]=readBase64(),a+=base64Chars[b[0]>>2],b[1]!=END_OF_INPUT?(a+=base64Chars[b[0]<<4&48|b[1]>>4],b[2]!=END_OF_INPUT?(a+=base64Chars[b[1]<<2&60|b[2]>>6],a+=base64Chars[b[2]&63]):(a+=base64Chars[b[1]<<2&60],a+="=",e=!0)):(a+=base64Chars[b[0]<<4&48],a+="=",a+="=",e=!0),c+=4,76<=c&&(a+="\n",c=0);return a}
function loadScript(a,b){var c=document.createElement("script"),e=!1,d;c.type="text/javascript";c.src=a;c.onload=c.onreadystatechange=function(){e||this.readyState&&"complete"!=this.readyState||(e=!0,b())};d=document.getElementsByTagName("script")[0];d.parentNode.insertBefore(c,d)}function callBackBlueKai(){bk_use_multiple_iframes=bk_allow_multiple_calls=!0;bk_doJSTag(BLUEKAI_SITE_ID,10)}
var _gstat={GSTAT_VERSION:"gstatv="+GSTAT_VERSION,GIF_ORIGINAL_WEB2:"w2.gstat.orange.fr/_gstat.gif",GIF_GSTAT_WEB1:"s.gstat.orange.fr/w1/_gstat.gif",GIF_GSTAT_WEB2:"s.gstat.orange.fr/w2/_gstat.gif",GIF_GSTAT_VIDEO:"s.gstat.orange.fr/video/_gstat.gif",SRC_CAMPAIGN_PARAM:"gst_idc",SRC_TYPE_ACC:"ACC",SRC_TYPE_SMO:"SMO",SRC_TYPE_SEO:"SEO",SRC_TYPE_SEM:"SEM",SRC_TYPE_NDE:"NDE",SRC_TYPE_NTY:"NTY",Cookie:{set:function(a,b,c,e,d,g){var k="";void 0!=c&&(k=new Date,k.setTime(k.getTime()+864E5*parseFloat(c)),
k="; expires="+k.toGMTString());document.cookie=a+"="+escape(b||"")+k+(e?"; path="+e:"")+(d?"; domain="+d:"")+(g?"; secure":"")},get:function(a){var b=document.cookie,c=b.indexOf(a+"=");if(!c&&a!=b.substring(0,a.length)||-1>=c)return null;a=c+a.length+1;c=b.indexOf(";",a);-1==c&&(c=b.length);return unescape(b.substring(a,c))},remove:function(a,b,c,e){var d=_gstat.Cookie.get(a);d&&_gstat.Cookie.set(a,"",-730,b,c,e);return d},test:function(){var a,b=_gstat.createUID();"boolean"==typeof navigator.cookieEnabled?
a=navigator.cookieEnabled:(_gstat.Cookie.set("_gstatCookieSupportTest",b),a=_gstat.Cookie.remove("_gstatCookieSupportTest"));a?(_gstat.Cookie.set("_gstatCookieSupportTest",b),a=_gstat.Cookie.get("_gstatCookieSupportTest")==b?-1:1,_gstat.Cookie.remove("_gstatCookieSupportTest")):a=0;return a}},getCookieDomain:function(){var a=document.domain;if(/^([0-9]{1,3}\.){3}[0-9]{1,3}$/.test(a))return a;if(-1!=a.indexOf("."))return a=a.split("."),2<a.length&&(a=a.slice(a.length-2)),"."+a.join(".")},createUID:function(){return Math.floor(2147483647*
Math.random()+1)+"."+(new Date).getTime()},checkUID:function(a){return RegExp("^[0-9]{3,11}\\.[0-9]{11,14}$","g").test(a)},getUID:function(){var a,b=0;a=_gstat.Cookie.test();-1==a?((a=_gstat.Cookie.get("_gstat"))&&""!=a?!1==_gstat.checkUID(a)&&(b=2):b=1,0<b&&(a=_gstat.createUID()),_gstat.Cookie.set("_gstat",a,730,"/",_gstat.getCookieDomain())):b=3;return a+"&ckregen="+b},getProtocol:function(){var a="http";"https"==document.URL.substr(0,5).toLowerCase()&&(a="https");return a},getReferrer:function(a){var b=
"";return b=a&&""!=a?escape(a):""!=document.referrer?escape(document.referrer):"0"},getSrcDetection:function(a,b){var c="",e="",d="",g=c="",k="",f="",h=!1;""==b||void 0==b?(c=document.location.search,""===c&&(c=document.location.hash,c=c.substr(c.indexOf("?")+1))):c=b.substr(b.indexOf("?")+1);if(""!=c&&-1<c.indexOf(_gstat.SRC_CAMPAIGN_PARAM+"="))e=c.indexOf(_gstat.SRC_CAMPAIGN_PARAM+"=")+_gstat.SRC_CAMPAIGN_PARAM.length+1,e=c.substr(e),d=-1<e.indexOf("&")?e.substr(0,e.indexOf("&")):e,e=_gstat.SRC_TYPE_NTY,
h=!0;else if((f=void 0!=a&&a?a:document.referrer)&&""!=f){if(0>f.indexOf("://"))return"";-1<f.indexOf("://")&&(f=f.substr(f.indexOf("://")+3,f.length));g=-1<f.indexOf("?")?f.substring(0,f.indexOf("?")):-1<f.indexOf("#")?f.substring(0,f.indexOf("#")):f;-1<f.indexOf("?")?k=f.substring(f.indexOf("?")+1,f.length):-1<f.indexOf("#")&&(k=f.substring(f.indexOf("#")+1,f.length));if(""!=g){for(f=0;f<_gsrc_smo.length;f++)""!=_gsrc_smo[f].regex&&null!=g.match(_gsrc_smo[f].regex)&&(e=_gstat.SRC_TYPE_SMO,d=_gsrc_smo[f].code,
h=!0);if(!1==h)for(f=0;f<_gsrc_seo.length;f++)if(""!=_gsrc_seo[f].regex&&null!=g.match(_gsrc_seo[f].regex))for(var l=_gsrc_seo[f].param.split("|"),m=0,n=!1;m<l.length&&!1==n;)-1<k.indexOf(l[m])&&(e=-1<c.indexOf("gstso=")&&-1<c.indexOf("gstkw=")&&-1<c.indexOf("esvcid=")?_gstat.SRC_TYPE_SEM:_gstat.SRC_TYPE_SEO,d=_gsrc_seo[f].code,h=n=!0),m++}}else e=_gstat.SRC_TYPE_ACC,d="0",h=!0;!1==h&&(e=_gstat.SRC_TYPE_NDE,d="0");c="&srct="+escape(encodeBase64(e));return c=e==_gstat.SRC_TYPE_NTY?c+("&srcid="+d):
c+("&srcid="+escape(encodeBase64(d)))},amount:!1,setAmount:function(a){isNaN(parseFloat(a.toString()))||"undefined"==typeof a?this.amount=!1:this.amount=a},dummy:function(){return!0},pause:function(a){var b=new Date;for(a=b.getTime()+a;b.getTime()<a;)b=new Date},setImg:function(a,b){var c=new Image(1,1);c.onLoad=function(){_gstat.dummy()};c.src=a;"undefined"!=typeof b&&b&&0<b&&_gstat.pause(b)},web2:function(a,b,c,e,d,g){_gstat.web2_psup(a,b,c,e,d,g,"")},web2_psup:function(a,b,c,e,d,g,k){var f=a.split(":");
a="https"==f[0]||"http"==f[0]?a+"?":_gstat.getProtocol()+"://"+a+"?";a+="uid="+_gstat.getUID();a+="&ty="+(_gstat.Cookie.get("ty")||"0");a+="&svc="+escape(b||"");a+="&ptf="+escape(c||"");a+="&act="+escape(e||"");a+="&ept="+escape(d||"");a+="&"+_gstat.GSTAT_VERSION;a+="&rnd="+Math.floor(1E10*Math.random()+1);k&&(a+="&"+k);_gstat.setImg(a,g)},web1:function(a,b,c,e,d,g){_gstat.web1_uid(a,"",b,c,e,d,g)},web1_uid:function(a,b,c,e,d,g,k){var f=0,h=a.split(":");a="https"==h[0]||"http"==h[0]?a+"?":_gstat.getProtocol()+
"://"+a+"?";b?(a+="uid="+b,f+=4):a+="uid="+_gstat.getUID();d?(a+="&sn="+escape(d),f+=1):a=""!=window.location.hostname?a+("&sn="+escape(window.location.hostname)):a+"&sn=localhost";b="";d=_gstat.get_magic_id_list();null!=d&&""!=d&&(b+="&mig_l="+escape(d));var h=d="",l=_gstat.getCookie("ap_ofr");"undefined"==typeof l?d=h="":(l=l.split(":"),"undefined"!=typeof l[0]&&(h=escape(l[0])),"undefined"!=typeof l[1]&&(d=escape(l[1])));b+="&gst_idp="+h+"&gst_pc="+d;1==_gstat.getCookie("optout")&&(b+="&optout=1");
d=_gstat.gst_clean_pn(window.location.href.substring(window.location.protocol.length+2+window.location.hostname.length));g?(typeof d[1]&&""!=d[1]||(d=_gstat.gst_clean_pn(g)),a+="&pn="+escape(g),f+=2):a+="&pn="+escape(d[0]);a=a+b+d[1];c&&(a+="&"+c);a+="&ty="+(_gstat.Cookie.get("ty")||"0");a+="&rfr="+_gstat.getReferrer(e);a+=_gstat.getSrcDetection(e);!1!=_gstat.amount&&(a+="&g_ca="+_gstat.amount);a+="&"+_gstat.getResolution();a+="&"+_gstat.GSTAT_VERSION;a+="&rnd="+Math.floor(1E10*Math.random()+1);0<
f&&(a+="&forced="+f,4<=f&&(a+="&real_uid="+_gstat.getUID()));a+="&time_netlat=0";a+="&time_pgload=0";_gstat.setImg(a,0);void 0!==k&&!0===k&&loadScript(_gstat.getProtocol()+BLUEKAI_SRC,callBackBlueKai)},get_magic_id_list:function(){for(var a=document.body.innerHTML,b=[],c=RegExp(/\x3c!-- ?mig:(.*?) ?--\x3e/g),e;e=c.exec(a);)b.push(e[1]);return b.join(",")},gst_clean_pn:function(a){var b=null,b=a.split("?");if(1<b.length){a=b[1].split("&");for(var c="",e="",d=0;d<a.length;d++)if("g"==a[d].charAt(0)&&
"s"==a[d].charAt(1)&&"t"==a[d].charAt(2)&&"_"==a[d].charAt(3))c+="&"+a[d];else if("g"==a[d].charAt(0)&&"s"==a[d].charAt(1)&&"t"==a[d].charAt(2)&&"s"==a[d].charAt(3)&&"o"==a[d].charAt(4)&&"="==a[d].charAt(5)){var g="",g=a[d].split("=");"google"==g[1]?(g="gstso=GOO&gstsorec="+g[1],e=""==e?e+("?"+g):e+("&"+g)):"yahoo"==g[1]?(g="gstso=YAH&gstsorec="+g[1],e=""==e?e+("?"+g):e+("&"+g)):e=""==e?e+("?"+a[d]):e+("&"+a[d])}else e=""==e?e+("?"+a[d]):e+("&"+a[d]);b=[b[0]+e,c]}else b=[a,""];return b},getCookie:function(a){var b,
c,e,d=document.cookie.split(";"),g=RegExp("^\\s+|\\s+$","g");for(b=0;b<d.length;b++)if(c=d[b].substr(0,d[b].indexOf("=")),e=d[b].substr(d[b].indexOf("=")+1),c=c.replace(g,""),c==a)return unescape(e)},audience_moteur_orange:function(a,b,c,e){_gstat.web1_uid(_gstat.GIF_GSTAT_WEB1,a,b,"",c,e)},audience:function(a,b,c,e){_gstat.web1(_gstat.GIF_GSTAT_WEB1,a,"",b,c,e)},audience_custom:function(a,b,c,e){_gstat.web1(e,a,"",b,c)},log:function(a,b,c,e,d){_gstat.web2(_gstat.GIF_GSTAT_WEB2,a,b,c,e,d)},web2_original:function(a,
b,c,e,d){_gstat.web2(_gstat.GIF_ORIGINAL_WEB2,a,b,c,e,d)},log_clic_magic:function(a,b,c,e,d,g,k,f,h,l,m){if("Prod"==a||"Rec"==a||"Dev"==a){c||(c="no_page");"/"==c.charAt([c.length-1])&&(c=c.substr(0,c.length-1));m||(m=250);var n="clic";f&&(10<f&&(f=10),n=n+","+f);n=n+":"+h+"~"+l;d=d.substr(0,3)+"00";k=k.split(RegExp(",","g"));f="";for(h=0;2>h;h++)0<h&&2>h&&(f+=","),h<k.length&&(f+=k[h]);_gstat.web2_psup(_gstat.GIF_GSTAT_WEB2,"Animation",a,n,c+","+e+","+d+","+g+","+f,m,"magic_id="+b)}},log_video:function(a,
b,c,e,d,g,k){var f=window.location,h=escape(f.hostname),f=escape(f.href.substring(f.protocol.length+2+f.hostname.length));_gstat.web2_psup(_gstat.GIF_GSTAT_VIDEO,"Video","Prod",a,d+"~"+k+","+(b+"~"+c+"~"+e+"~"+g),250,"sn="+h+"&pn="+f)},processLinkOnClick:function(a,b){if(a&&a.href&&a.tagName&&"a"===a.tagName.toLowerCase()){var c="http://r.orange.fr/r",e={gst_idm:b||null,gst_ty:_gstat.Cookie.get("ty"),gst_pc:"",gst_idp:"",rnd:Math.floor(1E10*Math.random()+1),url:a.href},d=_gstat.getCookie("ap_ofr");
d&&(d=d.split(":"),"undefined"!==typeof d[0]&&(e.gst_idp=d[0]),"undefined"!==typeof d[1]&&(e.gst_pc=d[1]));if(/^https?:\/\/r.orange.fr\/[rl]/i.test(e.url)){c=e.url.indexOf("?");d=-1==c?[e.url]:[e.url.substring(0,c),e.url.substring(c+1)];c=d[0];if("undefined"!==typeof d[1]){var g=d[1].split("&"),g=d[1].split("url=");"undefined"!==typeof g[1]&&(e.url=unescape(g[1]));for(var g=g[0].split("&"),k=0,f=g.length;k<f;k++)if(""!==g[k]){var h=g[k].split("=");if("undefined"!==typeof h[0]&&"undefined"!==h[1]){var l=
h[0],h=unescape(h[1]);"undefined"===typeof e[l]?e[l]=h:"url"===l&&(e.url=h)}}}"undefined"!==typeof d[1]&&-1!==d[1].indexOf("url=")||delete e.url}var d=[],m;for(m in e)"url"!==m&&d.push(m+"="+escape(null!==e[m]?e[m]:0));"undefined"!==typeof e.url&&d.push("url="+escape(e.url));a.href=c+"?"+d.join("&")}},getResolution:function(){var a=screen.width,b=screen.height,c,e,d="N",g=screen.colorDepth;"undefined"!=typeof window.innerWidth?(c=window.innerWidth,e=window.innerHeight,d="N1"):"undefined"!=typeof document.documentElement&&
"undefined"!=typeof document.documentElement.clientWidth&&0!=document.documentElement.clientWidth?(c=document.documentElement.clientWidth,e=document.documentElement.clientHeight,d="M1"):document.getElementsByTagName("body")?(c=document.getElementsByTagName("body")[0].clientWidth,e=document.getElementsByTagName("body")[0].clientHeight,d="M2"):(c=a,e=b,d="N2");return"resol="+escape("|"+c+"|"+e+"|"+d+"|"+a+"|"+b+"|"+g+"|")},xhr:!1,XMLHttpRequest:function(){var a=!1!=_gstat.xhr;if(!_gstat.xhr&&(window.XMLHttpRequest||
window.ActiveXObject))if(window.ActiveXObject)try{_gstat.xhr=new ActiveXObject("Msxml2.XMLHTTP"),a=!0}catch(b){_gstat.xhr=new ActiveXObject("Microsoft.XMLHTTP"),a=!0}else _gstat.xhr=new XMLHttpRequest,a=!0;return a}};
