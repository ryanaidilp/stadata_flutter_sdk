"use strict";(self.webpackChunkstadata_flutter_sdk=self.webpackChunkstadata_flutter_sdk||[]).push([[9837],{131:(a,n,e)=>{e.r(n),e.d(n,{assets:()=>l,contentTitle:()=>d,default:()=>p,frontMatter:()=>s,metadata:()=>r,toc:()=>u});var t=e(4848),i=e(8453);const s={sidebar_position:2},d="Instalasi",r={id:"quick-start",title:"Instalasi",description:"Ikuti langkah-langkah ini untuk dengan cepat mengintegrasikan Stadata Flutter SDK ke dalam proyek Flutter Anda.",source:"@site/i18n/id/docusaurus-plugin-content-docs/version-0.7.1/quick-start.md",sourceDirName:".",slug:"/quick-start",permalink:"/stadata_flutter_sdk/id/docs/0.7.1/quick-start",draft:!1,unlisted:!1,editUrl:"https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/docs/versioned_docs/version-0.7.1/quick-start.md",tags:[],version:"0.7.1",sidebarPosition:2,frontMatter:{sidebar_position:2},sidebar:"tutorialSidebar",previous:{title:"Memulai",permalink:"/stadata_flutter_sdk/id/docs/0.7.1/intro"},next:{title:"Contoh Aplikasi",permalink:"/stadata_flutter_sdk/id/docs/0.7.1/try-the-example"}},l={},u=[{value:"Perbarui Dependensi Anda",id:"perbarui-dependensi-anda",level:2},{value:"Install Dependensi",id:"install-dependensi",level:2},{value:"Inisialisasi SDK",id:"inisialisasi-sdk",level:2},{value:"Mulai Menggunakan STADATA Flutter SDK",id:"mulai-menggunakan-stadata-flutter-sdk",level:2}];function c(a){const n={a:"a",admonition:"admonition",code:"code",h1:"h1",h2:"h2",header:"header",p:"p",pre:"pre",...(0,i.R)(),...a.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(n.header,{children:(0,t.jsx)(n.h1,{id:"instalasi",children:"Instalasi"})}),"\n",(0,t.jsx)(n.p,{children:"Ikuti langkah-langkah ini untuk dengan cepat mengintegrasikan Stadata Flutter SDK ke dalam proyek Flutter Anda."}),"\n",(0,t.jsx)(n.h2,{id:"perbarui-dependensi-anda",children:"Perbarui Dependensi Anda"}),"\n",(0,t.jsxs)(n.p,{children:["Pertama, pastikan dependensi ",(0,t.jsx)(n.code,{children:"stadata_flutter_sdk"})," Anda sudah terbaru dengan menyertakan versi terbaru di file ",(0,t.jsx)(n.code,{children:"pubspec.yaml"})," Anda. Anda dapat memeriksa versi terbaru yang tersedia di ",(0,t.jsx)(n.a,{href:"https://pub.dev/packages/stadata_flutter_sdk",children:"pub.dev"}),"."]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-yaml",children:"dependencies:\n  stadata_flutter_sdk: ^latest_version\n"})}),"\n",(0,t.jsxs)(n.p,{children:["Ganti ",(0,t.jsx)(n.code,{children:"^latest_version"})," dengan nomor versi terbaru yang sebenarnya."]}),"\n",(0,t.jsx)(n.h2,{id:"install-dependensi",children:"Install Dependensi"}),"\n",(0,t.jsxs)(n.p,{children:["Setelah memperbarui ",(0,t.jsx)(n.code,{children:"pubspec.yaml"}),", jalankan perintah berikut untuk mengunduh dan memasang paket SDK:"]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-bash",children:"flutter pub get\n"})}),"\n",(0,t.jsxs)(n.p,{children:["Anda juga dapat memasangnya melalui ",(0,t.jsx)(n.code,{children:"cli"})," dengan menggunakan perintah ini:"]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-sh",children:"flutter pub add stadata_flutter_sdk\n"})}),"\n",(0,t.jsx)(n.h2,{id:"inisialisasi-sdk",children:"Inisialisasi SDK"}),"\n",(0,t.jsxs)(n.p,{children:["Inisialisasikan Stadata Flutter SDK di file ",(0,t.jsx)(n.code,{children:"main.dart"})," Anda dan pastikan untuk menyertakan token API Anda. Ganti ",(0,t.jsx)(n.code,{children:"'YOUR_API_KEY'"})," dengan kunci API sebenarnya yang Anda dapatkan dari ",(0,t.jsx)(n.a,{href:"https://webapi.bps.go.id/developer",children:"Web API BPS"}),"."]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-dart",children:"import 'package:flutter/material.dart';\nimport 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';\n\nvoid main() async {\n  // Pastikan Flutter sudah diinisialisasi\n  WidgetsFlutterBinding.ensureInitialized();\n\n  // Inisialisasikan instansi Stadata Flutter dengan kunci API Anda\n  await StadataFlutter.instance.init(\n    apiKey: 'YOUR_API_KEY',\n  );\n\n  // Titik masuk aplikasi Anda\n  runApp(MyApp());\n}\n"})}),"\n",(0,t.jsx)(n.admonition,{title:"Catatan Penting",type:"caution",children:(0,t.jsxs)(n.p,{children:["Pastikan Anda memanggil ",(0,t.jsx)(n.code,{children:"WidgetsFlutterBinding.ensureInitialized()"})," sebelum melakukan inisialisasi SDK dan pastikan insialisasi dilakukan sebelum ",(0,t.jsx)(n.code,{children:"runApp()"}),"!"]})}),"\n",(0,t.jsx)(n.h2,{id:"mulai-menggunakan-stadata-flutter-sdk",children:"Mulai Menggunakan STADATA Flutter SDK"}),"\n",(0,t.jsx)(n.p,{children:"Setelah SDK diinisialisasi, Anda siap untuk mulai menggunakan API Stadata dalam aplikasi Flutter Anda. Lihat dokumentasi dan contoh SDK untuk mempelajari cara mengambil dan mengintegrasikan data ke dalam aplikasi Anda."}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-dart",children:"// Contoh: Mengambil data menggunakan SDK\nfinal response = await StadataFlutter.instance.list.domains();\n// Tangani respons dan perbarui antarmuka aplikasi Anda sesuai kebutuhan.\n"})}),"\n",(0,t.jsx)(n.p,{children:"Itu saja! Anda telah berhasil mengintegrasikan Stadata Flutter SDK ke dalam proyek Anda. Anda sekarang dapat mulai menggunakan data dan fitur yang disediakan oleh Stadata dalam aplikasi Flutter Anda."}),"\n",(0,t.jsxs)(n.p,{children:["Sekarang, Anda siap untuk menjelajahi kemampuan ",(0,t.jsx)(n.code,{children:"STADATA Flutter SDK"})," dalam aplikasi Flutter Anda."]})]})}function p(a={}){const{wrapper:n}={...(0,i.R)(),...a.components};return n?(0,t.jsx)(n,{...a,children:(0,t.jsx)(c,{...a})}):c(a)}},8453:(a,n,e)=>{e.d(n,{R:()=>d,x:()=>r});var t=e(6540);const i={},s=t.createContext(i);function d(a){const n=t.useContext(s);return t.useMemo((function(){return"function"==typeof a?a(n):{...n,...a}}),[n,a])}function r(a){let n;return n=a.disableParentContext?"function"==typeof a.components?a.components(i):a.components||i:d(a.components),t.createElement(s.Provider,{value:n},a.children)}}}]);