///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsId implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsId _root = this; // ignore: unused_field

	@override 
	TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppId app = _TranslationsAppId._(_root);
	@override late final _TranslationsNavigationId navigation = _TranslationsNavigationId._(_root);
	@override late final _TranslationsCommonId common = _TranslationsCommonId._(_root);
	@override late final _TranslationsErrorsId errors = _TranslationsErrorsId._(_root);
	@override late final _TranslationsHomeId home = _TranslationsHomeId._(_root);
	@override late final _TranslationsListApiId listApi = _TranslationsListApiId._(_root);
	@override late final _TranslationsViewApiId viewApi = _TranslationsViewApiId._(_root);
	@override late final _TranslationsDomainsId domains = _TranslationsDomainsId._(_root);
	@override late final _TranslationsInfographicsId infographics = _TranslationsInfographicsId._(_root);
	@override late final _TranslationsPublicationsId publications = _TranslationsPublicationsId._(_root);
	@override late final _TranslationsNewsId news = _TranslationsNewsId._(_root);
	@override late final _TranslationsNewsCategoriesId newsCategories = _TranslationsNewsCategoriesId._(_root);
	@override late final _TranslationsDynamicTablesId dynamicTables = _TranslationsDynamicTablesId._(_root);
	@override late final _TranslationsPressReleasesId pressReleases = _TranslationsPressReleasesId._(_root);
	@override late final _TranslationsStaticTablesId staticTables = _TranslationsStaticTablesId._(_root);
	@override late final _TranslationsStrategicIndicatorsId strategicIndicators = _TranslationsStrategicIndicatorsId._(_root);
	@override late final _TranslationsSubjectsId subjects = _TranslationsSubjectsId._(_root);
	@override late final _TranslationsUnitsId units = _TranslationsUnitsId._(_root);
	@override late final _TranslationsVariablesId variables = _TranslationsVariablesId._(_root);
	@override late final _TranslationsSharedId shared = _TranslationsSharedId._(_root);
	@override late final _TranslationsValidationId validation = _TranslationsValidationId._(_root);
	@override late final _TranslationsCategoriesId categories = _TranslationsCategoriesId._(_root);
	@override late final _TranslationsInstructionsId instructions = _TranslationsInstructionsId._(_root);
	@override late final _TranslationsSettingsId settings = _TranslationsSettingsId._(_root);
}

// Path: app
class _TranslationsAppId implements TranslationsAppEn {
	_TranslationsAppId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contoh STADATA';
	@override String get description => 'Showcase kemampuan STADATA Flutter SDK';
}

// Path: navigation
class _TranslationsNavigationId implements TranslationsNavigationEn {
	_TranslationsNavigationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get home => 'Beranda';
	@override String get listApi => 'List API';
	@override String get viewApi => 'View API';
	@override String get dynamicTables => 'Tabel Dinamis';
	@override String get periods => 'Periode';
	@override String get pageNotFound => 'Halaman Tidak Ditemukan';
	@override String get pageNotFoundMessage => 'Halaman yang Anda cari tidak ada.';
}

// Path: common
class _TranslationsCommonId implements TranslationsCommonEn {
	_TranslationsCommonId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Memuat...';
	@override String get error => 'Error';
	@override String get retry => 'Coba Lagi';
	@override String get noData => 'Tidak ada data tersedia';
	@override String get search => 'Cari';
	@override String get refresh => 'Segarkan';
	@override String get cancel => 'Batal';
	@override String get save => 'Simpan';
	@override String get delete => 'Hapus';
	@override String get edit => 'Edit';
	@override String get create => 'Buat';
	@override String get update => 'Perbarui';
	@override String get back => 'Kembali';
	@override String get next => 'Selanjutnya';
	@override String get previous => 'Sebelumnya';
	@override String get page => 'Halaman';
	@override String get total => 'Total';
	@override String get items => 'item';
	@override String get of => 'dari';
	@override String get language => 'Bahasa';
	@override String get unknownState => 'Status tidak diketahui';
}

// Path: errors
class _TranslationsErrorsId implements TranslationsErrorsEn {
	_TranslationsErrorsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get generic => 'Terjadi kesalahan. Silakan coba lagi.';
	@override String get network => 'Error jaringan. Periksa koneksi Anda.';
	@override String get notFound => 'Data tidak ditemukan.';
	@override String get timeout => 'Request timeout. Silakan coba lagi.';
	@override String get unauthorized => 'Akses tidak diizinkan.';
	@override String get serverError => 'Error server. Silakan coba lagi nanti.';
}

// Path: home
class _TranslationsHomeId implements TranslationsHomeEn {
	_TranslationsHomeId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selamat Datang di STADATA';
	@override String get subtitle => 'Jelajahi Data Statistik Indonesia';
	@override String get description => 'Akses data statistik komprehensif dari Badan Pusat Statistik (BPS) Indonesia melalui aplikasi showcase ini.';
	@override late final _TranslationsHomeFeaturesId features = _TranslationsHomeFeaturesId._(_root);
	@override late final _TranslationsHomeAboutDemoId aboutDemo = _TranslationsHomeAboutDemoId._(_root);
	@override late final _TranslationsHomeSectionsId sections = _TranslationsHomeSectionsId._(_root);
}

// Path: listApi
class _TranslationsListApiId implements TranslationsListApiEn {
	_TranslationsListApiId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'List API';
	@override String get subtitle => 'Jelajahi koleksi data statistik dari BPS';
	@override late final _TranslationsListApiSectionsId sections = _TranslationsListApiSectionsId._(_root);
}

// Path: viewApi
class _TranslationsViewApiId implements TranslationsViewApiEn {
	_TranslationsViewApiId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'View API';
	@override String get subtitle => 'Tampilan informasi detail';
	@override late final _TranslationsViewApiSectionsId sections = _TranslationsViewApiSectionsId._(_root);
}

// Path: domains
class _TranslationsDomainsId implements TranslationsDomainsEn {
	_TranslationsDomainsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Domain';
	@override late final _TranslationsDomainsTypesId types = _TranslationsDomainsTypesId._(_root);
	@override late final _TranslationsDomainsFieldsId fields = _TranslationsDomainsFieldsId._(_root);
	@override late final _TranslationsDomainsParametersId parameters = _TranslationsDomainsParametersId._(_root);
	@override late final _TranslationsDomainsRequestDetailsId requestDetails = _TranslationsDomainsRequestDetailsId._(_root);
	@override late final _TranslationsDomainsResultsId results = _TranslationsDomainsResultsId._(_root);
	@override late final _TranslationsDomainsEducationId education = _TranslationsDomainsEducationId._(_root);
}

// Path: infographics
class _TranslationsInfographicsId implements TranslationsInfographicsEn {
	_TranslationsInfographicsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Infografis';
	@override late final _TranslationsInfographicsFieldsId fields = _TranslationsInfographicsFieldsId._(_root);
	@override late final _TranslationsInfographicsParametersId parameters = _TranslationsInfographicsParametersId._(_root);
	@override late final _TranslationsInfographicsRequestDetailsId requestDetails = _TranslationsInfographicsRequestDetailsId._(_root);
	@override late final _TranslationsInfographicsResultsId results = _TranslationsInfographicsResultsId._(_root);
	@override late final _TranslationsInfographicsEducationId education = _TranslationsInfographicsEducationId._(_root);
}

// Path: publications
class _TranslationsPublicationsId implements TranslationsPublicationsEn {
	_TranslationsPublicationsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Publikasi';
	@override String get comingSoon => 'Halaman Publikasi - Segera Hadir';
	@override late final _TranslationsPublicationsDetailId detail = _TranslationsPublicationsDetailId._(_root);
	@override late final _TranslationsPublicationsFieldsId fields = _TranslationsPublicationsFieldsId._(_root);
}

// Path: news
class _TranslationsNewsId implements TranslationsNewsEn {
	_TranslationsNewsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Berita';
	@override String get categories => 'Kategori';
	@override late final _TranslationsNewsFieldsId fields = _TranslationsNewsFieldsId._(_root);
	@override late final _TranslationsNewsParametersId parameters = _TranslationsNewsParametersId._(_root);
	@override late final _TranslationsNewsRequestDetailsId requestDetails = _TranslationsNewsRequestDetailsId._(_root);
	@override late final _TranslationsNewsResultsId results = _TranslationsNewsResultsId._(_root);
	@override late final _TranslationsNewsDetailId detail = _TranslationsNewsDetailId._(_root);
	@override late final _TranslationsNewsEducationId education = _TranslationsNewsEducationId._(_root);
}

// Path: newsCategories
class _TranslationsNewsCategoriesId implements TranslationsNewsCategoriesEn {
	_TranslationsNewsCategoriesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Berita';
	@override late final _TranslationsNewsCategoriesFieldsId fields = _TranslationsNewsCategoriesFieldsId._(_root);
	@override late final _TranslationsNewsCategoriesParametersId parameters = _TranslationsNewsCategoriesParametersId._(_root);
	@override late final _TranslationsNewsCategoriesRequestDetailsId requestDetails = _TranslationsNewsCategoriesRequestDetailsId._(_root);
	@override late final _TranslationsNewsCategoriesResultsId results = _TranslationsNewsCategoriesResultsId._(_root);
	@override late final _TranslationsNewsCategoriesCategoryDetailId categoryDetail = _TranslationsNewsCategoriesCategoryDetailId._(_root);
	@override late final _TranslationsNewsCategoriesEducationId education = _TranslationsNewsCategoriesEducationId._(_root);
}

// Path: dynamicTables
class _TranslationsDynamicTablesId implements TranslationsDynamicTablesEn {
	_TranslationsDynamicTablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Dinamis';
	@override late final _TranslationsDynamicTablesParametersId parameters = _TranslationsDynamicTablesParametersId._(_root);
	@override late final _TranslationsDynamicTablesRequestDetailsId requestDetails = _TranslationsDynamicTablesRequestDetailsId._(_root);
	@override late final _TranslationsDynamicTablesResultsId results = _TranslationsDynamicTablesResultsId._(_root);
	@override late final _TranslationsDynamicTablesWorkflowId workflow = _TranslationsDynamicTablesWorkflowId._(_root);
	@override late final _TranslationsDynamicTablesStatesId states = _TranslationsDynamicTablesStatesId._(_root);
}

// Path: pressReleases
class _TranslationsPressReleasesId implements TranslationsPressReleasesEn {
	_TranslationsPressReleasesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Siaran Pers';
	@override String get comingSoon => 'Halaman Siaran Pers - Segera Hadir';
	@override late final _TranslationsPressReleasesDetailId detail = _TranslationsPressReleasesDetailId._(_root);
}

// Path: staticTables
class _TranslationsStaticTablesId implements TranslationsStaticTablesEn {
	_TranslationsStaticTablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Statis';
	@override String get comingSoon => 'Halaman Tabel Statis - Segera Hadir';
	@override late final _TranslationsStaticTablesDetailId detail = _TranslationsStaticTablesDetailId._(_root);
}

// Path: strategicIndicators
class _TranslationsStrategicIndicatorsId implements TranslationsStrategicIndicatorsEn {
	_TranslationsStrategicIndicatorsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator Strategis';
	@override String get comingSoon => 'Halaman Indikator Strategis - Segera Hadir';
}

// Path: subjects
class _TranslationsSubjectsId implements TranslationsSubjectsEn {
	_TranslationsSubjectsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subjek';
	@override String get comingSoon => 'Halaman Subjek - Segera Hadir';
}

// Path: units
class _TranslationsUnitsId implements TranslationsUnitsEn {
	_TranslationsUnitsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unit';
	@override String get comingSoon => 'Halaman Unit - Segera Hadir';
}

// Path: variables
class _TranslationsVariablesId implements TranslationsVariablesEn {
	_TranslationsVariablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel';
	@override String get comingSoon => 'Halaman Variabel - Segera Hadir';
}

// Path: shared
class _TranslationsSharedId implements TranslationsSharedEn {
	_TranslationsSharedId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSharedPaginationId pagination = _TranslationsSharedPaginationId._(_root);
	@override late final _TranslationsSharedCodeSnippetId codeSnippet = _TranslationsSharedCodeSnippetId._(_root);
	@override late final _TranslationsSharedErrorWidgetId errorWidget = _TranslationsSharedErrorWidgetId._(_root);
	@override late final _TranslationsSharedSearchableDropdownId searchableDropdown = _TranslationsSharedSearchableDropdownId._(_root);
	@override late final _TranslationsSharedRequestDetailsId requestDetails = _TranslationsSharedRequestDetailsId._(_root);
}

// Path: validation
class _TranslationsValidationId implements TranslationsValidationEn {
	_TranslationsValidationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get domainRequired => 'Domain diperlukan';
}

// Path: categories
class _TranslationsCategoriesId implements TranslationsCategoriesEn {
	_TranslationsCategoriesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get imageNotAvailable => 'Gambar tidak tersedia';
	@override String get categoryId => 'ID Kategori';
	@override String get releaseDate => 'Tanggal Rilis';
	@override String get imageUrl => 'URL Gambar';
	@override String get tapToReadMore => 'Ketuk untuk baca lebih lanjut';
}

// Path: instructions
class _TranslationsInstructionsId implements TranslationsInstructionsEn {
	_TranslationsInstructionsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get requestDetailsWillShow => 'Detail request akan ditampilkan di halaman hasil';
	@override String get onlyHandlesParameters => 'Halaman ini hanya menangani konfigurasi parameter. Klik "Cari Domain" untuk melihat detail request di halaman hasil.';
	@override late final _TranslationsInstructionsLanguageLabelsId languageLabels = _TranslationsInstructionsLanguageLabelsId._(_root);
}

// Path: settings
class _TranslationsSettingsId implements TranslationsSettingsEn {
	_TranslationsSettingsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pengaturan';
	@override String get language => 'Bahasa';
	@override String get theme => 'Tema';
	@override String get darkMode => 'Mode Gelap';
	@override String get about => 'Tentang';
}

// Path: home.features
class _TranslationsHomeFeaturesId implements TranslationsHomeFeaturesEn {
	_TranslationsHomeFeaturesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fitur';
}

// Path: home.aboutDemo
class _TranslationsHomeAboutDemoId implements TranslationsHomeAboutDemoEn {
	_TranslationsHomeAboutDemoId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang Demo Ini';
	@override String get description => 'Contoh sederhana ini mendemonstrasikan fungsionalitas domain dari STADATA Flutter SDK. Klik pada kartu domain di atas untuk menjelajahi domain statistik dari BPS Indonesia.';
}

// Path: home.sections
class _TranslationsHomeSectionsId implements TranslationsHomeSectionsEn {
	_TranslationsHomeSectionsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeSectionsListApiId listApi = _TranslationsHomeSectionsListApiId._(_root);
	@override late final _TranslationsHomeSectionsViewApiId viewApi = _TranslationsHomeSectionsViewApiId._(_root);
	@override late final _TranslationsHomeSectionsDynamicTablesId dynamicTables = _TranslationsHomeSectionsDynamicTablesId._(_root);
	@override late final _TranslationsHomeSectionsPeriodsId periods = _TranslationsHomeSectionsPeriodsId._(_root);
}

// Path: listApi.sections
class _TranslationsListApiSectionsId implements TranslationsListApiSectionsEn {
	_TranslationsListApiSectionsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsListApiSectionsDomainsId domains = _TranslationsListApiSectionsDomainsId._(_root);
	@override late final _TranslationsListApiSectionsPublicationsId publications = _TranslationsListApiSectionsPublicationsId._(_root);
	@override late final _TranslationsListApiSectionsNewsId news = _TranslationsListApiSectionsNewsId._(_root);
	@override late final _TranslationsListApiSectionsPressReleasesId pressReleases = _TranslationsListApiSectionsPressReleasesId._(_root);
	@override late final _TranslationsListApiSectionsInfographicsId infographics = _TranslationsListApiSectionsInfographicsId._(_root);
	@override late final _TranslationsListApiSectionsNewsCategoriesId newsCategories = _TranslationsListApiSectionsNewsCategoriesId._(_root);
	@override late final _TranslationsListApiSectionsDynamicTablesId dynamicTables = _TranslationsListApiSectionsDynamicTablesId._(_root);
	@override late final _TranslationsListApiSectionsStaticTablesId staticTables = _TranslationsListApiSectionsStaticTablesId._(_root);
	@override late final _TranslationsListApiSectionsStrategicIndicatorsId strategicIndicators = _TranslationsListApiSectionsStrategicIndicatorsId._(_root);
	@override late final _TranslationsListApiSectionsSubjectsId subjects = _TranslationsListApiSectionsSubjectsId._(_root);
	@override late final _TranslationsListApiSectionsVariablesId variables = _TranslationsListApiSectionsVariablesId._(_root);
	@override late final _TranslationsListApiSectionsUnitsId units = _TranslationsListApiSectionsUnitsId._(_root);
}

// Path: viewApi.sections
class _TranslationsViewApiSectionsId implements TranslationsViewApiSectionsEn {
	_TranslationsViewApiSectionsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsViewApiSectionsPublicationId publication = _TranslationsViewApiSectionsPublicationId._(_root);
	@override late final _TranslationsViewApiSectionsNewsId news = _TranslationsViewApiSectionsNewsId._(_root);
	@override late final _TranslationsViewApiSectionsPressReleaseId pressRelease = _TranslationsViewApiSectionsPressReleaseId._(_root);
	@override late final _TranslationsViewApiSectionsStaticTableId staticTable = _TranslationsViewApiSectionsStaticTableId._(_root);
}

// Path: domains.types
class _TranslationsDomainsTypesId implements TranslationsDomainsTypesEn {
	_TranslationsDomainsTypesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get province => 'Provinsi';
	@override String get regency => 'Kabupaten';
	@override String get regencyByProvince => 'Kabupaten by Provinsi';
	@override String get all => 'Semua Domain';
}

// Path: domains.fields
class _TranslationsDomainsFieldsId implements TranslationsDomainsFieldsEn {
	_TranslationsDomainsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
	@override String get url => 'URL';
}

// Path: domains.parameters
class _TranslationsDomainsParametersId implements TranslationsDomainsParametersEn {
	_TranslationsDomainsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domainType => 'Tipe Domain';
	@override String get provinceCode => 'Kode Provinsi';
	@override String get provinceCodeHint => 'contoh: 32 untuk Jawa Barat';
	@override String get provinceCodeRequired => 'Kode provinsi diperlukan untuk tipe Kabupaten by Provinsi';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Edukatif - tidak diterapkan ke endpoint domain';
	@override String get loadButton => 'Muat Domain';
	@override String get loading => 'Memuat...';
	@override String get searchDomains => 'Cari Domain';
}

// Path: domains.requestDetails
class _TranslationsDomainsRequestDetailsId implements TranslationsDomainsRequestDetailsEn {
	_TranslationsDomainsRequestDetailsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get method => 'Metode';
	@override String get url => 'URL';
	@override String get parameters => 'Parameter';
	@override String get responseTime => 'Waktu Respons';
	@override String get copyUrl => 'Salin URL';
	@override String get urlCopied => 'URL disalin ke clipboard';
	@override String get noRequest => 'Belum ada request dibuat';
	@override String get showDetails => 'Tampilkan Detail Request';
	@override String get hideDetails => 'Sembunyikan Detail Request';
}

// Path: domains.results
class _TranslationsDomainsResultsId implements TranslationsDomainsResultsEn {
	_TranslationsDomainsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Domain';
	@override String get found => 'Ditemukan {count} domain';
	@override String get empty => 'Tidak ada domain ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Pilih parameter dan klik "Muat Domain" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: domains.education
class _TranslationsDomainsEducationId implements TranslationsDomainsEducationEn {
	_TranslationsDomainsEducationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cara Menggunakan';
	@override String get description => 'Pelajari cara mencari dan menjelajahi data domain dari BPS.';
	@override String get parameters => 'Parameter';
	@override String get parametersDescription => 'Konfigurasikan tipe domain dan pengaturan wilayah';
	@override String get results => 'Hasil';
	@override String get resultsDescription => 'Lihat domain yang sesuai dengan kriteria Anda';
	@override String get detail => 'Detail';
	@override String get detailDescription => 'Lihat informasi domain dan link akses';
}

// Path: infographics.fields
class _TranslationsInfographicsFieldsId implements TranslationsInfographicsFieldsEn {
	_TranslationsInfographicsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get image => 'Gambar';
	@override String get description => 'Deskripsi';
	@override String get category => 'Kategori';
	@override String get downloadUrl => 'URL Unduh';
}

// Path: infographics.parameters
class _TranslationsInfographicsParametersId implements TranslationsInfographicsParametersEn {
	_TranslationsInfographicsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'contoh: 7200 untuk tingkat nasional';
	@override String get keyword => 'Kata Kunci (Opsional)';
	@override String get keywordHint => 'Filter berdasarkan kata kunci';
	@override String get page => 'Halaman';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Diterapkan pada bahasa konten infografis';
	@override String get loadButton => 'Muat Infografis';
	@override String get loading => 'Memuat...';
	@override String get searchInfographics => 'Cari Infografis';
}

// Path: infographics.requestDetails
class _TranslationsInfographicsRequestDetailsId implements TranslationsInfographicsRequestDetailsEn {
	_TranslationsInfographicsRequestDetailsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get method => 'Metode';
	@override String get url => 'URL';
	@override String get parameters => 'Parameter';
	@override String get responseTime => 'Waktu Respons';
	@override String get copyUrl => 'Salin URL';
	@override String get urlCopied => 'URL disalin ke clipboard';
	@override String get noRequest => 'Belum ada request dibuat';
	@override String get showDetails => 'Tampilkan Detail Request';
	@override String get hideDetails => 'Sembunyikan Detail Request';
}

// Path: infographics.results
class _TranslationsInfographicsResultsId implements TranslationsInfographicsResultsEn {
	_TranslationsInfographicsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil';
	@override String get found => 'Ditemukan {count} infografis';
	@override String get empty => 'Tidak ada infografis ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasikan parameter dan klik "Muat Infografis" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: infographics.education
class _TranslationsInfographicsEducationId implements TranslationsInfographicsEducationEn {
	_TranslationsInfographicsEducationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tips';
	@override String get description => 'Pelajari cara menggunakan fitur infografis secara efektif.';
	@override String get parameters => 'Parameter';
	@override String get parametersDescription => 'Konfigurasikan kriteria pencarian Anda di sini';
	@override String get results => 'Hasil';
	@override String get resultsDescription => 'Lihat infografis yang sesuai dengan kriteria Anda';
	@override String get detail => 'Detail';
	@override String get detailDescription => 'Lihat konten lengkap dan opsi unduhan';
}

// Path: publications.detail
class _TranslationsPublicationsDetailId implements TranslationsPublicationsDetailEn {
	_TranslationsPublicationsDetailId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Publikasi';
}

// Path: publications.fields
class _TranslationsPublicationsFieldsId implements TranslationsPublicationsFieldsEn {
	_TranslationsPublicationsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get issn => 'ISSN';
	@override String get cover => 'Sampul';
	@override String get pdfUrl => 'URL PDF';
	@override String get size => 'Ukuran';
	@override String get abstract => 'Abstrak';
	@override String get catalogueNumber => 'Nomor Katalog';
	@override String get publicationNumber => 'Nomor Publikasi';
	@override String get releaseDate => 'Tanggal Rilis';
	@override String get updatedAt => 'Diperbarui';
}

// Path: news.fields
class _TranslationsNewsFieldsId implements TranslationsNewsFieldsEn {
	_TranslationsNewsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get content => 'Konten';
	@override String get picture => 'Gambar';
	@override String get releaseDate => 'Tanggal Rilis';
	@override String get category => 'Kategori';
	@override String get categoryID => 'ID Kategori';
}

// Path: news.parameters
class _TranslationsNewsParametersId implements TranslationsNewsParametersEn {
	_TranslationsNewsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'contoh: 7200 untuk Sulawesi Tengah';
	@override String get keyword => 'Kata Kunci (Opsional)';
	@override String get keywordHint => 'Filter berdasarkan kata kunci';
	@override String get category => 'ID Kategori (Opsional)';
	@override String get categoryHint => 'Filter berdasarkan ID kategori berita';
	@override String get month => 'Bulan (Opsional)';
	@override String get monthHint => 'Pilih bulan';
	@override String get year => 'Tahun (Opsional)';
	@override String get yearHint => 'Pilih tahun';
	@override String get page => 'Halaman';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Diterapkan pada bahasa konten berita';
	@override String get loadButton => 'Muat Berita';
	@override String get searchNews => 'Cari Berita';
	@override String get clearButton => 'Hapus Filter';
	@override String get loading => 'Memuat...';
}

// Path: news.requestDetails
class _TranslationsNewsRequestDetailsId implements TranslationsNewsRequestDetailsEn {
	_TranslationsNewsRequestDetailsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get method => 'Metode';
	@override String get url => 'URL';
	@override String get parameters => 'Parameter';
	@override String get responseTime => 'Waktu Respons';
	@override String get copyUrl => 'Salin URL';
	@override String get urlCopied => 'URL disalin ke clipboard';
	@override String get noRequest => 'Belum ada request dibuat';
	@override String get showDetails => 'Tampilkan Detail Request';
	@override String get hideDetails => 'Sembunyikan Detail Request';
}

// Path: news.results
class _TranslationsNewsResultsId implements TranslationsNewsResultsEn {
	_TranslationsNewsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Berita';
	@override String get found => 'Ditemukan {count} artikel berita';
	@override String get empty => 'Tidak ada berita ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasikan parameter dan klik "Muat Berita" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: news.detail
class _TranslationsNewsDetailId implements TranslationsNewsDetailEn {
	_TranslationsNewsDetailId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Berita';
	@override String get metadata => 'Informasi Berita';
	@override String get content => 'Konten Artikel';
}

// Path: news.education
class _TranslationsNewsEducationId implements TranslationsNewsEducationEn {
	_TranslationsNewsEducationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cara kerja';
	@override String get description => 'Ini mendemonstrasikan alur kerja API berita dengan halaman terpisah untuk parameter, hasil, dan tampilan detail.';
	@override String get parameters => 'Parameter';
	@override String get parametersDescription => 'Konfigurasikan kriteria pencarian Anda di sini';
	@override String get results => 'Hasil';
	@override String get resultsDescription => 'Lihat artikel berita yang sesuai dengan kriteria Anda';
	@override String get detail => 'Detail';
	@override String get detailDescription => 'Lihat konten lengkap menggunakan view API';
}

// Path: newsCategories.fields
class _TranslationsNewsCategoriesFieldsId implements TranslationsNewsCategoriesFieldsEn {
	_TranslationsNewsCategoriesFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
}

// Path: newsCategories.parameters
class _TranslationsNewsCategoriesParametersId implements TranslationsNewsCategoriesParametersEn {
	_TranslationsNewsCategoriesParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'contoh: 7200 untuk tingkat nasional';
	@override String get domainDescription => 'Kode domain 4+ karakter (wajib)';
	@override String get language => 'Bahasa';
	@override String get languageIndonesian => 'Indonesia';
	@override String get languageEnglish => 'Inggris';
	@override String get languageDescription => 'Bahasa konten untuk kategori berita';
	@override String get searchNewsCategories => 'Cari Kategori Berita';
}

// Path: newsCategories.requestDetails
class _TranslationsNewsCategoriesRequestDetailsId implements TranslationsNewsCategoriesRequestDetailsEn {
	_TranslationsNewsCategoriesRequestDetailsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get endpoint => 'Endpoint';
	@override String get method => 'Metode';
	@override String get parameters => 'Parameter';
	@override String get curlExample => 'Contoh cURL';
	@override String get showDetails => 'Tampilkan Detail Request';
	@override String get hideDetails => 'Sembunyikan Detail Request';
	@override String get noRequestYet => 'Belum ada request dibuat';
}

// Path: newsCategories.results
class _TranslationsNewsCategoriesResultsId implements TranslationsNewsCategoriesResultsEn {
	_TranslationsNewsCategoriesResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Kategori Berita';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String get categoriesFound => 'kategori ditemukan';
	@override String get noDataFound => 'Tidak Ada Kategori Ditemukan';
	@override String get noDataDescription => 'Coba sesuaikan parameter pencarian atau periksa apakah domain tersebut ada.';
}

// Path: newsCategories.categoryDetail
class _TranslationsNewsCategoriesCategoryDetailId implements TranslationsNewsCategoriesCategoryDetailEn {
	_TranslationsNewsCategoriesCategoryDetailId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Kategori';
	@override String get id => 'ID Kategori';
	@override String get name => 'Nama Kategori';
}

// Path: newsCategories.education
class _TranslationsNewsCategoriesEducationId implements TranslationsNewsCategoriesEducationEn {
	_TranslationsNewsCategoriesEducationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cara kerja';
	@override String get description => 'Jelajahi kategori berita yang tersedia untuk domain dan bahasa yang berbeda dari data statistik BPS.';
	@override String get parameters => 'Parameter';
	@override String get parametersDescription => 'Konfigurasikan pengaturan domain dan bahasa';
	@override String get results => 'Hasil';
	@override String get resultsDescription => 'Lihat kategori berita yang tersedia untuk domain';
	@override String get categories => 'Kategori';
	@override String get categoriesDescription => 'Jelajahi klasifikasi kategori berita yang berbeda';
}

// Path: dynamicTables.parameters
class _TranslationsDynamicTablesParametersId implements TranslationsDynamicTablesParametersEn {
	_TranslationsDynamicTablesParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'contoh: 7200 untuk tingkat nasional';
	@override String get variable => 'Variabel';
	@override String get variableHint => 'Pilih variabel statistik';
	@override String get selectYear => 'Pilih Tahun';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Diterapkan pada bahasa konten tabel dinamis';
	@override String get loadPeriods => 'Muat Periode yang Tersedia';
	@override String get generateTable => 'Generate Tabel Dinamis';
	@override String get loading => 'Memuat...';
}

// Path: dynamicTables.requestDetails
class _TranslationsDynamicTablesRequestDetailsId implements TranslationsDynamicTablesRequestDetailsEn {
	_TranslationsDynamicTablesRequestDetailsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get showDetails => 'Tampilkan Detail Request';
	@override String get hideDetails => 'Sembunyikan Detail Request';
	@override String get noRequest => 'Belum ada request dibuat';
}

// Path: dynamicTables.results
class _TranslationsDynamicTablesResultsId implements TranslationsDynamicTablesResultsEn {
	_TranslationsDynamicTablesResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Tabel Dinamis';
	@override String get periodsAvailable => 'Periode yang Tersedia';
	@override String get selectPeriod => 'Pilih periode dari atas untuk generate tabel';
	@override String get tableGenerated => 'Tabel berhasil di-generate';
	@override String get empty => 'Tidak ada data tersedia untuk kriteria yang dipilih';
	@override String get initial => 'Masukkan parameter di atas dan klik "Muat Tahun yang Tersedia" untuk memulai';
	@override String get periodInitial => 'Pilih tahun dari dropdown di atas, lalu klik "Muat Tabel Dinamis" untuk melihat data.';
	@override String get periodId => 'ID Periode';
}

// Path: dynamicTables.workflow
class _TranslationsDynamicTablesWorkflowId implements TranslationsDynamicTablesWorkflowEn {
	_TranslationsDynamicTablesWorkflowId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Alur Kerja Tabel Dinamis';
	@override String get description => 'Ikuti langkah-langkah ini untuk menghasilkan tabel dinamis dari data BPS.';
	@override String get step1 => 'Langkah 1';
	@override String get step1Description => 'Pilih domain dan bahasa, lalu pilih variabel';
	@override String get step2 => 'Langkah 2';
	@override String get step2Description => 'Muat periode yang tersedia untuk variabel yang dipilih';
	@override String get step3 => 'Langkah 3';
	@override String get step3Description => 'Pilih tahun/periode dan generate tabel';
}

// Path: dynamicTables.states
class _TranslationsDynamicTablesStatesId implements TranslationsDynamicTablesStatesEn {
	_TranslationsDynamicTablesStatesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get initializing => 'Menginisialisasi...';
	@override String get unknown => 'Status tidak diketahui';
}

// Path: pressReleases.detail
class _TranslationsPressReleasesDetailId implements TranslationsPressReleasesDetailEn {
	_TranslationsPressReleasesDetailId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Siaran Pers';
	@override String get forId => 'Detail Siaran Pers untuk ID: {id}';
}

// Path: staticTables.detail
class _TranslationsStaticTablesDetailId implements TranslationsStaticTablesDetailEn {
	_TranslationsStaticTablesDetailId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Tabel Statis';
	@override String get forId => 'Detail Tabel Statis untuk ID: {id}';
}

// Path: shared.pagination
class _TranslationsSharedPaginationId implements TranslationsSharedPaginationEn {
	_TranslationsSharedPaginationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get previous => 'Sebelumnya';
	@override String get next => 'Selanjutnya';
	@override String get loadMore => 'Muat Lebih Banyak';
	@override String get page => 'Halaman';
	@override String get previousPage => 'Halaman sebelumnya';
	@override String get nextPage => 'Halaman selanjutnya';
	@override String get previousPageTooltip => 'Halaman sebelumnya';
	@override String get nextPageTooltip => 'Halaman selanjutnya';
}

// Path: shared.codeSnippet
class _TranslationsSharedCodeSnippetId implements TranslationsSharedCodeSnippetEn {
	_TranslationsSharedCodeSnippetId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get copyToClipboard => 'Salin ke clipboard';
	@override String get codeCopied => 'Kode disalin ke clipboard';
}

// Path: shared.errorWidget
class _TranslationsSharedErrorWidgetId implements TranslationsSharedErrorWidgetEn {
	_TranslationsSharedErrorWidgetId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Coba Lagi';
}

// Path: shared.searchableDropdown
class _TranslationsSharedSearchableDropdownId implements TranslationsSharedSearchableDropdownEn {
	_TranslationsSharedSearchableDropdownId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get noItemsFound => 'Tidak ada item ditemukan';
	@override String get selectItem => 'Pilih item';
}

// Path: shared.requestDetails
class _TranslationsSharedRequestDetailsId implements TranslationsSharedRequestDetailsEn {
	_TranslationsSharedRequestDetailsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get method => 'Metode';
	@override String get url => 'URL';
	@override String get parameters => 'Parameter';
	@override String get urlCopied => 'URL disalin ke clipboard';
	@override String get parametersCopied => 'Parameter disalin ke clipboard';
}

// Path: instructions.languageLabels
class _TranslationsInstructionsLanguageLabelsId implements TranslationsInstructionsLanguageLabelsEn {
	_TranslationsInstructionsLanguageLabelsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get indonesian => 'Indonesia';
	@override String get english => 'Inggris';
}

// Path: home.sections.listApi
class _TranslationsHomeSectionsListApiId implements TranslationsHomeSectionsListApiEn {
	_TranslationsHomeSectionsListApiId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'List API';
	@override String get description => 'Jelajahi koleksi domain, publikasi, berita, dan lainnya';
}

// Path: home.sections.viewApi
class _TranslationsHomeSectionsViewApiId implements TranslationsHomeSectionsViewApiEn {
	_TranslationsHomeSectionsViewApiId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'View API';
	@override String get description => 'Dapatkan informasi detail tentang publikasi, berita, dan siaran pers tertentu';
}

// Path: home.sections.dynamicTables
class _TranslationsHomeSectionsDynamicTablesId implements TranslationsHomeSectionsDynamicTablesEn {
	_TranslationsHomeSectionsDynamicTablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Dinamis';
	@override String get description => 'Jelajahi tabel statistik dinamis dengan parameter yang dapat disesuaikan';
}

// Path: home.sections.periods
class _TranslationsHomeSectionsPeriodsId implements TranslationsHomeSectionsPeriodsEn {
	_TranslationsHomeSectionsPeriodsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Periode';
	@override String get description => 'Jelajahi periode waktu yang tersedia untuk data statistik';
}

// Path: listApi.sections.domains
class _TranslationsListApiSectionsDomainsId implements TranslationsListApiSectionsDomainsEn {
	_TranslationsListApiSectionsDomainsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Domain';
	@override String get description => 'Domain dan wilayah statistik';
}

// Path: listApi.sections.publications
class _TranslationsListApiSectionsPublicationsId implements TranslationsListApiSectionsPublicationsEn {
	_TranslationsListApiSectionsPublicationsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Publikasi';
	@override String get description => 'Publikasi dan laporan statistik';
}

// Path: listApi.sections.news
class _TranslationsListApiSectionsNewsId implements TranslationsListApiSectionsNewsEn {
	_TranslationsListApiSectionsNewsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Berita';
	@override String get description => 'Berita dan update statistik terbaru';
}

// Path: listApi.sections.pressReleases
class _TranslationsListApiSectionsPressReleasesId implements TranslationsListApiSectionsPressReleasesEn {
	_TranslationsListApiSectionsPressReleasesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Siaran Pers';
	@override String get description => 'Siaran pers resmi dari BPS';
}

// Path: listApi.sections.infographics
class _TranslationsListApiSectionsInfographicsId implements TranslationsListApiSectionsInfographicsEn {
	_TranslationsListApiSectionsInfographicsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Infografis';
	@override String get description => 'Informasi statistik visual';
}

// Path: listApi.sections.newsCategories
class _TranslationsListApiSectionsNewsCategoriesId implements TranslationsListApiSectionsNewsCategoriesEn {
	_TranslationsListApiSectionsNewsCategoriesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Berita';
	@override String get description => 'Jelajahi klasifikasi kategori berita dari BPS';
}

// Path: listApi.sections.dynamicTables
class _TranslationsListApiSectionsDynamicTablesId implements TranslationsListApiSectionsDynamicTablesEn {
	_TranslationsListApiSectionsDynamicTablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Dinamis';
	@override String get description => 'Jelajahi data statistik multi-dimensi dengan integrasi periode';
}

// Path: listApi.sections.staticTables
class _TranslationsListApiSectionsStaticTablesId implements TranslationsListApiSectionsStaticTablesEn {
	_TranslationsListApiSectionsStaticTablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Statis';
	@override String get description => 'Tabel statistik yang telah ditentukan';
}

// Path: listApi.sections.strategicIndicators
class _TranslationsListApiSectionsStrategicIndicatorsId implements TranslationsListApiSectionsStrategicIndicatorsEn {
	_TranslationsListApiSectionsStrategicIndicatorsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator Strategis';
	@override String get description => 'Indikator kinerja utama';
}

// Path: listApi.sections.subjects
class _TranslationsListApiSectionsSubjectsId implements TranslationsListApiSectionsSubjectsEn {
	_TranslationsListApiSectionsSubjectsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subjek';
	@override String get description => 'Kategori subjek statistik';
}

// Path: listApi.sections.variables
class _TranslationsListApiSectionsVariablesId implements TranslationsListApiSectionsVariablesEn {
	_TranslationsListApiSectionsVariablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel';
	@override String get description => 'Variabel dan ukuran statistik';
}

// Path: listApi.sections.units
class _TranslationsListApiSectionsUnitsId implements TranslationsListApiSectionsUnitsEn {
	_TranslationsListApiSectionsUnitsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unit';
	@override String get description => 'Unit pengukuran';
}

// Path: viewApi.sections.publication
class _TranslationsViewApiSectionsPublicationId implements TranslationsViewApiSectionsPublicationEn {
	_TranslationsViewApiSectionsPublicationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Publikasi';
	@override String get description => 'Informasi publikasi detail';
}

// Path: viewApi.sections.news
class _TranslationsViewApiSectionsNewsId implements TranslationsViewApiSectionsNewsEn {
	_TranslationsViewApiSectionsNewsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Berita';
	@override String get description => 'Artikel berita detail';
}

// Path: viewApi.sections.pressRelease
class _TranslationsViewApiSectionsPressReleaseId implements TranslationsViewApiSectionsPressReleaseEn {
	_TranslationsViewApiSectionsPressReleaseId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Siaran Pers';
	@override String get description => 'Siaran pers detail';
}

// Path: viewApi.sections.staticTable
class _TranslationsViewApiSectionsStaticTableId implements TranslationsViewApiSectionsStaticTableEn {
	_TranslationsViewApiSectionsStaticTableId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Tabel Statis';
	@override String get description => 'Informasi tabel detail';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'Contoh STADATA';
			case 'app.description': return 'Showcase kemampuan STADATA Flutter SDK';
			case 'navigation.home': return 'Beranda';
			case 'navigation.listApi': return 'List API';
			case 'navigation.viewApi': return 'View API';
			case 'navigation.dynamicTables': return 'Tabel Dinamis';
			case 'navigation.periods': return 'Periode';
			case 'navigation.pageNotFound': return 'Halaman Tidak Ditemukan';
			case 'navigation.pageNotFoundMessage': return 'Halaman yang Anda cari tidak ada.';
			case 'common.loading': return 'Memuat...';
			case 'common.error': return 'Error';
			case 'common.retry': return 'Coba Lagi';
			case 'common.noData': return 'Tidak ada data tersedia';
			case 'common.search': return 'Cari';
			case 'common.refresh': return 'Segarkan';
			case 'common.cancel': return 'Batal';
			case 'common.save': return 'Simpan';
			case 'common.delete': return 'Hapus';
			case 'common.edit': return 'Edit';
			case 'common.create': return 'Buat';
			case 'common.update': return 'Perbarui';
			case 'common.back': return 'Kembali';
			case 'common.next': return 'Selanjutnya';
			case 'common.previous': return 'Sebelumnya';
			case 'common.page': return 'Halaman';
			case 'common.total': return 'Total';
			case 'common.items': return 'item';
			case 'common.of': return 'dari';
			case 'common.language': return 'Bahasa';
			case 'common.unknownState': return 'Status tidak diketahui';
			case 'errors.generic': return 'Terjadi kesalahan. Silakan coba lagi.';
			case 'errors.network': return 'Error jaringan. Periksa koneksi Anda.';
			case 'errors.notFound': return 'Data tidak ditemukan.';
			case 'errors.timeout': return 'Request timeout. Silakan coba lagi.';
			case 'errors.unauthorized': return 'Akses tidak diizinkan.';
			case 'errors.serverError': return 'Error server. Silakan coba lagi nanti.';
			case 'home.title': return 'Selamat Datang di STADATA';
			case 'home.subtitle': return 'Jelajahi Data Statistik Indonesia';
			case 'home.description': return 'Akses data statistik komprehensif dari Badan Pusat Statistik (BPS) Indonesia melalui aplikasi showcase ini.';
			case 'home.features.title': return 'Fitur';
			case 'home.aboutDemo.title': return 'Tentang Demo Ini';
			case 'home.aboutDemo.description': return 'Contoh sederhana ini mendemonstrasikan fungsionalitas domain dari STADATA Flutter SDK. Klik pada kartu domain di atas untuk menjelajahi domain statistik dari BPS Indonesia.';
			case 'home.sections.listApi.title': return 'List API';
			case 'home.sections.listApi.description': return 'Jelajahi koleksi domain, publikasi, berita, dan lainnya';
			case 'home.sections.viewApi.title': return 'View API';
			case 'home.sections.viewApi.description': return 'Dapatkan informasi detail tentang publikasi, berita, dan siaran pers tertentu';
			case 'home.sections.dynamicTables.title': return 'Tabel Dinamis';
			case 'home.sections.dynamicTables.description': return 'Jelajahi tabel statistik dinamis dengan parameter yang dapat disesuaikan';
			case 'home.sections.periods.title': return 'Periode';
			case 'home.sections.periods.description': return 'Jelajahi periode waktu yang tersedia untuk data statistik';
			case 'listApi.title': return 'List API';
			case 'listApi.subtitle': return 'Jelajahi koleksi data statistik dari BPS';
			case 'listApi.sections.domains.title': return 'Domain';
			case 'listApi.sections.domains.description': return 'Domain dan wilayah statistik';
			case 'listApi.sections.publications.title': return 'Publikasi';
			case 'listApi.sections.publications.description': return 'Publikasi dan laporan statistik';
			case 'listApi.sections.news.title': return 'Berita';
			case 'listApi.sections.news.description': return 'Berita dan update statistik terbaru';
			case 'listApi.sections.pressReleases.title': return 'Siaran Pers';
			case 'listApi.sections.pressReleases.description': return 'Siaran pers resmi dari BPS';
			case 'listApi.sections.infographics.title': return 'Infografis';
			case 'listApi.sections.infographics.description': return 'Informasi statistik visual';
			case 'listApi.sections.newsCategories.title': return 'Kategori Berita';
			case 'listApi.sections.newsCategories.description': return 'Jelajahi klasifikasi kategori berita dari BPS';
			case 'listApi.sections.dynamicTables.title': return 'Tabel Dinamis';
			case 'listApi.sections.dynamicTables.description': return 'Jelajahi data statistik multi-dimensi dengan integrasi periode';
			case 'listApi.sections.staticTables.title': return 'Tabel Statis';
			case 'listApi.sections.staticTables.description': return 'Tabel statistik yang telah ditentukan';
			case 'listApi.sections.strategicIndicators.title': return 'Indikator Strategis';
			case 'listApi.sections.strategicIndicators.description': return 'Indikator kinerja utama';
			case 'listApi.sections.subjects.title': return 'Subjek';
			case 'listApi.sections.subjects.description': return 'Kategori subjek statistik';
			case 'listApi.sections.variables.title': return 'Variabel';
			case 'listApi.sections.variables.description': return 'Variabel dan ukuran statistik';
			case 'listApi.sections.units.title': return 'Unit';
			case 'listApi.sections.units.description': return 'Unit pengukuran';
			case 'viewApi.title': return 'View API';
			case 'viewApi.subtitle': return 'Tampilan informasi detail';
			case 'viewApi.sections.publication.title': return 'Detail Publikasi';
			case 'viewApi.sections.publication.description': return 'Informasi publikasi detail';
			case 'viewApi.sections.news.title': return 'Detail Berita';
			case 'viewApi.sections.news.description': return 'Artikel berita detail';
			case 'viewApi.sections.pressRelease.title': return 'Detail Siaran Pers';
			case 'viewApi.sections.pressRelease.description': return 'Siaran pers detail';
			case 'viewApi.sections.staticTable.title': return 'Detail Tabel Statis';
			case 'viewApi.sections.staticTable.description': return 'Informasi tabel detail';
			case 'domains.title': return 'Domain';
			case 'domains.types.province': return 'Provinsi';
			case 'domains.types.regency': return 'Kabupaten';
			case 'domains.types.regencyByProvince': return 'Kabupaten by Provinsi';
			case 'domains.types.all': return 'Semua Domain';
			case 'domains.fields.id': return 'ID';
			case 'domains.fields.name': return 'Nama';
			case 'domains.fields.url': return 'URL';
			case 'domains.parameters.title': return 'Parameter API';
			case 'domains.parameters.domainType': return 'Tipe Domain';
			case 'domains.parameters.provinceCode': return 'Kode Provinsi';
			case 'domains.parameters.provinceCodeHint': return 'contoh: 32 untuk Jawa Barat';
			case 'domains.parameters.provinceCodeRequired': return 'Kode provinsi diperlukan untuk tipe Kabupaten by Provinsi';
			case 'domains.parameters.language': return 'Bahasa';
			case 'domains.parameters.languageNote': return 'Edukatif - tidak diterapkan ke endpoint domain';
			case 'domains.parameters.loadButton': return 'Muat Domain';
			case 'domains.parameters.loading': return 'Memuat...';
			case 'domains.parameters.searchDomains': return 'Cari Domain';
			case 'domains.requestDetails.title': return 'Detail Request';
			case 'domains.requestDetails.method': return 'Metode';
			case 'domains.requestDetails.url': return 'URL';
			case 'domains.requestDetails.parameters': return 'Parameter';
			case 'domains.requestDetails.responseTime': return 'Waktu Respons';
			case 'domains.requestDetails.copyUrl': return 'Salin URL';
			case 'domains.requestDetails.urlCopied': return 'URL disalin ke clipboard';
			case 'domains.requestDetails.noRequest': return 'Belum ada request dibuat';
			case 'domains.requestDetails.showDetails': return 'Tampilkan Detail Request';
			case 'domains.requestDetails.hideDetails': return 'Sembunyikan Detail Request';
			case 'domains.results.title': return 'Hasil Domain';
			case 'domains.results.found': return 'Ditemukan {count} domain';
			case 'domains.results.empty': return 'Tidak ada domain ditemukan untuk kriteria yang dipilih';
			case 'domains.results.initial': return 'Pilih parameter dan klik "Muat Domain" untuk memulai';
			case 'domains.results.searchParameters': return 'Parameter Pencarian';
			case 'domains.education.title': return 'Cara Menggunakan';
			case 'domains.education.description': return 'Pelajari cara mencari dan menjelajahi data domain dari BPS.';
			case 'domains.education.parameters': return 'Parameter';
			case 'domains.education.parametersDescription': return 'Konfigurasikan tipe domain dan pengaturan wilayah';
			case 'domains.education.results': return 'Hasil';
			case 'domains.education.resultsDescription': return 'Lihat domain yang sesuai dengan kriteria Anda';
			case 'domains.education.detail': return 'Detail';
			case 'domains.education.detailDescription': return 'Lihat informasi domain dan link akses';
			case 'infographics.title': return 'Infografis';
			case 'infographics.fields.id': return 'ID';
			case 'infographics.fields.title': return 'Judul';
			case 'infographics.fields.image': return 'Gambar';
			case 'infographics.fields.description': return 'Deskripsi';
			case 'infographics.fields.category': return 'Kategori';
			case 'infographics.fields.downloadUrl': return 'URL Unduh';
			case 'infographics.parameters.title': return 'Parameter API';
			case 'infographics.parameters.domain': return 'Domain';
			case 'infographics.parameters.domainHint': return 'contoh: 7200 untuk tingkat nasional';
			case 'infographics.parameters.keyword': return 'Kata Kunci (Opsional)';
			case 'infographics.parameters.keywordHint': return 'Filter berdasarkan kata kunci';
			case 'infographics.parameters.page': return 'Halaman';
			case 'infographics.parameters.language': return 'Bahasa';
			case 'infographics.parameters.languageNote': return 'Diterapkan pada bahasa konten infografis';
			case 'infographics.parameters.loadButton': return 'Muat Infografis';
			case 'infographics.parameters.loading': return 'Memuat...';
			case 'infographics.parameters.searchInfographics': return 'Cari Infografis';
			case 'infographics.requestDetails.title': return 'Detail Request';
			case 'infographics.requestDetails.method': return 'Metode';
			case 'infographics.requestDetails.url': return 'URL';
			case 'infographics.requestDetails.parameters': return 'Parameter';
			case 'infographics.requestDetails.responseTime': return 'Waktu Respons';
			case 'infographics.requestDetails.copyUrl': return 'Salin URL';
			case 'infographics.requestDetails.urlCopied': return 'URL disalin ke clipboard';
			case 'infographics.requestDetails.noRequest': return 'Belum ada request dibuat';
			case 'infographics.requestDetails.showDetails': return 'Tampilkan Detail Request';
			case 'infographics.requestDetails.hideDetails': return 'Sembunyikan Detail Request';
			case 'infographics.results.title': return 'Hasil';
			case 'infographics.results.found': return 'Ditemukan {count} infografis';
			case 'infographics.results.empty': return 'Tidak ada infografis ditemukan untuk kriteria yang dipilih';
			case 'infographics.results.initial': return 'Konfigurasikan parameter dan klik "Muat Infografis" untuk memulai';
			case 'infographics.results.searchParameters': return 'Parameter Pencarian';
			case 'infographics.education.title': return 'Tips';
			case 'infographics.education.description': return 'Pelajari cara menggunakan fitur infografis secara efektif.';
			case 'infographics.education.parameters': return 'Parameter';
			case 'infographics.education.parametersDescription': return 'Konfigurasikan kriteria pencarian Anda di sini';
			case 'infographics.education.results': return 'Hasil';
			case 'infographics.education.resultsDescription': return 'Lihat infografis yang sesuai dengan kriteria Anda';
			case 'infographics.education.detail': return 'Detail';
			case 'infographics.education.detailDescription': return 'Lihat konten lengkap dan opsi unduhan';
			case 'publications.title': return 'Publikasi';
			case 'publications.comingSoon': return 'Halaman Publikasi - Segera Hadir';
			case 'publications.detail.title': return 'Detail Publikasi';
			case 'publications.fields.id': return 'ID';
			case 'publications.fields.title': return 'Judul';
			case 'publications.fields.issn': return 'ISSN';
			case 'publications.fields.cover': return 'Sampul';
			case 'publications.fields.pdfUrl': return 'URL PDF';
			case 'publications.fields.size': return 'Ukuran';
			case 'publications.fields.abstract': return 'Abstrak';
			case 'publications.fields.catalogueNumber': return 'Nomor Katalog';
			case 'publications.fields.publicationNumber': return 'Nomor Publikasi';
			case 'publications.fields.releaseDate': return 'Tanggal Rilis';
			case 'publications.fields.updatedAt': return 'Diperbarui';
			case 'news.title': return 'Berita';
			case 'news.categories': return 'Kategori';
			case 'news.fields.id': return 'ID';
			case 'news.fields.title': return 'Judul';
			case 'news.fields.content': return 'Konten';
			case 'news.fields.picture': return 'Gambar';
			case 'news.fields.releaseDate': return 'Tanggal Rilis';
			case 'news.fields.category': return 'Kategori';
			case 'news.fields.categoryID': return 'ID Kategori';
			case 'news.parameters.title': return 'Parameter API';
			case 'news.parameters.domain': return 'Domain';
			case 'news.parameters.domainHint': return 'contoh: 7200 untuk Sulawesi Tengah';
			case 'news.parameters.keyword': return 'Kata Kunci (Opsional)';
			case 'news.parameters.keywordHint': return 'Filter berdasarkan kata kunci';
			case 'news.parameters.category': return 'ID Kategori (Opsional)';
			case 'news.parameters.categoryHint': return 'Filter berdasarkan ID kategori berita';
			case 'news.parameters.month': return 'Bulan (Opsional)';
			case 'news.parameters.monthHint': return 'Pilih bulan';
			case 'news.parameters.year': return 'Tahun (Opsional)';
			case 'news.parameters.yearHint': return 'Pilih tahun';
			case 'news.parameters.page': return 'Halaman';
			case 'news.parameters.language': return 'Bahasa';
			case 'news.parameters.languageNote': return 'Diterapkan pada bahasa konten berita';
			case 'news.parameters.loadButton': return 'Muat Berita';
			case 'news.parameters.searchNews': return 'Cari Berita';
			case 'news.parameters.clearButton': return 'Hapus Filter';
			case 'news.parameters.loading': return 'Memuat...';
			case 'news.requestDetails.title': return 'Detail Request';
			case 'news.requestDetails.method': return 'Metode';
			case 'news.requestDetails.url': return 'URL';
			case 'news.requestDetails.parameters': return 'Parameter';
			case 'news.requestDetails.responseTime': return 'Waktu Respons';
			case 'news.requestDetails.copyUrl': return 'Salin URL';
			case 'news.requestDetails.urlCopied': return 'URL disalin ke clipboard';
			case 'news.requestDetails.noRequest': return 'Belum ada request dibuat';
			case 'news.requestDetails.showDetails': return 'Tampilkan Detail Request';
			case 'news.requestDetails.hideDetails': return 'Sembunyikan Detail Request';
			case 'news.results.title': return 'Hasil Berita';
			case 'news.results.found': return 'Ditemukan {count} artikel berita';
			case 'news.results.empty': return 'Tidak ada berita ditemukan untuk kriteria yang dipilih';
			case 'news.results.initial': return 'Konfigurasikan parameter dan klik "Muat Berita" untuk memulai';
			case 'news.results.searchParameters': return 'Parameter Pencarian';
			case 'news.detail.title': return 'Detail Berita';
			case 'news.detail.metadata': return 'Informasi Berita';
			case 'news.detail.content': return 'Konten Artikel';
			case 'news.education.title': return 'Cara kerja';
			case 'news.education.description': return 'Ini mendemonstrasikan alur kerja API berita dengan halaman terpisah untuk parameter, hasil, dan tampilan detail.';
			case 'news.education.parameters': return 'Parameter';
			case 'news.education.parametersDescription': return 'Konfigurasikan kriteria pencarian Anda di sini';
			case 'news.education.results': return 'Hasil';
			case 'news.education.resultsDescription': return 'Lihat artikel berita yang sesuai dengan kriteria Anda';
			case 'news.education.detail': return 'Detail';
			case 'news.education.detailDescription': return 'Lihat konten lengkap menggunakan view API';
			case 'newsCategories.title': return 'Kategori Berita';
			case 'newsCategories.fields.id': return 'ID';
			case 'newsCategories.fields.name': return 'Nama';
			case 'newsCategories.parameters.title': return 'Parameter API';
			case 'newsCategories.parameters.domain': return 'Domain';
			case 'newsCategories.parameters.domainHint': return 'contoh: 7200 untuk tingkat nasional';
			case 'newsCategories.parameters.domainDescription': return 'Kode domain 4+ karakter (wajib)';
			case 'newsCategories.parameters.language': return 'Bahasa';
			case 'newsCategories.parameters.languageIndonesian': return 'Indonesia';
			case 'newsCategories.parameters.languageEnglish': return 'Inggris';
			case 'newsCategories.parameters.languageDescription': return 'Bahasa konten untuk kategori berita';
			case 'newsCategories.parameters.searchNewsCategories': return 'Cari Kategori Berita';
			case 'newsCategories.requestDetails.title': return 'Detail Request';
			case 'newsCategories.requestDetails.endpoint': return 'Endpoint';
			case 'newsCategories.requestDetails.method': return 'Metode';
			case 'newsCategories.requestDetails.parameters': return 'Parameter';
			case 'newsCategories.requestDetails.curlExample': return 'Contoh cURL';
			case 'newsCategories.requestDetails.showDetails': return 'Tampilkan Detail Request';
			case 'newsCategories.requestDetails.hideDetails': return 'Sembunyikan Detail Request';
			case 'newsCategories.requestDetails.noRequestYet': return 'Belum ada request dibuat';
			case 'newsCategories.results.title': return 'Hasil Kategori Berita';
			case 'newsCategories.results.searchParameters': return 'Parameter Pencarian';
			case 'newsCategories.results.categoriesFound': return 'kategori ditemukan';
			case 'newsCategories.results.noDataFound': return 'Tidak Ada Kategori Ditemukan';
			case 'newsCategories.results.noDataDescription': return 'Coba sesuaikan parameter pencarian atau periksa apakah domain tersebut ada.';
			case 'newsCategories.categoryDetail.title': return 'Detail Kategori';
			case 'newsCategories.categoryDetail.id': return 'ID Kategori';
			case 'newsCategories.categoryDetail.name': return 'Nama Kategori';
			case 'newsCategories.education.title': return 'Cara kerja';
			case 'newsCategories.education.description': return 'Jelajahi kategori berita yang tersedia untuk domain dan bahasa yang berbeda dari data statistik BPS.';
			case 'newsCategories.education.parameters': return 'Parameter';
			case 'newsCategories.education.parametersDescription': return 'Konfigurasikan pengaturan domain dan bahasa';
			case 'newsCategories.education.results': return 'Hasil';
			case 'newsCategories.education.resultsDescription': return 'Lihat kategori berita yang tersedia untuk domain';
			case 'newsCategories.education.categories': return 'Kategori';
			case 'newsCategories.education.categoriesDescription': return 'Jelajahi klasifikasi kategori berita yang berbeda';
			case 'dynamicTables.title': return 'Tabel Dinamis';
			case 'dynamicTables.parameters.title': return 'Parameter API';
			case 'dynamicTables.parameters.domain': return 'Domain';
			case 'dynamicTables.parameters.domainHint': return 'contoh: 7200 untuk tingkat nasional';
			case 'dynamicTables.parameters.variable': return 'Variabel';
			case 'dynamicTables.parameters.variableHint': return 'Pilih variabel statistik';
			case 'dynamicTables.parameters.selectYear': return 'Pilih Tahun';
			case 'dynamicTables.parameters.language': return 'Bahasa';
			case 'dynamicTables.parameters.languageNote': return 'Diterapkan pada bahasa konten tabel dinamis';
			case 'dynamicTables.parameters.loadPeriods': return 'Muat Periode yang Tersedia';
			case 'dynamicTables.parameters.generateTable': return 'Generate Tabel Dinamis';
			case 'dynamicTables.parameters.loading': return 'Memuat...';
			case 'dynamicTables.requestDetails.title': return 'Detail Request';
			case 'dynamicTables.requestDetails.showDetails': return 'Tampilkan Detail Request';
			case 'dynamicTables.requestDetails.hideDetails': return 'Sembunyikan Detail Request';
			case 'dynamicTables.requestDetails.noRequest': return 'Belum ada request dibuat';
			case 'dynamicTables.results.title': return 'Hasil Tabel Dinamis';
			case 'dynamicTables.results.periodsAvailable': return 'Periode yang Tersedia';
			case 'dynamicTables.results.selectPeriod': return 'Pilih periode dari atas untuk generate tabel';
			case 'dynamicTables.results.tableGenerated': return 'Tabel berhasil di-generate';
			case 'dynamicTables.results.empty': return 'Tidak ada data tersedia untuk kriteria yang dipilih';
			case 'dynamicTables.results.initial': return 'Masukkan parameter di atas dan klik "Muat Tahun yang Tersedia" untuk memulai';
			case 'dynamicTables.results.periodInitial': return 'Pilih tahun dari dropdown di atas, lalu klik "Muat Tabel Dinamis" untuk melihat data.';
			case 'dynamicTables.results.periodId': return 'ID Periode';
			case 'dynamicTables.workflow.title': return 'Alur Kerja Tabel Dinamis';
			case 'dynamicTables.workflow.description': return 'Ikuti langkah-langkah ini untuk menghasilkan tabel dinamis dari data BPS.';
			case 'dynamicTables.workflow.step1': return 'Langkah 1';
			case 'dynamicTables.workflow.step1Description': return 'Pilih domain dan bahasa, lalu pilih variabel';
			case 'dynamicTables.workflow.step2': return 'Langkah 2';
			case 'dynamicTables.workflow.step2Description': return 'Muat periode yang tersedia untuk variabel yang dipilih';
			case 'dynamicTables.workflow.step3': return 'Langkah 3';
			case 'dynamicTables.workflow.step3Description': return 'Pilih tahun/periode dan generate tabel';
			case 'dynamicTables.states.initializing': return 'Menginisialisasi...';
			case 'dynamicTables.states.unknown': return 'Status tidak diketahui';
			case 'pressReleases.title': return 'Siaran Pers';
			case 'pressReleases.comingSoon': return 'Halaman Siaran Pers - Segera Hadir';
			case 'pressReleases.detail.title': return 'Detail Siaran Pers';
			case 'pressReleases.detail.forId': return 'Detail Siaran Pers untuk ID: {id}';
			case 'staticTables.title': return 'Tabel Statis';
			case 'staticTables.comingSoon': return 'Halaman Tabel Statis - Segera Hadir';
			case 'staticTables.detail.title': return 'Detail Tabel Statis';
			case 'staticTables.detail.forId': return 'Detail Tabel Statis untuk ID: {id}';
			case 'strategicIndicators.title': return 'Indikator Strategis';
			case 'strategicIndicators.comingSoon': return 'Halaman Indikator Strategis - Segera Hadir';
			case 'subjects.title': return 'Subjek';
			case 'subjects.comingSoon': return 'Halaman Subjek - Segera Hadir';
			case 'units.title': return 'Unit';
			case 'units.comingSoon': return 'Halaman Unit - Segera Hadir';
			case 'variables.title': return 'Variabel';
			case 'variables.comingSoon': return 'Halaman Variabel - Segera Hadir';
			case 'shared.pagination.previous': return 'Sebelumnya';
			case 'shared.pagination.next': return 'Selanjutnya';
			case 'shared.pagination.loadMore': return 'Muat Lebih Banyak';
			case 'shared.pagination.page': return 'Halaman';
			case 'shared.pagination.previousPage': return 'Halaman sebelumnya';
			case 'shared.pagination.nextPage': return 'Halaman selanjutnya';
			case 'shared.pagination.previousPageTooltip': return 'Halaman sebelumnya';
			case 'shared.pagination.nextPageTooltip': return 'Halaman selanjutnya';
			case 'shared.codeSnippet.copyToClipboard': return 'Salin ke clipboard';
			case 'shared.codeSnippet.codeCopied': return 'Kode disalin ke clipboard';
			case 'shared.errorWidget.tryAgain': return 'Coba Lagi';
			case 'shared.searchableDropdown.noItemsFound': return 'Tidak ada item ditemukan';
			case 'shared.searchableDropdown.selectItem': return 'Pilih item';
			case 'shared.requestDetails.title': return 'Detail Request';
			case 'shared.requestDetails.method': return 'Metode';
			case 'shared.requestDetails.url': return 'URL';
			case 'shared.requestDetails.parameters': return 'Parameter';
			case 'shared.requestDetails.urlCopied': return 'URL disalin ke clipboard';
			case 'shared.requestDetails.parametersCopied': return 'Parameter disalin ke clipboard';
			case 'validation.domainRequired': return 'Domain diperlukan';
			case 'categories.imageNotAvailable': return 'Gambar tidak tersedia';
			case 'categories.categoryId': return 'ID Kategori';
			case 'categories.releaseDate': return 'Tanggal Rilis';
			case 'categories.imageUrl': return 'URL Gambar';
			case 'categories.tapToReadMore': return 'Ketuk untuk baca lebih lanjut';
			case 'instructions.requestDetailsWillShow': return 'Detail request akan ditampilkan di halaman hasil';
			case 'instructions.onlyHandlesParameters': return 'Halaman ini hanya menangani konfigurasi parameter. Klik "Cari Domain" untuk melihat detail request di halaman hasil.';
			case 'instructions.languageLabels.indonesian': return 'Indonesia';
			case 'instructions.languageLabels.english': return 'Inggris';
			case 'settings.title': return 'Pengaturan';
			case 'settings.language': return 'Bahasa';
			case 'settings.theme': return 'Tema';
			case 'settings.darkMode': return 'Mode Gelap';
			case 'settings.about': return 'Tentang';
			default: return null;
		}
	}
}

