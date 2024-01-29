"use strict";(self.webpackChunk_docspace_components=self.webpackChunk_docspace_components||[]).push([[5218],{"./toast/toast.stories.js":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.r(__webpack_exports__),__webpack_require__.d(__webpack_exports__,{__namedExportsOrder:()=>__namedExportsOrder,all:()=>all,basic:()=>basic,default:()=>__WEBPACK_DEFAULT_EXPORT__});__webpack_require__("../../node_modules/react/index.js"),__webpack_require__("../../node_modules/react-dom/index.js");var ___WEBPACK_IMPORTED_MODULE_2__=__webpack_require__("./toast/index.js"),_toastr__WEBPACK_IMPORTED_MODULE_3__=__webpack_require__("./toast/toastr.js"),_button__WEBPACK_IMPORTED_MODULE_4__=__webpack_require__("./button/index.js"),_link__WEBPACK_IMPORTED_MODULE_5__=__webpack_require__("./link/index.js"),react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__=__webpack_require__("../../node_modules/react/jsx-runtime.js");const __WEBPACK_DEFAULT_EXPORT__={title:"Components/Toast",component:___WEBPACK_IMPORTED_MODULE_2__.Z,argTypes:{withCross:{description:"If `false`: toast disappeared after clicking on any area of toast. If `true`: toast disappeared after clicking on close button"},timeout:{description:"Time (in milliseconds) for showing your toast. Setting in `0` let you to show toast constantly until clicking on it"},data:{description:"Any components or data inside a toast"}},parameters:{design:{type:"figma",url:"https://www.figma.com/file/ZiW5KSwb4t7Tj6Nz5TducC/UI-Kit-DocSpace-1.0.0?node-id=648%3A4421&mode=dev"}}},basic=(({type,data,title,timeout,withCross,...args})=>(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsxs)(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.Fragment,{children:[(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsx)(___WEBPACK_IMPORTED_MODULE_2__.Z,{...args}),(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsx)(_button__WEBPACK_IMPORTED_MODULE_4__.Z,{label:"Show toast",primary:!0,size:"small",onClick:()=>{switch(type){case"error":_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.error(data,title,timeout,withCross);break;case"warning":_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.warning(data,title,timeout,withCross);break;case"info":_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.info(data,title,timeout,withCross);break;default:_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.success(data,title,timeout,withCross)}}})]})).bind({});basic.args={type:"success",data:"Demo text for Toast",title:"Demo title",withCross:!1,timeout:5e3};const all=(args=>(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsxs)(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.Fragment,{children:[(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsx)(___WEBPACK_IMPORTED_MODULE_2__.Z,{}),(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsx)(_button__WEBPACK_IMPORTED_MODULE_4__.Z,{label:"Show all toast",primary:!0,size:"small",onClick:()=>(_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.success("Demo text for success Toast closes in 30 seconds or on click",null,3e4),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.error("Demo text for error Toast closes in 28 seconds or on click",null,28e3),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.warning("Demo text for warning Toast closes in 25 seconds or on click",null,25e3),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.info("Demo text for info Toast closes in 15 seconds or on click",null,15e3),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.success("Demo text for success Toast with title closes in 12 seconds or on click","Demo title",12e3),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.error("Demo text for error Toast with title closes in 10 seconds or on click","Demo title",1e4),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.warning("Demo text for warning Toast with title closes in 8 seconds or on click","Demo title",8e3),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.info("Demo text for info Toast with title closes in 6 seconds or on click","Demo title",6e3),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.success("Demo text for success manual closed Toast",null,0,!0,!0),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.error("Demo text for error manual closed Toast",null,0,!0,!0),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.warning("Demo text for warning manual closed Toast",null,0,!0,!0),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.info("Demo text for info manual closed Toast",null,0,!0,!0),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.success((0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsxs)(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.Fragment,{children:["Demo text for success manual closed Toast with title and contains"," ",(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_6__.jsx)(_link__WEBPACK_IMPORTED_MODULE_5__.Z,{type:"page",color:"gray",href:"https://github.com",text:"gray link"})]}),"Demo title",0,!0,!0),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.error("Demo text for error manual closed Toast with title","Demo title",0,!0,!0),_toastr__WEBPACK_IMPORTED_MODULE_3__.Z.warning("Demo text for warning manual closed Toast with title","Demo title",0,!0,!0),void _toastr__WEBPACK_IMPORTED_MODULE_3__.Z.info("Demo text for info manual closed Toast with title","Demo title",0,!0,!0))})]})).bind({});basic.parameters={...basic.parameters,docs:{...basic.parameters?.docs,source:{originalSource:'({\n  type,\n  data,\n  title,\n  timeout,\n  withCross,\n  ...args\n}) => {\n  return <>\r\n      <Toast {...args} />\r\n      <Button label="Show toast" primary size="small" onClick={() => {\n      switch (type) {\n        case "error":\n          toastr.error(data, title, timeout, withCross);\n          break;\n        case "warning":\n          toastr.warning(data, title, timeout, withCross);\n          break;\n        case "info":\n          toastr.info(data, title, timeout, withCross);\n          break;\n        default:\n          toastr.success(data, title, timeout, withCross);\n          break;\n      }\n    }} />\r\n    </>;\n}',...basic.parameters?.docs?.source}}},all.parameters={...all.parameters,docs:{...all.parameters?.docs,source:{originalSource:'args => {\n  const renderAllToast = () => {\n    toastr.success("Demo text for success Toast closes in 30 seconds or on click", null, 30000);\n    toastr.error("Demo text for error Toast closes in 28 seconds or on click", null, 28000);\n    toastr.warning("Demo text for warning Toast closes in 25 seconds or on click", null, 25000);\n    toastr.info("Demo text for info Toast closes in 15 seconds or on click", null, 15000);\n    toastr.success("Demo text for success Toast with title closes in 12 seconds or on click", "Demo title", 12000);\n    toastr.error("Demo text for error Toast with title closes in 10 seconds or on click", "Demo title", 10000);\n    toastr.warning("Demo text for warning Toast with title closes in 8 seconds or on click", "Demo title", 8000);\n    toastr.info("Demo text for info Toast with title closes in 6 seconds or on click", "Demo title", 6000);\n    toastr.success("Demo text for success manual closed Toast", null, 0, true, true);\n    toastr.error("Demo text for error manual closed Toast", null, 0, true, true);\n    toastr.warning("Demo text for warning manual closed Toast", null, 0, true, true);\n    toastr.info("Demo text for info manual closed Toast", null, 0, true, true);\n    toastr.success(<>\r\n        Demo text for success manual closed Toast with title and contains{" "}\r\n        <Link type="page" color="gray" href="https://github.com" text="gray link" />\r\n      </>, "Demo title", 0, true, true);\n    toastr.error("Demo text for error manual closed Toast with title", "Demo title", 0, true, true);\n    toastr.warning("Demo text for warning manual closed Toast with title", "Demo title", 0, true, true);\n    toastr.info("Demo text for info manual closed Toast with title", "Demo title", 0, true, true);\n  };\n  return <>\r\n      <Toast />\r\n      <Button label="Show all toast" primary size="small" onClick={() => renderAllToast()} />\r\n    </>;\n}',...all.parameters?.docs?.source}}};const __namedExportsOrder=["basic","all"]}}]);