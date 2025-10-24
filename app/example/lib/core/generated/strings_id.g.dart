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
/// Note: We use a HashMap because Dart seems to be unable to compile large switch statements.
Map<String, dynamic>? _map;

extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		final map = _map ?? _initFlatMap();
		return map[path];
	}

	/// Initializes the flat map and returns it.
	Map<String, dynamic> _initFlatMap() {
		final map = <String, dynamic>{};
		map['app.title'] = 'Contoh STADATA';
		map['app.description'] = 'Showcase kemampuan STADATA Flutter SDK';
		map['navigation.home'] = 'Beranda';
		map['navigation.listApi'] = 'List API';
		map['navigation.viewApi'] = 'View API';
		map['navigation.dynamicTables'] = 'Tabel Dinamis';
		map['navigation.periods'] = 'Periode';
		map['navigation.pageNotFound'] = 'Halaman Tidak Ditemukan';
		map['navigation.pageNotFoundMessage'] = 'Halaman yang Anda cari tidak ada.';
		map['common.loading'] = 'Memuat...';
		map['common.error'] = 'Error';
		map['common.retry'] = 'Coba Lagi';
		map['common.noData'] = 'Tidak ada data tersedia';
		map['common.search'] = 'Cari';
		map['common.refresh'] = 'Segarkan';
		map['common.cancel'] = 'Batal';
		map['common.save'] = 'Simpan';
		map['common.delete'] = 'Hapus';
		map['common.edit'] = 'Edit';
		map['common.create'] = 'Buat';
		map['common.update'] = 'Perbarui';
		map['common.back'] = 'Kembali';
		map['common.next'] = 'Selanjutnya';
		map['common.previous'] = 'Sebelumnya';
		map['common.page'] = 'Halaman';
		map['common.total'] = 'Total';
		map['common.items'] = 'item';
		map['common.of'] = 'dari';
		map['common.language'] = 'Bahasa';
		map['common.details'] = 'Detail';
		map['common.unknownState'] = 'Status tidak diketahui';
		map['errors.generic'] = 'Terjadi kesalahan. Silakan coba lagi.';
		map['errors.network'] = 'Error jaringan. Periksa koneksi Anda.';
		map['errors.notFound'] = 'Data tidak ditemukan.';
		map['errors.timeout'] = 'Request timeout. Silakan coba lagi.';
		map['errors.unauthorized'] = 'Akses tidak diizinkan.';
		map['errors.serverError'] = 'Error server. Silakan coba lagi nanti.';
		map['home.title'] = 'Selamat Datang di STADATA';
		map['home.subtitle'] = 'Jelajahi Data Statistik Indonesia';
		map['home.description'] = 'Akses data statistik komprehensif dari Badan Pusat Statistik (BPS) Indonesia melalui aplikasi showcase ini.';
		map['home.features.title'] = 'Fitur';
		map['home.aboutDemo.title'] = 'Tentang Demo Ini';
		map['home.aboutDemo.description'] = 'Contoh sederhana ini mendemonstrasikan fungsionalitas domain dari STADATA Flutter SDK. Klik pada kartu domain di atas untuk menjelajahi domain statistik dari BPS Indonesia.';
		map['home.sections.listApi.title'] = 'List API';
		map['home.sections.listApi.description'] = 'Jelajahi koleksi domain, publikasi, berita, dan lainnya';
		map['home.sections.viewApi.title'] = 'View API';
		map['home.sections.viewApi.description'] = 'Dapatkan informasi detail tentang publikasi, berita, dan siaran pers tertentu';
		map['home.sections.dynamicTables.title'] = 'Tabel Dinamis';
		map['home.sections.dynamicTables.description'] = 'Jelajahi tabel statistik dinamis dengan parameter yang dapat disesuaikan';
		map['home.sections.periods.title'] = 'Periode';
		map['home.sections.periods.description'] = 'Jelajahi periode waktu yang tersedia untuk data statistik';
		map['listApi.title'] = 'List API';
		map['listApi.subtitle'] = 'Jelajahi koleksi data statistik dari BPS';
		map['listApi.sections.domains.title'] = 'Domain';
		map['listApi.sections.domains.description'] = 'Domain dan wilayah statistik';
		map['listApi.sections.publications.title'] = 'Publikasi';
		map['listApi.sections.publications.description'] = 'Publikasi dan laporan statistik';
		map['listApi.sections.news.title'] = 'Berita';
		map['listApi.sections.news.description'] = 'Berita dan update statistik terbaru';
		map['listApi.sections.pressReleases.title'] = 'Siaran Pers';
		map['listApi.sections.pressReleases.description'] = 'Siaran pers resmi dari BPS';
		map['listApi.sections.infographics.title'] = 'Infografis';
		map['listApi.sections.infographics.description'] = 'Informasi statistik visual';
		map['listApi.sections.newsCategories.title'] = 'Kategori Berita';
		map['listApi.sections.newsCategories.description'] = 'Jelajahi klasifikasi kategori berita dari BPS';
		map['listApi.sections.dynamicTables.title'] = 'Tabel Dinamis';
		map['listApi.sections.dynamicTables.description'] = 'Jelajahi data statistik multi-dimensi dengan integrasi periode';
		map['listApi.sections.staticTables.title'] = 'Tabel Statis';
		map['listApi.sections.staticTables.description'] = 'Tabel statistik yang telah ditentukan';
		map['listApi.sections.statisticalClassifications.title'] = 'Klasifikasi Statistik';
		map['listApi.sections.statisticalClassifications.description'] = 'Jelajahi klasifikasi KBLI dan KBKI';
		map['listApi.sections.strategicIndicators.title'] = 'Indikator Strategis';
		map['listApi.sections.strategicIndicators.description'] = 'Ukuran statistik kunci yang melacak pembangunan nasional';
		map['listApi.sections.subjectCategories.title'] = 'Kategori Subjek';
		map['listApi.sections.subjectCategories.description'] = 'Jelajahi dan telusuri kategori subjek';
		map['listApi.sections.subjects.title'] = 'Subjek';
		map['listApi.sections.subjects.description'] = 'Kategori subjek statistik';
		map['listApi.sections.variables.title'] = 'Variabel';
		map['listApi.sections.variables.description'] = 'Variabel dan ukuran statistik';
		map['listApi.sections.verticalVariables.title'] = 'Variabel Vertikal';
		map['listApi.sections.verticalVariables.description'] = 'Dimensi kategorikal dan sistem klasifikasi';
		map['listApi.sections.units.title'] = 'Unit';
		map['listApi.sections.units.description'] = 'Unit pengukuran untuk data statistik';
		map['listApi.sections.periods.title'] = 'Periode';
		map['listApi.sections.periods.description'] = 'Periode waktu untuk data statistik';
		map['listApi.sections.derivedPeriods.title'] = 'Periode Turunan';
		map['listApi.sections.derivedPeriods.description'] = 'Periode waktu yang dikelompokkan dan diagregasi';
		map['listApi.sections.derivedVariables.title'] = 'Variabel Turunan';
		map['listApi.sections.derivedVariables.description'] = 'Variabel statistik yang dihitung dan ditransformasi';
		map['listApi.sections.censusEvents.title'] = 'Kegiatan Sensus';
		map['listApi.sections.censusEvents.description'] = 'Daftar kegiatan sensus utama';
		map['listApi.sections.censusTopics.title'] = 'Topik Sensus';
		map['listApi.sections.censusTopics.description'] = 'Topik dalam kegiatan sensus';
		map['listApi.sections.censusDatasets.title'] = 'Dataset Sensus';
		map['listApi.sections.censusDatasets.description'] = 'Dataset yang tersedia untuk topik sensus';
		map['listApi.sections.censusData.title'] = 'Data Sensus';
		map['listApi.sections.censusData.description'] = 'Data statistik sensus aktual';
		map['listApi.sections.censusAreas.title'] = 'Wilayah Sensus';
		map['listApi.sections.censusAreas.description'] = 'Wilayah geografis yang tercakup dalam kegiatan sensus';
		map['viewApi.title'] = 'View API';
		map['viewApi.subtitle'] = 'Tampilan informasi detail';
		map['viewApi.sections.publication.title'] = 'Detail Publikasi';
		map['viewApi.sections.publication.description'] = 'Informasi publikasi detail';
		map['viewApi.sections.news.title'] = 'Detail Berita';
		map['viewApi.sections.news.description'] = 'Artikel berita detail';
		map['viewApi.sections.pressRelease.title'] = 'Detail Siaran Pers';
		map['viewApi.sections.pressRelease.description'] = 'Siaran pers detail';
		map['viewApi.sections.staticTable.title'] = 'Detail Tabel Statis';
		map['viewApi.sections.staticTable.description'] = 'Informasi tabel detail';
		map['domains.title'] = 'Domain';
		map['domains.types.province'] = 'Provinsi';
		map['domains.types.regency'] = 'Kabupaten';
		map['domains.types.regencyByProvince'] = 'Kabupaten by Provinsi';
		map['domains.types.all'] = 'Semua Domain';
		map['domains.fields.id'] = 'ID';
		map['domains.fields.name'] = 'Nama';
		map['domains.fields.url'] = 'URL';
		map['domains.parameters.title'] = 'Parameter API';
		map['domains.parameters.domainType'] = 'Tipe Domain';
		map['domains.parameters.provinceCode'] = 'Kode Provinsi';
		map['domains.parameters.provinceCodeHint'] = 'contoh: 32 untuk Jawa Barat';
		map['domains.parameters.provinceCodeRequired'] = 'Kode provinsi diperlukan untuk tipe Kabupaten by Provinsi';
		map['domains.parameters.language'] = 'Bahasa';
		map['domains.parameters.languageNote'] = 'Edukatif - tidak diterapkan ke endpoint domain';
		map['domains.parameters.loadButton'] = 'Muat Domain';
		map['domains.parameters.loading'] = 'Memuat...';
		map['domains.parameters.searchDomains'] = 'Cari Domain';
		map['domains.requestDetails.title'] = 'Detail Request';
		map['domains.requestDetails.method'] = 'Metode';
		map['domains.requestDetails.url'] = 'URL';
		map['domains.requestDetails.parameters'] = 'Parameter';
		map['domains.requestDetails.responseTime'] = 'Waktu Respons';
		map['domains.requestDetails.copyUrl'] = 'Salin URL';
		map['domains.requestDetails.urlCopied'] = 'URL disalin ke clipboard';
		map['domains.requestDetails.noRequest'] = 'Belum ada request dibuat';
		map['domains.requestDetails.showDetails'] = 'Tampilkan Detail Request';
		map['domains.requestDetails.hideDetails'] = 'Sembunyikan Detail Request';
		map['domains.results.title'] = 'Hasil Domain';
		map['domains.results.found'] = 'Ditemukan {count} domain';
		map['domains.results.empty'] = 'Tidak ada domain ditemukan untuk kriteria yang dipilih';
		map['domains.results.initial'] = 'Pilih parameter dan klik "Muat Domain" untuk memulai';
		map['domains.results.searchParameters'] = 'Parameter Pencarian';
		map['domains.education.title'] = 'Cara Menggunakan';
		map['domains.education.description'] = 'Pelajari cara mencari dan menjelajahi data domain dari BPS.';
		map['domains.education.parameters'] = 'Parameter';
		map['domains.education.parametersDescription'] = 'Konfigurasikan tipe domain dan pengaturan wilayah';
		map['domains.education.results'] = 'Hasil';
		map['domains.education.resultsDescription'] = 'Lihat domain yang sesuai dengan kriteria Anda';
		map['domains.education.detail'] = 'Detail';
		map['domains.education.detailDescription'] = 'Lihat informasi domain dan link akses';
		map['infographics.title'] = 'Infografis';
		map['infographics.fields.id'] = 'ID';
		map['infographics.fields.title'] = 'Judul';
		map['infographics.fields.image'] = 'Gambar';
		map['infographics.fields.description'] = 'Deskripsi';
		map['infographics.fields.category'] = 'Kategori';
		map['infographics.fields.downloadUrl'] = 'URL Unduh';
		map['infographics.parameters.title'] = 'Parameter API';
		map['infographics.parameters.domain'] = 'Domain';
		map['infographics.parameters.domainHint'] = 'contoh: 7200 untuk tingkat nasional';
		map['infographics.parameters.keyword'] = 'Kata Kunci (Opsional)';
		map['infographics.parameters.keywordHint'] = 'Filter berdasarkan kata kunci';
		map['infographics.parameters.page'] = 'Halaman';
		map['infographics.parameters.language'] = 'Bahasa';
		map['infographics.parameters.languageNote'] = 'Diterapkan pada bahasa konten infografis';
		map['infographics.parameters.loadButton'] = 'Muat Infografis';
		map['infographics.parameters.loading'] = 'Memuat...';
		map['infographics.parameters.searchInfographics'] = 'Cari Infografis';
		map['infographics.requestDetails.title'] = 'Detail Request';
		map['infographics.requestDetails.method'] = 'Metode';
		map['infographics.requestDetails.url'] = 'URL';
		map['infographics.requestDetails.parameters'] = 'Parameter';
		map['infographics.requestDetails.responseTime'] = 'Waktu Respons';
		map['infographics.requestDetails.copyUrl'] = 'Salin URL';
		map['infographics.requestDetails.urlCopied'] = 'URL disalin ke clipboard';
		map['infographics.requestDetails.noRequest'] = 'Belum ada request dibuat';
		map['infographics.requestDetails.showDetails'] = 'Tampilkan Detail Request';
		map['infographics.requestDetails.hideDetails'] = 'Sembunyikan Detail Request';
		map['infographics.results.title'] = 'Hasil';
		map['infographics.results.found'] = 'Ditemukan {count} infografis';
		map['infographics.results.empty'] = 'Tidak ada infografis ditemukan untuk kriteria yang dipilih';
		map['infographics.results.initial'] = 'Konfigurasikan parameter dan klik "Muat Infografis" untuk memulai';
		map['infographics.results.searchParameters'] = 'Parameter Pencarian';
		map['infographics.education.title'] = 'Tips';
		map['infographics.education.description'] = 'Pelajari cara menggunakan fitur infografis secara efektif.';
		map['infographics.education.parameters'] = 'Parameter';
		map['infographics.education.parametersDescription'] = 'Konfigurasikan kriteria pencarian Anda di sini';
		map['infographics.education.results'] = 'Hasil';
		map['infographics.education.resultsDescription'] = 'Lihat infografis yang sesuai dengan kriteria Anda';
		map['infographics.education.detail'] = 'Detail';
		map['infographics.education.detailDescription'] = 'Lihat konten lengkap dan opsi unduhan';
		map['publications.title'] = 'Publikasi';
		map['publications.comingSoon'] = 'Halaman Publikasi - Segera Hadir';
		map['publications.detail.title'] = 'Detail Publikasi';
		map['publications.fields.id'] = 'ID';
		map['publications.fields.title'] = 'Judul';
		map['publications.fields.issn'] = 'ISSN';
		map['publications.fields.cover'] = 'Sampul';
		map['publications.fields.pdfUrl'] = 'URL PDF';
		map['publications.fields.size'] = 'Ukuran';
		map['publications.fields.abstract'] = 'Abstrak';
		map['publications.fields.catalogueNumber'] = 'Nomor Katalog';
		map['publications.fields.publicationNumber'] = 'Nomor Publikasi';
		map['publications.fields.releaseDate'] = 'Tanggal Rilis';
		map['publications.fields.updatedAt'] = 'Diperbarui';
		map['publications.parameters.title'] = 'Parameter API';
		map['publications.parameters.domain'] = 'Domain';
		map['publications.parameters.domainHint'] = 'contoh: 7200 untuk tingkat nasional';
		map['publications.parameters.keyword'] = 'Kata Kunci (Opsional)';
		map['publications.parameters.keywordHint'] = 'Filter berdasarkan kata kunci';
		map['publications.parameters.month'] = 'Bulan (Opsional)';
		map['publications.parameters.monthHint'] = 'Pilih bulan';
		map['publications.parameters.year'] = 'Tahun (Opsional)';
		map['publications.parameters.yearHint'] = 'Pilih tahun';
		map['publications.parameters.language'] = 'Bahasa';
		map['publications.parameters.languageNote'] = 'Diterapkan pada bahasa konten publikasi';
		map['publications.parameters.loadButton'] = 'Muat Publikasi';
		map['publications.parameters.loading'] = 'Memuat...';
		map['publications.parameters.searchPublications'] = 'Cari Publikasi';
		map['publications.parameters.clearButton'] = 'Hapus Filter';
		map['publications.requestDetails.title'] = 'Detail Request';
		map['publications.requestDetails.method'] = 'Method';
		map['publications.requestDetails.url'] = 'URL';
		map['publications.requestDetails.parameters'] = 'Parameter';
		map['publications.requestDetails.responseTime'] = 'Waktu Respons';
		map['publications.requestDetails.copyUrl'] = 'Salin URL';
		map['publications.requestDetails.urlCopied'] = 'URL disalin ke clipboard';
		map['publications.requestDetails.noRequest'] = 'Belum ada request yang dibuat';
		map['publications.requestDetails.showDetails'] = 'Tampilkan Detail Request';
		map['publications.requestDetails.hideDetails'] = 'Sembunyikan Detail Request';
		map['publications.results.title'] = 'Hasil Publikasi';
		map['publications.results.found'] = 'Ditemukan {count} publikasi';
		map['publications.results.empty'] = 'Tidak ada publikasi yang ditemukan untuk kriteria yang dipilih';
		map['publications.results.initial'] = 'Konfigurasi parameter dan klik "Muat Publikasi" untuk memulai';
		map['publications.results.searchParameters'] = 'Parameter Pencarian';
		map['publications.education.title'] = 'Cara Menggunakan';
		map['publications.education.description'] = 'Pelajari cara mencari dan mengeksplorasi data publikasi dari BPS.';
		map['publications.education.parameters'] = 'Parameter';
		map['publications.education.parametersDescription'] = 'Konfigurasi domain dan kriteria pencarian';
		map['publications.education.results'] = 'Hasil';
		map['publications.education.resultsDescription'] = 'Lihat publikasi yang sesuai dengan kriteria Anda';
		map['publications.education.detail'] = 'Detail';
		map['publications.education.detailDescription'] = 'Lihat informasi publikasi dan opsi unduhan';
		map['news.title'] = 'Berita';
		map['news.categories'] = 'Kategori';
		map['news.fields.id'] = 'ID';
		map['news.fields.title'] = 'Judul';
		map['news.fields.content'] = 'Konten';
		map['news.fields.picture'] = 'Gambar';
		map['news.fields.releaseDate'] = 'Tanggal Rilis';
		map['news.fields.category'] = 'Kategori';
		map['news.fields.categoryID'] = 'ID Kategori';
		map['news.parameters.title'] = 'Parameter API';
		map['news.parameters.domain'] = 'Domain';
		map['news.parameters.domainHint'] = 'contoh: 7200 untuk Sulawesi Tengah';
		map['news.parameters.keyword'] = 'Kata Kunci (Opsional)';
		map['news.parameters.keywordHint'] = 'Filter berdasarkan kata kunci';
		map['news.parameters.category'] = 'ID Kategori (Opsional)';
		map['news.parameters.categoryHint'] = 'Filter berdasarkan ID kategori berita';
		map['news.parameters.month'] = 'Bulan (Opsional)';
		map['news.parameters.monthHint'] = 'Pilih bulan';
		map['news.parameters.year'] = 'Tahun (Opsional)';
		map['news.parameters.yearHint'] = 'Pilih tahun';
		map['news.parameters.page'] = 'Halaman';
		map['news.parameters.language'] = 'Bahasa';
		map['news.parameters.languageNote'] = 'Diterapkan pada bahasa konten berita';
		map['news.parameters.loadButton'] = 'Muat Berita';
		map['news.parameters.searchNews'] = 'Cari Berita';
		map['news.parameters.clearButton'] = 'Hapus Filter';
		map['news.parameters.loading'] = 'Memuat...';
		map['news.requestDetails.title'] = 'Detail Request';
		map['news.requestDetails.method'] = 'Metode';
		map['news.requestDetails.url'] = 'URL';
		map['news.requestDetails.parameters'] = 'Parameter';
		map['news.requestDetails.responseTime'] = 'Waktu Respons';
		map['news.requestDetails.copyUrl'] = 'Salin URL';
		map['news.requestDetails.urlCopied'] = 'URL disalin ke clipboard';
		map['news.requestDetails.noRequest'] = 'Belum ada request dibuat';
		map['news.requestDetails.showDetails'] = 'Tampilkan Detail Request';
		map['news.requestDetails.hideDetails'] = 'Sembunyikan Detail Request';
		map['news.results.title'] = 'Hasil Berita';
		map['news.results.found'] = 'Ditemukan {count} artikel berita';
		map['news.results.empty'] = 'Tidak ada berita ditemukan untuk kriteria yang dipilih';
		map['news.results.initial'] = 'Konfigurasikan parameter dan klik "Muat Berita" untuk memulai';
		map['news.results.searchParameters'] = 'Parameter Pencarian';
		map['news.detail.title'] = 'Detail Berita';
		map['news.detail.metadata'] = 'Informasi Berita';
		map['news.detail.content'] = 'Konten Artikel';
		map['news.education.title'] = 'Cara kerja';
		map['news.education.description'] = 'Ini mendemonstrasikan alur kerja API berita dengan halaman terpisah untuk parameter, hasil, dan tampilan detail.';
		map['news.education.parameters'] = 'Parameter';
		map['news.education.parametersDescription'] = 'Konfigurasikan kriteria pencarian Anda di sini';
		map['news.education.results'] = 'Hasil';
		map['news.education.resultsDescription'] = 'Lihat artikel berita yang sesuai dengan kriteria Anda';
		map['news.education.detail'] = 'Detail';
		map['news.education.detailDescription'] = 'Lihat konten lengkap menggunakan view API';
		map['newsCategories.title'] = 'Kategori Berita';
		map['newsCategories.fields.id'] = 'ID';
		map['newsCategories.fields.name'] = 'Nama';
		map['newsCategories.parameters.title'] = 'Parameter API';
		map['newsCategories.parameters.domain'] = 'Domain';
		map['newsCategories.parameters.domainHint'] = 'contoh: 7200 untuk tingkat nasional';
		map['newsCategories.parameters.domainDescription'] = 'Kode domain 4+ karakter (wajib)';
		map['newsCategories.parameters.language'] = 'Bahasa';
		map['newsCategories.parameters.languageIndonesian'] = 'Indonesia';
		map['newsCategories.parameters.languageEnglish'] = 'Inggris';
		map['newsCategories.parameters.languageDescription'] = 'Bahasa konten untuk kategori berita';
		map['newsCategories.parameters.searchNewsCategories'] = 'Cari Kategori Berita';
		map['newsCategories.requestDetails.title'] = 'Detail Request';
		map['newsCategories.requestDetails.endpoint'] = 'Endpoint';
		map['newsCategories.requestDetails.method'] = 'Metode';
		map['newsCategories.requestDetails.parameters'] = 'Parameter';
		map['newsCategories.requestDetails.curlExample'] = 'Contoh cURL';
		map['newsCategories.requestDetails.showDetails'] = 'Tampilkan Detail Request';
		map['newsCategories.requestDetails.hideDetails'] = 'Sembunyikan Detail Request';
		map['newsCategories.requestDetails.noRequestYet'] = 'Belum ada request dibuat';
		map['newsCategories.results.title'] = 'Hasil Kategori Berita';
		map['newsCategories.results.searchParameters'] = 'Parameter Pencarian';
		map['newsCategories.results.categoriesFound'] = 'kategori ditemukan';
		map['newsCategories.results.noDataFound'] = 'Tidak Ada Kategori Ditemukan';
		map['newsCategories.results.noDataDescription'] = 'Coba sesuaikan parameter pencarian atau periksa apakah domain tersebut ada.';
		map['newsCategories.categoryDetail.title'] = 'Detail Kategori';
		map['newsCategories.categoryDetail.id'] = 'ID Kategori';
		map['newsCategories.categoryDetail.name'] = 'Nama Kategori';
		map['newsCategories.education.title'] = 'Cara kerja';
		map['newsCategories.education.description'] = 'Jelajahi kategori berita yang tersedia untuk domain dan bahasa yang berbeda dari data statistik BPS.';
		map['newsCategories.education.parameters'] = 'Parameter';
		map['newsCategories.education.parametersDescription'] = 'Konfigurasikan pengaturan domain dan bahasa';
		map['newsCategories.education.results'] = 'Hasil';
		map['newsCategories.education.resultsDescription'] = 'Lihat kategori berita yang tersedia untuk domain';
		map['newsCategories.education.categories'] = 'Kategori';
		map['newsCategories.education.categoriesDescription'] = 'Jelajahi klasifikasi kategori berita yang berbeda';
		map['dynamicTables.title'] = 'Tabel Dinamis';
		map['dynamicTables.parameters.title'] = 'Parameter API';
		map['dynamicTables.parameters.domain'] = 'Domain';
		map['dynamicTables.parameters.domainHint'] = 'contoh: 7200 untuk tingkat nasional';
		map['dynamicTables.parameters.variable'] = 'Variabel';
		map['dynamicTables.parameters.variableHint'] = 'Pilih variabel statistik';
		map['dynamicTables.parameters.selectYear'] = 'Pilih Tahun';
		map['dynamicTables.parameters.language'] = 'Bahasa';
		map['dynamicTables.parameters.languageNote'] = 'Diterapkan pada bahasa konten tabel dinamis';
		map['dynamicTables.parameters.loadPeriods'] = 'Muat Periode yang Tersedia';
		map['dynamicTables.parameters.generateTable'] = 'Generate Tabel Dinamis';
		map['dynamicTables.parameters.loading'] = 'Memuat...';
		map['dynamicTables.requestDetails.title'] = 'Detail Request';
		map['dynamicTables.requestDetails.showDetails'] = 'Tampilkan Detail Request';
		map['dynamicTables.requestDetails.hideDetails'] = 'Sembunyikan Detail Request';
		map['dynamicTables.requestDetails.noRequest'] = 'Belum ada request dibuat';
		map['dynamicTables.results.title'] = 'Hasil Tabel Dinamis';
		map['dynamicTables.results.periodsAvailable'] = 'Periode yang Tersedia';
		map['dynamicTables.results.selectPeriod'] = 'Pilih periode dari atas untuk generate tabel';
		map['dynamicTables.results.tableGenerated'] = 'Tabel berhasil di-generate';
		map['dynamicTables.results.empty'] = 'Tidak ada data tersedia untuk kriteria yang dipilih';
		map['dynamicTables.results.initial'] = 'Masukkan parameter di atas dan klik "Muat Tahun yang Tersedia" untuk memulai';
		map['dynamicTables.results.periodInitial'] = 'Pilih tahun dari dropdown di atas, lalu klik "Muat Tabel Dinamis" untuk melihat data.';
		map['dynamicTables.results.periodId'] = 'ID Periode';
		map['dynamicTables.workflow.title'] = 'Alur Kerja Tabel Dinamis';
		map['dynamicTables.workflow.description'] = 'Ikuti langkah-langkah ini untuk menghasilkan tabel dinamis dari data BPS.';
		map['dynamicTables.workflow.step1'] = 'Langkah 1';
		map['dynamicTables.workflow.step1Description'] = 'Pilih domain dan bahasa, lalu pilih variabel';
		map['dynamicTables.workflow.step2'] = 'Langkah 2';
		map['dynamicTables.workflow.step2Description'] = 'Muat periode yang tersedia untuk variabel yang dipilih';
		map['dynamicTables.workflow.step3'] = 'Langkah 3';
		map['dynamicTables.workflow.step3Description'] = 'Pilih tahun/periode dan generate tabel';
		map['dynamicTables.states.initializing'] = 'Menginisialisasi...';
		map['dynamicTables.states.unknown'] = 'Status tidak diketahui';
		map['pressReleases.title'] = 'Siaran Pers';
		map['pressReleases.comingSoon'] = 'Halaman Siaran Pers - Segera Hadir';
		map['pressReleases.detail.title'] = 'Detail Siaran Pers';
		map['pressReleases.detail.forId'] = 'Detail Siaran Pers untuk ID: {id}';
		map['pressReleases.fields.id'] = 'ID';
		map['pressReleases.fields.title'] = 'Judul';
		map['pressReleases.fields.cover'] = 'Sampul';
		map['pressReleases.fields.pdfUrl'] = 'URL PDF';
		map['pressReleases.fields.size'] = 'Ukuran';
		map['pressReleases.fields.abstract'] = 'Abstrak';
		map['pressReleases.fields.releaseDate'] = 'Tanggal Rilis';
		map['pressReleases.parameters.title'] = 'Parameter API';
		map['pressReleases.parameters.domain'] = 'Domain';
		map['pressReleases.parameters.domainHint'] = 'contoh: 7200 untuk tingkat nasional';
		map['pressReleases.parameters.keyword'] = 'Kata Kunci (Opsional)';
		map['pressReleases.parameters.keywordHint'] = 'Filter berdasarkan kata kunci';
		map['pressReleases.parameters.month'] = 'Bulan (Opsional)';
		map['pressReleases.parameters.monthHint'] = 'Pilih bulan';
		map['pressReleases.parameters.year'] = 'Tahun (Opsional)';
		map['pressReleases.parameters.yearHint'] = 'Pilih tahun';
		map['pressReleases.parameters.language'] = 'Bahasa';
		map['pressReleases.parameters.languageNote'] = 'Diterapkan pada bahasa konten siaran pers';
		map['pressReleases.parameters.clearFilters'] = 'Hapus Filter';
		map['pressReleases.parameters.search'] = 'Cari';
		map['pressReleases.parameters.load'] = 'Muat Siaran Pers';
		map['pressReleases.results.title'] = 'Hasil Siaran Pers';
		map['pressReleases.results.count'] = '{count} siaran pers ditemukan';
		map['pressReleases.results.noData'] = 'Tidak ada siaran pers ditemukan';
		map['pressReleases.results.searchParameters'] = 'Parameter Pencarian';
		map['pressReleases.results.loading'] = 'Memuat siaran pers...';
		map['pressReleases.results.pressSearchToLoad'] = 'Tekan tombol cari untuk memuat data';
		map['pressReleases.actions.downloadPdf'] = 'Unduh PDF';
		map['pressReleases.actions.viewDetails'] = 'Lihat Detail';
		map['staticTables.title'] = 'Tabel Statis';
		map['staticTables.description'] = 'Tabel statistik yang telah didefinisikan dengan data dalam format HTML dan Excel';
		map['staticTables.noDataFound'] = 'Tidak ada tabel statis yang ditemukan';
		map['staticTables.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} tabel statis',
				other: 'Ditemukan ${n} tabel statis',
			);
		map['staticTables.fields.id'] = 'ID';
		map['staticTables.fields.title'] = 'Judul';
		map['staticTables.fields.subject'] = 'Subjek';
		map['staticTables.fields.size'] = 'Ukuran';
		map['staticTables.fields.updatedAt'] = 'Diperbarui Pada';
		map['staticTables.fields.createdAt'] = 'Dibuat Pada';
		map['staticTables.parameters.title'] = 'Parameter';
		map['staticTables.parameters.domain'] = 'Domain *';
		map['staticTables.parameters.domainHint'] = 'contoh: 7200';
		map['staticTables.parameters.language'] = 'Bahasa';
		map['staticTables.parameters.keyword'] = 'Kata Kunci (Opsional)';
		map['staticTables.parameters.keywordHint'] = 'Filter berdasarkan kata kunci';
		map['staticTables.parameters.month'] = 'Bulan (Opsional)';
		map['staticTables.parameters.monthHint'] = 'Pilih bulan';
		map['staticTables.parameters.year'] = 'Tahun (Opsional)';
		map['staticTables.parameters.yearHint'] = 'Pilih tahun';
		map['staticTables.parameters.clearFilters'] = 'Hapus Filter';
		map['staticTables.parameters.loadButton'] = 'Muat Tabel Statis';
		map['staticTables.actions.viewTable'] = 'Lihat Tabel';
		map['staticTables.actions.downloadExcel'] = 'Unduh Excel';
		map['staticTables.detail.title'] = 'Detail Tabel Statis';
		map['staticTables.detail.loading'] = 'Memuat tabel...';
		map['staticTables.detail.noTableData'] = 'Tidak ada data tabel yang tersedia';
		map['staticTables.detail.refresh'] = 'Segarkan';
		map['staticTables.detail.downloadExcel'] = 'Unduh Excel';
		map['strategicIndicators.title'] = 'Indikator Strategis';
		map['strategicIndicators.fields.id'] = 'ID';
		map['strategicIndicators.fields.title'] = 'Judul';
		map['strategicIndicators.fields.name'] = 'Nama';
		map['strategicIndicators.fields.dataSource'] = 'Sumber Data';
		map['strategicIndicators.fields.value'] = 'Nilai';
		map['strategicIndicators.fields.unit'] = 'Satuan';
		map['strategicIndicators.fields.period'] = 'Periode';
		map['strategicIndicators.fields.categoryID'] = 'ID Kategori';
		map['strategicIndicators.fields.variableID'] = 'ID Variabel';
		map['strategicIndicators.parameters.title'] = 'Parameter';
		map['strategicIndicators.parameters.domain'] = 'Domain *';
		map['strategicIndicators.parameters.domainHint'] = 'contoh: 7200';
		map['strategicIndicators.parameters.variableID'] = 'ID Variabel (Opsional)';
		map['strategicIndicators.parameters.variableIDHint'] = 'Filter berdasarkan ID variabel';
		map['strategicIndicators.parameters.language'] = 'Bahasa';
		map['strategicIndicators.parameters.loadButton'] = 'Muat Indikator Strategis';
		map['strategicIndicators.results.title'] = 'Hasil Indikator Strategis';
		map['strategicIndicators.results.searchParameters'] = 'Parameter Pencarian';
		map['strategicIndicators.results.found'] = 'Ditemukan {count} indikator strategis';
		map['strategicIndicators.results.foundSingular'] = '';
		map['strategicIndicators.results.foundPlural'] = '';
		map['strategicIndicators.results.initializing'] = 'Menginisialisasi...';
		map['censusTopics.title'] = 'Topik Sensus';
		map['censusTopics.fields.id'] = 'ID';
		map['censusTopics.fields.topic'] = 'Topik';
		map['censusTopics.fields.eventID'] = 'ID Kegiatan';
		map['censusTopics.fields.eventName'] = 'Nama Kegiatan';
		map['censusTopics.parameters.title'] = 'Parameter';
		map['censusTopics.parameters.censusEvent'] = 'Kegiatan Sensus *';
		map['censusTopics.parameters.censusEventHint'] = 'Pilih kegiatan sensus';
		map['censusTopics.parameters.loadButton'] = 'Muat Topik';
		map['censusTopics.results.title'] = 'Hasil Topik Sensus';
		map['censusTopics.results.searchParameters'] = 'Parameter Pencarian';
		map['censusTopics.results.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} topik',
				other: 'Ditemukan ${n} topik',
			);
		map['censusTopics.results.initializing'] = 'Menginisialisasi...';
		map['censusDatasets.title'] = 'Dataset Sensus';
		map['censusDatasets.fields.id'] = 'ID Dataset';
		map['censusDatasets.fields.topicID'] = 'ID Topik';
		map['censusDatasets.fields.topic'] = 'Topik';
		map['censusDatasets.fields.eventID'] = 'ID Kegiatan';
		map['censusDatasets.fields.name'] = 'Nama Dataset';
		map['censusDatasets.fields.description'] = 'Deskripsi';
		map['censusDatasets.parameters.title'] = 'Parameter';
		map['censusDatasets.parameters.censusEvent'] = 'Kegiatan Sensus *';
		map['censusDatasets.parameters.censusEventHint'] = 'Pilih kegiatan sensus';
		map['censusDatasets.parameters.censusTopic'] = 'Topik Sensus *';
		map['censusDatasets.parameters.censusTopicHint'] = 'Pilih topik sensus';
		map['censusDatasets.parameters.loadButton'] = 'Muat Dataset';
		map['censusDatasets.results.title'] = 'Hasil Dataset Sensus';
		map['censusDatasets.results.searchParameters'] = 'Parameter Pencarian';
		map['censusDatasets.results.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} dataset',
				other: 'Ditemukan ${n} dataset',
			);
		map['censusDatasets.results.initializing'] = 'Menginisialisasi...';
		map['censusData.title'] = 'Data Sensus';
		map['censusData.fields.regionID'] = 'ID Wilayah';
		map['censusData.fields.regionCode'] = 'Kode Wilayah';
		map['censusData.fields.regionName'] = 'Nama Wilayah';
		map['censusData.fields.regionLevel'] = 'Tingkat Wilayah';
		map['censusData.fields.indicatorID'] = 'ID Indikator';
		map['censusData.fields.indicatorName'] = 'Nama Indikator';
		map['censusData.fields.categories'] = 'Kategori';
		map['censusData.fields.period'] = 'Periode';
		map['censusData.fields.value'] = 'Nilai';
		map['censusData.parameters.title'] = 'Parameter';
		map['censusData.parameters.censusEvent'] = 'Kegiatan Sensus *';
		map['censusData.parameters.censusEventHint'] = 'Pilih kegiatan sensus';
		map['censusData.parameters.censusTopic'] = 'Topik Sensus *';
		map['censusData.parameters.censusTopicHint'] = 'Pilih topik sensus';
		map['censusData.parameters.censusArea'] = 'Wilayah Sensus';
		map['censusData.parameters.censusAreaHint'] = 'Pilih wilayah sensus (opsional)';
		map['censusData.parameters.dataset'] = 'Dataset *';
		map['censusData.parameters.datasetHint'] = 'Pilih dataset';
		map['censusData.parameters.loadButton'] = 'Muat Data Sensus';
		map['censusData.results.title'] = 'Hasil Data Sensus';
		map['censusData.results.searchParameters'] = 'Parameter Pencarian';
		map['censusData.results.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} data',
				other: 'Ditemukan ${n} data',
			);
		map['censusData.results.initializing'] = 'Menginisialisasi...';
		map['censusAreas.title'] = 'Wilayah Sensus';
		map['censusAreas.description'] = 'Wilayah geografis yang tercakup dalam kegiatan sensus';
		map['censusAreas.fields.id'] = 'ID Wilayah';
		map['censusAreas.fields.name'] = 'Nama Wilayah';
		map['censusAreas.fields.slug'] = 'Slug';
		map['censusAreas.fields.mfdCode'] = 'Kode MFD';
		map['censusAreas.parameters.title'] = 'Parameter';
		map['censusAreas.parameters.censusEvent'] = 'Kegiatan Sensus *';
		map['censusAreas.parameters.censusEventHint'] = 'Pilih kegiatan sensus';
		map['censusAreas.parameters.loadButton'] = 'Muat Wilayah Sensus';
		map['censusAreas.results.title'] = 'Hasil Wilayah Sensus';
		map['censusAreas.results.searchParameters'] = 'Parameter Pencarian';
		map['censusAreas.results.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} wilayah',
				other: 'Ditemukan ${n} wilayah',
			);
		map['censusAreas.results.initializing'] = 'Menginisialisasi...';
		map['subjectCategories.title'] = 'Kategori Subjek';
		map['subjectCategories.fields.id'] = 'ID';
		map['subjectCategories.fields.name'] = 'Nama';
		map['subjectCategories.parameters.title'] = 'Parameter';
		map['subjectCategories.parameters.domain'] = 'Domain *';
		map['subjectCategories.parameters.domainHint'] = 'contoh: 7200';
		map['subjectCategories.parameters.language'] = 'Bahasa';
		map['subjectCategories.parameters.loadButton'] = 'Muat Kategori Subjek';
		map['subjectCategories.results.title'] = 'Hasil Kategori Subjek';
		map['subjectCategories.results.searchParameters'] = 'Parameter Pencarian';
		map['subjectCategories.results.found'] = 'Ditemukan {count} kategori subjek';
		map['subjectCategories.results.foundSingular'] = '';
		map['subjectCategories.results.foundPlural'] = '';
		map['subjectCategories.results.initializing'] = 'Menginisialisasi...';
		map['subjects.title'] = 'Subjek';
		map['subjects.comingSoon'] = 'Halaman Subjek - Segera Hadir';
		map['units.title'] = 'Unit';
		map['units.description'] = 'Unit pengukuran untuk data statistik';
		map['units.noDataFound'] = 'Tidak ada unit yang ditemukan';
		map['units.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} unit',
				other: 'Ditemukan ${n} unit',
			);
		map['units.fields.id'] = 'ID';
		map['units.fields.title'] = 'Judul';
		map['units.parameters.title'] = 'Parameter';
		map['units.parameters.domain'] = 'Domain *';
		map['units.parameters.domainHint'] = 'contoh: 7200';
		map['units.parameters.language'] = 'Bahasa';
		map['units.parameters.variableID'] = 'Variabel (Opsional)';
		map['units.parameters.variableIDHint'] = 'Pilih variabel (opsional)';
		map['units.parameters.loadButton'] = 'Muat Unit';
		map['variables.title'] = 'Variabel';
		map['variables.description'] = 'Variabel dan ukuran statistik';
		map['variables.noDataFound'] = 'Tidak ada variabel yang ditemukan';
		map['variables.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} variabel',
				other: 'Ditemukan ${n} variabel',
			);
		map['variables.fields.id'] = 'ID';
		map['variables.fields.title'] = 'Judul';
		map['variables.fields.graphName'] = 'Nama Grafik';
		map['variables.fields.unit'] = 'Satuan';
		map['variables.fields.subjectID'] = 'ID Subjek';
		map['variables.fields.subjectName'] = 'Nama Subjek';
		map['variables.fields.notes'] = 'Catatan';
		map['variables.fields.verticalVariableID'] = 'ID Variabel Vertikal';
		map['variables.parameters.title'] = 'Parameter';
		map['variables.parameters.domain'] = 'Domain *';
		map['variables.parameters.domainHint'] = 'contoh: 7200';
		map['variables.parameters.language'] = 'Bahasa';
		map['variables.parameters.year'] = 'Tahun';
		map['variables.parameters.yearHint'] = 'contoh: 2024 (opsional)';
		map['variables.parameters.subject'] = 'Subjek';
		map['variables.parameters.subjectHint'] = 'Pilih subjek (opsional)';
		map['variables.parameters.allSubjects'] = 'Semua Subjek';
		map['variables.parameters.showExistingVariables'] = 'Tampilkan Variabel yang Ada';
		map['variables.parameters.loadButton'] = 'Muat Variabel';
		map['verticalVariables.title'] = 'Variabel Vertikal';
		map['verticalVariables.description'] = 'Dimensi kategorikal dan sistem klasifikasi';
		map['verticalVariables.noDataFound'] = 'Tidak ada variabel vertikal yang ditemukan';
		map['verticalVariables.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} variabel vertikal',
				other: 'Ditemukan ${n} variabel vertikal',
			);
		map['verticalVariables.fields.id'] = 'ID';
		map['verticalVariables.fields.title'] = 'Judul';
		map['verticalVariables.fields.itemID'] = 'ID Item';
		map['verticalVariables.fields.groupID'] = 'ID Grup';
		map['verticalVariables.fields.groupName'] = 'Nama Grup';
		map['verticalVariables.parameters.title'] = 'Parameter';
		map['verticalVariables.parameters.domain'] = 'Domain *';
		map['verticalVariables.parameters.domainHint'] = 'contoh: 7200';
		map['verticalVariables.parameters.language'] = 'Bahasa';
		map['verticalVariables.parameters.variableID'] = 'ID Variabel';
		map['verticalVariables.parameters.variableIDHint'] = 'contoh: 1234 (opsional)';
		map['verticalVariables.parameters.loadButton'] = 'Muat Variabel Vertikal';
		map['shared.pagination.previous'] = 'Sebelumnya';
		map['shared.pagination.next'] = 'Selanjutnya';
		map['shared.pagination.loadMore'] = 'Muat Lebih Banyak';
		map['shared.pagination.page'] = 'Halaman';
		map['shared.pagination.previousPage'] = 'Halaman sebelumnya';
		map['shared.pagination.nextPage'] = 'Halaman selanjutnya';
		map['shared.pagination.previousPageTooltip'] = 'Halaman sebelumnya';
		map['shared.pagination.nextPageTooltip'] = 'Halaman selanjutnya';
		map['shared.codeSnippet.copyToClipboard'] = 'Salin ke clipboard';
		map['shared.codeSnippet.codeCopied'] = 'Kode disalin ke clipboard';
		map['shared.errorWidget.tryAgain'] = 'Coba Lagi';
		map['shared.searchableDropdown.noItemsFound'] = 'Tidak ada item ditemukan';
		map['shared.searchableDropdown.selectItem'] = 'Pilih item';
		map['shared.requestDetails.title'] = 'Detail Request';
		map['shared.requestDetails.method'] = 'Metode';
		map['shared.requestDetails.url'] = 'URL';
		map['shared.requestDetails.parameters'] = 'Parameter';
		map['shared.requestDetails.urlCopied'] = 'URL disalin ke clipboard';
		map['shared.requestDetails.parametersCopied'] = 'Parameter disalin ke clipboard';
		map['validation.domainRequired'] = 'Domain diperlukan';
		map['categories.imageNotAvailable'] = 'Gambar tidak tersedia';
		map['categories.categoryId'] = 'ID Kategori';
		map['categories.releaseDate'] = 'Tanggal Rilis';
		map['categories.imageUrl'] = 'URL Gambar';
		map['categories.tapToReadMore'] = 'Ketuk untuk baca lebih lanjut';
		map['instructions.requestDetailsWillShow'] = 'Detail request akan ditampilkan di halaman hasil';
		map['instructions.onlyHandlesParameters'] = 'Halaman ini hanya menangani konfigurasi parameter. Klik "Cari Domain" untuk melihat detail request di halaman hasil.';
		map['instructions.enterParametersAndLoad'] = 'Masukkan parameter dan klik muat untuk melihat data';
		map['instructions.languageLabels.indonesian'] = 'Indonesia';
		map['instructions.languageLabels.english'] = 'Inggris';
		map['settings.title'] = 'Pengaturan';
		map['settings.language'] = 'Bahasa';
		map['settings.theme'] = 'Tema';
		map['settings.darkMode'] = 'Mode Gelap';
		map['settings.about'] = 'Tentang';
		map['statisticalClassifications.title'] = 'Klasifikasi Statistik';
		map['statisticalClassifications.fields.id'] = 'ID';
		map['statisticalClassifications.fields.title'] = 'Judul';
		map['statisticalClassifications.fields.type'] = 'Tipe';
		map['statisticalClassifications.fields.level'] = 'Level';
		map['statisticalClassifications.fields.source'] = 'Sumber';
		map['statisticalClassifications.fields.description'] = 'Deskripsi';
		map['statisticalClassifications.fields.releaseDate'] = 'Tanggal Rilis';
		map['statisticalClassifications.levels.category'] = 'Kategori';
		map['statisticalClassifications.levels.primaryGroup'] = 'Golongan Pokok';
		map['statisticalClassifications.levels.group'] = 'Golongan';
		map['statisticalClassifications.levels.subGroup'] = 'Sub-Golongan';
		map['statisticalClassifications.levels.cluster'] = 'Kelompok';
		map['statisticalClassifications.kbkiLevels.section'] = 'Seksi';
		map['statisticalClassifications.kbkiLevels.division'] = 'Divisi';
		map['statisticalClassifications.kbkiLevels.group'] = 'Kelompok';
		map['statisticalClassifications.kbkiLevels.classes'] = 'Kelas';
		map['statisticalClassifications.kbkiLevels.subClass'] = 'Subkelas';
		map['statisticalClassifications.kbkiLevels.commodityGroup'] = 'Kelompok Komoditas';
		map['statisticalClassifications.kbkiLevels.commodity'] = 'Komoditas';
		map['statisticalClassifications.parameters.title'] = 'Parameter';
		map['statisticalClassifications.parameters.category'] = 'Kategori Klasifikasi *';
		map['statisticalClassifications.parameters.categoryHint'] = 'Pilih KBLI atau KBKI';
		map['statisticalClassifications.parameters.type'] = 'Tipe Klasifikasi *';
		map['statisticalClassifications.parameters.typeHint'] = 'Pilih tahun klasifikasi';
		map['statisticalClassifications.parameters.level'] = 'Level Klasifikasi (Opsional)';
		map['statisticalClassifications.parameters.levelHint'] = 'Pilih level';
		map['statisticalClassifications.parameters.allLevels'] = 'Semua Level';
		map['statisticalClassifications.parameters.language'] = 'Bahasa';
		map['statisticalClassifications.parameters.loadButton'] = 'Muat Klasifikasi';
		map['statisticalClassifications.results.title'] = 'Hasil Klasifikasi Statistik';
		map['statisticalClassifications.results.searchParameters'] = 'Parameter Pencarian';
		map['statisticalClassifications.results.found'] = 'Ditemukan {count} klasifikasi';
		map['statisticalClassifications.results.foundSingular'] = '';
		map['statisticalClassifications.results.foundPlural'] = '';
		map['statisticalClassifications.results.initializing'] = 'Menginisialisasi...';
		map['statisticalClassifications.detail.title'] = 'Detail Klasifikasi';
		map['statisticalClassifications.detail.noChildren'] = 'Tidak ada sub-klasifikasi tersedia';
		map['statisticalClassifications.detail.metadata'] = 'Metadata';
		map['statisticalClassifications.detail.source'] = 'Sumber';
		map['statisticalClassifications.detail.releaseDate'] = 'Tanggal Rilis';
		map['statisticalClassifications.detail.lastUpdate'] = 'Terakhir Diperbarui';
		map['statisticalClassifications.detail.level'] = 'Tingkat';
		map['statisticalClassifications.detail.viewOnline'] = 'Lihat Online';
		map['statisticalClassifications.detail.tags'] = 'Tag';
		map['statisticalClassifications.detail.derivedClassifications'] = 'Klasifikasi Turunan';
		map['censusEvents.title'] = 'Kegiatan Sensus';
		map['censusEvents.fields.id'] = 'ID';
		map['censusEvents.fields.name'] = 'Nama';
		map['censusEvents.fields.year'] = 'Tahun';
		map['censusEvents.found'] = ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
				one: 'Ditemukan ${n} kegiatan sensus',
				other: 'Ditemukan ${n} kegiatan sensus',
			);
		map['censusEvents.initializing'] = 'Menginisialisasi...';

		_map = map;
		return map;
	}
}

