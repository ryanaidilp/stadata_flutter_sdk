"use strict";(self.webpackChunkstadata_flutter_sdk=self.webpackChunkstadata_flutter_sdk||[]).push([[5115],{3642:(e,n,i)=>{i.r(n),i.d(n,{assets:()=>d,contentTitle:()=>l,default:()=>h,frontMatter:()=>a,metadata:()=>r,toc:()=>o});var t=i(4848),s=i(8453);const a={},l="List",r={id:"usage/list",title:"List",description:"The list property returns a ListResult class, which includes two main properties:",source:"@site/versioned_docs/version-0.7.0/usage/list.md",sourceDirName:"usage",slug:"/usage/list",permalink:"/stadata_flutter_sdk/docs/0.7.0/usage/list",draft:!1,unlisted:!1,editUrl:"https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/docs/versioned_docs/version-0.7.0/usage/list.md",tags:[],version:"0.7.0",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Enums",permalink:"/stadata_flutter_sdk/docs/0.7.0/usage/enums"},next:{title:"View",permalink:"/stadata_flutter_sdk/docs/0.7.0/usage/view"}},d={},o=[];function c(e){const n={code:"code",h1:"h1",header:"header",li:"li",ol:"ol",p:"p",pre:"pre",strong:"strong",ul:"ul",...(0,s.R)(),...e.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(n.header,{children:(0,t.jsx)(n.h1,{id:"list",children:"List"})}),"\n",(0,t.jsxs)(n.p,{children:["The ",(0,t.jsx)(n.code,{children:"list"})," property returns a ",(0,t.jsx)(n.code,{children:"ListResult"})," class, which includes two main properties:"]}),"\n",(0,t.jsxs)(n.ol,{children:["\n",(0,t.jsxs)(n.li,{children:["\n",(0,t.jsx)(n.p,{children:(0,t.jsx)(n.strong,{children:"Data Property:"})}),"\n",(0,t.jsxs)(n.ul,{children:["\n",(0,t.jsxs)(n.li,{children:["The ",(0,t.jsx)(n.code,{children:"data"})," property contains a list of data based on the specified type. For instance, if you are fetching publications, the data will be of type ",(0,t.jsx)(n.code,{children:"List<Publication>"}),"."]}),"\n"]}),"\n"]}),"\n",(0,t.jsxs)(n.li,{children:["\n",(0,t.jsx)(n.p,{children:(0,t.jsx)(n.strong,{children:"Pagination Property:"})}),"\n",(0,t.jsxs)(n.ul,{children:["\n",(0,t.jsxs)(n.li,{children:["The ",(0,t.jsx)(n.code,{children:"pagination"})," property is an instance of the ",(0,t.jsx)(n.code,{children:"Pagination"})," entity, which provides information related to pagination. It includes the following properties:","\n",(0,t.jsxs)(n.ul,{children:["\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"page"}),": The current page."]}),"\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"pages"}),": The total number of pages."]}),"\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"count"}),": The count of data entries on the current page."]}),"\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"perPage"}),": The number of entries per page."]}),"\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"total"}),": The total number of data entries."]}),"\n"]}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,t.jsxs)(n.li,{children:["\n",(0,t.jsx)(n.p,{children:(0,t.jsx)(n.strong,{children:"Data Availability Property:"})}),"\n",(0,t.jsxs)(n.ul,{children:["\n",(0,t.jsxs)(n.li,{children:["The ",(0,t.jsx)(n.code,{children:"dataAvailability"})," property is an enum from ",(0,t.jsx)(n.code,{children:"DataAvailability"})," enum, which provides information related to data availability. It includes the following values:","\n",(0,t.jsxs)(n.ul,{children:["\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"DataAvailability.available"}),": Indicating data is available."]}),"\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"DataAvailability.listUnavailable"}),": Indicating the requested list not available."]}),"\n",(0,t.jsxs)(n.li,{children:[(0,t.jsx)(n.code,{children:"DataAvailability.unavailable"}),": Indicating the requested data not available."]}),"\n"]}),"\n"]}),"\n"]}),"\n"]}),"\n"]}),"\n",(0,t.jsx)(n.p,{children:"To retrieve a list of models, follow these steps:"}),"\n",(0,t.jsxs)(n.ol,{children:["\n",(0,t.jsxs)(n.li,{children:["\n",(0,t.jsxs)(n.p,{children:["Create an instance of ",(0,t.jsx)(n.code,{children:"StadataFlutter"}),"."]}),"\n"]}),"\n",(0,t.jsxs)(n.li,{children:["\n",(0,t.jsxs)(n.p,{children:["Access the ",(0,t.jsx)(n.code,{children:"list"})," getter from the instance, granting you access to various models from domains, publications, press releases, and more."]}),"\n"]}),"\n",(0,t.jsxs)(n.li,{children:["\n",(0,t.jsxs)(n.p,{children:["Use the ",(0,t.jsx)(n.code,{children:"list"})," method with the desired parameters. For example:"]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-dart",children:"var result = await StadataFlutter.instance.list.publications(domain: '7200');\n"})}),"\n"]}),"\n"]}),"\n",(0,t.jsxs)(n.p,{children:["This call will provide you with a ",(0,t.jsx)(n.code,{children:"ListResult"})," containing data of type ",(0,t.jsx)(n.code,{children:"List<Publication>"})," and pagination information for further navigation."]})]})}function h(e={}){const{wrapper:n}={...(0,s.R)(),...e.components};return n?(0,t.jsx)(n,{...e,children:(0,t.jsx)(c,{...e})}):c(e)}},8453:(e,n,i)=>{i.d(n,{R:()=>l,x:()=>r});var t=i(6540);const s={},a=t.createContext(s);function l(e){const n=t.useContext(a);return t.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function r(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:l(e.components),t.createElement(a.Provider,{value:n},e.children)}}}]);