///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsId with BaseTranslations<AppLocale, Translations> implements Translations {
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
	@override late final _TranslationsCensusTopicsId censusTopics = _TranslationsCensusTopicsId._(_root);
	@override late final _TranslationsCensusDatasetsId censusDatasets = _TranslationsCensusDatasetsId._(_root);
	@override late final _TranslationsCensusDataId censusData = _TranslationsCensusDataId._(_root);
	@override late final _TranslationsCensusAreasId censusAreas = _TranslationsCensusAreasId._(_root);
	@override late final _TranslationsSubjectCategoriesId subjectCategories = _TranslationsSubjectCategoriesId._(_root);
	@override late final _TranslationsSubjectsId subjects = _TranslationsSubjectsId._(_root);
	@override late final _TranslationsUnitsId units = _TranslationsUnitsId._(_root);
	@override late final _TranslationsVariablesId variables = _TranslationsVariablesId._(_root);
	@override late final _TranslationsVerticalVariablesId verticalVariables = _TranslationsVerticalVariablesId._(_root);
	@override late final _TranslationsSharedId shared = _TranslationsSharedId._(_root);
	@override late final _TranslationsValidationId validation = _TranslationsValidationId._(_root);
	@override late final _TranslationsCategoriesId categories = _TranslationsCategoriesId._(_root);
	@override late final _TranslationsInstructionsId instructions = _TranslationsInstructionsId._(_root);
	@override late final _TranslationsSettingsId settings = _TranslationsSettingsId._(_root);
	@override late final _TranslationsStatisticalClassificationsId statisticalClassifications = _TranslationsStatisticalClassificationsId._(_root);
	@override late final _TranslationsCensusEventsId censusEvents = _TranslationsCensusEventsId._(_root);
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
	@override String get details => 'Detail';
	@override String get unknownState => 'Status tidak diketahui';
	@override String get showMore => 'Tampilkan lebih banyak';
	@override String get showLess => 'Tampilkan lebih sedikit';
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
	@override late final _TranslationsPublicationsParametersId parameters = _TranslationsPublicationsParametersId._(_root);
	@override late final _TranslationsPublicationsRequestDetailsId requestDetails = _TranslationsPublicationsRequestDetailsId._(_root);
	@override late final _TranslationsPublicationsResultsId results = _TranslationsPublicationsResultsId._(_root);
	@override late final _TranslationsPublicationsEducationId education = _TranslationsPublicationsEducationId._(_root);
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
	@override late final _TranslationsPressReleasesFieldsId fields = _TranslationsPressReleasesFieldsId._(_root);
	@override late final _TranslationsPressReleasesParametersId parameters = _TranslationsPressReleasesParametersId._(_root);
	@override late final _TranslationsPressReleasesResultsId results = _TranslationsPressReleasesResultsId._(_root);
	@override late final _TranslationsPressReleasesActionsId actions = _TranslationsPressReleasesActionsId._(_root);
}

// Path: staticTables
class _TranslationsStaticTablesId implements TranslationsStaticTablesEn {
	_TranslationsStaticTablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Statis';
	@override String get description => 'Tabel statistik yang telah didefinisikan dengan data dalam format HTML dan Excel';
	@override String get noDataFound => 'Tidak ada tabel statis yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} tabel statis',
		other: 'Ditemukan ${n} tabel statis',
	);
	@override late final _TranslationsStaticTablesFieldsId fields = _TranslationsStaticTablesFieldsId._(_root);
	@override late final _TranslationsStaticTablesParametersId parameters = _TranslationsStaticTablesParametersId._(_root);
	@override late final _TranslationsStaticTablesActionsId actions = _TranslationsStaticTablesActionsId._(_root);
	@override late final _TranslationsStaticTablesDetailId detail = _TranslationsStaticTablesDetailId._(_root);
}

// Path: strategicIndicators
class _TranslationsStrategicIndicatorsId implements TranslationsStrategicIndicatorsEn {
	_TranslationsStrategicIndicatorsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator Strategis';
	@override late final _TranslationsStrategicIndicatorsFieldsId fields = _TranslationsStrategicIndicatorsFieldsId._(_root);
	@override late final _TranslationsStrategicIndicatorsParametersId parameters = _TranslationsStrategicIndicatorsParametersId._(_root);
	@override late final _TranslationsStrategicIndicatorsResultsId results = _TranslationsStrategicIndicatorsResultsId._(_root);
}

// Path: censusTopics
class _TranslationsCensusTopicsId implements TranslationsCensusTopicsEn {
	_TranslationsCensusTopicsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Topik Sensus';
	@override late final _TranslationsCensusTopicsFieldsId fields = _TranslationsCensusTopicsFieldsId._(_root);
	@override late final _TranslationsCensusTopicsParametersId parameters = _TranslationsCensusTopicsParametersId._(_root);
	@override late final _TranslationsCensusTopicsResultsId results = _TranslationsCensusTopicsResultsId._(_root);
}

// Path: censusDatasets
class _TranslationsCensusDatasetsId implements TranslationsCensusDatasetsEn {
	_TranslationsCensusDatasetsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dataset Sensus';
	@override late final _TranslationsCensusDatasetsFieldsId fields = _TranslationsCensusDatasetsFieldsId._(_root);
	@override late final _TranslationsCensusDatasetsParametersId parameters = _TranslationsCensusDatasetsParametersId._(_root);
	@override late final _TranslationsCensusDatasetsResultsId results = _TranslationsCensusDatasetsResultsId._(_root);
}

// Path: censusData
class _TranslationsCensusDataId implements TranslationsCensusDataEn {
	_TranslationsCensusDataId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Data Sensus';
	@override late final _TranslationsCensusDataFieldsId fields = _TranslationsCensusDataFieldsId._(_root);
	@override late final _TranslationsCensusDataParametersId parameters = _TranslationsCensusDataParametersId._(_root);
	@override late final _TranslationsCensusDataResultsId results = _TranslationsCensusDataResultsId._(_root);
}

// Path: censusAreas
class _TranslationsCensusAreasId implements TranslationsCensusAreasEn {
	_TranslationsCensusAreasId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wilayah Sensus';
	@override String get description => 'Wilayah geografis yang tercakup dalam kegiatan sensus';
	@override late final _TranslationsCensusAreasFieldsId fields = _TranslationsCensusAreasFieldsId._(_root);
	@override late final _TranslationsCensusAreasParametersId parameters = _TranslationsCensusAreasParametersId._(_root);
	@override late final _TranslationsCensusAreasResultsId results = _TranslationsCensusAreasResultsId._(_root);
}

// Path: subjectCategories
class _TranslationsSubjectCategoriesId implements TranslationsSubjectCategoriesEn {
	_TranslationsSubjectCategoriesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Subjek';
	@override late final _TranslationsSubjectCategoriesFieldsId fields = _TranslationsSubjectCategoriesFieldsId._(_root);
	@override late final _TranslationsSubjectCategoriesParametersId parameters = _TranslationsSubjectCategoriesParametersId._(_root);
	@override late final _TranslationsSubjectCategoriesResultsId results = _TranslationsSubjectCategoriesResultsId._(_root);
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
	@override String get description => 'Unit pengukuran untuk data statistik';
	@override String get noDataFound => 'Tidak ada unit yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} unit',
		other: 'Ditemukan ${n} unit',
	);
	@override late final _TranslationsUnitsFieldsId fields = _TranslationsUnitsFieldsId._(_root);
	@override late final _TranslationsUnitsParametersId parameters = _TranslationsUnitsParametersId._(_root);
}

// Path: variables
class _TranslationsVariablesId implements TranslationsVariablesEn {
	_TranslationsVariablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel';
	@override String get description => 'Variabel dan ukuran statistik';
	@override String get noDataFound => 'Tidak ada variabel yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} variabel',
		other: 'Ditemukan ${n} variabel',
	);
	@override late final _TranslationsVariablesFieldsId fields = _TranslationsVariablesFieldsId._(_root);
	@override late final _TranslationsVariablesParametersId parameters = _TranslationsVariablesParametersId._(_root);
}

// Path: verticalVariables
class _TranslationsVerticalVariablesId implements TranslationsVerticalVariablesEn {
	_TranslationsVerticalVariablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel Vertikal';
	@override String get description => 'Dimensi kategorikal dan sistem klasifikasi';
	@override String get noDataFound => 'Tidak ada variabel vertikal yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} variabel vertikal',
		other: 'Ditemukan ${n} variabel vertikal',
	);
	@override late final _TranslationsVerticalVariablesFieldsId fields = _TranslationsVerticalVariablesFieldsId._(_root);
	@override late final _TranslationsVerticalVariablesParametersId parameters = _TranslationsVerticalVariablesParametersId._(_root);
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
	@override String get enterParametersAndLoad => 'Masukkan parameter dan klik muat untuk melihat data';
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

// Path: statisticalClassifications
class _TranslationsStatisticalClassificationsId implements TranslationsStatisticalClassificationsEn {
	_TranslationsStatisticalClassificationsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Klasifikasi Statistik';
	@override late final _TranslationsStatisticalClassificationsFieldsId fields = _TranslationsStatisticalClassificationsFieldsId._(_root);
	@override late final _TranslationsStatisticalClassificationsLevelsId levels = _TranslationsStatisticalClassificationsLevelsId._(_root);
	@override late final _TranslationsStatisticalClassificationsKbkiLevelsId kbkiLevels = _TranslationsStatisticalClassificationsKbkiLevelsId._(_root);
	@override late final _TranslationsStatisticalClassificationsParametersId parameters = _TranslationsStatisticalClassificationsParametersId._(_root);
	@override late final _TranslationsStatisticalClassificationsResultsId results = _TranslationsStatisticalClassificationsResultsId._(_root);
	@override late final _TranslationsStatisticalClassificationsDetailId detail = _TranslationsStatisticalClassificationsDetailId._(_root);
}

// Path: censusEvents
class _TranslationsCensusEventsId implements TranslationsCensusEventsEn {
	_TranslationsCensusEventsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kegiatan Sensus';
	@override late final _TranslationsCensusEventsFieldsId fields = _TranslationsCensusEventsFieldsId._(_root);
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} kegiatan sensus',
		other: 'Ditemukan ${n} kegiatan sensus',
	);
	@override String get initializing => 'Menginisialisasi...';
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
	@override late final _TranslationsListApiSectionsStatisticalClassificationsId statisticalClassifications = _TranslationsListApiSectionsStatisticalClassificationsId._(_root);
	@override late final _TranslationsListApiSectionsStrategicIndicatorsId strategicIndicators = _TranslationsListApiSectionsStrategicIndicatorsId._(_root);
	@override late final _TranslationsListApiSectionsSubjectCategoriesId subjectCategories = _TranslationsListApiSectionsSubjectCategoriesId._(_root);
	@override late final _TranslationsListApiSectionsSubjectsId subjects = _TranslationsListApiSectionsSubjectsId._(_root);
	@override late final _TranslationsListApiSectionsVariablesId variables = _TranslationsListApiSectionsVariablesId._(_root);
	@override late final _TranslationsListApiSectionsVerticalVariablesId verticalVariables = _TranslationsListApiSectionsVerticalVariablesId._(_root);
	@override late final _TranslationsListApiSectionsUnitsId units = _TranslationsListApiSectionsUnitsId._(_root);
	@override late final _TranslationsListApiSectionsPeriodsId periods = _TranslationsListApiSectionsPeriodsId._(_root);
	@override late final _TranslationsListApiSectionsDerivedPeriodsId derivedPeriods = _TranslationsListApiSectionsDerivedPeriodsId._(_root);
	@override late final _TranslationsListApiSectionsDerivedVariablesId derivedVariables = _TranslationsListApiSectionsDerivedVariablesId._(_root);
	@override late final _TranslationsListApiSectionsCensusEventsId censusEvents = _TranslationsListApiSectionsCensusEventsId._(_root);
	@override late final _TranslationsListApiSectionsCensusTopicsId censusTopics = _TranslationsListApiSectionsCensusTopicsId._(_root);
	@override late final _TranslationsListApiSectionsCensusDatasetsId censusDatasets = _TranslationsListApiSectionsCensusDatasetsId._(_root);
	@override late final _TranslationsListApiSectionsCensusDataId censusData = _TranslationsListApiSectionsCensusDataId._(_root);
	@override late final _TranslationsListApiSectionsCensusAreasId censusAreas = _TranslationsListApiSectionsCensusAreasId._(_root);
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

// Path: publications.parameters
class _TranslationsPublicationsParametersId implements TranslationsPublicationsParametersEn {
	_TranslationsPublicationsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'contoh: 7200 untuk tingkat nasional';
	@override String get keyword => 'Kata Kunci (Opsional)';
	@override String get keywordHint => 'Filter berdasarkan kata kunci';
	@override String get month => 'Bulan (Opsional)';
	@override String get monthHint => 'Pilih bulan';
	@override String get year => 'Tahun (Opsional)';
	@override String get yearHint => 'Pilih tahun';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Diterapkan pada bahasa konten publikasi';
	@override String get loadButton => 'Muat Publikasi';
	@override String get loading => 'Memuat...';
	@override String get searchPublications => 'Cari Publikasi';
	@override String get clearButton => 'Hapus Filter';
}

// Path: publications.requestDetails
class _TranslationsPublicationsRequestDetailsId implements TranslationsPublicationsRequestDetailsEn {
	_TranslationsPublicationsRequestDetailsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get method => 'Method';
	@override String get url => 'URL';
	@override String get parameters => 'Parameter';
	@override String get responseTime => 'Waktu Respons';
	@override String get copyUrl => 'Salin URL';
	@override String get urlCopied => 'URL disalin ke clipboard';
	@override String get noRequest => 'Belum ada request yang dibuat';
	@override String get showDetails => 'Tampilkan Detail Request';
	@override String get hideDetails => 'Sembunyikan Detail Request';
}

// Path: publications.results
class _TranslationsPublicationsResultsId implements TranslationsPublicationsResultsEn {
	_TranslationsPublicationsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Publikasi';
	@override String get found => 'Ditemukan {count} publikasi';
	@override String get empty => 'Tidak ada publikasi yang ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasi parameter dan klik "Muat Publikasi" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: publications.education
class _TranslationsPublicationsEducationId implements TranslationsPublicationsEducationEn {
	_TranslationsPublicationsEducationId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cara Menggunakan';
	@override String get description => 'Pelajari cara mencari dan mengeksplorasi data publikasi dari BPS.';
	@override String get parameters => 'Parameter';
	@override String get parametersDescription => 'Konfigurasi domain dan kriteria pencarian';
	@override String get results => 'Hasil';
	@override String get resultsDescription => 'Lihat publikasi yang sesuai dengan kriteria Anda';
	@override String get detail => 'Detail';
	@override String get detailDescription => 'Lihat informasi publikasi dan opsi unduhan';
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

// Path: pressReleases.fields
class _TranslationsPressReleasesFieldsId implements TranslationsPressReleasesFieldsEn {
	_TranslationsPressReleasesFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get cover => 'Sampul';
	@override String get pdfUrl => 'URL PDF';
	@override String get size => 'Ukuran';
	@override String get abstract => 'Abstrak';
	@override String get releaseDate => 'Tanggal Rilis';
}

// Path: pressReleases.parameters
class _TranslationsPressReleasesParametersId implements TranslationsPressReleasesParametersEn {
	_TranslationsPressReleasesParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'contoh: 7200 untuk tingkat nasional';
	@override String get keyword => 'Kata Kunci (Opsional)';
	@override String get keywordHint => 'Filter berdasarkan kata kunci';
	@override String get month => 'Bulan (Opsional)';
	@override String get monthHint => 'Pilih bulan';
	@override String get year => 'Tahun (Opsional)';
	@override String get yearHint => 'Pilih tahun';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Diterapkan pada bahasa konten siaran pers';
	@override String get clearFilters => 'Hapus Filter';
	@override String get search => 'Cari';
	@override String get load => 'Muat Siaran Pers';
}

// Path: pressReleases.results
class _TranslationsPressReleasesResultsId implements TranslationsPressReleasesResultsEn {
	_TranslationsPressReleasesResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Siaran Pers';
	@override String get count => '{count} siaran pers ditemukan';
	@override String get noData => 'Tidak ada siaran pers ditemukan';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String get loading => 'Memuat siaran pers...';
	@override String get pressSearchToLoad => 'Tekan tombol cari untuk memuat data';
}

// Path: pressReleases.actions
class _TranslationsPressReleasesActionsId implements TranslationsPressReleasesActionsEn {
	_TranslationsPressReleasesActionsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get downloadPdf => 'Unduh PDF';
	@override String get viewDetails => 'Lihat Detail';
}

// Path: staticTables.fields
class _TranslationsStaticTablesFieldsId implements TranslationsStaticTablesFieldsEn {
	_TranslationsStaticTablesFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get subject => 'Subjek';
	@override String get size => 'Ukuran';
	@override String get updatedAt => 'Diperbarui Pada';
	@override String get createdAt => 'Dibuat Pada';
}

// Path: staticTables.parameters
class _TranslationsStaticTablesParametersId implements TranslationsStaticTablesParametersEn {
	_TranslationsStaticTablesParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get domain => 'Domain *';
	@override String get domainHint => 'contoh: 7200';
	@override String get language => 'Bahasa';
	@override String get keyword => 'Kata Kunci (Opsional)';
	@override String get keywordHint => 'Filter berdasarkan kata kunci';
	@override String get month => 'Bulan (Opsional)';
	@override String get monthHint => 'Pilih bulan';
	@override String get year => 'Tahun (Opsional)';
	@override String get yearHint => 'Pilih tahun';
	@override String get clearFilters => 'Hapus Filter';
	@override String get loadButton => 'Muat Tabel Statis';
}

// Path: staticTables.actions
class _TranslationsStaticTablesActionsId implements TranslationsStaticTablesActionsEn {
	_TranslationsStaticTablesActionsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get viewTable => 'Lihat Tabel';
	@override String get downloadExcel => 'Unduh Excel';
}

// Path: staticTables.detail
class _TranslationsStaticTablesDetailId implements TranslationsStaticTablesDetailEn {
	_TranslationsStaticTablesDetailId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Tabel Statis';
	@override String get loading => 'Memuat tabel...';
	@override String get noTableData => 'Tidak ada data tabel yang tersedia';
	@override String get refresh => 'Segarkan';
	@override String get downloadExcel => 'Unduh Excel';
}

// Path: strategicIndicators.fields
class _TranslationsStrategicIndicatorsFieldsId implements TranslationsStrategicIndicatorsFieldsEn {
	_TranslationsStrategicIndicatorsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get name => 'Nama';
	@override String get dataSource => 'Sumber Data';
	@override String get value => 'Nilai';
	@override String get unit => 'Satuan';
	@override String get period => 'Periode';
	@override String get categoryID => 'ID Kategori';
	@override String get variableID => 'ID Variabel';
}

// Path: strategicIndicators.parameters
class _TranslationsStrategicIndicatorsParametersId implements TranslationsStrategicIndicatorsParametersEn {
	_TranslationsStrategicIndicatorsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get domain => 'Domain *';
	@override String get domainHint => 'contoh: 7200';
	@override String get variableID => 'ID Variabel (Opsional)';
	@override String get variableIDHint => 'Filter berdasarkan ID variabel';
	@override String get language => 'Bahasa';
	@override String get loadButton => 'Muat Indikator Strategis';
}

// Path: strategicIndicators.results
class _TranslationsStrategicIndicatorsResultsId implements TranslationsStrategicIndicatorsResultsEn {
	_TranslationsStrategicIndicatorsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Indikator Strategis';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String get found => 'Ditemukan {count} indikator strategis';
	@override String get foundSingular => '';
	@override String get foundPlural => '';
	@override String get initializing => 'Menginisialisasi...';
}

// Path: censusTopics.fields
class _TranslationsCensusTopicsFieldsId implements TranslationsCensusTopicsFieldsEn {
	_TranslationsCensusTopicsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get topic => 'Topik';
	@override String get eventID => 'ID Kegiatan';
	@override String get eventName => 'Nama Kegiatan';
}

// Path: censusTopics.parameters
class _TranslationsCensusTopicsParametersId implements TranslationsCensusTopicsParametersEn {
	_TranslationsCensusTopicsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get censusEvent => 'Kegiatan Sensus *';
	@override String get censusEventHint => 'Pilih kegiatan sensus';
	@override String get loadButton => 'Muat Topik';
}

// Path: censusTopics.results
class _TranslationsCensusTopicsResultsId implements TranslationsCensusTopicsResultsEn {
	_TranslationsCensusTopicsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Topik Sensus';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} topik',
		other: 'Ditemukan ${n} topik',
	);
	@override String get initializing => 'Menginisialisasi...';
}

// Path: censusDatasets.fields
class _TranslationsCensusDatasetsFieldsId implements TranslationsCensusDatasetsFieldsEn {
	_TranslationsCensusDatasetsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID Dataset';
	@override String get topicID => 'ID Topik';
	@override String get topic => 'Topik';
	@override String get eventID => 'ID Kegiatan';
	@override String get name => 'Nama Dataset';
	@override String get description => 'Deskripsi';
}

// Path: censusDatasets.parameters
class _TranslationsCensusDatasetsParametersId implements TranslationsCensusDatasetsParametersEn {
	_TranslationsCensusDatasetsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get censusEvent => 'Kegiatan Sensus *';
	@override String get censusEventHint => 'Pilih kegiatan sensus';
	@override String get censusTopic => 'Topik Sensus *';
	@override String get censusTopicHint => 'Pilih topik sensus';
	@override String get loadButton => 'Muat Dataset';
}

// Path: censusDatasets.results
class _TranslationsCensusDatasetsResultsId implements TranslationsCensusDatasetsResultsEn {
	_TranslationsCensusDatasetsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Dataset Sensus';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} dataset',
		other: 'Ditemukan ${n} dataset',
	);
	@override String get initializing => 'Menginisialisasi...';
}

// Path: censusData.fields
class _TranslationsCensusDataFieldsId implements TranslationsCensusDataFieldsEn {
	_TranslationsCensusDataFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get regionID => 'ID Wilayah';
	@override String get regionCode => 'Kode Wilayah';
	@override String get regionName => 'Nama Wilayah';
	@override String get regionLevel => 'Tingkat Wilayah';
	@override String get indicatorID => 'ID Indikator';
	@override String get indicatorName => 'Nama Indikator';
	@override String get categories => 'Kategori';
	@override String get period => 'Periode';
	@override String get value => 'Nilai';
}

// Path: censusData.parameters
class _TranslationsCensusDataParametersId implements TranslationsCensusDataParametersEn {
	_TranslationsCensusDataParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get censusEvent => 'Kegiatan Sensus *';
	@override String get censusEventHint => 'Pilih kegiatan sensus';
	@override String get censusTopic => 'Topik Sensus *';
	@override String get censusTopicHint => 'Pilih topik sensus';
	@override String get censusArea => 'Wilayah Sensus';
	@override String get censusAreaHint => 'Pilih wilayah sensus (opsional)';
	@override String get dataset => 'Dataset *';
	@override String get datasetHint => 'Pilih dataset';
	@override String get loadButton => 'Muat Data Sensus';
}

// Path: censusData.results
class _TranslationsCensusDataResultsId implements TranslationsCensusDataResultsEn {
	_TranslationsCensusDataResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Data Sensus';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} data',
		other: 'Ditemukan ${n} data',
	);
	@override String get initializing => 'Menginisialisasi...';
}

// Path: censusAreas.fields
class _TranslationsCensusAreasFieldsId implements TranslationsCensusAreasFieldsEn {
	_TranslationsCensusAreasFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID Wilayah';
	@override String get name => 'Nama Wilayah';
	@override String get slug => 'Slug';
	@override String get mfdCode => 'Kode MFD';
}

// Path: censusAreas.parameters
class _TranslationsCensusAreasParametersId implements TranslationsCensusAreasParametersEn {
	_TranslationsCensusAreasParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get censusEvent => 'Kegiatan Sensus *';
	@override String get censusEventHint => 'Pilih kegiatan sensus';
	@override String get loadButton => 'Muat Wilayah Sensus';
}

// Path: censusAreas.results
class _TranslationsCensusAreasResultsId implements TranslationsCensusAreasResultsEn {
	_TranslationsCensusAreasResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Wilayah Sensus';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} wilayah',
		other: 'Ditemukan ${n} wilayah',
	);
	@override String get initializing => 'Menginisialisasi...';
}

// Path: subjectCategories.fields
class _TranslationsSubjectCategoriesFieldsId implements TranslationsSubjectCategoriesFieldsEn {
	_TranslationsSubjectCategoriesFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
}

// Path: subjectCategories.parameters
class _TranslationsSubjectCategoriesParametersId implements TranslationsSubjectCategoriesParametersEn {
	_TranslationsSubjectCategoriesParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get domain => 'Domain *';
	@override String get domainHint => 'contoh: 7200';
	@override String get language => 'Bahasa';
	@override String get loadButton => 'Muat Kategori Subjek';
}

// Path: subjectCategories.results
class _TranslationsSubjectCategoriesResultsId implements TranslationsSubjectCategoriesResultsEn {
	_TranslationsSubjectCategoriesResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Kategori Subjek';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String get found => 'Ditemukan {count} kategori subjek';
	@override String get foundSingular => '';
	@override String get foundPlural => '';
	@override String get initializing => 'Menginisialisasi...';
}

// Path: units.fields
class _TranslationsUnitsFieldsId implements TranslationsUnitsFieldsEn {
	_TranslationsUnitsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
}

// Path: units.parameters
class _TranslationsUnitsParametersId implements TranslationsUnitsParametersEn {
	_TranslationsUnitsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get domain => 'Domain *';
	@override String get domainHint => 'contoh: 7200';
	@override String get language => 'Bahasa';
	@override String get variableID => 'Variabel (Opsional)';
	@override String get variableIDHint => 'Pilih variabel (opsional)';
	@override String get loadButton => 'Muat Unit';
}

// Path: variables.fields
class _TranslationsVariablesFieldsId implements TranslationsVariablesFieldsEn {
	_TranslationsVariablesFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get graphName => 'Nama Grafik';
	@override String get unit => 'Satuan';
	@override String get subjectID => 'ID Subjek';
	@override String get subjectName => 'Nama Subjek';
	@override String get notes => 'Catatan';
	@override String get verticalVariableID => 'ID Variabel Vertikal';
}

// Path: variables.parameters
class _TranslationsVariablesParametersId implements TranslationsVariablesParametersEn {
	_TranslationsVariablesParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get domain => 'Domain *';
	@override String get domainHint => 'contoh: 7200';
	@override String get language => 'Bahasa';
	@override String get year => 'Tahun';
	@override String get yearHint => 'contoh: 2024 (opsional)';
	@override String get subject => 'Subjek';
	@override String get subjectHint => 'Pilih subjek (opsional)';
	@override String get allSubjects => 'Semua Subjek';
	@override String get showExistingVariables => 'Tampilkan Variabel yang Ada';
	@override String get loadButton => 'Muat Variabel';
}

// Path: verticalVariables.fields
class _TranslationsVerticalVariablesFieldsId implements TranslationsVerticalVariablesFieldsEn {
	_TranslationsVerticalVariablesFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get itemID => 'ID Item';
	@override String get groupID => 'ID Grup';
	@override String get groupName => 'Nama Grup';
}

// Path: verticalVariables.parameters
class _TranslationsVerticalVariablesParametersId implements TranslationsVerticalVariablesParametersEn {
	_TranslationsVerticalVariablesParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get domain => 'Domain *';
	@override String get domainHint => 'contoh: 7200';
	@override String get language => 'Bahasa';
	@override String get variableID => 'ID Variabel';
	@override String get variableIDHint => 'contoh: 1234 (opsional)';
	@override String get loadButton => 'Muat Variabel Vertikal';
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

// Path: statisticalClassifications.fields
class _TranslationsStatisticalClassificationsFieldsId implements TranslationsStatisticalClassificationsFieldsEn {
	_TranslationsStatisticalClassificationsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get type => 'Tipe';
	@override String get level => 'Level';
	@override String get source => 'Sumber';
	@override String get description => 'Deskripsi';
	@override String get releaseDate => 'Tanggal Rilis';
}

// Path: statisticalClassifications.levels
class _TranslationsStatisticalClassificationsLevelsId implements TranslationsStatisticalClassificationsLevelsEn {
	_TranslationsStatisticalClassificationsLevelsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get category => 'Kategori';
	@override String get primaryGroup => 'Golongan Pokok';
	@override String get group => 'Golongan';
	@override String get subGroup => 'Sub-Golongan';
	@override String get cluster => 'Kelompok';
}

// Path: statisticalClassifications.kbkiLevels
class _TranslationsStatisticalClassificationsKbkiLevelsId implements TranslationsStatisticalClassificationsKbkiLevelsEn {
	_TranslationsStatisticalClassificationsKbkiLevelsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get section => 'Seksi';
	@override String get division => 'Divisi';
	@override String get group => 'Kelompok';
	@override String get classes => 'Kelas';
	@override String get subClass => 'Subkelas';
	@override String get commodityGroup => 'Kelompok Komoditas';
	@override String get commodity => 'Komoditas';
}

// Path: statisticalClassifications.parameters
class _TranslationsStatisticalClassificationsParametersId implements TranslationsStatisticalClassificationsParametersEn {
	_TranslationsStatisticalClassificationsParametersId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get category => 'Kategori Klasifikasi *';
	@override String get categoryHint => 'Pilih KBLI atau KBKI';
	@override String get type => 'Tipe Klasifikasi *';
	@override String get typeHint => 'Pilih tahun klasifikasi';
	@override String get level => 'Level Klasifikasi (Opsional)';
	@override String get levelHint => 'Pilih level';
	@override String get allLevels => 'Semua Level';
	@override String get language => 'Bahasa';
	@override String get loadButton => 'Muat Klasifikasi';
}

// Path: statisticalClassifications.results
class _TranslationsStatisticalClassificationsResultsId implements TranslationsStatisticalClassificationsResultsEn {
	_TranslationsStatisticalClassificationsResultsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Klasifikasi Statistik';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String get found => 'Ditemukan {count} klasifikasi';
	@override String get foundSingular => '';
	@override String get foundPlural => '';
	@override String get initializing => 'Menginisialisasi...';
}

// Path: statisticalClassifications.detail
class _TranslationsStatisticalClassificationsDetailId implements TranslationsStatisticalClassificationsDetailEn {
	_TranslationsStatisticalClassificationsDetailId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Klasifikasi';
	@override String get noChildren => 'Tidak ada sub-klasifikasi tersedia';
	@override String get metadata => 'Metadata';
	@override String get source => 'Sumber';
	@override String get releaseDate => 'Tanggal Rilis';
	@override String get lastUpdate => 'Terakhir Diperbarui';
	@override String get level => 'Tingkat';
	@override String get viewOnline => 'Lihat Online';
	@override String get tags => 'Tag';
	@override String get derivedClassifications => 'Klasifikasi Turunan';
}

// Path: censusEvents.fields
class _TranslationsCensusEventsFieldsId implements TranslationsCensusEventsFieldsEn {
	_TranslationsCensusEventsFieldsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
	@override String get year => 'Tahun';
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

// Path: listApi.sections.statisticalClassifications
class _TranslationsListApiSectionsStatisticalClassificationsId implements TranslationsListApiSectionsStatisticalClassificationsEn {
	_TranslationsListApiSectionsStatisticalClassificationsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Klasifikasi Statistik';
	@override String get description => 'Jelajahi klasifikasi KBLI dan KBKI';
}

// Path: listApi.sections.strategicIndicators
class _TranslationsListApiSectionsStrategicIndicatorsId implements TranslationsListApiSectionsStrategicIndicatorsEn {
	_TranslationsListApiSectionsStrategicIndicatorsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator Strategis';
	@override String get description => 'Ukuran statistik kunci yang melacak pembangunan nasional';
}

// Path: listApi.sections.subjectCategories
class _TranslationsListApiSectionsSubjectCategoriesId implements TranslationsListApiSectionsSubjectCategoriesEn {
	_TranslationsListApiSectionsSubjectCategoriesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Subjek';
	@override String get description => 'Jelajahi dan telusuri kategori subjek';
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

// Path: listApi.sections.verticalVariables
class _TranslationsListApiSectionsVerticalVariablesId implements TranslationsListApiSectionsVerticalVariablesEn {
	_TranslationsListApiSectionsVerticalVariablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel Vertikal';
	@override String get description => 'Dimensi kategorikal dan sistem klasifikasi';
}

// Path: listApi.sections.units
class _TranslationsListApiSectionsUnitsId implements TranslationsListApiSectionsUnitsEn {
	_TranslationsListApiSectionsUnitsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unit';
	@override String get description => 'Unit pengukuran untuk data statistik';
}

// Path: listApi.sections.periods
class _TranslationsListApiSectionsPeriodsId implements TranslationsListApiSectionsPeriodsEn {
	_TranslationsListApiSectionsPeriodsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Periode';
	@override String get description => 'Periode waktu untuk data statistik';
}

// Path: listApi.sections.derivedPeriods
class _TranslationsListApiSectionsDerivedPeriodsId implements TranslationsListApiSectionsDerivedPeriodsEn {
	_TranslationsListApiSectionsDerivedPeriodsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Periode Turunan';
	@override String get description => 'Periode waktu yang dikelompokkan dan diagregasi';
}

// Path: listApi.sections.derivedVariables
class _TranslationsListApiSectionsDerivedVariablesId implements TranslationsListApiSectionsDerivedVariablesEn {
	_TranslationsListApiSectionsDerivedVariablesId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel Turunan';
	@override String get description => 'Variabel statistik yang dihitung dan ditransformasi';
}

// Path: listApi.sections.censusEvents
class _TranslationsListApiSectionsCensusEventsId implements TranslationsListApiSectionsCensusEventsEn {
	_TranslationsListApiSectionsCensusEventsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kegiatan Sensus';
	@override String get description => 'Daftar kegiatan sensus utama';
}

// Path: listApi.sections.censusTopics
class _TranslationsListApiSectionsCensusTopicsId implements TranslationsListApiSectionsCensusTopicsEn {
	_TranslationsListApiSectionsCensusTopicsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Topik Sensus';
	@override String get description => 'Topik dalam kegiatan sensus';
}

// Path: listApi.sections.censusDatasets
class _TranslationsListApiSectionsCensusDatasetsId implements TranslationsListApiSectionsCensusDatasetsEn {
	_TranslationsListApiSectionsCensusDatasetsId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dataset Sensus';
	@override String get description => 'Dataset yang tersedia untuk topik sensus';
}

// Path: listApi.sections.censusData
class _TranslationsListApiSectionsCensusDataId implements TranslationsListApiSectionsCensusDataEn {
	_TranslationsListApiSectionsCensusDataId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Data Sensus';
	@override String get description => 'Data statistik sensus aktual';
}

// Path: listApi.sections.censusAreas
class _TranslationsListApiSectionsCensusAreasId implements TranslationsListApiSectionsCensusAreasEn {
	_TranslationsListApiSectionsCensusAreasId._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wilayah Sensus';
	@override String get description => 'Wilayah geografis yang tercakup dalam kegiatan sensus';
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

/// The flat map containing all translations for locale <id>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Contoh STADATA',
			'app.description' => 'Showcase kemampuan STADATA Flutter SDK',
			'navigation.home' => 'Beranda',
			'navigation.listApi' => 'List API',
			'navigation.viewApi' => 'View API',
			'navigation.dynamicTables' => 'Tabel Dinamis',
			'navigation.periods' => 'Periode',
			'navigation.pageNotFound' => 'Halaman Tidak Ditemukan',
			'navigation.pageNotFoundMessage' => 'Halaman yang Anda cari tidak ada.',
			'common.loading' => 'Memuat...',
			'common.error' => 'Error',
			'common.retry' => 'Coba Lagi',
			'common.noData' => 'Tidak ada data tersedia',
			'common.search' => 'Cari',
			'common.refresh' => 'Segarkan',
			'common.cancel' => 'Batal',
			'common.save' => 'Simpan',
			'common.delete' => 'Hapus',
			'common.edit' => 'Edit',
			'common.create' => 'Buat',
			'common.update' => 'Perbarui',
			'common.back' => 'Kembali',
			'common.next' => 'Selanjutnya',
			'common.previous' => 'Sebelumnya',
			'common.page' => 'Halaman',
			'common.total' => 'Total',
			'common.items' => 'item',
			'common.of' => 'dari',
			'common.language' => 'Bahasa',
			'common.details' => 'Detail',
			'common.unknownState' => 'Status tidak diketahui',
			'common.showMore' => 'Tampilkan lebih banyak',
			'common.showLess' => 'Tampilkan lebih sedikit',
			'errors.generic' => 'Terjadi kesalahan. Silakan coba lagi.',
			'errors.network' => 'Error jaringan. Periksa koneksi Anda.',
			'errors.notFound' => 'Data tidak ditemukan.',
			'errors.timeout' => 'Request timeout. Silakan coba lagi.',
			'errors.unauthorized' => 'Akses tidak diizinkan.',
			'errors.serverError' => 'Error server. Silakan coba lagi nanti.',
			'home.title' => 'Selamat Datang di STADATA',
			'home.subtitle' => 'Jelajahi Data Statistik Indonesia',
			'home.description' => 'Akses data statistik komprehensif dari Badan Pusat Statistik (BPS) Indonesia melalui aplikasi showcase ini.',
			'home.features.title' => 'Fitur',
			'home.aboutDemo.title' => 'Tentang Demo Ini',
			'home.aboutDemo.description' => 'Contoh sederhana ini mendemonstrasikan fungsionalitas domain dari STADATA Flutter SDK. Klik pada kartu domain di atas untuk menjelajahi domain statistik dari BPS Indonesia.',
			'home.sections.listApi.title' => 'List API',
			'home.sections.listApi.description' => 'Jelajahi koleksi domain, publikasi, berita, dan lainnya',
			'home.sections.viewApi.title' => 'View API',
			'home.sections.viewApi.description' => 'Dapatkan informasi detail tentang publikasi, berita, dan siaran pers tertentu',
			'home.sections.dynamicTables.title' => 'Tabel Dinamis',
			'home.sections.dynamicTables.description' => 'Jelajahi tabel statistik dinamis dengan parameter yang dapat disesuaikan',
			'home.sections.periods.title' => 'Periode',
			'home.sections.periods.description' => 'Jelajahi periode waktu yang tersedia untuk data statistik',
			'listApi.title' => 'List API',
			'listApi.subtitle' => 'Jelajahi koleksi data statistik dari BPS',
			'listApi.sections.domains.title' => 'Domain',
			'listApi.sections.domains.description' => 'Domain dan wilayah statistik',
			'listApi.sections.publications.title' => 'Publikasi',
			'listApi.sections.publications.description' => 'Publikasi dan laporan statistik',
			'listApi.sections.news.title' => 'Berita',
			'listApi.sections.news.description' => 'Berita dan update statistik terbaru',
			'listApi.sections.pressReleases.title' => 'Siaran Pers',
			'listApi.sections.pressReleases.description' => 'Siaran pers resmi dari BPS',
			'listApi.sections.infographics.title' => 'Infografis',
			'listApi.sections.infographics.description' => 'Informasi statistik visual',
			'listApi.sections.newsCategories.title' => 'Kategori Berita',
			'listApi.sections.newsCategories.description' => 'Jelajahi klasifikasi kategori berita dari BPS',
			'listApi.sections.dynamicTables.title' => 'Tabel Dinamis',
			'listApi.sections.dynamicTables.description' => 'Jelajahi data statistik multi-dimensi dengan integrasi periode',
			'listApi.sections.staticTables.title' => 'Tabel Statis',
			'listApi.sections.staticTables.description' => 'Tabel statistik yang telah ditentukan',
			'listApi.sections.statisticalClassifications.title' => 'Klasifikasi Statistik',
			'listApi.sections.statisticalClassifications.description' => 'Jelajahi klasifikasi KBLI dan KBKI',
			'listApi.sections.strategicIndicators.title' => 'Indikator Strategis',
			'listApi.sections.strategicIndicators.description' => 'Ukuran statistik kunci yang melacak pembangunan nasional',
			'listApi.sections.subjectCategories.title' => 'Kategori Subjek',
			'listApi.sections.subjectCategories.description' => 'Jelajahi dan telusuri kategori subjek',
			'listApi.sections.subjects.title' => 'Subjek',
			'listApi.sections.subjects.description' => 'Kategori subjek statistik',
			'listApi.sections.variables.title' => 'Variabel',
			'listApi.sections.variables.description' => 'Variabel dan ukuran statistik',
			'listApi.sections.verticalVariables.title' => 'Variabel Vertikal',
			'listApi.sections.verticalVariables.description' => 'Dimensi kategorikal dan sistem klasifikasi',
			'listApi.sections.units.title' => 'Unit',
			'listApi.sections.units.description' => 'Unit pengukuran untuk data statistik',
			'listApi.sections.periods.title' => 'Periode',
			'listApi.sections.periods.description' => 'Periode waktu untuk data statistik',
			'listApi.sections.derivedPeriods.title' => 'Periode Turunan',
			'listApi.sections.derivedPeriods.description' => 'Periode waktu yang dikelompokkan dan diagregasi',
			'listApi.sections.derivedVariables.title' => 'Variabel Turunan',
			'listApi.sections.derivedVariables.description' => 'Variabel statistik yang dihitung dan ditransformasi',
			'listApi.sections.censusEvents.title' => 'Kegiatan Sensus',
			'listApi.sections.censusEvents.description' => 'Daftar kegiatan sensus utama',
			'listApi.sections.censusTopics.title' => 'Topik Sensus',
			'listApi.sections.censusTopics.description' => 'Topik dalam kegiatan sensus',
			'listApi.sections.censusDatasets.title' => 'Dataset Sensus',
			'listApi.sections.censusDatasets.description' => 'Dataset yang tersedia untuk topik sensus',
			'listApi.sections.censusData.title' => 'Data Sensus',
			'listApi.sections.censusData.description' => 'Data statistik sensus aktual',
			'listApi.sections.censusAreas.title' => 'Wilayah Sensus',
			'listApi.sections.censusAreas.description' => 'Wilayah geografis yang tercakup dalam kegiatan sensus',
			'viewApi.title' => 'View API',
			'viewApi.subtitle' => 'Tampilan informasi detail',
			'viewApi.sections.publication.title' => 'Detail Publikasi',
			'viewApi.sections.publication.description' => 'Informasi publikasi detail',
			'viewApi.sections.news.title' => 'Detail Berita',
			'viewApi.sections.news.description' => 'Artikel berita detail',
			'viewApi.sections.pressRelease.title' => 'Detail Siaran Pers',
			'viewApi.sections.pressRelease.description' => 'Siaran pers detail',
			'viewApi.sections.staticTable.title' => 'Detail Tabel Statis',
			'viewApi.sections.staticTable.description' => 'Informasi tabel detail',
			'domains.title' => 'Domain',
			'domains.types.province' => 'Provinsi',
			'domains.types.regency' => 'Kabupaten',
			'domains.types.regencyByProvince' => 'Kabupaten by Provinsi',
			'domains.types.all' => 'Semua Domain',
			'domains.fields.id' => 'ID',
			'domains.fields.name' => 'Nama',
			'domains.fields.url' => 'URL',
			'domains.parameters.title' => 'Parameter API',
			'domains.parameters.domainType' => 'Tipe Domain',
			'domains.parameters.provinceCode' => 'Kode Provinsi',
			'domains.parameters.provinceCodeHint' => 'contoh: 32 untuk Jawa Barat',
			'domains.parameters.provinceCodeRequired' => 'Kode provinsi diperlukan untuk tipe Kabupaten by Provinsi',
			'domains.parameters.language' => 'Bahasa',
			'domains.parameters.languageNote' => 'Edukatif - tidak diterapkan ke endpoint domain',
			'domains.parameters.loadButton' => 'Muat Domain',
			'domains.parameters.loading' => 'Memuat...',
			'domains.parameters.searchDomains' => 'Cari Domain',
			'domains.requestDetails.title' => 'Detail Request',
			'domains.requestDetails.method' => 'Metode',
			'domains.requestDetails.url' => 'URL',
			'domains.requestDetails.parameters' => 'Parameter',
			'domains.requestDetails.responseTime' => 'Waktu Respons',
			'domains.requestDetails.copyUrl' => 'Salin URL',
			'domains.requestDetails.urlCopied' => 'URL disalin ke clipboard',
			'domains.requestDetails.noRequest' => 'Belum ada request dibuat',
			'domains.requestDetails.showDetails' => 'Tampilkan Detail Request',
			'domains.requestDetails.hideDetails' => 'Sembunyikan Detail Request',
			'domains.results.title' => 'Hasil Domain',
			'domains.results.found' => 'Ditemukan {count} domain',
			'domains.results.empty' => 'Tidak ada domain ditemukan untuk kriteria yang dipilih',
			'domains.results.initial' => 'Pilih parameter dan klik "Muat Domain" untuk memulai',
			'domains.results.searchParameters' => 'Parameter Pencarian',
			'domains.education.title' => 'Cara Menggunakan',
			'domains.education.description' => 'Pelajari cara mencari dan menjelajahi data domain dari BPS.',
			'domains.education.parameters' => 'Parameter',
			'domains.education.parametersDescription' => 'Konfigurasikan tipe domain dan pengaturan wilayah',
			'domains.education.results' => 'Hasil',
			'domains.education.resultsDescription' => 'Lihat domain yang sesuai dengan kriteria Anda',
			'domains.education.detail' => 'Detail',
			'domains.education.detailDescription' => 'Lihat informasi domain dan link akses',
			'infographics.title' => 'Infografis',
			'infographics.fields.id' => 'ID',
			'infographics.fields.title' => 'Judul',
			'infographics.fields.image' => 'Gambar',
			'infographics.fields.description' => 'Deskripsi',
			'infographics.fields.category' => 'Kategori',
			'infographics.fields.downloadUrl' => 'URL Unduh',
			'infographics.parameters.title' => 'Parameter API',
			'infographics.parameters.domain' => 'Domain',
			'infographics.parameters.domainHint' => 'contoh: 7200 untuk tingkat nasional',
			'infographics.parameters.keyword' => 'Kata Kunci (Opsional)',
			'infographics.parameters.keywordHint' => 'Filter berdasarkan kata kunci',
			'infographics.parameters.page' => 'Halaman',
			'infographics.parameters.language' => 'Bahasa',
			'infographics.parameters.languageNote' => 'Diterapkan pada bahasa konten infografis',
			'infographics.parameters.loadButton' => 'Muat Infografis',
			'infographics.parameters.loading' => 'Memuat...',
			'infographics.parameters.searchInfographics' => 'Cari Infografis',
			'infographics.requestDetails.title' => 'Detail Request',
			'infographics.requestDetails.method' => 'Metode',
			'infographics.requestDetails.url' => 'URL',
			'infographics.requestDetails.parameters' => 'Parameter',
			'infographics.requestDetails.responseTime' => 'Waktu Respons',
			'infographics.requestDetails.copyUrl' => 'Salin URL',
			'infographics.requestDetails.urlCopied' => 'URL disalin ke clipboard',
			'infographics.requestDetails.noRequest' => 'Belum ada request dibuat',
			'infographics.requestDetails.showDetails' => 'Tampilkan Detail Request',
			'infographics.requestDetails.hideDetails' => 'Sembunyikan Detail Request',
			'infographics.results.title' => 'Hasil',
			'infographics.results.found' => 'Ditemukan {count} infografis',
			'infographics.results.empty' => 'Tidak ada infografis ditemukan untuk kriteria yang dipilih',
			'infographics.results.initial' => 'Konfigurasikan parameter dan klik "Muat Infografis" untuk memulai',
			'infographics.results.searchParameters' => 'Parameter Pencarian',
			'infographics.education.title' => 'Tips',
			'infographics.education.description' => 'Pelajari cara menggunakan fitur infografis secara efektif.',
			'infographics.education.parameters' => 'Parameter',
			'infographics.education.parametersDescription' => 'Konfigurasikan kriteria pencarian Anda di sini',
			'infographics.education.results' => 'Hasil',
			'infographics.education.resultsDescription' => 'Lihat infografis yang sesuai dengan kriteria Anda',
			'infographics.education.detail' => 'Detail',
			'infographics.education.detailDescription' => 'Lihat konten lengkap dan opsi unduhan',
			'publications.title' => 'Publikasi',
			'publications.comingSoon' => 'Halaman Publikasi - Segera Hadir',
			'publications.detail.title' => 'Detail Publikasi',
			'publications.fields.id' => 'ID',
			'publications.fields.title' => 'Judul',
			'publications.fields.issn' => 'ISSN',
			'publications.fields.cover' => 'Sampul',
			'publications.fields.pdfUrl' => 'URL PDF',
			'publications.fields.size' => 'Ukuran',
			'publications.fields.abstract' => 'Abstrak',
			'publications.fields.catalogueNumber' => 'Nomor Katalog',
			'publications.fields.publicationNumber' => 'Nomor Publikasi',
			'publications.fields.releaseDate' => 'Tanggal Rilis',
			'publications.fields.updatedAt' => 'Diperbarui',
			'publications.parameters.title' => 'Parameter API',
			'publications.parameters.domain' => 'Domain',
			'publications.parameters.domainHint' => 'contoh: 7200 untuk tingkat nasional',
			'publications.parameters.keyword' => 'Kata Kunci (Opsional)',
			'publications.parameters.keywordHint' => 'Filter berdasarkan kata kunci',
			'publications.parameters.month' => 'Bulan (Opsional)',
			'publications.parameters.monthHint' => 'Pilih bulan',
			'publications.parameters.year' => 'Tahun (Opsional)',
			'publications.parameters.yearHint' => 'Pilih tahun',
			'publications.parameters.language' => 'Bahasa',
			'publications.parameters.languageNote' => 'Diterapkan pada bahasa konten publikasi',
			'publications.parameters.loadButton' => 'Muat Publikasi',
			'publications.parameters.loading' => 'Memuat...',
			'publications.parameters.searchPublications' => 'Cari Publikasi',
			'publications.parameters.clearButton' => 'Hapus Filter',
			'publications.requestDetails.title' => 'Detail Request',
			'publications.requestDetails.method' => 'Method',
			'publications.requestDetails.url' => 'URL',
			'publications.requestDetails.parameters' => 'Parameter',
			'publications.requestDetails.responseTime' => 'Waktu Respons',
			'publications.requestDetails.copyUrl' => 'Salin URL',
			'publications.requestDetails.urlCopied' => 'URL disalin ke clipboard',
			'publications.requestDetails.noRequest' => 'Belum ada request yang dibuat',
			'publications.requestDetails.showDetails' => 'Tampilkan Detail Request',
			'publications.requestDetails.hideDetails' => 'Sembunyikan Detail Request',
			'publications.results.title' => 'Hasil Publikasi',
			'publications.results.found' => 'Ditemukan {count} publikasi',
			'publications.results.empty' => 'Tidak ada publikasi yang ditemukan untuk kriteria yang dipilih',
			'publications.results.initial' => 'Konfigurasi parameter dan klik "Muat Publikasi" untuk memulai',
			'publications.results.searchParameters' => 'Parameter Pencarian',
			'publications.education.title' => 'Cara Menggunakan',
			'publications.education.description' => 'Pelajari cara mencari dan mengeksplorasi data publikasi dari BPS.',
			'publications.education.parameters' => 'Parameter',
			'publications.education.parametersDescription' => 'Konfigurasi domain dan kriteria pencarian',
			'publications.education.results' => 'Hasil',
			'publications.education.resultsDescription' => 'Lihat publikasi yang sesuai dengan kriteria Anda',
			'publications.education.detail' => 'Detail',
			'publications.education.detailDescription' => 'Lihat informasi publikasi dan opsi unduhan',
			'news.title' => 'Berita',
			'news.categories' => 'Kategori',
			'news.fields.id' => 'ID',
			'news.fields.title' => 'Judul',
			'news.fields.content' => 'Konten',
			'news.fields.picture' => 'Gambar',
			'news.fields.releaseDate' => 'Tanggal Rilis',
			'news.fields.category' => 'Kategori',
			'news.fields.categoryID' => 'ID Kategori',
			'news.parameters.title' => 'Parameter API',
			'news.parameters.domain' => 'Domain',
			'news.parameters.domainHint' => 'contoh: 7200 untuk Sulawesi Tengah',
			'news.parameters.keyword' => 'Kata Kunci (Opsional)',
			'news.parameters.keywordHint' => 'Filter berdasarkan kata kunci',
			'news.parameters.category' => 'ID Kategori (Opsional)',
			'news.parameters.categoryHint' => 'Filter berdasarkan ID kategori berita',
			'news.parameters.month' => 'Bulan (Opsional)',
			'news.parameters.monthHint' => 'Pilih bulan',
			'news.parameters.year' => 'Tahun (Opsional)',
			'news.parameters.yearHint' => 'Pilih tahun',
			'news.parameters.page' => 'Halaman',
			'news.parameters.language' => 'Bahasa',
			'news.parameters.languageNote' => 'Diterapkan pada bahasa konten berita',
			'news.parameters.loadButton' => 'Muat Berita',
			'news.parameters.searchNews' => 'Cari Berita',
			'news.parameters.clearButton' => 'Hapus Filter',
			'news.parameters.loading' => 'Memuat...',
			'news.requestDetails.title' => 'Detail Request',
			'news.requestDetails.method' => 'Metode',
			'news.requestDetails.url' => 'URL',
			'news.requestDetails.parameters' => 'Parameter',
			'news.requestDetails.responseTime' => 'Waktu Respons',
			'news.requestDetails.copyUrl' => 'Salin URL',
			'news.requestDetails.urlCopied' => 'URL disalin ke clipboard',
			'news.requestDetails.noRequest' => 'Belum ada request dibuat',
			'news.requestDetails.showDetails' => 'Tampilkan Detail Request',
			'news.requestDetails.hideDetails' => 'Sembunyikan Detail Request',
			'news.results.title' => 'Hasil Berita',
			'news.results.found' => 'Ditemukan {count} artikel berita',
			'news.results.empty' => 'Tidak ada berita ditemukan untuk kriteria yang dipilih',
			'news.results.initial' => 'Konfigurasikan parameter dan klik "Muat Berita" untuk memulai',
			'news.results.searchParameters' => 'Parameter Pencarian',
			'news.detail.title' => 'Detail Berita',
			'news.detail.metadata' => 'Informasi Berita',
			'news.detail.content' => 'Konten Artikel',
			'news.education.title' => 'Cara kerja',
			'news.education.description' => 'Ini mendemonstrasikan alur kerja API berita dengan halaman terpisah untuk parameter, hasil, dan tampilan detail.',
			'news.education.parameters' => 'Parameter',
			'news.education.parametersDescription' => 'Konfigurasikan kriteria pencarian Anda di sini',
			'news.education.results' => 'Hasil',
			'news.education.resultsDescription' => 'Lihat artikel berita yang sesuai dengan kriteria Anda',
			'news.education.detail' => 'Detail',
			'news.education.detailDescription' => 'Lihat konten lengkap menggunakan view API',
			'newsCategories.title' => 'Kategori Berita',
			'newsCategories.fields.id' => 'ID',
			'newsCategories.fields.name' => 'Nama',
			'newsCategories.parameters.title' => 'Parameter API',
			'newsCategories.parameters.domain' => 'Domain',
			'newsCategories.parameters.domainHint' => 'contoh: 7200 untuk tingkat nasional',
			'newsCategories.parameters.domainDescription' => 'Kode domain 4+ karakter (wajib)',
			'newsCategories.parameters.language' => 'Bahasa',
			'newsCategories.parameters.languageIndonesian' => 'Indonesia',
			'newsCategories.parameters.languageEnglish' => 'Inggris',
			'newsCategories.parameters.languageDescription' => 'Bahasa konten untuk kategori berita',
			'newsCategories.parameters.searchNewsCategories' => 'Cari Kategori Berita',
			'newsCategories.requestDetails.title' => 'Detail Request',
			'newsCategories.requestDetails.endpoint' => 'Endpoint',
			'newsCategories.requestDetails.method' => 'Metode',
			'newsCategories.requestDetails.parameters' => 'Parameter',
			'newsCategories.requestDetails.curlExample' => 'Contoh cURL',
			'newsCategories.requestDetails.showDetails' => 'Tampilkan Detail Request',
			'newsCategories.requestDetails.hideDetails' => 'Sembunyikan Detail Request',
			'newsCategories.requestDetails.noRequestYet' => 'Belum ada request dibuat',
			'newsCategories.results.title' => 'Hasil Kategori Berita',
			'newsCategories.results.searchParameters' => 'Parameter Pencarian',
			'newsCategories.results.categoriesFound' => 'kategori ditemukan',
			'newsCategories.results.noDataFound' => 'Tidak Ada Kategori Ditemukan',
			'newsCategories.results.noDataDescription' => 'Coba sesuaikan parameter pencarian atau periksa apakah domain tersebut ada.',
			'newsCategories.categoryDetail.title' => 'Detail Kategori',
			'newsCategories.categoryDetail.id' => 'ID Kategori',
			'newsCategories.categoryDetail.name' => 'Nama Kategori',
			'newsCategories.education.title' => 'Cara kerja',
			'newsCategories.education.description' => 'Jelajahi kategori berita yang tersedia untuk domain dan bahasa yang berbeda dari data statistik BPS.',
			'newsCategories.education.parameters' => 'Parameter',
			'newsCategories.education.parametersDescription' => 'Konfigurasikan pengaturan domain dan bahasa',
			'newsCategories.education.results' => 'Hasil',
			'newsCategories.education.resultsDescription' => 'Lihat kategori berita yang tersedia untuk domain',
			'newsCategories.education.categories' => 'Kategori',
			'newsCategories.education.categoriesDescription' => 'Jelajahi klasifikasi kategori berita yang berbeda',
			'dynamicTables.title' => 'Tabel Dinamis',
			'dynamicTables.parameters.title' => 'Parameter API',
			'dynamicTables.parameters.domain' => 'Domain',
			'dynamicTables.parameters.domainHint' => 'contoh: 7200 untuk tingkat nasional',
			'dynamicTables.parameters.variable' => 'Variabel',
			'dynamicTables.parameters.variableHint' => 'Pilih variabel statistik',
			'dynamicTables.parameters.selectYear' => 'Pilih Tahun',
			'dynamicTables.parameters.language' => 'Bahasa',
			'dynamicTables.parameters.languageNote' => 'Diterapkan pada bahasa konten tabel dinamis',
			'dynamicTables.parameters.loadPeriods' => 'Muat Periode yang Tersedia',
			'dynamicTables.parameters.generateTable' => 'Generate Tabel Dinamis',
			'dynamicTables.parameters.loading' => 'Memuat...',
			'dynamicTables.requestDetails.title' => 'Detail Request',
			'dynamicTables.requestDetails.showDetails' => 'Tampilkan Detail Request',
			'dynamicTables.requestDetails.hideDetails' => 'Sembunyikan Detail Request',
			'dynamicTables.requestDetails.noRequest' => 'Belum ada request dibuat',
			'dynamicTables.results.title' => 'Hasil Tabel Dinamis',
			'dynamicTables.results.periodsAvailable' => 'Periode yang Tersedia',
			'dynamicTables.results.selectPeriod' => 'Pilih periode dari atas untuk generate tabel',
			'dynamicTables.results.tableGenerated' => 'Tabel berhasil di-generate',
			'dynamicTables.results.empty' => 'Tidak ada data tersedia untuk kriteria yang dipilih',
			'dynamicTables.results.initial' => 'Masukkan parameter di atas dan klik "Muat Tahun yang Tersedia" untuk memulai',
			'dynamicTables.results.periodInitial' => 'Pilih tahun dari dropdown di atas, lalu klik "Muat Tabel Dinamis" untuk melihat data.',
			'dynamicTables.results.periodId' => 'ID Periode',
			'dynamicTables.workflow.title' => 'Alur Kerja Tabel Dinamis',
			'dynamicTables.workflow.description' => 'Ikuti langkah-langkah ini untuk menghasilkan tabel dinamis dari data BPS.',
			'dynamicTables.workflow.step1' => 'Langkah 1',
			'dynamicTables.workflow.step1Description' => 'Pilih domain dan bahasa, lalu pilih variabel',
			'dynamicTables.workflow.step2' => 'Langkah 2',
			'dynamicTables.workflow.step2Description' => 'Muat periode yang tersedia untuk variabel yang dipilih',
			'dynamicTables.workflow.step3' => 'Langkah 3',
			'dynamicTables.workflow.step3Description' => 'Pilih tahun/periode dan generate tabel',
			'dynamicTables.states.initializing' => 'Menginisialisasi...',
			'dynamicTables.states.unknown' => 'Status tidak diketahui',
			'pressReleases.title' => 'Siaran Pers',
			'pressReleases.comingSoon' => 'Halaman Siaran Pers - Segera Hadir',
			'pressReleases.detail.title' => 'Detail Siaran Pers',
			'pressReleases.detail.forId' => 'Detail Siaran Pers untuk ID: {id}',
			'pressReleases.fields.id' => 'ID',
			'pressReleases.fields.title' => 'Judul',
			'pressReleases.fields.cover' => 'Sampul',
			'pressReleases.fields.pdfUrl' => 'URL PDF',
			'pressReleases.fields.size' => 'Ukuran',
			'pressReleases.fields.abstract' => 'Abstrak',
			'pressReleases.fields.releaseDate' => 'Tanggal Rilis',
			'pressReleases.parameters.title' => 'Parameter API',
			'pressReleases.parameters.domain' => 'Domain',
			'pressReleases.parameters.domainHint' => 'contoh: 7200 untuk tingkat nasional',
			'pressReleases.parameters.keyword' => 'Kata Kunci (Opsional)',
			'pressReleases.parameters.keywordHint' => 'Filter berdasarkan kata kunci',
			'pressReleases.parameters.month' => 'Bulan (Opsional)',
			'pressReleases.parameters.monthHint' => 'Pilih bulan',
			'pressReleases.parameters.year' => 'Tahun (Opsional)',
			'pressReleases.parameters.yearHint' => 'Pilih tahun',
			'pressReleases.parameters.language' => 'Bahasa',
			'pressReleases.parameters.languageNote' => 'Diterapkan pada bahasa konten siaran pers',
			'pressReleases.parameters.clearFilters' => 'Hapus Filter',
			'pressReleases.parameters.search' => 'Cari',
			'pressReleases.parameters.load' => 'Muat Siaran Pers',
			'pressReleases.results.title' => 'Hasil Siaran Pers',
			'pressReleases.results.count' => '{count} siaran pers ditemukan',
			'pressReleases.results.noData' => 'Tidak ada siaran pers ditemukan',
			'pressReleases.results.searchParameters' => 'Parameter Pencarian',
			'pressReleases.results.loading' => 'Memuat siaran pers...',
			'pressReleases.results.pressSearchToLoad' => 'Tekan tombol cari untuk memuat data',
			'pressReleases.actions.downloadPdf' => 'Unduh PDF',
			'pressReleases.actions.viewDetails' => 'Lihat Detail',
			'staticTables.title' => 'Tabel Statis',
			'staticTables.description' => 'Tabel statistik yang telah didefinisikan dengan data dalam format HTML dan Excel',
			'staticTables.noDataFound' => 'Tidak ada tabel statis yang ditemukan',
			'staticTables.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} tabel statis', other: 'Ditemukan ${n} tabel statis', ), 
			'staticTables.fields.id' => 'ID',
			'staticTables.fields.title' => 'Judul',
			'staticTables.fields.subject' => 'Subjek',
			'staticTables.fields.size' => 'Ukuran',
			'staticTables.fields.updatedAt' => 'Diperbarui Pada',
			'staticTables.fields.createdAt' => 'Dibuat Pada',
			'staticTables.parameters.title' => 'Parameter',
			'staticTables.parameters.domain' => 'Domain *',
			'staticTables.parameters.domainHint' => 'contoh: 7200',
			'staticTables.parameters.language' => 'Bahasa',
			'staticTables.parameters.keyword' => 'Kata Kunci (Opsional)',
			'staticTables.parameters.keywordHint' => 'Filter berdasarkan kata kunci',
			'staticTables.parameters.month' => 'Bulan (Opsional)',
			'staticTables.parameters.monthHint' => 'Pilih bulan',
			'staticTables.parameters.year' => 'Tahun (Opsional)',
			'staticTables.parameters.yearHint' => 'Pilih tahun',
			'staticTables.parameters.clearFilters' => 'Hapus Filter',
			'staticTables.parameters.loadButton' => 'Muat Tabel Statis',
			'staticTables.actions.viewTable' => 'Lihat Tabel',
			'staticTables.actions.downloadExcel' => 'Unduh Excel',
			'staticTables.detail.title' => 'Detail Tabel Statis',
			'staticTables.detail.loading' => 'Memuat tabel...',
			'staticTables.detail.noTableData' => 'Tidak ada data tabel yang tersedia',
			'staticTables.detail.refresh' => 'Segarkan',
			'staticTables.detail.downloadExcel' => 'Unduh Excel',
			'strategicIndicators.title' => 'Indikator Strategis',
			'strategicIndicators.fields.id' => 'ID',
			'strategicIndicators.fields.title' => 'Judul',
			'strategicIndicators.fields.name' => 'Nama',
			'strategicIndicators.fields.dataSource' => 'Sumber Data',
			'strategicIndicators.fields.value' => 'Nilai',
			'strategicIndicators.fields.unit' => 'Satuan',
			'strategicIndicators.fields.period' => 'Periode',
			'strategicIndicators.fields.categoryID' => 'ID Kategori',
			'strategicIndicators.fields.variableID' => 'ID Variabel',
			'strategicIndicators.parameters.title' => 'Parameter',
			'strategicIndicators.parameters.domain' => 'Domain *',
			'strategicIndicators.parameters.domainHint' => 'contoh: 7200',
			'strategicIndicators.parameters.variableID' => 'ID Variabel (Opsional)',
			'strategicIndicators.parameters.variableIDHint' => 'Filter berdasarkan ID variabel',
			'strategicIndicators.parameters.language' => 'Bahasa',
			'strategicIndicators.parameters.loadButton' => 'Muat Indikator Strategis',
			'strategicIndicators.results.title' => 'Hasil Indikator Strategis',
			'strategicIndicators.results.searchParameters' => 'Parameter Pencarian',
			'strategicIndicators.results.found' => 'Ditemukan {count} indikator strategis',
			'strategicIndicators.results.foundSingular' => '',
			'strategicIndicators.results.foundPlural' => '',
			'strategicIndicators.results.initializing' => 'Menginisialisasi...',
			'censusTopics.title' => 'Topik Sensus',
			'censusTopics.fields.id' => 'ID',
			'censusTopics.fields.topic' => 'Topik',
			'censusTopics.fields.eventID' => 'ID Kegiatan',
			'censusTopics.fields.eventName' => 'Nama Kegiatan',
			'censusTopics.parameters.title' => 'Parameter',
			'censusTopics.parameters.censusEvent' => 'Kegiatan Sensus *',
			'censusTopics.parameters.censusEventHint' => 'Pilih kegiatan sensus',
			'censusTopics.parameters.loadButton' => 'Muat Topik',
			'censusTopics.results.title' => 'Hasil Topik Sensus',
			'censusTopics.results.searchParameters' => 'Parameter Pencarian',
			'censusTopics.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} topik', other: 'Ditemukan ${n} topik', ), 
			'censusTopics.results.initializing' => 'Menginisialisasi...',
			'censusDatasets.title' => 'Dataset Sensus',
			'censusDatasets.fields.id' => 'ID Dataset',
			'censusDatasets.fields.topicID' => 'ID Topik',
			'censusDatasets.fields.topic' => 'Topik',
			'censusDatasets.fields.eventID' => 'ID Kegiatan',
			'censusDatasets.fields.name' => 'Nama Dataset',
			'censusDatasets.fields.description' => 'Deskripsi',
			'censusDatasets.parameters.title' => 'Parameter',
			'censusDatasets.parameters.censusEvent' => 'Kegiatan Sensus *',
			'censusDatasets.parameters.censusEventHint' => 'Pilih kegiatan sensus',
			'censusDatasets.parameters.censusTopic' => 'Topik Sensus *',
			'censusDatasets.parameters.censusTopicHint' => 'Pilih topik sensus',
			'censusDatasets.parameters.loadButton' => 'Muat Dataset',
			'censusDatasets.results.title' => 'Hasil Dataset Sensus',
			'censusDatasets.results.searchParameters' => 'Parameter Pencarian',
			'censusDatasets.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} dataset', other: 'Ditemukan ${n} dataset', ), 
			'censusDatasets.results.initializing' => 'Menginisialisasi...',
			'censusData.title' => 'Data Sensus',
			'censusData.fields.regionID' => 'ID Wilayah',
			'censusData.fields.regionCode' => 'Kode Wilayah',
			'censusData.fields.regionName' => 'Nama Wilayah',
			'censusData.fields.regionLevel' => 'Tingkat Wilayah',
			'censusData.fields.indicatorID' => 'ID Indikator',
			'censusData.fields.indicatorName' => 'Nama Indikator',
			'censusData.fields.categories' => 'Kategori',
			'censusData.fields.period' => 'Periode',
			'censusData.fields.value' => 'Nilai',
			'censusData.parameters.title' => 'Parameter',
			'censusData.parameters.censusEvent' => 'Kegiatan Sensus *',
			'censusData.parameters.censusEventHint' => 'Pilih kegiatan sensus',
			'censusData.parameters.censusTopic' => 'Topik Sensus *',
			'censusData.parameters.censusTopicHint' => 'Pilih topik sensus',
			'censusData.parameters.censusArea' => 'Wilayah Sensus',
			'censusData.parameters.censusAreaHint' => 'Pilih wilayah sensus (opsional)',
			'censusData.parameters.dataset' => 'Dataset *',
			'censusData.parameters.datasetHint' => 'Pilih dataset',
			'censusData.parameters.loadButton' => 'Muat Data Sensus',
			'censusData.results.title' => 'Hasil Data Sensus',
			'censusData.results.searchParameters' => 'Parameter Pencarian',
			'censusData.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} data', other: 'Ditemukan ${n} data', ), 
			'censusData.results.initializing' => 'Menginisialisasi...',
			'censusAreas.title' => 'Wilayah Sensus',
			'censusAreas.description' => 'Wilayah geografis yang tercakup dalam kegiatan sensus',
			'censusAreas.fields.id' => 'ID Wilayah',
			'censusAreas.fields.name' => 'Nama Wilayah',
			'censusAreas.fields.slug' => 'Slug',
			_ => null,
		} ?? switch (path) {
			'censusAreas.fields.mfdCode' => 'Kode MFD',
			'censusAreas.parameters.title' => 'Parameter',
			'censusAreas.parameters.censusEvent' => 'Kegiatan Sensus *',
			'censusAreas.parameters.censusEventHint' => 'Pilih kegiatan sensus',
			'censusAreas.parameters.loadButton' => 'Muat Wilayah Sensus',
			'censusAreas.results.title' => 'Hasil Wilayah Sensus',
			'censusAreas.results.searchParameters' => 'Parameter Pencarian',
			'censusAreas.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} wilayah', other: 'Ditemukan ${n} wilayah', ), 
			'censusAreas.results.initializing' => 'Menginisialisasi...',
			'subjectCategories.title' => 'Kategori Subjek',
			'subjectCategories.fields.id' => 'ID',
			'subjectCategories.fields.name' => 'Nama',
			'subjectCategories.parameters.title' => 'Parameter',
			'subjectCategories.parameters.domain' => 'Domain *',
			'subjectCategories.parameters.domainHint' => 'contoh: 7200',
			'subjectCategories.parameters.language' => 'Bahasa',
			'subjectCategories.parameters.loadButton' => 'Muat Kategori Subjek',
			'subjectCategories.results.title' => 'Hasil Kategori Subjek',
			'subjectCategories.results.searchParameters' => 'Parameter Pencarian',
			'subjectCategories.results.found' => 'Ditemukan {count} kategori subjek',
			'subjectCategories.results.foundSingular' => '',
			'subjectCategories.results.foundPlural' => '',
			'subjectCategories.results.initializing' => 'Menginisialisasi...',
			'subjects.title' => 'Subjek',
			'subjects.comingSoon' => 'Halaman Subjek - Segera Hadir',
			'units.title' => 'Unit',
			'units.description' => 'Unit pengukuran untuk data statistik',
			'units.noDataFound' => 'Tidak ada unit yang ditemukan',
			'units.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} unit', other: 'Ditemukan ${n} unit', ), 
			'units.fields.id' => 'ID',
			'units.fields.title' => 'Judul',
			'units.parameters.title' => 'Parameter',
			'units.parameters.domain' => 'Domain *',
			'units.parameters.domainHint' => 'contoh: 7200',
			'units.parameters.language' => 'Bahasa',
			'units.parameters.variableID' => 'Variabel (Opsional)',
			'units.parameters.variableIDHint' => 'Pilih variabel (opsional)',
			'units.parameters.loadButton' => 'Muat Unit',
			'variables.title' => 'Variabel',
			'variables.description' => 'Variabel dan ukuran statistik',
			'variables.noDataFound' => 'Tidak ada variabel yang ditemukan',
			'variables.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} variabel', other: 'Ditemukan ${n} variabel', ), 
			'variables.fields.id' => 'ID',
			'variables.fields.title' => 'Judul',
			'variables.fields.graphName' => 'Nama Grafik',
			'variables.fields.unit' => 'Satuan',
			'variables.fields.subjectID' => 'ID Subjek',
			'variables.fields.subjectName' => 'Nama Subjek',
			'variables.fields.notes' => 'Catatan',
			'variables.fields.verticalVariableID' => 'ID Variabel Vertikal',
			'variables.parameters.title' => 'Parameter',
			'variables.parameters.domain' => 'Domain *',
			'variables.parameters.domainHint' => 'contoh: 7200',
			'variables.parameters.language' => 'Bahasa',
			'variables.parameters.year' => 'Tahun',
			'variables.parameters.yearHint' => 'contoh: 2024 (opsional)',
			'variables.parameters.subject' => 'Subjek',
			'variables.parameters.subjectHint' => 'Pilih subjek (opsional)',
			'variables.parameters.allSubjects' => 'Semua Subjek',
			'variables.parameters.showExistingVariables' => 'Tampilkan Variabel yang Ada',
			'variables.parameters.loadButton' => 'Muat Variabel',
			'verticalVariables.title' => 'Variabel Vertikal',
			'verticalVariables.description' => 'Dimensi kategorikal dan sistem klasifikasi',
			'verticalVariables.noDataFound' => 'Tidak ada variabel vertikal yang ditemukan',
			'verticalVariables.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} variabel vertikal', other: 'Ditemukan ${n} variabel vertikal', ), 
			'verticalVariables.fields.id' => 'ID',
			'verticalVariables.fields.title' => 'Judul',
			'verticalVariables.fields.itemID' => 'ID Item',
			'verticalVariables.fields.groupID' => 'ID Grup',
			'verticalVariables.fields.groupName' => 'Nama Grup',
			'verticalVariables.parameters.title' => 'Parameter',
			'verticalVariables.parameters.domain' => 'Domain *',
			'verticalVariables.parameters.domainHint' => 'contoh: 7200',
			'verticalVariables.parameters.language' => 'Bahasa',
			'verticalVariables.parameters.variableID' => 'ID Variabel',
			'verticalVariables.parameters.variableIDHint' => 'contoh: 1234 (opsional)',
			'verticalVariables.parameters.loadButton' => 'Muat Variabel Vertikal',
			'shared.pagination.previous' => 'Sebelumnya',
			'shared.pagination.next' => 'Selanjutnya',
			'shared.pagination.loadMore' => 'Muat Lebih Banyak',
			'shared.pagination.page' => 'Halaman',
			'shared.pagination.previousPage' => 'Halaman sebelumnya',
			'shared.pagination.nextPage' => 'Halaman selanjutnya',
			'shared.pagination.previousPageTooltip' => 'Halaman sebelumnya',
			'shared.pagination.nextPageTooltip' => 'Halaman selanjutnya',
			'shared.codeSnippet.copyToClipboard' => 'Salin ke clipboard',
			'shared.codeSnippet.codeCopied' => 'Kode disalin ke clipboard',
			'shared.errorWidget.tryAgain' => 'Coba Lagi',
			'shared.searchableDropdown.noItemsFound' => 'Tidak ada item ditemukan',
			'shared.searchableDropdown.selectItem' => 'Pilih item',
			'shared.requestDetails.title' => 'Detail Request',
			'shared.requestDetails.method' => 'Metode',
			'shared.requestDetails.url' => 'URL',
			'shared.requestDetails.parameters' => 'Parameter',
			'shared.requestDetails.urlCopied' => 'URL disalin ke clipboard',
			'shared.requestDetails.parametersCopied' => 'Parameter disalin ke clipboard',
			'validation.domainRequired' => 'Domain diperlukan',
			'categories.imageNotAvailable' => 'Gambar tidak tersedia',
			'categories.categoryId' => 'ID Kategori',
			'categories.releaseDate' => 'Tanggal Rilis',
			'categories.imageUrl' => 'URL Gambar',
			'categories.tapToReadMore' => 'Ketuk untuk baca lebih lanjut',
			'instructions.requestDetailsWillShow' => 'Detail request akan ditampilkan di halaman hasil',
			'instructions.onlyHandlesParameters' => 'Halaman ini hanya menangani konfigurasi parameter. Klik "Cari Domain" untuk melihat detail request di halaman hasil.',
			'instructions.enterParametersAndLoad' => 'Masukkan parameter dan klik muat untuk melihat data',
			'instructions.languageLabels.indonesian' => 'Indonesia',
			'instructions.languageLabels.english' => 'Inggris',
			'settings.title' => 'Pengaturan',
			'settings.language' => 'Bahasa',
			'settings.theme' => 'Tema',
			'settings.darkMode' => 'Mode Gelap',
			'settings.about' => 'Tentang',
			'statisticalClassifications.title' => 'Klasifikasi Statistik',
			'statisticalClassifications.fields.id' => 'ID',
			'statisticalClassifications.fields.title' => 'Judul',
			'statisticalClassifications.fields.type' => 'Tipe',
			'statisticalClassifications.fields.level' => 'Level',
			'statisticalClassifications.fields.source' => 'Sumber',
			'statisticalClassifications.fields.description' => 'Deskripsi',
			'statisticalClassifications.fields.releaseDate' => 'Tanggal Rilis',
			'statisticalClassifications.levels.category' => 'Kategori',
			'statisticalClassifications.levels.primaryGroup' => 'Golongan Pokok',
			'statisticalClassifications.levels.group' => 'Golongan',
			'statisticalClassifications.levels.subGroup' => 'Sub-Golongan',
			'statisticalClassifications.levels.cluster' => 'Kelompok',
			'statisticalClassifications.kbkiLevels.section' => 'Seksi',
			'statisticalClassifications.kbkiLevels.division' => 'Divisi',
			'statisticalClassifications.kbkiLevels.group' => 'Kelompok',
			'statisticalClassifications.kbkiLevels.classes' => 'Kelas',
			'statisticalClassifications.kbkiLevels.subClass' => 'Subkelas',
			'statisticalClassifications.kbkiLevels.commodityGroup' => 'Kelompok Komoditas',
			'statisticalClassifications.kbkiLevels.commodity' => 'Komoditas',
			'statisticalClassifications.parameters.title' => 'Parameter',
			'statisticalClassifications.parameters.category' => 'Kategori Klasifikasi *',
			'statisticalClassifications.parameters.categoryHint' => 'Pilih KBLI atau KBKI',
			'statisticalClassifications.parameters.type' => 'Tipe Klasifikasi *',
			'statisticalClassifications.parameters.typeHint' => 'Pilih tahun klasifikasi',
			'statisticalClassifications.parameters.level' => 'Level Klasifikasi (Opsional)',
			'statisticalClassifications.parameters.levelHint' => 'Pilih level',
			'statisticalClassifications.parameters.allLevels' => 'Semua Level',
			'statisticalClassifications.parameters.language' => 'Bahasa',
			'statisticalClassifications.parameters.loadButton' => 'Muat Klasifikasi',
			'statisticalClassifications.results.title' => 'Hasil Klasifikasi Statistik',
			'statisticalClassifications.results.searchParameters' => 'Parameter Pencarian',
			'statisticalClassifications.results.found' => 'Ditemukan {count} klasifikasi',
			'statisticalClassifications.results.foundSingular' => '',
			'statisticalClassifications.results.foundPlural' => '',
			'statisticalClassifications.results.initializing' => 'Menginisialisasi...',
			'statisticalClassifications.detail.title' => 'Detail Klasifikasi',
			'statisticalClassifications.detail.noChildren' => 'Tidak ada sub-klasifikasi tersedia',
			'statisticalClassifications.detail.metadata' => 'Metadata',
			'statisticalClassifications.detail.source' => 'Sumber',
			'statisticalClassifications.detail.releaseDate' => 'Tanggal Rilis',
			'statisticalClassifications.detail.lastUpdate' => 'Terakhir Diperbarui',
			'statisticalClassifications.detail.level' => 'Tingkat',
			'statisticalClassifications.detail.viewOnline' => 'Lihat Online',
			'statisticalClassifications.detail.tags' => 'Tag',
			'statisticalClassifications.detail.derivedClassifications' => 'Klasifikasi Turunan',
			'censusEvents.title' => 'Kegiatan Sensus',
			'censusEvents.fields.id' => 'ID',
			'censusEvents.fields.name' => 'Nama',
			'censusEvents.fields.year' => 'Tahun',
			'censusEvents.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n, one: 'Ditemukan ${n} kegiatan sensus', other: 'Ditemukan ${n} kegiatan sensus', ), 
			'censusEvents.initializing' => 'Menginisialisasi...',
			_ => null,
		};
	}
}
