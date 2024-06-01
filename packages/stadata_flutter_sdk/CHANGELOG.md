# Change Log

## 2024-06-01

### Changes

---

## 0.8.0 (stadata_flutter_sdk)

Packages with breaking changes:

- There are no breaking changes in this release.

Packages with other changes:

- **REFACTOR**(typedef): create InstanceCreator typedef. ([f7bb9c73](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f7bb9c73be576c9aab0a991e0cd8f3a4ec04da47))
- **REFACTOR**(linter): update analysis option. ([bf80bfdc](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/bf80bfdc152850452048ae0323618f4bc105fd71))
- **REFACTOR**(codebase): add barrel files. ([00b7b0fb](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/00b7b0fb7a19b88fda79013a4dc2e58f919a3884))
- **REFACTOR**(endpoint): modify type to use ClassificationType param. ([ff2b8524](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/ff2b85245769f6c822ab7190a7cf2b9983a42a13))
- **REFACTOR**(injector): inject repository. ([7a347a41](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7a347a41c5275957e1832e4891a660b043d4b334))
- **REFACTOR**(datasource): fix bug in statistic classification data source. ([ef389d43](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/ef389d43d056aa19a637e49e7b8b0565eb954d48))
- **REFACTOR**(entity): add classification type and level property. ([47b88f51](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/47b88f51818d8455762c98af552fc45a8af5d7c2))
- **REFACTOR**(usecase): update return value of use case. ([c31eb154](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c31eb154442420f8c4538577c22949d5a81de93c))
- **REFACTOR**(repository): remove classification level param from detail. ([63452f5d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/63452f5dba17adaeabc8bc1685cf487bdde3c727))
- **REFACTOR**(http_client): register logging interceptor only on debug mode. ([2093da15](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2093da15d254da71937a8dda9b6bd2c09bc34a17))
- **REFACTOR**(app): re-structuring app code. ([88e30890](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/88e3089028bdece8e052558654a65d3e9c704e4e))
- **REFACTOR**(enums): add doc comment & factory builder. ([42b5c9db](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/42b5c9dbed6fcd50f9545c9a376aa8db006a7263))
- **REFACTOR**(barrel): rename and sort class. ([06b3d2ac](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/06b3d2ac84f6c2f54dd89504b7eab134b1c855ae))
- **REFACTOR**(enum): rename basic enum class. ([4781e360](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/4781e3604cd07c95e3dc231e78a298cd4c0bad74))
- **REFACTOR**(docs): update documentation url. ([19ee634b](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/19ee634bf0001ec45e9d00781947c388e5ccf252))
- **REFACTOR**(injector): rename register to factory. ([b4aed885](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b4aed8850a9e17e3f026d373d6b349a311c778d0))
- **FIX**(core): update base entity implementation. ([6509e773](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/6509e7732a06ac99b5601923595383aebd20b5fc))
- **FIX**(bug): fix wrong json key. ([01361b16](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/01361b1673298cb65d11c01c3144a8a796ed64b8))
- **FIX**(bug): fix bug in api response model pagination data lost. ([9d947c05](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/9d947c056d9f7e5714a4d9cebe40a61cad8fd9a8))
- **FIX**(packages): add license and readme. ([2cf4d929](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2cf4d9294b612cbfc610fc253ece6d3dc55cb13d))
- **FIX**(typo): fix typo folder name. ([7181a158](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7181a158f3c944bb55b5af21d80c564359f2f6d0))
- **FEAT**(list): add getStatisticClassification method. ([fd21e65a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/fd21e65a2af3318e1bca6889052ba59935a72fa4))
- **FEAT**(failure): add statistic classification failure. ([52eb2246](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/52eb224666f5c83fa5c539e7b657cb7f5f61cec4))
- **FEAT**(models): export model through data layer. ([d59901c4](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d59901c422c255ec5553d757c645bc9c0645f38f))
- **FEAT**(model): create statistic classification model. ([d04ca582](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d04ca58206ec380d59b5ad4d01c70366a2e2c02b))
- **FEAT**(models): create classification item model. ([7b2446cf](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7b2446cf9655a85e3558cf75ffb94bb3e0106032))
- **FEAT**(helper): create date helper. ([1daba675](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1daba6753d403b6a0b93917ec34365479c11b817))
- **FEAT**(injector): inject statistic classification data source. ([e08a172b](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e08a172b830f611f8693298f4e820ff04c719842))
- **FEAT**(injector): create feature specific injector. ([e98a9c5b](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e98a9c5b46d732cc0262bbff5aaa4382c75540cb))
- **FEAT**(barrel): add usecase to barrel file. ([1d95ac20](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1d95ac200c18cbe2d4c18359b6cead1d9161efa8))
- **FEAT**(usecase): create statistic classification related usecases. ([f1c80c4e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f1c80c4e4c1e489c74d2bb7130479cc79c41a89d))
- **FEAT**(exceptions): add exception throwing. ([2ee9e861](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2ee9e861268c09f48604f064c180bd2e6154a21c))
- **FEAT**(repository-domain): create repository contract. ([29e96d3e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/29e96d3e480fa9f52bdf0a692b95df335c02e656))
- **FEAT**(exceptions): add statistic classification not available exc. ([d5bc6aa4](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d5bc6aa4ac79012c9d03ef91606718bd712de3f9))
- **FEAT**(entities): create statistic classification entity. ([07ee95de](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/07ee95de5d74e489ad9ca5605585beb4804e60a3))
- **FEAT**(repositories): create statistic classification repository. ([b57a8a44](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b57a8a4417c62c12f03053c41a2d892cbed6e6be))
- **FEAT**(exception): add statistic classification exception. ([3ba7e7eb](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/3ba7e7eb9ce22924cf66af2881c391236a2cef7e))
- **FEAT**(sdk): export kbli/kbki related class. ([9f847fd3](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/9f847fd3f914ed34ee7810c9f002d4f8373cd136))
- **FEAT**(entity): create base entity for equatable replacement. ([eb3cb4cd](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/eb3cb4cd6a68c5bdd36b1e4ee453f581d360e545))
- **FEAT**(barrel): create barrel file for statistical classification. ([555e283a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/555e283a7d762f449045e5fb291f82385067c5d9))
- **FEAT**(enums): create kbli type & level enum. ([b715e916](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b715e9167ec24b4d954d77e3c27e4a0074c4646d))
- **FEAT**(enums): create kbki type & level enum. ([0f8fdcef](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0f8fdcef3c6bea8d6315ea3ecc04b965636c1284))
- **FEAT**(enums): create base statistical classification level enum. ([b1b27e1d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b1b27e1d4b7b23b0d70077368247681eb5a96df9))
- **FEAT**(enums): create base statistical classification enum. ([7d2d505e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7d2d505efe796696c8e29bb867969b3cf75e2845))
- **FEAT**(detail): add get detail statistic classification. ([5e7dbfd1](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/5e7dbfd12728f8821e53fba5076e50655a5aa825))
- **FEAT**(datasources): create statistic classification data source. ([675f99b1](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/675f99b1a4a790a009985cf6d3b7ccb2b3751c56))
- **FEAT**(injector): register statistic classification injector. ([bd715dcd](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/bd715dcdde153990dc522160ed09a25e765890f3))
- **DOCS**(entities): add doc comments to classifications entities. ([1fe54f83](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1fe54f839135f42f53d1f68299c36a5c6cf1898e))

# Change Log

## 2024-04-28

### Changes

---

## 0.7.1 (stadata_flutter_sdk)

Packages with breaking changes:

- **REFACTOR**(injector): rename register to factory. ([b4aed885](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b4aed8850a9e17e3f026d373d6b349a311c778d0))
- **REFACTOR**(typedef): create InstanceCreator typedef. ([f7bb9c73](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f7bb9c73be576c9aab0a991e0cd8f3a4ec04da47))
- **REFACTOR**(linter): update analysis option. ([bf80bfdc](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/bf80bfdc152850452048ae0323618f4bc105fd71))
- **REFACTOR**(app): re-structuring app code. ([88e30890](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/88e3089028bdece8e052558654a65d3e9c704e4e))
- **FIX**(typo): fix typo folder name. ([7181a158](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7181a158f3c944bb55b5af21d80c564359f2f6d0))

Packages with other changes:

- Add ability to fetch Unit
- Add ability to fetch Variable
- Add ability to fetch Vertical Variable

# Change Log

## 2023-12-06

### Changes

---

Packages with breaking changes:

- There are no breaking changes in this release. But there is some deprecation to existing model property.

Packages with other changes:

- There are no other changes in this release.

## 0.7.0

- **REFACTOR**(import): optimize code import. ([b99bdd04](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b99bdd04adf1ff464e74d1278b5de6b13d6dcfd9))
- **REFACTOR**(feature): rename news_category to news_categories. ([0637bc98](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0637bc98bcc7d5dfaabba96000960e546bf375ea))
- **REFACTOR**(exception): make stadata exception a normal class. ([f6d61af2](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f6d61af24098a850e2b76016138ddd55c871dbe7))
- **REFACTOR**(datasource): remove unused param on press release. ([3e8af21c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/3e8af21c88dd3faaaa74bc71cc0b9fe3afb0befc))
- **REFACTOR**(news): mark categoryId deprecated. ([895b5aab](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/895b5aab36f6cf1399724fa1b2ced61344749819))
- **REFACTOR**(controllers): replace deprecated member. ([1aadefaa](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1aadefaa4008f5c6a853e70ba01ff1e10dda0d0f))
- **REFACTOR**(list): make some property deprecated. ([e72f2da8](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e72f2da8104fac1893806cd231b774405a702180))
- **REFACTOR**(env): using new useConstantCase param. ([be72a53d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/be72a53d05d10202bab7c5ada7ffad8efb746c83))
- **REFACTOR**(env): regenerate env variable. ([de57655e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/de57655e8a0b6599671768a0df9c8dc36dd781a8))
- **REFACTOR**(config): update melos config. ([855b1eed](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/855b1eed2b54cd2c1fb602adc5c385890700166c))
- **REFACTOR**(params): update all param that has id to ID instead of Id. ([7c1349d9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7c1349d9a3d89d0756b494ca4e48ff1af529f6a7))
- **REFACTOR**(domain): change variableID param type to int? ([2cb36f8d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2cb36f8d34ad285dbecf272e37e3ad93bf0d8c47))
- **REFACTOR**(domain): add page parameter. ([1a58d429](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1a58d4295a0ff2b4e10abffed91a7750cb4c5b10))
- **REFACTOR**(domain): update return value type to api response. ([9a6b27a2](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/9a6b27a25c60cb3065c27907b2c2516c0544e31a))
- **REFACTOR**(exceptions): update exception class. ([daedbf8f](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/daedbf8fafda1ddbcf37796c5acd871cadb69739))
- **REFACTOR**(repository): remove dead code. ([00d1bb2e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/00d1bb2e67eadda0e7a8e6133808d77006320668))
- **REFACTOR**(static_table): mark subjectId as deprecated. ([ad17bf37](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/ad17bf37dacb008c95e495525f87548b9565b196))
- **REFACTOR**(fixture): update fixture helper. ([73f0dea4](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/73f0dea4c5314dceb188352e655179711c05f534))
- **REFACTOR**(fixtures): add dummy json to strategic indicator fixture. ([d05842dc](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d05842dc566add143312908ff579a90c87758035))
- **REFACTOR**(widget): make description nullable. ([d50b0d01](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d50b0d012e718a4b6b46289d621abe8296a1cb48))
- **REFACTOR**(entity): make description nullable. ([f17da9e2](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f17da9e2c3fbc37f457c03ef4246a184b701d2f4))
- **REFACTOR**(datasource): refactor domain remote data source. ([69c25af5](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/69c25af5baea05401fcece3d19b464fb297ba31c))
- **REFACTOR**(ui): minor ui update on example app. ([a99fb0c9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a99fb0c97ded1bd4f10c03a2cae5aeee64a2dc88))
- **REFACTOR**(list): add dataAvailability property to list result. ([6958cbd6](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/6958cbd602087b1dcad3327b0fd61efdec10a251))
- **REFACTOR**(example): restructuring example app using getx. ([921dae9c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/921dae9ca93d41cc0409fd52e7fc29526d26a824))
- **REFACTOR**(export): optimize file export. ([07e3a794](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/07e3a794c7c4e01debfe80f17518a16a314db741))
- **REFACTOR**(features): move domains from list to features. ([4f8605fc](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/4f8605fcabc6ed9f93aaf61ae84b255e635810b5))
- **REFACTOR**(static_table): mark subjectId as deprecated. ([2b6817be](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2b6817bea24ee1079999645406fb8097180fe714))
- **REFACTOR**(endpoint): update infographic endpoint name and add endpoint. ([12d6ff80](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/12d6ff80ac99ecb1e164f4991cba924258b54cd8))
- **REFACTOR**(interceptor): update logging interceptor. ([29c6de99](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/29c6de9911d47965e17d0ffc90050c3ced414e07))
- **REFACTOR**(datasource): rename endpoint. ([d9251d60](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d9251d60fd60e6fc91ae7d47ea1abedbeb35572c))
- **REFACTOR**(pagination): move required to first param. ([be078ea9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/be078ea9ee8fe58045b9f069e3f23c76ea84299e))
- **REFACTOR**(logger): add prefix to log. ([9cf4745d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/9cf4745db92fe80f9834c41df7945e812cd14079))
- **REFACTOR**(docs): update doc comments properties. ([a46697bd](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a46697bdcbe3c9bc41cd6710e5e80a2652cd6b44))
- **REFACTOR**(usecase): rename get all infographic param. ([b6f40b39](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b6f40b3911638b87120c2449786a38faf52fe41c))
- **REFACTOR**(exceptions): add news category exception and failure. ([fac96409](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/fac96409a2fa9647ec8f1f8d23f60c5904dea21b))
- **REFACTOR**(models): add news serializer to cleanup news content. ([a684fc20](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a684fc20129761876aa8613ea4893b148de79b34))
- **REFACTOR**(usecase): rename usecase to follow convention. ([cddcd4a7](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/cddcd4a76eb4b7f0e51a1e1dbb107150611afb97))
- **REFACTOR**(repository): remove dead code. ([5436a3a5](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/5436a3a5017ef43ffe18843980b19e9566d9a6c2))
- **REFACTOR**(failures): make failure extend equatable. ([6dddae61](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/6dddae619e308c2cff5334707de198b407fbfb3b))
- **REFACTOR**(list): rename newsCategory to newsCategories. ([e3c41d55](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e3c41d55c854ab2b0f29cda26f7e305cc7e7e379))
- **REFACTOR**(linter): remove one member abstract & invalid annotation. ([2a6114b3](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2a6114b3b83a0d7c61a682d794660eb6d572bc32))
- **REFACTOR**(entity): update static table property docs. ([7e222523](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7e222523cbc21c8040785f608fd6a0dbe2a0610d))
- **REFACTOR**(example): remove unused page ini example app. ([7ad5e329](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7ad5e32917b70725a7904b989265727bbb4872c2))
- **REFACTOR**(fixture): update fixture name in fixture enums. ([0dca09fc](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0dca09fc4042a60e76f3dda9be6fa6bc20247b26))
- **REFACTOR**(api_response): revert changes. ([45dce55e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/45dce55ed800793fb829a8545bf1fa7619741f66))
- **REFACTOR**(fixture): rename all fixture to follow naming convention. ([8d127f61](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/8d127f612e7a161379d8ac3cdb62299772afba6f))
- **REFACTOR**(endpoint): add endpoint of news category. ([5e1110d4](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/5e1110d47426007061bd1f699b35e5ceb8646cf1))
- **REFACTOR**(ui): update ui of publication example. ([7b029c43](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7b029c4322a5aa9b01f1620e58c74aeee507b09f))
- **REFACTOR**(model): add default value for pagination. ([e7af03b5](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e7af03b5e4698aa0b57928aa5578b782fbbd07d2))
- **FIX**(http_module): add exception handling. ([81a0ddba](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/81a0ddba36044125dd5fb89d274c9f86c013fbfe))
- **FIX**(bug): add missing implementation of data availability. ([b6e6debd](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b6e6debd22c5f8132d15fbb0c5000cae8b26eb50))
- **FIX**(analyzer): fix analyzer issue. ([1855e7bb](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1855e7bb9f8044fb98b6847b7201b8b0e21fe087))
- **FIX**(example): fix wrong keyboard type in example app. ([17a3dfec](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/17a3dfece1ccf6843fca65ddab415e345e3a72b1))
- **FIX**(bug): make data availability nullable. ([bea4623d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/bea4623dba741355205630fd682f63fae1f75036))
- **FIX**(android): enable multidex. ([a1be65c2](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a1be65c2eb352049410abe1440b5a504c09401c4))
- **FIX**(typo): fix typo on readme and add words to cspell. ([c3714999](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c3714999a623f2c329225b321d1250e249bd51e9))
- **FIX**(example): fix nullable abstract. ([ce895748](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/ce8957480bca921b84787cfb611b6ddf31926a67))
- **FIX**(analysis): fix analysis issue. ([2d267267](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2d267267d3d9fd03fc4a8188900ef348e1495442))
- **FIX**(test): fix breaking test. ([2c7f836d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2c7f836d9d16065ee60a7114cbf07371894b13af))
- **FIX**(model): fix wrong key for period. ([3eb79002](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/3eb79002171086d809fec2f0c7cfe2ec3b0120da))
- **FIX**(library): fix get it wont run. ([211383cd](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/211383cd9ff26a9c2bf61cbfae286097cfa089bf))
- **FIX**(cspell): add new words to cspell. ([804abbea](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/804abbeafd8d6f0fa59116ad755a3cabafc52e09))
- **FIX**(entity): fix nullable csa subject ID. ([7ef65569](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7ef65569f8fc06ff1aaed4e0b738be1ed6844ae0))
- **FIX**(bug): add default value for unit property. ([960cba24](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/960cba24be24aacff0b4941bfc894a6536273e94))
- **FIX**(datasource): add missing lang param. ([e563325e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e563325e8727cf580e1b2b67a937c0b77a25def1))
- **FIX**(repository): add missing variable id param. ([a7ab6ca9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a7ab6ca9c6db32963d21c373067cbca02df0658c))
- **FIX**(packages): fix missing package. ([8e94b16d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/8e94b16d6e5d634db01be937a2aa22a052b6c6af))
- **FIX**(models): add default value for strategic indicator unit. ([1989b5f8](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1989b5f81e4d62a00f3d651ea6af7e51c1be055e))
- **FIX**(press_release): make abstract nullable and re-build. ([1989e91f](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1989e91f0eac89d4bdcbcdfe907a2a4122e00412))
- **FIX**(type): fix typo in publication page. ([97655132](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/97655132e5132d41583450ee680a8aee1e489c9a))
- **FEAT**(datasource): create data source for infographic. ([c394ba8b](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c394ba8b5074a2f5209b2e20f309c8bcac70aacb))
- **FEAT**(repository): create news category repository contract. ([f4821017](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f482101771368ef57deae16c52285e98e98bd3c1))
- **FEAT**(domain): create base repository contract. ([4f5fcbb9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/4f5fcbb91db7d99a184d19263402a670bf2676d4))
- **FEAT**(usecases): add get all news category use case. ([610e5e3b](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/610e5e3b8e92fcb1395017e4c3286b1400336b61))
- **FEAT**(endpoint): add endpoint for news. ([528d3f3d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/528d3f3dff759114eacc3fa06d6381e1eff5d405))
- **FEAT**(repositories): create news repository implementation. ([4f2c5bc3](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/4f2c5bc3a904247255779870eb8e3cb41a5e1937))
- **FEAT**(models): create news category model. ([efad538a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/efad538ab93c56fe0d5eec70ac1f0bb5965bb0e9))
- **FEAT**(datasource): add news category remote data source. ([b7628f27](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b7628f2715dddb2def2308b0803b594550286783))
- **FEAT**(repository): write implementation of news category repo. ([79056b1c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/79056b1c918b0852f237fa9c5729eae51cbb8e26))
- **FEAT**(models): create news model. ([0c4dc3d4](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0c4dc3d42f5efef1b7a527379be2bf4ca3847e23))
- **FEAT**(usecases): create usecase to get all news and news detail. ([da03130a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/da03130a4387cc2ed2e7dfac332bfd76b592decc))
- **FEAT**(repository): create news repository contract. ([753212b1](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/753212b1a6cebba57c658b3934ba991e5d5aab8e))
- **FEAT**(entity): create news entity. ([cb53d6df](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/cb53d6df9c72c4252ea210c01240b12cdbd051c0))
- **FEAT**(new_categories): add news categories to features. ([01551ba9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/01551ba9c5d968819f6e1ce00d526fab2739325f))
- **FEAT**(news_categories): add news categories to list. ([d92debf0](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d92debf00ed8a512c7fe9585744be72b9bbc2dee))
- **FEAT**(entities): create news category entity. ([c3acc99c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c3acc99c526f3ea1eb2c40708792df8da85c7f94))
- **FEAT**(example): add news categories and news example. ([b6999fdf](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b6999fdfa1273fb95441681a53a8df1324bbb3fb))
- **FEAT**(example): add preview for static table feature. ([c526bf83](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c526bf83de576d58a44427c56c31ec1f71c8684d))
- **FEAT**(build_runner): re-build. ([1614e65c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1614e65ccae01a9a8ed9bcbefa4d9f03c5f12d0c))
- **FEAT**(static_table): add static table to list and view. ([15af0f6c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/15af0f6cba76a9067c642e79d8cb9ff37cc8a145))
- **FEAT**(repository): create static table repository implementation. ([493f45ce](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/493f45ce304268ec508a62c0bacd11d9c1c8565e))
- **FEAT**(datasource): create static table remote data source. ([6057805f](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/6057805f71a22620343308233f63d6636c07ba4f))
- **FEAT**(models): create static table model. ([e14450dc](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e14450dc47231b5aa5d846cc2cb2d802a4ed5bbf))
- **FEAT**(serializer): create table serializer. ([e5ad68b0](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/e5ad68b0d6154fd41ee11e2828af86566ed85dc3))
- **FEAT**(exceptions): add exception and failure for static table. ([a271f561](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a271f5619a7556e63fdea430e5bf979aa2682ad6))
- **FEAT**(datasource): create news remote data source. ([fd982e22](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/fd982e224a299251d5ff676ac57cb82deb744e8b))
- **FEAT**(models): create infographic model. ([491f1b23](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/491f1b23aa63dff45e26c2a3e2e0c32f726a141f))
- **FEAT**(models): add static table model. ([f9223f28](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f9223f282cbeadf822525604e4c82126c61e46b4))
- **FEAT**(usecase): create use case for static table. ([837ceefa](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/837ceefab3e86405baae8365e260029827c3df11))
- **FEAT**(example): add example page for news. ([d54b0ba8](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d54b0ba84deb6119dfe81b2b5d3fe16cc36c9d4b))
- **FEAT**(entity): create static table entity. ([5521a3e5](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/5521a3e5d7c406824f01bb316628f2c12b7143d2))
- **FEAT**(widget): add infographic card widget. ([a776d9f3](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a776d9f34ec127b8bf4cfb33cca144aa437669fd))
- **FEAT**: Add Subject Categories, Subjects, & Press Release feature ([#32](https://github.com/ryanaidilp/stadata_flutter_sdk/issues/32)). ([b280165e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b280165ec8798ea4eedf6085b697ac08c6f9b007))
- **FEAT**(domain): create get all strategic indicators usecase. ([73e4bb64](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/73e4bb64627ffbaca8171d565cfc49b30b217259))
- **FEAT**(data): create strategic indicator models. ([54c69bf5](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/54c69bf51aeff7a6e6e0e55742e43756e03d3e41))
- **FEAT**(repository): create implementation of infographic repo. ([ce4ce1ee](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/ce4ce1ee28c8f088e8af4ad2b1d48de54352ab6d))
- **FEAT**(features): export infographic entity. ([4874106c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/4874106c81baa2ea16d6c1dccf1cb708bc7d6167))
- **FEAT**(list): add infographics to stadata list. ([da24d0ba](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/da24d0bab91c6514d77fe3bf8dc1d8b57b047542))
- **FEAT**(data): create repository implementation. ([ee2596bc](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/ee2596bc5545fa0fb0e70576dc4f566d12eff7ba))
- **FEAT**(list): add strategic indicator to list class. ([18f6bc9e](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/18f6bc9ef64bb6939f26dd0a086be0a24c85adca))
- **FEAT**(di): run build runner to generate injection. ([35d9fb33](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/35d9fb334ac7b1ff16113a17f03c6a39fc223c93))
- **FEAT**(library): add infographics to stadata flutter sdk. ([7b8d6757](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7b8d6757bc9dce1abe36478ac36dfcb1b7dda8ae))
- **FEAT**(example): add infographics page example. ([1b8b4c79](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1b8b4c79820abc38986164ad85f63d7b30847d47))
- **FEAT**(example): create example page for strategic indicator. ([2b043768](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/2b04376878f5152128f7233bf7eab1886fe9c800))
- **FEAT**(repository): create static table repository contract. ([9af562a5](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/9af562a5cd6f389b2c9ae1a61290319b6f4fb697))
- **FEAT**(news): add news feature to list and view. ([0448b1c6](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0448b1c66fc747b327732b7c5b187cc2dc9ab55d))
- **DOCS**(changelog): update changelog. ([0488edea](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0488edeaff0ccf6a87571387c8377145cba322cb))
- **DOCS**(license): add license. ([4efa395d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/4efa395d307cffdda31c5634c28ce31566b0dc86))
- **DOCS**(CG): add contribution guideline. ([19386714](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/19386714f5187889daa7584161c846a2dcd02e89))
- **DOCS**(COC): add code of conduct. ([b76bac9c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b76bac9c580400db3125ec3b79426425fcd04691))
- **DOCS**(CHANGELOG): add changelog. ([5a672ebe](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/5a672ebe3eb67a8f6f856b7646508ce07426de67))
- **DOCS**(README): update readme. ([dd3c375f](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/dd3c375f8a286096360adfe26ea36bb12a964d49))
- **DOCS**(readme): fix typo. ([76b2b062](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/76b2b062c62a4c52133099fea8b1aeefc015bb66))
- **DOCS**(readme): update badge. ([a77ff7ad](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a77ff7ad36f328017679ff0d3d013983e1552864))
- **DOCS**(README): improve documentation. ([c5495d36](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c5495d36bf7799694bbf74ad75c44d1d2375d846))
- **DOCS**(readme): add more badge. ([6dccf9fe](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/6dccf9fec5b5183194513d54be1be58e284a1102))
- **DOCS**(changelog): update changelog. ([eb37dc7c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/eb37dc7ccd7800a44b752aebf8b793f2102602a2))
- **DOCS**(changelog): update changelog. ([a55a5f86](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a55a5f865c549406b95cccd252879adf56305d8a))
- **DOCS**(changelog): update changelog. ([b577836a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/b577836a5ae961c9fc5b1de313e3e200a61efaf2))
- **DOCS**(README): update readme. ([c0e36e5a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c0e36e5ac1d120c14bd777ab07365e95dd4f5dd0))
- **DOCS**(README): update readme. ([44ce6990](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/44ce69902657ecbef90b0baf5a67435ffe28e25c))
- **DOCS**(README): update readme. ([4d0a3101](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/4d0a3101606d35c60134f6dd22fed3030b11ed52))
- **DOCS**(changelog): update changelog. ([75e3ef78](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/75e3ef788006df57b82e48b26054fc99eee6e8de))
- **DOCS**(readme): update documentation. ([55dcc195](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/55dcc195ab2bc1eff61f8ec59e83aa923db17820))
- **DOCS**(changelog): update changelog. ([a1dd6fed](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a1dd6fed31011c93aa7ab933de64ab3be9c34727))
- **DOCS**(readme): add coverage badge. ([7ef51eda](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7ef51eda73b2f6c79170b545f1d1e05eb13ea49c))
- **DOCS**(README): update readme. ([0610d39c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0610d39c96758a4ad17e6d2e7e848497fbe745bc))
- **DOCS**(README): update readme. ([7414a11a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7414a11acf6a3c327eda7ccb749fc122cf8c9de1))
- **DOCS**(CONTRIBUTING): update contribution guide. ([14663972](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1466397227ee4201778918929dc62e5001eed637))
- **DOCS**(changelog): update changelog. ([50d096f9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/50d096f9dec574620511653f8ebd2766d6eea34e))
- **DOCS**(README): update documentation. ([d0e8de07](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d0e8de07ca938fbf32ba8c7bc28372cb50b77ad7))
- **DOCS**(README): fix typo on some words. ([d8acb05d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d8acb05d168c70021fbac221a226377af5e73099))
- **DOCS**(readme): update documentation to refer to the official docs. ([5c72c358](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/5c72c358bc98b2162ad2c1e661278bae16a4256e))
- **DOCS**(changelog): update changelog. ([0844906b](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0844906b52432f7f5f6074f5feeeba46489675cc))
- **DOCS**(README): update documentation. ([f5ae957d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f5ae957d4f094390d8858a5b45fdc72c3f44ad39))
- **DOCS**(changelog): add new changelog. ([c4a6fdcf](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c4a6fdcfaf7c8b322572e5b4bd9a865dbe3c76c4))

# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.6.3+15

> 2023-10-01

### Fixed

- **Fixed** crash causing by `Infographic` not handling null description case.

## 0.6.2+14

> 2023-10-01

### What's new?

- **Updated** documentation
- **Updated** minor ui changes in example app

### Fixed

- **Fixed** minor issue in `ListResult` class

## 0.6.1+13

> 2023-09-26

### What's new?

- **Fixed** `PressRelease` abstract property is nullable

## 0.6.0+12

> 2023-09-26

### What's New?

- **Added** subject category entity.
- **Added** subject category repository contract.
- **Added** use case to get all subject categories.
- **Added** subject category model.
- **Added** subject category remote data source.
- **Added** subject category repository implementation.
- **Added** subject category feature export.
- **Added** subject entity.
- **Added** subject repository contract.
- **Added** use case to get all subjects.
- **Added** subject model.
- **Added** subject remote data source.
- **Added** subject repository implementation.
- **Added** subject feature export.
- **Added** press release entity.
- **Added** press release repository.
- **Added** use cases to get list and detail of press releases.
- **Added** press release model.
- **Added** press release remote data source.
- **Added** press release repository implementation.
- **Added** press release feature export.
- **Added** example pages for subject, subject category, and press release.
- **Added** routes for subject, subject category, and press release.
- **Added** press release card in the example.
- **Added** fixtures for subject category, subject list, and press release.
- **Added** unit tests for subject category use case.
- **Added** unit tests for subject use case.
- **Added** unit tests for press release use case.
- **Added** unit tests for API endpoints.
- **Added** unit tests for data layer of subject category.
- **Added** unit tests for subject remote data source.
- **Added** unit tests for subject repository implementation.
- **Added** unit tests for press release data source.
- **Added** unit tests for press release repository implementation.
- **Refactored** exception classes.
- **Removed** dead code from the repository.
- **Updated** test names and added missing tests for domain and publication models.
- **Renamed** infographic endpoint and added a new endpoint.
- **Added** tests for the static table endpoint.
- **Created** the `StaticTable` entity, repository contract, use case, and model.
- **Optimized** code import and file export.
- **Added** exceptions and failures for the static table feature.
- **Created** a table serializer.
- **Added** tests for the static table model, remote data source, and repository implementation.
- **Integrated** the static table feature into list and view.
- **Updated** static table property documentation.
- **Added** fixtures and tests for static tables.
- **Implemented** unit tests for the static table use case and repository.
- **Added** teardown steps to all unit tests.
- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/32)

## 0.5.0+11

> 2023-09-16

### What's New?

- **Added** exceptions and failure handling for news.
- **Added** a news entity to represent news data.
- **Added** a news repository contract.
- **Added** use cases for retrieving all news and news details.
- **Added** a news model to represent news data.
- **Added** fixtures for news and news details.
- **Added** fixture enums.
- **Added** unit tests for news use cases.
- **Added** an endpoint for news.
- **Added** a news remote data source.
- **Added** an example page for news.
- **Added** a news category entity.
- **Added** exceptions and failure handling for news categories.
- **Added** a news category repository contract.
- **Added** a use case for getting all news categories.
- **Added** a news category model.
- **Added** fixtures for news categories.
- **Added** unit tests for news category use cases.

### Fixed

- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/19)

## 0.4.0+10

> 2023-09-15

### What's New?

#### Fetch Static Table Data from BPS API (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Added support for fetching static table data from the BPS (Bureau of Public Statistics) API.
- Introduced a new `StaticTable` class to model static table data.
- Implemented API requests and data parsing logic for retrieving static tables.
- Documented the usage of the new feature in the SDK's documentation.

#### Documentation Updates

- Updated README to reflect the new Static Table feature (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17)).

### Refactor

#### Codebase Improvements (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Refactored exception classes.
- Removed dead code from the repository.
- Updated test names and added missing tests for domain and publication models (PR #128).
- Renamed infographic endpoint and added a new endpoint.
- Added tests for the static table endpoint.
- Created the `StaticTable` entity, repository contract, use case, and model.
- Optimized code import and file export.
- Added exceptions and failures for the static table feature (PR #138).
- Created a table serializer.
- Added tests for the static table model, remote data source, and repository implementation.
- Integrated the static table feature into list and view.
- Added an example preview for the static table feature.
- Updated static table property documentation.
- Added fixtures and tests for static tables.
- Implemented unit tests for the static table use case and repository.
- Added teardown steps to all unit tests.

### Chore

#### Dependency Updates

- Updated project dependencies to the latest versions.

## 0.3.5+9

> 2023-09-15

### Fixed

- revert broken changes that makes the SDK unusable from version 0.3.0 [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add test for `PaginationModel` [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add config to run example app on ios [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)

## 0.3.4+8

> 2023-09-15

### Fixed

- revert broken changes [#15](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/15)

## 0.3.3+7

> 2023-09-15

### Fixed

- issue with auto publish [#14](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/14)

## 0.3.2+6

> 2023-09-15

### Fixed

- add `homepage` & `repository` to `pubspec.yaml` [#13](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/13)

## 0.3.1+5

> 2023-09-15

### Fixed

- add list of `platforms` to `pubspec.yaml` [#12](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/12)

## 0.3.0+4

> 2023-09-14

### Added

- Fetch Infographic Data from BPS API by @ryanaidilp in [#9](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/9)
- Fetch Infographic Data from BPS API & Improve Documentation by @ryanaidilp in [#10](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/10)

### Changed

- Chore: Add test coverage by @ryanaidilp in [#8](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/8)

## 0.2.1+3

> 2023-09-13

### Fixed

- Enable multidex by @ryanaidilp in [#7](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/7)

## 0.2.0+2

> 2023-09-13

### Added

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
  ect, subject category, and press release.
- **Added** routes for subject, subject category, and press release.
- **Added** press release card in the example.
- **Added** fixtures for subject category, subject list, and press release.
- **Added** unit tests for subject category use case.
- **Added** unit tests for subject use case.
- **Added** unit tests for press release use case.
- **Added** unit tests for API endpoints.
- **Added** unit tests for data layer of subject category.
- **Added** unit tests for subject remote data source.
- **Added** unit tests for subject repository implementation.
- **Added** unit tests for press release data source.
- **Added** unit tests for press release repository implementation.
- **Refactored** exception classes.
- **Removed** dead code from the repository.
- **Updated** test names and added missing tests for domain and publication models.
- **Renamed** infographic endpoint and added a new endpoint.
- **Added** tests for the static table endpoint.
- **Created** the `StaticTable` entity, repository contract, use case, and model.
- **Optimized** code import and file export.
- **Added** exceptions and failures for the static table feature.
- **Created** a table serializer.
- **Added** tests for the static table model, remote data source, and repository implementation.
- **Integrated** the static table feature into list and view.
- **Updated** static table property documentation.
- **Added** fixtures and tests for static tables.
- **Implemented** unit tests for the static table use case and repository.
- **Added** teardown steps to all unit tests.
- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/32)

## 0.5.0+11

> 2023-09-16

### What's New?

- **Added** exceptions and failure handling for news.
- **Added** a news entity to represent news data.
- **Added** a news repository contract.
- **Added** use cases for retrieving all news and news details.
- **Added** a news model to represent news data.
- **Added** fixtures for news and news details.
- **Added** fixture enums.
- **Added** unit tests for news use cases.
- **Added** an endpoint for news.
- **Added** a news remote data source.
- **Added** an example page for news.
- **Added** a news category entity.
- **Added** exceptions and failure handling for news categories.
- **Added** a news category repository contract.
- **Added** a use case for getting all news categories.
- **Added** a news category model.
- **Added** fixtures for news categories.
- **Added** unit tests for news category use cases.

### Fixed

- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/19)

## 0.4.0+10

> 2023-09-15

### What's New?

#### Fetch Static Table Data from BPS API (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Added support for fetching static table data from the BPS (Bureau of Public Statistics) API.
- Introduced a new `StaticTable` class to model static table data.
- Implemented API requests and data parsing logic for retrieving static tables.
- Documented the usage of the new feature in the SDK's documentation.

#### Documentation Updates

- Updated README to reflect the new Static Table feature (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17)).

### Refactor

#### Codebase Improvements (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Refactored exception classes.
- Removed dead code from the repository.
- Updated test names and added missing tests for domain and publication models (PR #128).
- Renamed infographic endpoint and added a new endpoint.
- Added tests for the static table endpoint.
- Created the `StaticTable` entity, repository contract, use case, and model.
- Optimized code import and file export.
- Added exceptions and failures for the static table feature (PR #138).
- Created a table serializer.
- Added tests for the static table model, remote data source, and repository implementation.
- Integrated the static table feature into list and view.
- Added an example preview for the static table feature.
- Updated static table property documentation.
- Added fixtures and tests for static tables.
- Implemented unit tests for the static table use case and repository.
- Added teardown steps to all unit tests.

### Chore

#### Dependency Updates

- Updated project dependencies to the latest versions.

## 0.3.5+9

> 2023-09-15

### Fixed

- revert broken changes that makes the SDK unusable from version 0.3.0 [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add test for `PaginationModel` [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add config to run example app on ios [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)

## 0.3.4+8

> 2023-09-15

### Fixed

- revert broken changes [#15](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/15)

## 0.3.3+7

> 2023-09-15

### Fixed

- issue with auto publish [#14](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/14)

## 0.3.2+6

> 2023-09-15

### Fixed

- add `homepage` & `repository` to `pubspec.yaml` [#13](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/13)

## 0.3.1+5

> 2023-09-15

### Fixed

- add list of `platforms` to `pubspec.yaml` [#12](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/12)

## 0.3.0+4

> 2023-09-14

### Added

- Fetch Infographic Data from BPS API by @ryanaidilp in [#9](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/9)
- Fetch Infographic Data from BPS API & Improve Documentation by @ryanaidilp in [#10](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/10)

### Changed

- Chore: Add test coverage by @ryanaidilp in [#8](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/8)

## 0.2.1+3

> 2023-09-13

### Fixed

- Enable multidex by @ryanaidilp in [#7](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/7)

## 0.2.0+2

> 2023-09-13

### Added

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
