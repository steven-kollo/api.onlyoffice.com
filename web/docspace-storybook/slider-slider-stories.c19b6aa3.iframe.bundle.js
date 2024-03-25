"use strict";(self.webpackChunk_docspace_components=self.webpackChunk_docspace_components||[]).push([[6026],{"./slider/slider.stories.js":(__unused_webpack_module,__webpack_exports__,__webpack_require__)=>{__webpack_require__.r(__webpack_exports__),__webpack_require__.d(__webpack_exports__,{Default:()=>Default,__namedExportsOrder:()=>__namedExportsOrder,default:()=>__WEBPACK_DEFAULT_EXPORT__});var react__WEBPACK_IMPORTED_MODULE_0__=__webpack_require__("../../node_modules/react/index.js"),___WEBPACK_IMPORTED_MODULE_1__=__webpack_require__("./slider/index.js"),react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__=__webpack_require__("../../node_modules/react/jsx-runtime.js");const __WEBPACK_DEFAULT_EXPORT__={title:"Components/Slider",component:___WEBPACK_IMPORTED_MODULE_1__.Z,parameters:{docs:{description:{component:"Components/Slider"}},design:{type:"figma",url:"https://www.figma.com/file/ZiW5KSwb4t7Tj6Nz5TducC/UI-Kit-DocSpace-1.0.0?type=design&node-id=505-4112&mode=design&t=TBNCKMQKQMxr44IZ-0"}}},Template=({...args})=>{const[value,setValue]=(0,react__WEBPACK_IMPORTED_MODULE_0__.useState)(0);return(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx)("div",{style:{width:"400px",height:"50px"},children:(0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_2__.jsx)(___WEBPACK_IMPORTED_MODULE_1__.Z,{...args,value,onChange:e=>{const target=e.target;setValue(target.value)}})})};Template.displayName="Template";const Default=Template.bind({});Default.args={min:0,max:5,step:.1,withPouring:!1},Default.parameters={...Default.parameters,docs:{...Default.parameters?.docs,source:{originalSource:'({\n  ...args\n}) => {\n  const [value, setValue] = useState(0);\n  const handleChange = e => {\n    const target = e.target;\n    setValue(target.value);\n  };\n  return <div style={{\n    width: "400px",\n    height: "50px"\n  }}>\r\n      <Slider {...args} value={value} onChange={handleChange} />\r\n    </div>;\n}',...Default.parameters?.docs?.source}}};const __namedExportsOrder=["Default"]}}]);