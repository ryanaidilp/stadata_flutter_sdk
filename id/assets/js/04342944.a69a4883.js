"use strict";(self.webpackChunkstadata_flutter_sdk=self.webpackChunkstadata_flutter_sdk||[]).push([[3181],{72:(e,r,s)=>{s.r(r),s.d(r,{assets:()=>l,contentTitle:()=>d,default:()=>o,frontMatter:()=>t,metadata:()=>a,toc:()=>c});var i=s(4848),n=s(8453);const t={},d="Siaran Pers",a={id:"api-docs/view/press-release",title:"Siaran Pers",description:"Metode ini digunakan untuk mengambil informasi detail tentang siaran pers tertentu.",source:"@site/i18n/id/docusaurus-plugin-content-docs/version-0.6.3/api-docs/view/press-release.md",sourceDirName:"api-docs/view",slug:"/api-docs/view/press-release",permalink:"/stadata_flutter_sdk/id/docs/0.6.3/api-docs/view/press-release",draft:!1,unlisted:!1,editUrl:"https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/docs/versioned_docs/version-0.6.3/api-docs/view/press-release.md",tags:[],version:"0.6.3",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Berita",permalink:"/stadata_flutter_sdk/id/docs/0.6.3/api-docs/view/news"},next:{title:"Publikasi",permalink:"/stadata_flutter_sdk/id/docs/0.6.3/api-docs/view/publication"}},l={},c=[{value:"Parameter",id:"parameter",level:2},{value:"Contoh",id:"contoh",level:2},{value:"Properti (PressRelease)",id:"properti-pressrelease",level:2}];function h(e){const r={code:"code",h1:"h1",h2:"h2",header:"header",img:"img",p:"p",pre:"pre",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",...(0,n.R)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(r.header,{children:(0,i.jsx)(r.h1,{id:"siaran-pers",children:"Siaran Pers"})}),"\n",(0,i.jsx)(r.p,{children:"Metode ini digunakan untuk mengambil informasi detail tentang siaran pers tertentu."}),"\n",(0,i.jsx)(r.h2,{id:"parameter",children:"Parameter"}),"\n",(0,i.jsxs)(r.table,{children:[(0,i.jsx)(r.thead,{children:(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.th,{children:"Parameter"}),(0,i.jsx)(r.th,{children:"Tipe"}),(0,i.jsx)(r.th,{children:"Deskripsi"})]})}),(0,i.jsxs)(r.tbody,{children:[(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"id"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"int"})}),(0,i.jsx)(r.td,{children:"Pengenal unik dari siaran pers tersebut."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"domain"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"String"})}),(0,i.jsx)(r.td,{children:"Kode domain (wilayah) untuk mengambil detail siaran pers."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"lang"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"DataLanguage"})}),(0,i.jsxs)(r.td,{children:["Bahasa untuk data siaran pers (default: ",(0,i.jsx)(r.code,{children:"DataLanguage.id"}),")."]})]})]})]}),"\n",(0,i.jsx)(r.h2,{id:"contoh",children:"Contoh"}),"\n",(0,i.jsx)(r.p,{children:"Contoh penggunaan dan hasil contoh:"}),"\n",(0,i.jsx)(r.p,{children:(0,i.jsx)(r.img,{alt:"Preview",src:s(227).A+"",width:"296",height:"640"})}),"\n",(0,i.jsx)(r.pre,{children:(0,i.jsx)(r.code,{className:"language-dart",children:"// Ambil detail rilis pers dari API BPS\nfinal siaranPers = await StadataFlutter.instance.view.siaranPers(id: 1234, domain: '7200');\n\n// Tampilkan data siaran pers yang diambil\nprint('ID Siaran Pers: ${siaranPers.id}');\nprint('Judul: ${siaranPers.title}');\nprint('Abstrak: ${siaranPers.abstract}');\nprint('Tanggal Rilis: ${siaranPers.releaseDate}');\nprint('Cover: ${siaranPers.cover}');\nprint('Ukuran File: ${siaranPers.size}');\nprint('URL PDF: ${siaranPers.pdf}');\nprint('URL Slide: ${siaranPers.slide}');\nprint('Diperbarui Pada: ${siaranPers.updatedAt}');\n"})}),"\n",(0,i.jsx)(r.h2,{id:"properti-pressrelease",children:"Properti (PressRelease)"}),"\n",(0,i.jsxs)(r.table,{children:[(0,i.jsx)(r.thead,{children:(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.th,{children:"Properti"}),(0,i.jsx)(r.th,{children:"Tipe"}),(0,i.jsx)(r.th,{children:"Deskripsi"})]})}),(0,i.jsxs)(r.tbody,{children:[(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"id"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"int"})}),(0,i.jsx)(r.td,{children:"Pengenal unik dari siaran pers tersebut."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"title"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"String"})}),(0,i.jsx)(r.td,{children:"Judul dari siaran pers tersebut."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"subject"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"Subject?"})}),(0,i.jsx)(r.td,{children:"Subjek opsional dari siaran pers tersebut."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"size"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"String"})}),(0,i.jsx)(r.td,{children:"Ukuran file."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"pdf"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"String"})}),(0,i.jsx)(r.td,{children:"Tautan atau referensi ke file PDF terkait untuk siaran pers tersebut."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"cover"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"String"})}),(0,i.jsx)(r.td,{children:"Gambar miniatur dari siaran pers tersebut."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"abstract"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"String?"})}),(0,i.jsx)(r.td,{children:"Abstrak dari siaran pers tersebut."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"updatedAt"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"DateTime"})}),(0,i.jsx)(r.td,{children:"Tanggal dan waktu ketika tabel terakhir diperbarui."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"releaseDate"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"DateTime?"})}),(0,i.jsx)(r.td,{children:"Tanggal dan waktu opsional ketika tabel tersebut dibuat."})]}),(0,i.jsxs)(r.tr,{children:[(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"slide"})}),(0,i.jsx)(r.td,{children:(0,i.jsx)(r.code,{children:"String"})}),(0,i.jsx)(r.td,{children:"Tautan atau referensi ke file Slide terkait untuk siaran pers tersebut."})]})]})]})]})}function o(e={}){const{wrapper:r}={...(0,n.R)(),...e.components};return r?(0,i.jsx)(r,{...e,children:(0,i.jsx)(h,{...e})}):h(e)}},227:(e,r,s)=>{s.d(r,{A:()=>i});const i=s.p+"assets/images/press_releases-d4648a8a83e6f684ab790c0a3ec35b03.gif"},8453:(e,r,s)=>{s.d(r,{R:()=>d,x:()=>a});var i=s(6540);const n={},t=i.createContext(n);function d(e){const r=i.useContext(t);return i.useMemo((function(){return"function"==typeof e?e(r):{...r,...e}}),[r,e])}function a(e){let r;return r=e.disableParentContext?"function"==typeof e.components?e.components(n):e.components||n:d(e.components),i.createElement(t.Provider,{value:r},e.children)}}}]);