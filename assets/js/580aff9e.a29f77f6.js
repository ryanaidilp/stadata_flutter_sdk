"use strict";(self.webpackChunkstadata_flutter_sdk=self.webpackChunkstadata_flutter_sdk||[]).push([[3251],{7165:(e,t,s)=>{s.r(t),s.d(t,{assets:()=>a,contentTitle:()=>d,default:()=>h,frontMatter:()=>r,metadata:()=>c,toc:()=>l});var n=s(4848),i=s(8453);const r={},d="Subjects",c={id:"api-docs/list/subjects",title:"Subjects",description:"This method is used to retrieve a list of subject based on the selected domain (region).",source:"@site/versioned_docs/version-0.7.0/api-docs/list/subjects.md",sourceDirName:"api-docs/list",slug:"/api-docs/list/subjects",permalink:"/stadata_flutter_sdk/docs/0.7.0/api-docs/list/subjects",draft:!1,unlisted:!1,editUrl:"https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/docs/versioned_docs/version-0.7.0/api-docs/list/subjects.md",tags:[],version:"0.7.0",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Subject Categories",permalink:"/stadata_flutter_sdk/docs/0.7.0/api-docs/list/subject-categories"},next:{title:"View",permalink:"/stadata_flutter_sdk/docs/0.7.0/category/view"}},a={},l=[{value:"Parameters",id:"parameters",level:2},{value:"Example",id:"example",level:2},{value:"Properties (Subject)",id:"properties-subject",level:2}];function o(e){const t={code:"code",h1:"h1",h2:"h2",header:"header",img:"img",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,i.R)(),...e.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(t.header,{children:(0,n.jsx)(t.h1,{id:"subjects",children:"Subjects"})}),"\n",(0,n.jsx)(t.p,{children:"This method is used to retrieve a list of subject based on the selected domain (region)."}),"\n",(0,n.jsx)(t.h2,{id:"parameters",children:"Parameters"}),"\n",(0,n.jsxs)(t.table,{children:[(0,n.jsx)(t.thead,{children:(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.th,{children:"Parameter"}),(0,n.jsx)(t.th,{children:"Type"}),(0,n.jsx)(t.th,{children:"Description"})]})}),(0,n.jsxs)(t.tbody,{children:[(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"domain"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String"})}),(0,n.jsx)(t.td,{children:"The domain (region) code for retrieving subject."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"lang"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"DataLanguage"})}),(0,n.jsxs)(t.td,{children:["The language for subject data (default: ",(0,n.jsx)(t.code,{children:"DataLanguage.id"}),")."]})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"page"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"int"})}),(0,n.jsxs)(t.td,{children:["The page number (default: ",(0,n.jsx)(t.code,{children:"1"}),")."]})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"subjectCategoryId"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"int?"})}),(0,n.jsx)(t.td,{children:"ID of the subject category for filtering subject (optional)."})]})]})]}),"\n",(0,n.jsx)(t.h2,{id:"example",children:"Example"}),"\n",(0,n.jsx)(t.p,{children:"Example usage and sample output:"}),"\n",(0,n.jsx)(t.p,{children:(0,n.jsx)(t.img,{alt:"Preview",src:s(6998).A+"",width:"296",height:"640"})}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{className:"language-dart",children:"// Fetch news categories data from BPS API\nfinal result = await StadataFlutter.instance.list.subjects(domain: '7200');\nfinal subjectList = result.data;\nfinal pagination = result.pagination;\n\n\n// Print pagination info\nprint('Current Page: ${pagination.page}');\nprint('Total Pages: ${pagination.pages}');\nprint('Data Count in This Page: ${pagination.count}');\nprint('Per Page: ${pagination.perPage}');\nprint('Total: ${pagination.total}');\nprint('------------------------');\n\n// Print the retrieved subject data\nfor (final subject in subjectList) {\n    print('Subject ID: ${subject.id}');\n    print('Subject Name: ${subject.name}');\n    print('Subject Category ID: ${subject.category?.id}');\n    print('Subject Category Name: ${subject.category?.name}');\n    print('Subject N Table: ${subject.nTable}');\n}\n"})}),"\n",(0,n.jsx)(t.h2,{id:"properties-subject",children:"Properties (Subject)"}),"\n",(0,n.jsxs)(t.table,{children:[(0,n.jsx)(t.thead,{children:(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.th,{children:"Property"}),(0,n.jsx)(t.th,{children:"Type"}),(0,n.jsx)(t.th,{children:"Description"})]})}),(0,n.jsxs)(t.tbody,{children:[(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"id"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"int"})}),(0,n.jsx)(t.td,{children:"The unique identifier for the subject."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"name"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String"})}),(0,n.jsx)(t.td,{children:"The name for the subject."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"category"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"SubjectCategory?"})}),(0,n.jsx)(t.td,{children:"The category for the subject."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"nTable"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"int?"})}),(0,n.jsx)(t.td,{children:"Sum of the table of the subject."})]})]})]})]})}function h(e={}){const{wrapper:t}={...(0,i.R)(),...e.components};return t?(0,n.jsx)(t,{...e,children:(0,n.jsx)(o,{...e})}):o(e)}},6998:(e,t,s)=>{s.d(t,{A:()=>n});const n=s.p+"assets/images/subjects-4de9c2c93ccab6bb9f85c02b0c2e74da.gif"},8453:(e,t,s)=>{s.d(t,{R:()=>d,x:()=>c});var n=s(6540);const i={},r=n.createContext(i);function d(e){const t=n.useContext(r);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function c(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:d(e.components),n.createElement(r.Provider,{value:t},e.children)}}}]);