"use strict";(self.webpackChunkstadata_flutter_sdk=self.webpackChunkstadata_flutter_sdk||[]).push([[3147],{9785:(e,t,i)=>{i.r(t),i.d(t,{assets:()=>c,contentTitle:()=>s,default:()=>o,frontMatter:()=>d,metadata:()=>a,toc:()=>l});var n=i(4848),r=i(8453);const d={},s="Berita",a={id:"api-docs/view/news",title:"Berita",description:"Metode ini digunakan untuk mengambil informasi terperinci tentang berita tertentu.",source:"@site/i18n/id/docusaurus-plugin-content-docs/current/api-docs/view/news.md",sourceDirName:"api-docs/view",slug:"/api-docs/view/news",permalink:"/stadata_flutter_sdk/id/docs/api-docs/view/news",draft:!1,unlisted:!1,editUrl:"https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/docs/docs/api-docs/view/news.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Pengantar",permalink:"/stadata_flutter_sdk/id/docs/api-docs/view/intro"},next:{title:"Siaran Pers",permalink:"/stadata_flutter_sdk/id/docs/api-docs/view/press-release"}},c={},l=[{value:"Parameter",id:"parameter",level:2},{value:"Contoh",id:"contoh",level:2},{value:"Properti (News)",id:"properti-news",level:2}];function h(e){const t={code:"code",h1:"h1",h2:"h2",header:"header",img:"img",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,r.R)(),...e.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(t.header,{children:(0,n.jsx)(t.h1,{id:"berita",children:"Berita"})}),"\n",(0,n.jsx)(t.p,{children:"Metode ini digunakan untuk mengambil informasi terperinci tentang berita tertentu."}),"\n",(0,n.jsx)(t.h2,{id:"parameter",children:"Parameter"}),"\n",(0,n.jsxs)(t.table,{children:[(0,n.jsx)(t.thead,{children:(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.th,{children:"Parameter"}),(0,n.jsx)(t.th,{children:"Tipe"}),(0,n.jsx)(t.th,{children:"Deskripsi"})]})}),(0,n.jsxs)(t.tbody,{children:[(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"id"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"int"})}),(0,n.jsx)(t.td,{children:"Identifier unik untuk berita."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"domain"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String"})}),(0,n.jsx)(t.td,{children:"Kode domain (wilayah) untuk mengambil detail berita."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"lang"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"DataLanguage"})}),(0,n.jsxs)(t.td,{children:["Bahasa untuk data berita (default: ",(0,n.jsx)(t.code,{children:"DataLanguage.id"}),")."]})]})]})]}),"\n",(0,n.jsx)(t.h2,{id:"contoh",children:"Contoh"}),"\n",(0,n.jsx)(t.p,{children:"Contoh penggunaan dan hasil contoh:"}),"\n",(0,n.jsx)(t.p,{children:(0,n.jsx)(t.img,{alt:"Preview",src:i(7192).A+"",width:"296",height:"640"})}),"\n",(0,n.jsx)(t.pre,{children:(0,n.jsx)(t.code,{className:"language-dart",children:"// Mengambil detail berita dari API BPS\nfinal berita = await StadataFlutter.instance.view.news(id: 12, domain: '7200');\n\n// Mencetak data kategori berita yang diambil\nprint('ID Berita: ${berita.id}');\nprint('Kategori: ${berita.category}');\nprint('Judul: ${berita.title}');\nprint('Konten: ${berita.content}');\nprint('Tanggal Rilis: ${berita.releaseDate}');\nprint('Gambar: ${berita.picture}');\nprint('------------------------');\n"})}),"\n",(0,n.jsx)(t.h2,{id:"properti-news",children:"Properti (News)"}),"\n",(0,n.jsxs)(t.table,{children:[(0,n.jsx)(t.thead,{children:(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.th,{children:"Properti"}),(0,n.jsx)(t.th,{children:"Tipe"}),(0,n.jsx)(t.th,{children:"Deskripsi"})]})}),(0,n.jsxs)(t.tbody,{children:[(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"id"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"int"})}),(0,n.jsx)(t.td,{children:"Identifier unik untuk berita."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"categoryId"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String"})}),(0,n.jsx)(t.td,{children:"Identifier kategori untuk berita (opsional)."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"category"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String?"})}),(0,n.jsx)(t.td,{children:"Nama kategori berita (opsional)."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"title"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String"})}),(0,n.jsx)(t.td,{children:"Judul berita."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"content"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String"})}),(0,n.jsx)(t.td,{children:"Isi berita."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"releaseDate"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"DateTime"})}),(0,n.jsx)(t.td,{children:"Tanggal rilis berita."})]}),(0,n.jsxs)(t.tr,{children:[(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"picture"})}),(0,n.jsx)(t.td,{children:(0,n.jsx)(t.code,{children:"String"})}),(0,n.jsx)(t.td,{children:"Gambar yang terkait dengan berita."})]})]})]})]})}function o(e={}){const{wrapper:t}={...(0,r.R)(),...e.components};return t?(0,n.jsx)(t,{...e,children:(0,n.jsx)(h,{...e})}):h(e)}},7192:(e,t,i)=>{i.d(t,{A:()=>n});const n=i.p+"assets/images/news-77b830f5b4ad365ccf15a5b10e9c742e.gif"},8453:(e,t,i)=>{i.d(t,{R:()=>s,x:()=>a});var n=i(6540);const r={},d=n.createContext(r);function s(e){const t=n.useContext(d);return n.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function a(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:s(e.components),n.createElement(d.Provider,{value:t},e.children)}}}]);