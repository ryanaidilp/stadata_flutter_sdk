"use strict";(self.webpackChunkstadata_flutter_sdk=self.webpackChunkstadata_flutter_sdk||[]).push([[4499],{4245:(e,i,s)=>{s.r(i),s.d(i,{assets:()=>l,contentTitle:()=>r,default:()=>o,frontMatter:()=>n,metadata:()=>c,toc:()=>a});var t=s(4848),d=s(8453);const n={},r="Statistical Classification (KBKI & KBLI)",c={id:"api-docs/list/statistic-classifications",title:"Statistical Classification (KBKI & KBLI)",description:"This method is used to retrieve the list of Indonesian Standard Industrial Classification (KBLI) & Indonesian Standard Commodity Classification (KBKI) from the BPS API. It enables users to access information regarding classification codes and their descriptions.",source:"@site/docs/api-docs/list/statistic-classifications.md",sourceDirName:"api-docs/list",slug:"/api-docs/list/statistic-classifications",permalink:"/stadata_flutter_sdk/docs/api-docs/list/statistic-classifications",draft:!1,unlisted:!1,editUrl:"https://github.com/ryanaidilp/stadata_flutter_sdk/tree/main/docs/docs/api-docs/list/statistic-classifications.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Static Tables",permalink:"/stadata_flutter_sdk/docs/api-docs/list/static-tables"},next:{title:"Strategic Indicators",permalink:"/stadata_flutter_sdk/docs/api-docs/list/strategic-indicators"}},l={},a=[{value:"Enums",id:"enums",level:2},{value:"ClassificationType",id:"classificationtype",level:3},{value:"ClassificationLevel",id:"classificationlevel",level:3},{value:"Parameters",id:"parameters",level:2},{value:"Example",id:"example",level:2},{value:"Properties",id:"properties",level:2}];function h(e){const i={code:"code",h1:"h1",h2:"h2",h3:"h3",header:"header",li:"li",p:"p",pre:"pre",strong:"strong",table:"table",tbody:"tbody",td:"td",th:"th",thead:"thead",tr:"tr",ul:"ul",...(0,d.R)(),...e.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(i.header,{children:(0,t.jsx)(i.h1,{id:"statistical-classification-kbki--kbli",children:"Statistical Classification (KBKI & KBLI)"})}),"\n",(0,t.jsx)(i.p,{children:"This method is used to retrieve the list of Indonesian Standard Industrial Classification (KBLI) & Indonesian Standard Commodity Classification (KBKI) from the BPS API. It enables users to access information regarding classification codes and their descriptions."}),"\n",(0,t.jsx)(i.h2,{id:"enums",children:"Enums"}),"\n",(0,t.jsx)(i.p,{children:"There are two enum classes that can be used as parameters."}),"\n",(0,t.jsx)(i.h3,{id:"classificationtype",children:"ClassificationType"}),"\n",(0,t.jsxs)(i.p,{children:[(0,t.jsx)(i.code,{children:"ClassificationType"})," is the base class for determining the type of classification. This class is then extended by ",(0,t.jsx)(i.code,{children:"KBLIType"})," and ",(0,t.jsx)(i.code,{children:"KBKIType"}),". Each of these classes has the following options."]}),"\n",(0,t.jsxs)(i.ul,{children:["\n",(0,t.jsxs)(i.li,{children:["\n",(0,t.jsx)(i.p,{children:(0,t.jsx)(i.strong,{children:"KBLIType"})}),"\n",(0,t.jsxs)(i.table,{children:[(0,t.jsx)(i.thead,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.th,{children:"Enum"}),(0,t.jsx)(i.th,{children:"Value"}),(0,t.jsx)(i.th,{children:"Description"})]})}),(0,t.jsxs)(i.tbody,{children:[(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLI.y2009"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"kbli2009"})}),(0,t.jsx)(i.td,{children:"KBLI year 2009"})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLI.y2015"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"kbli2015"})}),(0,t.jsx)(i.td,{children:"KBLI year 2015"})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLI.y2017"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"kbli2017"})}),(0,t.jsx)(i.td,{children:"KBLI year 2017"})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLI.y2020"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"kbli2020"})}),(0,t.jsx)(i.td,{children:"KBLI year 2020"})]})]})]}),"\n",(0,t.jsxs)(i.p,{children:["To make a request to the ",(0,t.jsx)(i.code,{children:"detail"})," endpoint, the KBLI code needs to be formatted in the ",(0,t.jsx)(i.code,{children:"kbli_year_code"})," format. This class also facilitates this formatting process through the ",(0,t.jsx)(i.code,{children:"urlParamGenerator"})," method which accepts the code parameter."]}),"\n",(0,t.jsx)(i.p,{children:"Example:"}),"\n",(0,t.jsx)(i.pre,{children:(0,t.jsx)(i.code,{className:"language-dart",children:"final url = KBLIType.y2009.urlParamGenerator('24');\n/// result: kbli_2009_24\nfinal value = KBLIType.y2009.value;\n/// result: kbli2009\nfinal year = KBLIType.y2009.year;\n/// result: 2009\n"})}),"\n"]}),"\n",(0,t.jsxs)(i.li,{children:["\n",(0,t.jsx)(i.p,{children:(0,t.jsx)(i.strong,{children:"KBKIType"})}),"\n",(0,t.jsxs)(i.table,{children:[(0,t.jsx)(i.thead,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.th,{children:"Enum"}),(0,t.jsx)(i.th,{children:"Value"}),(0,t.jsx)(i.th,{children:"Description"})]})}),(0,t.jsx)(i.tbody,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKI.y2015"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"kbki2015"})}),(0,t.jsx)(i.td,{children:"KBKI year 2015"})]})})]}),"\n",(0,t.jsxs)(i.p,{children:["To make a request to the ",(0,t.jsx)(i.code,{children:"detail"})," endpoint, the KBKI code needs to be formatted in the ",(0,t.jsx)(i.code,{children:"kbki_year_code"})," format. This class also facilitates this formatting process through the ",(0,t.jsx)(i.code,{children:"urlParamGenerator"})," method which accepts the code parameter."]}),"\n",(0,t.jsx)(i.p,{children:"Example:"}),"\n",(0,t.jsx)(i.pre,{children:(0,t.jsx)(i.code,{className:"language-dart",children:"final url = KBKIType.y2015.urlParamGenerator('24');\n/// result: kbki_2015_24\nfinal value = KBKIType.y2015.value;\n/// result: kbki2015\nfinal year = KBKIType.y2015.year;\n/// result: 2015\n"})}),"\n"]}),"\n"]}),"\n",(0,t.jsx)(i.h3,{id:"classificationlevel",children:"ClassificationLevel"}),"\n",(0,t.jsxs)(i.p,{children:[(0,t.jsx)(i.code,{children:"ClassificationLevel"})," is the base class for determining the group/level of classification. This class is then extended by ",(0,t.jsx)(i.code,{children:"KBLILevel"})," and ",(0,t.jsx)(i.code,{children:"KBKILevel"}),". Each of these classes has the following options."]}),"\n",(0,t.jsxs)(i.ul,{children:["\n",(0,t.jsxs)(i.li,{children:["\n",(0,t.jsx)(i.p,{children:(0,t.jsx)(i.strong,{children:"KBLILevel"})}),"\n",(0,t.jsxs)(i.table,{children:[(0,t.jsx)(i.thead,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.th,{children:"Enum"}),(0,t.jsx)(i.th,{children:"Value"}),(0,t.jsx)(i.th,{children:"Description"})]})}),(0,t.jsxs)(i.tbody,{children:[(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLILevel.category"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"category"})}),(0,t.jsx)(i.td,{children:"Represents the main classification. Marked with a single alphabet."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLILevel.primaryGroup"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"primary group"})}),(0,t.jsx)(i.td,{children:"Detailed description from category, each coded with two digits."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLILevel.group"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"group"})}),(0,t.jsx)(i.td,{children:"Further details from the primary group, each coded with three digits. The first two indicate the primary group and the last digit the economic activity."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLILevel.subGroup"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"subgroup"})}),(0,t.jsx)(i.td,{children:"Further detail from a group's economic activities, coded with four digits. The first three indicate the group and the last digit specifies the sub-group."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBLILevel.cluster"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"cluster"})}),(0,t.jsx)(i.td,{children:"Distinguishes activities within a subgroup into more homogeneous activities, coded with five digits."})]})]})]}),"\n",(0,t.jsxs)(i.p,{children:["This class also facilitates the KBLI code validation process through the ",(0,t.jsx)(i.code,{children:"validateCode"})," method."]}),"\n",(0,t.jsx)(i.p,{children:"Example:"}),"\n",(0,t.jsx)(i.pre,{children:(0,t.jsx)(i.code,{className:"language-dart",children:"final isValid = KBLILevel.category.validateCode('A');\n/// result: true\nfinal value = KBLILevel.category.value;\n/// result: category\n"})}),"\n"]}),"\n",(0,t.jsxs)(i.li,{children:["\n",(0,t.jsx)(i.p,{children:(0,t.jsx)(i.strong,{children:"KBKILevel"})}),"\n",(0,t.jsxs)(i.table,{children:[(0,t.jsx)(i.thead,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.th,{children:"Enum"}),(0,t.jsx)(i.th,{children:"Value"}),(0,t.jsx)(i.th,{children:"Description"})]})}),(0,t.jsxs)(i.tbody,{children:[(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKILevel.section"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"section"})}),(0,t.jsx)(i.td,{children:"General classification outline, 1-digit code, 5 sections, 0-4."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKILevel.division"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"division"})}),(0,t.jsx)(i.td,{children:"Detailed description from section, 2-digit code."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKILevel.group"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"group"})}),(0,t.jsx)(i.td,{children:"Further details from division, 3-digit code."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKILevel.classes"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"classes"})}),(0,t.jsx)(i.td,{children:"Further details from group, 4-digit code."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKILevel.subClass"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"subclass"})}),(0,t.jsx)(i.td,{children:"Detailed from classes, 5-digit code."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKILevel.commodityGroup"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"commodity group"})}),(0,t.jsx)(i.td,{children:"Detailed from sub-classes, 7-digit code for commodity group."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:"KBKILevel.commodity"}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"commodity"})}),(0,t.jsx)(i.td,{children:"Detailed from commodity group, 10-digit code for commodities."})]})]})]}),"\n",(0,t.jsxs)(i.p,{children:["This class also facilitates the KBLI code validation process through the ",(0,t.jsx)(i.code,{children:"validateCode"})," method."]}),"\n",(0,t.jsx)(i.p,{children:"Example:"}),"\n",(0,t.jsx)(i.pre,{children:(0,t.jsx)(i.code,{className:"language-dart",children:"final isValid = KBKILevel.section.validateCode('A');\n/// result: false\nfinal value = KBKILevel.section.value;\n/// result: section\n"})}),"\n"]}),"\n"]}),"\n",(0,t.jsx)(i.h2,{id:"parameters",children:"Parameters"}),"\n",(0,t.jsxs)(i.table,{children:[(0,t.jsx)(i.thead,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.th,{children:"Parameter"}),(0,t.jsx)(i.th,{children:"Type"}),(0,t.jsx)(i.th,{children:"Description"})]})}),(0,t.jsxs)(i.tbody,{children:[(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"type"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"ClassificationType"})}),(0,t.jsxs)(i.td,{children:["Specifies the classification type from the ",(0,t.jsx)(i.code,{children:"KBLIType"})," or ",(0,t.jsx)(i.code,{children:"KBKIType"})," enum."]})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"level"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"ClassificationLevel?"})}),(0,t.jsxs)(i.td,{children:["Specifies the classification level from the ",(0,t.jsx)(i.code,{children:"KBLILevel"})," or ",(0,t.jsx)(i.code,{children:"KBKILevel"})," enum. (optional)"]})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"lang"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"DataLanguage"})}),(0,t.jsxs)(i.td,{children:["The language used for KBLI/KBKI data (default: ",(0,t.jsx)(i.code,{children:"DataLanguage.id"}),")."]})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"page"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"int"})}),(0,t.jsx)(i.td,{children:"Page number (default: 1)."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"perPage"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"int"})}),(0,t.jsx)(i.td,{children:"Number of data per page (default: 10)."})]})]})]}),"\n",(0,t.jsx)(i.h2,{id:"example",children:"Example"}),"\n",(0,t.jsx)(i.p,{children:"Here is an example of usage:"}),"\n",(0,t.jsx)(i.pre,{children:(0,t.jsx)(i.code,{className:"language-dart",children:"// Fetch KBLI/KBKI data from the BPS API\nfinal result = await StadataFlutter.instance.list.statisticClassifications(\n  type: KBLIType.y2015,\n  level: KBLILevel.category,\n);\nfinal statisticClassificationsList = result.data;\nfinal pagination = result.pagination;\n\n// Display page information\nprint('Current Page: ${pagination.page}');\nprint('Total Pages: ${pagination.pages}');\nprint('Data Count on This Page: ${pagination.count}');\nprint('Per Page: ${pagination.perPage}');\nprint('Total: ${pagination.total}');\nprint('------------------------');\n\n// Display the retrieved statuc classification data\nfor (final statisticClassifications in statisticClassificationsList) {\n    print('Statistic Classification ID: ${statisticClassifications.id}');\n    print('Source: ${statisticClassifications.source}');\n    print('Title: ${statisticClassifications.title}');\n    print('Description: ${statisticClassifications.description}');\n    print('Last Update: ${statisticClassifications.lastUpdate}');\n    print('Release Date: ${statisticClassifications.releaseDate}');\n    print('Previous Classification Items: ${statisticClassifications.previous}');\n    print('Derived Classification Items: ${statisticClassifications.derived}');\n    print('Flag: ${statisticClassifications.flag}');\n    print('Tags: ${statisticClassifications.tags}');\n    print('Type: ${statisticClassifications.type}');\n    print('Level: ${statisticClassifications.level}');\n    print('ISBN: ${statisticClassifications.isbn}');\n    print('ISSN: ${statisticClassifications.issn}');\n    print('Catalogue Number: ${statisticClassifications.catalogueNumber}');\n    print('Publication Number: ${statisticClassifications.publicationNumber}');\n    print('Location: ${statisticClassifications.location}');\n    print('URL: ${statisticClassifications.url}');\n    print('MFD: ${statisticClassifications.mfd}');\n}\n\n"})}),"\n",(0,t.jsx)(i.h2,{id:"properties",children:"Properties"}),"\n",(0,t.jsxs)(i.ul,{children:["\n",(0,t.jsx)(i.li,{children:"StatisticClassification"}),"\n"]}),"\n",(0,t.jsxs)(i.table,{children:[(0,t.jsx)(i.thead,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.th,{children:"Property"}),(0,t.jsx)(i.th,{children:"Type"}),(0,t.jsx)(i.th,{children:"Description"})]})}),(0,t.jsxs)(i.tbody,{children:[(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"id"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String"})}),(0,t.jsx)(i.td,{children:"Unique identifier for KBLI/KBKI."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"type"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"ClassificationType?"})}),(0,t.jsx)(i.td,{children:"Classification type."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"level"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"ClassificationLevel?"})}),(0,t.jsx)(i.td,{children:"Classification level."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"source"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String"})}),(0,t.jsx)(i.td,{children:"Data source."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"title"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String"})}),(0,t.jsx)(i.td,{children:"Title."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"description"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String"})}),(0,t.jsx)(i.td,{children:"Description."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"isbn"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String?"})}),(0,t.jsx)(i.td,{children:"ISBN number."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"issn"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String?"})}),(0,t.jsx)(i.td,{children:"ISSN number."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"catalogueNumber"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String?"})}),(0,t.jsx)(i.td,{children:"Catalogue number."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"publicationNumber"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String?"})}),(0,t.jsx)(i.td,{children:"Publication number."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"lastUpdate"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"DateTime"})}),(0,t.jsx)(i.td,{children:"Last update date."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"releaseDate"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"DateTime"})}),(0,t.jsx)(i.td,{children:"Release date."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"location"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String?"})}),(0,t.jsx)(i.td,{children:"Location."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"url"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String?"})}),(0,t.jsx)(i.td,{children:"URL."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"mfd"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String?"})}),(0,t.jsx)(i.td,{children:"MFD information."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"previous"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"List<ClassificationItem>"})}),(0,t.jsx)(i.td,{children:"List of previous classification items."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"derived"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"List<ClassificationItem>"})}),(0,t.jsx)(i.td,{children:"List of derived classification items."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"flag"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"bool"})}),(0,t.jsx)(i.td,{children:"Flag."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"tags"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"List<String>"})}),(0,t.jsx)(i.td,{children:"List of tags."})]})]})]}),"\n",(0,t.jsxs)(i.ul,{children:["\n",(0,t.jsx)(i.li,{children:"ClassificationItem"}),"\n"]}),"\n",(0,t.jsxs)(i.table,{children:[(0,t.jsx)(i.thead,{children:(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.th,{children:"Property"}),(0,t.jsx)(i.th,{children:"Type"}),(0,t.jsx)(i.th,{children:"Description"})]})}),(0,t.jsxs)(i.tbody,{children:[(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"code"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String"})}),(0,t.jsx)(i.td,{children:"Code."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"title"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String"})}),(0,t.jsx)(i.td,{children:"Title."})]}),(0,t.jsxs)(i.tr,{children:[(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"description"})}),(0,t.jsx)(i.td,{children:(0,t.jsx)(i.code,{children:"String"})}),(0,t.jsx)(i.td,{children:"Description."})]})]})]})]})}function o(e={}){const{wrapper:i}={...(0,d.R)(),...e.components};return i?(0,t.jsx)(i,{...e,children:(0,t.jsx)(h,{...e})}):h(e)}},8453:(e,i,s)=>{s.d(i,{R:()=>r,x:()=>c});var t=s(6540);const d={},n=t.createContext(d);function r(e){const i=t.useContext(n);return t.useMemo((function(){return"function"==typeof e?e(i):{...i,...e}}),[i,e])}function c(e){let i;return i=e.disableParentContext?"function"==typeof e.components?e.components(d):e.components||d:r(e.components),t.createElement(n.Provider,{value:i},e.children)}}}]);