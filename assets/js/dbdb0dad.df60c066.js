"use strict";(self.webpackChunkstadata_flutter_sdk=self.webpackChunkstadata_flutter_sdk||[]).push([[5284],{7863:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>a,contentTitle:()=>i,default:()=>o,frontMatter:()=>r,metadata:()=>c,toc:()=>l});var s=n(4848),d=n(8453);const r={},i="News",c={id:"api-docs/view/news",title:"News",description:"This method is used to retrieve detailed information about a specific news.",source:"@site/docs/api-docs/view/news.md",sourceDirName:"api-docs/view",slug:"/api-docs/view/news",permalink:"/stadata_flutter_sdk/docs/api-docs/view/news",draft:!1,unlisted:!1,editUrl:"https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/docs/docs/api-docs/view/news.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Intro",permalink:"/stadata_flutter_sdk/docs/api-docs/view/intro"},next:{title:"Press Release",permalink:"/stadata_flutter_sdk/docs/api-docs/view/press-release"}},a={},l=[{value:"Parameters",id:"parameters",level:2},{value:"Example",id:"example",level:2},{value:"Properties (News)",id:"properties-news",level:2}];function h(e){const t={code:"code",h1:"h1",h2:"h2",header:"header",img:"img",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,d.R)(),...e.components};return(0,s.jsxs)(s.Fragment,{children:[(0,s.jsx)(t.header,{children:(0,s.jsx)(t.h1,{id:"news",children:"News"})}),"\n",(0,s.jsx)(t.p,{children:"This method is used to retrieve detailed information about a specific news."}),"\n",(0,s.jsx)(t.h2,{id:"parameters",children:"Parameters"}),"\n",(0,s.jsxs)(t.table,{children:[(0,s.jsx)(t.thead,{children:(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.th,{children:"Parameter"}),(0,s.jsx)(t.th,{children:"Type"}),(0,s.jsx)(t.th,{children:"Description"})]})}),(0,s.jsxs)(t.tbody,{children:[(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"id"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"int"})}),(0,s.jsx)(t.td,{children:"The unique identifier of the news."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"domain"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"String"})}),(0,s.jsx)(t.td,{children:"The domain (region) code for retrieving news detail."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"lang"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"DataLanguage"})}),(0,s.jsxs)(t.td,{children:["The language for news data (default: ",(0,s.jsx)(t.code,{children:"DataLanguage.id"}),")."]})]})]})]}),"\n",(0,s.jsx)(t.h2,{id:"example",children:"Example"}),"\n",(0,s.jsx)(t.p,{children:"Example usage and sample output:"}),"\n",(0,s.jsx)(t.p,{children:(0,s.jsx)(t.img,{alt:"Preview",src:n(7192).A+"",width:"296",height:"640"})}),"\n",(0,s.jsx)(t.pre,{children:(0,s.jsx)(t.code,{className:"language-dart",children:"// Fetch news detail from BPS API\nfinal news = await StadataFlutter.instance.view.news(id: 12:, domain: '7200');\n\n// Print the retrieved news category data\nprint('News ID: ${news.id}');\nprint('Category: ${news.category}');\nprint('Title: ${news.title}');\nprint('Content: ${news.content}');\nprint('Release Date: ${news.releaseDate}');\nprint('Picture: ${news.picture}');\nprint('------------------------');\n"})}),"\n",(0,s.jsx)(t.h2,{id:"properties-news",children:"Properties (News)"}),"\n",(0,s.jsxs)(t.table,{children:[(0,s.jsx)(t.thead,{children:(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.th,{children:"Property"}),(0,s.jsx)(t.th,{children:"Type"}),(0,s.jsx)(t.th,{children:"Description"})]})}),(0,s.jsxs)(t.tbody,{children:[(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"id"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"int"})}),(0,s.jsx)(t.td,{children:"The unique identifier for the news."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"categoryId"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"String"})}),(0,s.jsx)(t.td,{children:"The category identifier for the news (optional)."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"category"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"String?"})}),(0,s.jsx)(t.td,{children:"The name of the news category (optional)."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"title"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"String"})}),(0,s.jsx)(t.td,{children:"The title of the news."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"content"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"String"})}),(0,s.jsx)(t.td,{children:"The content of the news."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"releaseDate"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"DateTime"})}),(0,s.jsx)(t.td,{children:"The date when the news was released."})]}),(0,s.jsxs)(t.tr,{children:[(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"picture"})}),(0,s.jsx)(t.td,{children:(0,s.jsx)(t.code,{children:"String"})}),(0,s.jsx)(t.td,{children:"The picture associated with the news."})]})]})]})]})}function o(e={}){const{wrapper:t}={...(0,d.R)(),...e.components};return t?(0,s.jsx)(t,{...e,children:(0,s.jsx)(h,{...e})}):h(e)}},7192:(e,t,n)=>{n.d(t,{A:()=>s});const s=n.p+"assets/images/news-77b830f5b4ad365ccf15a5b10e9c742e.gif"},8453:(e,t,n)=>{n.d(t,{R:()=>i,x:()=>c});var s=n(6540);const d={},r=s.createContext(d);function i(e){const t=s.useContext(r);return s.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function c(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(d):e.components||d:i(e.components),s.createElement(r.Provider,{value:t},e.children)}}}]);