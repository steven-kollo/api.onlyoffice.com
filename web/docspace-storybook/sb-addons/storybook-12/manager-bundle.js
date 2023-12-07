try{
var Je=__STORYBOOKAPI__,{ActiveTabs:Qe,Consumer:Xe,ManagerContext:et,Provider:tt,addons:q,combineParameters:rt,controlOrMetaKey:at,controlOrMetaSymbol:nt,eventMatchesShortcut:ot,eventToShortcut:it,isMacLike:st,isShortcutTaken:lt,keyToSymbol:pt,merge:dt,mockChannel:ft,optionOrAltSymbol:ut,shortcutMatchesShortcut:ct,shortcutToHumanString:ht,types:gt,useAddonState:mt,useArgTypes:bt,useArgs:yt,useChannel:vt,useGlobalTypes:xt,useGlobals:Ct,useParameter:Ft,useSharedState:wt,useStoryPrepared:St,useStorybookApi:Pt,useStorybookState:kt}=__STORYBOOKAPI__;var N=(()=>{let e;return typeof window<"u"?e=window:typeof globalThis<"u"?e=globalThis:typeof window<"u"?e=window:typeof self<"u"?e=self:e={},e})();var Bt=__STORYBOOKCLIENTLOGGER__,{deprecate:Rt,logger:G,once:Et,pretty:zt}=__STORYBOOKCLIENTLOGGER__;function v(){return v=Object.assign?Object.assign.bind():function(e){for(var t=1;t<arguments.length;t++){var r=arguments[t];for(var a in r)Object.prototype.hasOwnProperty.call(r,a)&&(e[a]=r[a])}return e},v.apply(this,arguments)}function ae(e){if(e===void 0)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return e}function x(e,t){return x=Object.setPrototypeOf?Object.setPrototypeOf.bind():function(r,a){return r.__proto__=a,r},x(e,t)}function ne(e,t){e.prototype=Object.create(t.prototype),e.prototype.constructor=e,x(e,t)}function E(e){return E=Object.setPrototypeOf?Object.getPrototypeOf.bind():function(t){return t.__proto__||Object.getPrototypeOf(t)},E(e)}function oe(e){return Function.toString.call(e).indexOf("[native code]")!==-1}function ie(){if(typeof Reflect>"u"||!Reflect.construct||Reflect.construct.sham)return!1;if(typeof Proxy=="function")return!0;try{return Boolean.prototype.valueOf.call(Reflect.construct(Boolean,[],function(){})),!0}catch{return!1}}function S(e,t,r){return ie()?S=Reflect.construct.bind():S=function(a,n,o){var i=[null];i.push.apply(i,n);var l=Function.bind.apply(a,i),p=new l;return o&&x(p,o.prototype),p},S.apply(null,arguments)}function z(e){var t=typeof Map=="function"?new Map:void 0;return z=function(r){if(r===null||!oe(r))return r;if(typeof r!="function")throw new TypeError("Super expression must either be null or a function");if(typeof t<"u"){if(t.has(r))return t.get(r);t.set(r,a)}function a(){return S(r,arguments,E(this).constructor)}return a.prototype=Object.create(r.prototype,{constructor:{value:a,enumerable:!1,writable:!0,configurable:!0}}),x(a,r)},z(e)}var se={1:`Passed invalid arguments to hsl, please pass multiple numbers e.g. hsl(360, 0.75, 0.4) or an object e.g. rgb({ hue: 255, saturation: 0.4, lightness: 0.75 }).

`,2:`Passed invalid arguments to hsla, please pass multiple numbers e.g. hsla(360, 0.75, 0.4, 0.7) or an object e.g. rgb({ hue: 255, saturation: 0.4, lightness: 0.75, alpha: 0.7 }).

`,3:`Passed an incorrect argument to a color function, please pass a string representation of a color.

`,4:`Couldn't generate valid rgb string from %s, it returned %s.

`,5:`Couldn't parse the color string. Please provide the color as a string in hex, rgb, rgba, hsl or hsla notation.

`,6:`Passed invalid arguments to rgb, please pass multiple numbers e.g. rgb(255, 205, 100) or an object e.g. rgb({ red: 255, green: 205, blue: 100 }).

`,7:`Passed invalid arguments to rgba, please pass multiple numbers e.g. rgb(255, 205, 100, 0.75) or an object e.g. rgb({ red: 255, green: 205, blue: 100, alpha: 0.75 }).

`,8:`Passed invalid argument to toColorString, please pass a RgbColor, RgbaColor, HslColor or HslaColor object.

`,9:`Please provide a number of steps to the modularScale helper.

`,10:`Please pass a number or one of the predefined scales to the modularScale helper as the ratio.

`,11:`Invalid value passed as base to modularScale, expected number or em string but got "%s"

`,12:`Expected a string ending in "px" or a number passed as the first argument to %s(), got "%s" instead.

`,13:`Expected a string ending in "px" or a number passed as the second argument to %s(), got "%s" instead.

`,14:`Passed invalid pixel value ("%s") to %s(), please pass a value like "12px" or 12.

`,15:`Passed invalid base value ("%s") to %s(), please pass a value like "12px" or 12.

`,16:`You must provide a template to this method.

`,17:`You passed an unsupported selector state to this method.

`,18:`minScreen and maxScreen must be provided as stringified numbers with the same units.

`,19:`fromSize and toSize must be provided as stringified numbers with the same units.

`,20:`expects either an array of objects or a single object with the properties prop, fromSize, and toSize.

`,21:"expects the objects in the first argument array to have the properties `prop`, `fromSize`, and `toSize`.\n\n",22:"expects the first argument object to have the properties `prop`, `fromSize`, and `toSize`.\n\n",23:`fontFace expects a name of a font-family.

`,24:`fontFace expects either the path to the font file(s) or a name of a local copy.

`,25:`fontFace expects localFonts to be an array.

`,26:`fontFace expects fileFormats to be an array.

`,27:`radialGradient requries at least 2 color-stops to properly render.

`,28:`Please supply a filename to retinaImage() as the first argument.

`,29:`Passed invalid argument to triangle, please pass correct pointingDirection e.g. 'right'.

`,30:"Passed an invalid value to `height` or `width`. Please provide a pixel based unit.\n\n",31:`The animation shorthand only takes 8 arguments. See the specification for more information: http://mdn.io/animation

`,32:`To pass multiple animations please supply them in arrays, e.g. animation(['rotate', '2s'], ['move', '1s'])
To pass a single animation please supply them in simple values, e.g. animation('rotate', '2s')

`,33:`The animation shorthand arrays can only have 8 elements. See the specification for more information: http://mdn.io/animation

`,34:`borderRadius expects a radius value as a string or number as the second argument.

`,35:`borderRadius expects one of "top", "bottom", "left" or "right" as the first argument.

`,36:`Property must be a string value.

`,37:`Syntax Error at %s.

`,38:`Formula contains a function that needs parentheses at %s.

`,39:`Formula is missing closing parenthesis at %s.

`,40:`Formula has too many closing parentheses at %s.

`,41:`All values in a formula must have the same unit or be unitless.

`,42:`Please provide a number of steps to the modularScale helper.

`,43:`Please pass a number or one of the predefined scales to the modularScale helper as the ratio.

`,44:`Invalid value passed as base to modularScale, expected number or em/rem string but got %s.

`,45:`Passed invalid argument to hslToColorString, please pass a HslColor or HslaColor object.

`,46:`Passed invalid argument to rgbToColorString, please pass a RgbColor or RgbaColor object.

`,47:`minScreen and maxScreen must be provided as stringified numbers with the same units.

`,48:`fromSize and toSize must be provided as stringified numbers with the same units.

`,49:`Expects either an array of objects or a single object with the properties prop, fromSize, and toSize.

`,50:`Expects the objects in the first argument array to have the properties prop, fromSize, and toSize.

`,51:`Expects the first argument object to have the properties prop, fromSize, and toSize.

`,52:`fontFace expects either the path to the font file(s) or a name of a local copy.

`,53:`fontFace expects localFonts to be an array.

`,54:`fontFace expects fileFormats to be an array.

`,55:`fontFace expects a name of a font-family.

`,56:`linearGradient requries at least 2 color-stops to properly render.

`,57:`radialGradient requries at least 2 color-stops to properly render.

`,58:`Please supply a filename to retinaImage() as the first argument.

`,59:`Passed invalid argument to triangle, please pass correct pointingDirection e.g. 'right'.

`,60:"Passed an invalid value to `height` or `width`. Please provide a pixel based unit.\n\n",61:`Property must be a string value.

`,62:`borderRadius expects a radius value as a string or number as the second argument.

`,63:`borderRadius expects one of "top", "bottom", "left" or "right" as the first argument.

`,64:`The animation shorthand only takes 8 arguments. See the specification for more information: http://mdn.io/animation.

`,65:`To pass multiple animations please supply them in arrays, e.g. animation(['rotate', '2s'], ['move', '1s'])\\nTo pass a single animation please supply them in simple values, e.g. animation('rotate', '2s').

`,66:`The animation shorthand arrays can only have 8 elements. See the specification for more information: http://mdn.io/animation.

`,67:`You must provide a template to this method.

`,68:`You passed an unsupported selector state to this method.

`,69:`Expected a string ending in "px" or a number passed as the first argument to %s(), got %s instead.

`,70:`Expected a string ending in "px" or a number passed as the second argument to %s(), got %s instead.

`,71:`Passed invalid pixel value %s to %s(), please pass a value like "12px" or 12.

`,72:`Passed invalid base value %s to %s(), please pass a value like "12px" or 12.

`,73:`Please provide a valid CSS variable.

`,74:`CSS variable not found and no default was provided.

`,75:`important requires a valid style object, got a %s instead.

`,76:`fromSize and toSize must be provided as stringified numbers with the same units as minScreen and maxScreen.

`,77:`remToPx expects a value in "rem" but you provided it in "%s".

`,78:`base must be set in "px" or "%" but you set it in "%s".
`};function le(){for(var e=arguments.length,t=new Array(e),r=0;r<e;r++)t[r]=arguments[r];var a=t[0],n=[],o;for(o=1;o<t.length;o+=1)n.push(t[o]);return n.forEach(function(i){a=a.replace(/%[a-z]/,i)}),a}var f=function(e){ne(t,e);function t(r){for(var a,n=arguments.length,o=new Array(n>1?n-1:0),i=1;i<n;i++)o[i-1]=arguments[i];return a=e.call(this,le.apply(void 0,[se[r]].concat(o)))||this,ae(a)}return t}(z(Error));function j(e){return Math.round(e*255)}function pe(e,t,r){return j(e)+","+j(t)+","+j(r)}function C(e,t,r,a){if(a===void 0&&(a=pe),t===0)return a(r,r,r);var n=(e%360+360)%360/60,o=(1-Math.abs(2*r-1))*t,i=o*(1-Math.abs(n%2-1)),l=0,p=0,d=0;n>=0&&n<1?(l=o,p=i):n>=1&&n<2?(l=i,p=o):n>=2&&n<3?(p=o,d=i):n>=3&&n<4?(p=i,d=o):n>=4&&n<5?(l=i,d=o):n>=5&&n<6&&(l=o,d=i);var b=r-o/2,y=l+b,u=p+b,M=d+b;return a(y,u,M)}var Y={aliceblue:"f0f8ff",antiquewhite:"faebd7",aqua:"00ffff",aquamarine:"7fffd4",azure:"f0ffff",beige:"f5f5dc",bisque:"ffe4c4",black:"000",blanchedalmond:"ffebcd",blue:"0000ff",blueviolet:"8a2be2",brown:"a52a2a",burlywood:"deb887",cadetblue:"5f9ea0",chartreuse:"7fff00",chocolate:"d2691e",coral:"ff7f50",cornflowerblue:"6495ed",cornsilk:"fff8dc",crimson:"dc143c",cyan:"00ffff",darkblue:"00008b",darkcyan:"008b8b",darkgoldenrod:"b8860b",darkgray:"a9a9a9",darkgreen:"006400",darkgrey:"a9a9a9",darkkhaki:"bdb76b",darkmagenta:"8b008b",darkolivegreen:"556b2f",darkorange:"ff8c00",darkorchid:"9932cc",darkred:"8b0000",darksalmon:"e9967a",darkseagreen:"8fbc8f",darkslateblue:"483d8b",darkslategray:"2f4f4f",darkslategrey:"2f4f4f",darkturquoise:"00ced1",darkviolet:"9400d3",deeppink:"ff1493",deepskyblue:"00bfff",dimgray:"696969",dimgrey:"696969",dodgerblue:"1e90ff",firebrick:"b22222",floralwhite:"fffaf0",forestgreen:"228b22",fuchsia:"ff00ff",gainsboro:"dcdcdc",ghostwhite:"f8f8ff",gold:"ffd700",goldenrod:"daa520",gray:"808080",green:"008000",greenyellow:"adff2f",grey:"808080",honeydew:"f0fff0",hotpink:"ff69b4",indianred:"cd5c5c",indigo:"4b0082",ivory:"fffff0",khaki:"f0e68c",lavender:"e6e6fa",lavenderblush:"fff0f5",lawngreen:"7cfc00",lemonchiffon:"fffacd",lightblue:"add8e6",lightcoral:"f08080",lightcyan:"e0ffff",lightgoldenrodyellow:"fafad2",lightgray:"d3d3d3",lightgreen:"90ee90",lightgrey:"d3d3d3",lightpink:"ffb6c1",lightsalmon:"ffa07a",lightseagreen:"20b2aa",lightskyblue:"87cefa",lightslategray:"789",lightslategrey:"789",lightsteelblue:"b0c4de",lightyellow:"ffffe0",lime:"0f0",limegreen:"32cd32",linen:"faf0e6",magenta:"f0f",maroon:"800000",mediumaquamarine:"66cdaa",mediumblue:"0000cd",mediumorchid:"ba55d3",mediumpurple:"9370db",mediumseagreen:"3cb371",mediumslateblue:"7b68ee",mediumspringgreen:"00fa9a",mediumturquoise:"48d1cc",mediumvioletred:"c71585",midnightblue:"191970",mintcream:"f5fffa",mistyrose:"ffe4e1",moccasin:"ffe4b5",navajowhite:"ffdead",navy:"000080",oldlace:"fdf5e6",olive:"808000",olivedrab:"6b8e23",orange:"ffa500",orangered:"ff4500",orchid:"da70d6",palegoldenrod:"eee8aa",palegreen:"98fb98",paleturquoise:"afeeee",palevioletred:"db7093",papayawhip:"ffefd5",peachpuff:"ffdab9",peru:"cd853f",pink:"ffc0cb",plum:"dda0dd",powderblue:"b0e0e6",purple:"800080",rebeccapurple:"639",red:"f00",rosybrown:"bc8f8f",royalblue:"4169e1",saddlebrown:"8b4513",salmon:"fa8072",sandybrown:"f4a460",seagreen:"2e8b57",seashell:"fff5ee",sienna:"a0522d",silver:"c0c0c0",skyblue:"87ceeb",slateblue:"6a5acd",slategray:"708090",slategrey:"708090",snow:"fffafa",springgreen:"00ff7f",steelblue:"4682b4",tan:"d2b48c",teal:"008080",thistle:"d8bfd8",tomato:"ff6347",turquoise:"40e0d0",violet:"ee82ee",wheat:"f5deb3",white:"fff",whitesmoke:"f5f5f5",yellow:"ff0",yellowgreen:"9acd32"};function de(e){if(typeof e!="string")return e;var t=e.toLowerCase();return Y[t]?"#"+Y[t]:e}var fe=/^#[a-fA-F0-9]{6}$/,ue=/^#[a-fA-F0-9]{8}$/,ce=/^#[a-fA-F0-9]{3}$/,he=/^#[a-fA-F0-9]{4}$/,_=/^rgb\(\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*\)$/i,ge=/^rgb(?:a)?\(\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*(?:,)?\s*(\d{1,3})\s*(?:,|\/)\s*([-+]?\d*[.]?\d+[%]?)\s*\)$/i,me=/^hsl\(\s*(\d{0,3}[.]?[0-9]+(?:deg)?)\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*\)$/i,be=/^hsl(?:a)?\(\s*(\d{0,3}[.]?[0-9]+(?:deg)?)\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*(?:,)?\s*(\d{1,3}[.]?[0-9]?)%\s*(?:,|\/)\s*([-+]?\d*[.]?\d+[%]?)\s*\)$/i;function T(e){if(typeof e!="string")throw new f(3);var t=de(e);if(t.match(fe))return{red:parseInt(""+t[1]+t[2],16),green:parseInt(""+t[3]+t[4],16),blue:parseInt(""+t[5]+t[6],16)};if(t.match(ue)){var r=parseFloat((parseInt(""+t[7]+t[8],16)/255).toFixed(2));return{red:parseInt(""+t[1]+t[2],16),green:parseInt(""+t[3]+t[4],16),blue:parseInt(""+t[5]+t[6],16),alpha:r}}if(t.match(ce))return{red:parseInt(""+t[1]+t[1],16),green:parseInt(""+t[2]+t[2],16),blue:parseInt(""+t[3]+t[3],16)};if(t.match(he)){var a=parseFloat((parseInt(""+t[4]+t[4],16)/255).toFixed(2));return{red:parseInt(""+t[1]+t[1],16),green:parseInt(""+t[2]+t[2],16),blue:parseInt(""+t[3]+t[3],16),alpha:a}}var n=_.exec(t);if(n)return{red:parseInt(""+n[1],10),green:parseInt(""+n[2],10),blue:parseInt(""+n[3],10)};var o=ge.exec(t.substring(0,50));if(o)return{red:parseInt(""+o[1],10),green:parseInt(""+o[2],10),blue:parseInt(""+o[3],10),alpha:parseFloat(""+o[4])>1?parseFloat(""+o[4])/100:parseFloat(""+o[4])};var i=me.exec(t);if(i){var l=parseInt(""+i[1],10),p=parseInt(""+i[2],10)/100,d=parseInt(""+i[3],10)/100,b="rgb("+C(l,p,d)+")",y=_.exec(b);if(!y)throw new f(4,t,b);return{red:parseInt(""+y[1],10),green:parseInt(""+y[2],10),blue:parseInt(""+y[3],10)}}var u=be.exec(t.substring(0,50));if(u){var M=parseInt(""+u[1],10),te=parseInt(""+u[2],10)/100,re=parseInt(""+u[3],10)/100,Z="rgb("+C(M,te,re)+")",w=_.exec(Z);if(!w)throw new f(4,t,Z);return{red:parseInt(""+w[1],10),green:parseInt(""+w[2],10),blue:parseInt(""+w[3],10),alpha:parseFloat(""+u[4])>1?parseFloat(""+u[4])/100:parseFloat(""+u[4])}}throw new f(5)}function ye(e){var t=e.red/255,r=e.green/255,a=e.blue/255,n=Math.max(t,r,a),o=Math.min(t,r,a),i=(n+o)/2;if(n===o)return e.alpha!==void 0?{hue:0,saturation:0,lightness:i,alpha:e.alpha}:{hue:0,saturation:0,lightness:i};var l,p=n-o,d=i>.5?p/(2-n-o):p/(n+o);switch(n){case t:l=(r-a)/p+(r<a?6:0);break;case r:l=(a-t)/p+2;break;default:l=(t-r)/p+4;break}return l*=60,e.alpha!==void 0?{hue:l,saturation:d,lightness:i,alpha:e.alpha}:{hue:l,saturation:d,lightness:i}}function W(e){return ye(T(e))}var ve=function(e){return e.length===7&&e[1]===e[2]&&e[3]===e[4]&&e[5]===e[6]?"#"+e[1]+e[3]+e[5]:e},A=ve;function m(e){var t=e.toString(16);return t.length===1?"0"+t:t}function L(e){return m(Math.round(e*255))}function xe(e,t,r){return A("#"+L(e)+L(t)+L(r))}function k(e,t,r){return C(e,t,r,xe)}function Ce(e,t,r){if(typeof e=="number"&&typeof t=="number"&&typeof r=="number")return k(e,t,r);if(typeof e=="object"&&t===void 0&&r===void 0)return k(e.hue,e.saturation,e.lightness);throw new f(1)}function Fe(e,t,r,a){if(typeof e=="number"&&typeof t=="number"&&typeof r=="number"&&typeof a=="number")return a>=1?k(e,t,r):"rgba("+C(e,t,r)+","+a+")";if(typeof e=="object"&&t===void 0&&r===void 0&&a===void 0)return e.alpha>=1?k(e.hue,e.saturation,e.lightness):"rgba("+C(e.hue,e.saturation,e.lightness)+","+e.alpha+")";throw new f(2)}function D(e,t,r){if(typeof e=="number"&&typeof t=="number"&&typeof r=="number")return A("#"+m(e)+m(t)+m(r));if(typeof e=="object"&&t===void 0&&r===void 0)return A("#"+m(e.red)+m(e.green)+m(e.blue));throw new f(6)}function F(e,t,r,a){if(typeof e=="string"&&typeof t=="number"){var n=T(e);return"rgba("+n.red+","+n.green+","+n.blue+","+t+")"}else{if(typeof e=="number"&&typeof t=="number"&&typeof r=="number"&&typeof a=="number")return a>=1?D(e,t,r):"rgba("+e+","+t+","+r+","+a+")";if(typeof e=="object"&&t===void 0&&r===void 0&&a===void 0)return e.alpha>=1?D(e.red,e.green,e.blue):"rgba("+e.red+","+e.green+","+e.blue+","+e.alpha+")"}throw new f(7)}var we=function(e){return typeof e.red=="number"&&typeof e.green=="number"&&typeof e.blue=="number"&&(typeof e.alpha!="number"||typeof e.alpha>"u")},Se=function(e){return typeof e.red=="number"&&typeof e.green=="number"&&typeof e.blue=="number"&&typeof e.alpha=="number"},Pe=function(e){return typeof e.hue=="number"&&typeof e.saturation=="number"&&typeof e.lightness=="number"&&(typeof e.alpha!="number"||typeof e.alpha>"u")},ke=function(e){return typeof e.hue=="number"&&typeof e.saturation=="number"&&typeof e.lightness=="number"&&typeof e.alpha=="number"};function U(e){if(typeof e!="object")throw new f(8);if(Se(e))return F(e);if(we(e))return D(e);if(ke(e))return Fe(e);if(Pe(e))return Ce(e);throw new f(8)}function J(e,t,r){return function(){var a=r.concat(Array.prototype.slice.call(arguments));return a.length>=t?e.apply(this,a):J(e,t,a)}}function H(e){return J(e,e.length,[])}function I(e,t,r){return Math.max(e,Math.min(t,r))}function Oe(e,t){if(t==="transparent")return t;var r=W(t);return U(v({},r,{lightness:I(0,1,r.lightness-parseFloat(e))}))}var Te=H(Oe),He=Te;function Ie(e,t){if(t==="transparent")return t;var r=W(t);return U(v({},r,{lightness:I(0,1,r.lightness+parseFloat(e))}))}var Me=H(Ie),je=Me;function _e(e,t){if(t==="transparent")return t;var r=T(t),a=typeof r.alpha=="number"?r.alpha:1,n=v({},r,{alpha:I(0,1,(a*100+parseFloat(e)*100)/100)});return F(n)}var Gt=H(_e);function Le(e,t){if(t==="transparent")return t;var r=T(t),a=typeof r.alpha=="number"?r.alpha:1,n=v({},r,{alpha:I(0,1,+(a*100-parseFloat(e)*100).toFixed(2)/100)});return F(n)}var Be=H(Le),Re=Be,s={primary:"#FF4785",secondary:"#029CFD",tertiary:"#FAFBFC",ancillary:"#22a699",orange:"#FC521F",gold:"#FFAE00",green:"#66BF3C",seafoam:"#37D5D3",purple:"#6F2CAC",ultraviolet:"#2A0481",lightest:"#FFFFFF",lighter:"#F7FAFC",light:"#EEF3F6",mediumlight:"#ECF4F9",medium:"#D9E8F2",mediumdark:"#73828C",dark:"#5C6870",darker:"#454E54",darkest:"#2E3438",border:"hsla(203, 50%, 30%, 0.15)",positive:"#66BF3C",negative:"#FF4400",warning:"#E69D00",critical:"#FFFFFF",defaultText:"#2E3438",inverseText:"#FFFFFF",positiveText:"#448028",negativeText:"#D43900",warningText:"#A15C20"},K={app:"#F6F9FC",bar:s.lightest,content:s.lightest,gridCellSize:10,hoverable:Re(.93,s.secondary),positive:"#E1FFD4",negative:"#FEDED2",warning:"#FFF5CF",critical:"#FF4400"},O={fonts:{base:['"Nunito Sans"',"-apple-system",'".SFNSText-Regular"','"San Francisco"',"BlinkMacSystemFont",'"Segoe UI"','"Helvetica Neue"',"Helvetica","Arial","sans-serif"].join(", "),mono:["ui-monospace","Menlo","Monaco",'"Roboto Mono"','"Oxygen Mono"','"Ubuntu Monospace"','"Source Code Pro"','"Droid Sans Mono"','"Courier New"',"monospace"].join(", ")},weight:{regular:400,bold:700},size:{s1:12,s2:14,s3:16,m1:20,m2:24,m3:28,l1:32,l2:40,l3:48,code:90}},Ee={base:"light",colorPrimary:"#FF4785",colorSecondary:"#029CFD",appBg:K.app,appContentBg:s.lightest,appBorderColor:s.border,appBorderRadius:4,fontBase:O.fonts.base,fontCode:O.fonts.mono,textColor:s.darkest,textInverseColor:s.lightest,textMutedColor:s.mediumdark,barTextColor:s.mediumdark,barSelectedColor:s.secondary,barBg:s.lightest,buttonBg:K.app,buttonBorder:s.medium,booleanBg:s.mediumlight,booleanSelectedBg:s.lightest,inputBg:s.lightest,inputBorder:s.border,inputTextColor:s.darkest,inputBorderRadius:4},V=Ee,ze={base:"dark",colorPrimary:"#FF4785",colorSecondary:"#029CFD",appBg:"#222425",appContentBg:"#1B1C1D",appBorderColor:"rgba(255,255,255,.1)",appBorderRadius:4,fontBase:O.fonts.base,fontCode:O.fonts.mono,textColor:"#C9CDCF",textInverseColor:"#222425",textMutedColor:"#798186",barTextColor:"#798186",barSelectedColor:s.secondary,barBg:"#292C2E",buttonBg:"#222425",buttonBorder:"rgba(255,255,255,.1)",booleanBg:"#222425",booleanSelectedBg:"#2E3438",inputBg:"#1B1C1D",inputBorder:"rgba(255,255,255,.1)",inputTextColor:s.lightest,inputBorderRadius:4},Ae=ze,{window:B}=N;var De=e=>typeof e!="string"?(G.warn(`Color passed to theme object should be a string. Instead ${e}(${typeof e}) was passed.`),!1):!0,$e=e=>!/(gradient|var|calc)/.test(e),Ze=(e,t)=>e==="darken"?F(`${He(1,t)}`,.95):e==="lighten"?F(`${je(1,t)}`,.95):t,Q=e=>t=>{if(!De(t)||!$e(t))return t;try{return Ze(e,t)}catch{return t}},Yt=Q("lighten"),Kt=Q("darken"),qe=()=>!B||!B.matchMedia?"light":B.matchMedia("(prefers-color-scheme: dark)").matches?"dark":"light",P={light:V,dark:Ae,normal:V},R=qe(),$=(e={base:R},t)=>{let r={...P[R],...P[e.base]||{},...e,base:P[e.base]?e.base:R};return{...t,...r,barSelectedColor:e.barSelectedColor||r.colorSecondary}};var X='data:image/svg+xml,<svg width="246" height="46" viewBox="0 0 246 46" fill="none" xmlns="http://www.w3.org/2000/svg">%0D%0A<path fill-rule="evenodd" clip-rule="evenodd" d="M21.0665 44.9485L1.26509 35.6841C-0.421696 34.8753 -0.421696 33.6254 1.26509 32.8901L8.1589 29.6549L20.9931 35.6841C22.6799 36.4929 25.3934 36.4929 27.0069 35.6841L39.8411 29.6549L46.7349 32.8901C48.4217 33.6989 48.4217 34.9489 46.7349 35.6841L26.9335 44.9485C25.3934 45.6838 22.6799 45.6838 21.0665 44.9485Z" fill="%23FF6F3D"/>%0D%0A<path fill-rule="evenodd" clip-rule="evenodd" d="M21.0023 33.4842L1.26123 24.2091C-0.420411 23.3993 -0.420411 22.1479 1.26123 21.4118L7.98781 18.2465L21.0023 24.3563C22.6839 25.166 25.3892 25.166 26.9977 24.3563L40.0122 18.2465L46.7388 21.4118C48.4204 22.2215 48.4204 23.4729 46.7388 24.2091L26.9977 33.4842C25.3161 34.294 22.6108 34.294 21.0023 33.4842Z" fill="%2395C038"/>%0D%0A<path fill-rule="evenodd" clip-rule="evenodd" d="M21.0023 22.139L1.26123 12.9973C-0.420411 12.1992 -0.420411 10.9658 1.26123 10.2403L21.0023 1.09856C22.6839 0.300479 25.3892 0.300479 26.9977 1.09856L46.7388 10.2403C48.4204 11.0383 48.4204 12.2717 46.7388 12.9973L26.9977 22.139C25.3161 22.8645 22.6108 22.8645 21.0023 22.139Z" fill="%235DC0E8"/>%0D%0A<path d="M71.3268 11.5C65.6139 11.5 60 14.8408 60 23C60 31.1592 65.6139 34.5 71.3268 34.5C77.0398 34.5 82.6537 31.1592 82.6537 23C82.6537 14.8408 77.0398 11.5 71.3268 11.5ZM71.3268 14.7123C73.0771 14.7123 77.7003 15.3869 77.7003 23C77.7003 30.6131 73.0771 31.2877 71.3268 31.2877C69.5766 31.2877 64.9534 30.6131 64.9534 23C64.9534 15.3869 69.5766 14.7123 71.3268 14.7123Z" fill="%23333333"/>%0D%0A<path d="M86.4634 11.757V34.243H91.1527V21.0084L91.0536 17.0251H91.1527L92.3085 19.5307L100.366 34.243H106.442V11.757H101.753V24.9916L101.852 28.9749H101.753L100.531 25.9232L92.5396 11.757H86.4634Z" fill="%23333333"/>%0D%0A<path d="M111.069 11.757V34.243H124.939V30.4525H115.759V11.757H111.069Z" fill="%23333333"/>%0D%0A<path d="M120.976 11.757L129.496 25.0559V34.243H134.185V25.1201L142.507 11.757H137.554L132.765 19.6592L131.973 21.2011H131.874L131.147 19.6592L126.392 11.757H120.976Z" fill="%23333333"/>%0D%0A<path d="M153.433 11.5C147.72 11.5 142.106 14.8408 142.106 23C142.106 31.1592 147.72 34.5 153.433 34.5C159.145 34.5 164.759 31.1592 164.759 23C164.759 14.8408 159.145 11.5 153.433 11.5ZM153.433 14.7123C155.183 14.7123 159.806 15.3869 159.806 23C159.806 30.6131 155.183 31.2877 153.433 31.2877C151.682 31.2877 147.059 30.6131 147.059 23C147.059 15.3869 151.682 14.7123 153.433 14.7123Z" fill="%23333333"/>%0D%0A<path d="M168.569 11.757V34.243H173.258V24.7025H181.118V21.0084H173.258V15.5475H181.514V11.757H168.569Z" fill="%23333333"/>%0D%0A<path d="M184.823 11.757V34.243H189.512V24.7025H197.371V21.0084H189.512V15.5475H197.768V11.757H184.823Z" fill="%23333333"/>%0D%0A<path d="M201.076 34.243H205.765V11.757H201.076V34.243Z" fill="%23333333"/>%0D%0A<path d="M227.271 29.7137C226.115 30.2277 224.497 30.7095 222.449 30.7095C218.288 30.7095 214.524 28.493 214.524 23.0642C214.524 18.4707 217.595 15.2905 222.779 15.2905C224.53 15.2905 226.016 15.6117 227.37 16.1257L227.568 12.2709C225.818 11.7249 224.266 11.5 222.449 11.5C215.184 11.5 209.57 15.3869 209.57 23.1285C209.57 31.3198 215.845 34.5 221.591 34.5C223.44 34.5 225.52 34.2109 227.568 33.5363L227.271 29.7137Z" fill="%23333333"/>%0D%0A<path d="M231.196 11.757V34.243H245V30.2598H235.886V24.5098H244.174V20.8156H235.886V15.7402H245V11.757H231.196Z" fill="%23333333"/>%0D%0A</svg>%0D%0A';var ee=$({base:"light",brandTitle:"ONLYOFFICE",brandUrl:"https://www.onlyoffice.com/docspace.aspx",brandImage:X,brandTarget:"_self"});q.setConfig({lightTheme:ee});
}catch(e){ console.error("[Storybook] One of your manager-entries failed: " + import.meta.url, e); }
//# sourceMappingURL=manager-bundle.js.map
