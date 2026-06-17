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
	@override late final _Translations$app$id app = _Translations$app$id._(_root);
	@override late final _Translations$navigation$id navigation = _Translations$navigation$id._(_root);
	@override late final _Translations$common$id common = _Translations$common$id._(_root);
	@override late final _Translations$errors$id errors = _Translations$errors$id._(_root);
	@override late final _Translations$home$id home = _Translations$home$id._(_root);
	@override late final _Translations$listApi$id listApi = _Translations$listApi$id._(_root);
	@override late final _Translations$viewApi$id viewApi = _Translations$viewApi$id._(_root);
	@override late final _Translations$domains$id domains = _Translations$domains$id._(_root);
	@override late final _Translations$infographics$id infographics = _Translations$infographics$id._(_root);
	@override late final _Translations$publications$id publications = _Translations$publications$id._(_root);
	@override late final _Translations$news$id news = _Translations$news$id._(_root);
	@override late final _Translations$newsCategories$id newsCategories = _Translations$newsCategories$id._(_root);
	@override late final _Translations$dynamicTables$id dynamicTables = _Translations$dynamicTables$id._(_root);
	@override late final _Translations$pressReleases$id pressReleases = _Translations$pressReleases$id._(_root);
	@override late final _Translations$staticTables$id staticTables = _Translations$staticTables$id._(_root);
	@override late final _Translations$strategicIndicators$id strategicIndicators = _Translations$strategicIndicators$id._(_root);
	@override late final _Translations$censusTopics$id censusTopics = _Translations$censusTopics$id._(_root);
	@override late final _Translations$censusDatasets$id censusDatasets = _Translations$censusDatasets$id._(_root);
	@override late final _Translations$censusData$id censusData = _Translations$censusData$id._(_root);
	@override late final _Translations$censusAreas$id censusAreas = _Translations$censusAreas$id._(_root);
	@override late final _Translations$subjectCategories$id subjectCategories = _Translations$subjectCategories$id._(_root);
	@override late final _Translations$subjects$id subjects = _Translations$subjects$id._(_root);
	@override late final _Translations$units$id units = _Translations$units$id._(_root);
	@override late final _Translations$variables$id variables = _Translations$variables$id._(_root);
	@override late final _Translations$verticalVariables$id verticalVariables = _Translations$verticalVariables$id._(_root);
	@override late final _Translations$shared$id shared = _Translations$shared$id._(_root);
	@override late final _Translations$validation$id validation = _Translations$validation$id._(_root);
	@override late final _Translations$categories$id categories = _Translations$categories$id._(_root);
	@override late final _Translations$instructions$id instructions = _Translations$instructions$id._(_root);
	@override late final _Translations$settings$id settings = _Translations$settings$id._(_root);
	@override late final _Translations$statisticalClassifications$id statisticalClassifications = _Translations$statisticalClassifications$id._(_root);
	@override late final _Translations$censusEvents$id censusEvents = _Translations$censusEvents$id._(_root);
	@override late final _Translations$glossary$id glossary = _Translations$glossary$id._(_root);
	@override late final _Translations$sdgIndicators$id sdgIndicators = _Translations$sdgIndicators$id._(_root);
}

// Path: app
class _Translations$app$id implements Translations$app$en {
	_Translations$app$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Contoh STADATA';
	@override String get description => 'Showcase kemampuan STADATA Flutter SDK';
}

// Path: navigation
class _Translations$navigation$id implements Translations$navigation$en {
	_Translations$navigation$id._(this._root);

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
class _Translations$common$id implements Translations$common$en {
	_Translations$common$id._(this._root);

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
class _Translations$errors$id implements Translations$errors$en {
	_Translations$errors$id._(this._root);

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
class _Translations$home$id implements Translations$home$en {
	_Translations$home$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Selamat Datang di STADATA';
	@override String get subtitle => 'Jelajahi Data Statistik Indonesia';
	@override String get description => 'Akses data statistik komprehensif dari Badan Pusat Statistik (BPS) Indonesia melalui aplikasi showcase ini.';
	@override late final _Translations$home$features$id features = _Translations$home$features$id._(_root);
	@override late final _Translations$home$aboutDemo$id aboutDemo = _Translations$home$aboutDemo$id._(_root);
	@override late final _Translations$home$sections$id sections = _Translations$home$sections$id._(_root);
}

// Path: listApi
class _Translations$listApi$id implements Translations$listApi$en {
	_Translations$listApi$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'List API';
	@override String get subtitle => 'Jelajahi koleksi data statistik dari BPS';
	@override late final _Translations$listApi$sections$id sections = _Translations$listApi$sections$id._(_root);
}

// Path: viewApi
class _Translations$viewApi$id implements Translations$viewApi$en {
	_Translations$viewApi$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'View API';
	@override String get subtitle => 'Tampilan informasi detail';
	@override late final _Translations$viewApi$sections$id sections = _Translations$viewApi$sections$id._(_root);
}

// Path: domains
class _Translations$domains$id implements Translations$domains$en {
	_Translations$domains$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Domain';
	@override late final _Translations$domains$types$id types = _Translations$domains$types$id._(_root);
	@override late final _Translations$domains$fields$id fields = _Translations$domains$fields$id._(_root);
	@override late final _Translations$domains$parameters$id parameters = _Translations$domains$parameters$id._(_root);
	@override late final _Translations$domains$requestDetails$id requestDetails = _Translations$domains$requestDetails$id._(_root);
	@override late final _Translations$domains$results$id results = _Translations$domains$results$id._(_root);
	@override late final _Translations$domains$education$id education = _Translations$domains$education$id._(_root);
}

// Path: infographics
class _Translations$infographics$id implements Translations$infographics$en {
	_Translations$infographics$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Infografis';
	@override late final _Translations$infographics$fields$id fields = _Translations$infographics$fields$id._(_root);
	@override late final _Translations$infographics$parameters$id parameters = _Translations$infographics$parameters$id._(_root);
	@override late final _Translations$infographics$requestDetails$id requestDetails = _Translations$infographics$requestDetails$id._(_root);
	@override late final _Translations$infographics$results$id results = _Translations$infographics$results$id._(_root);
	@override late final _Translations$infographics$education$id education = _Translations$infographics$education$id._(_root);
}

// Path: publications
class _Translations$publications$id implements Translations$publications$en {
	_Translations$publications$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Publikasi';
	@override String get comingSoon => 'Halaman Publikasi - Segera Hadir';
	@override late final _Translations$publications$detail$id detail = _Translations$publications$detail$id._(_root);
	@override late final _Translations$publications$fields$id fields = _Translations$publications$fields$id._(_root);
	@override late final _Translations$publications$parameters$id parameters = _Translations$publications$parameters$id._(_root);
	@override late final _Translations$publications$requestDetails$id requestDetails = _Translations$publications$requestDetails$id._(_root);
	@override late final _Translations$publications$results$id results = _Translations$publications$results$id._(_root);
	@override late final _Translations$publications$education$id education = _Translations$publications$education$id._(_root);
}

// Path: news
class _Translations$news$id implements Translations$news$en {
	_Translations$news$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Berita';
	@override String get categories => 'Kategori';
	@override late final _Translations$news$fields$id fields = _Translations$news$fields$id._(_root);
	@override late final _Translations$news$parameters$id parameters = _Translations$news$parameters$id._(_root);
	@override late final _Translations$news$requestDetails$id requestDetails = _Translations$news$requestDetails$id._(_root);
	@override late final _Translations$news$results$id results = _Translations$news$results$id._(_root);
	@override late final _Translations$news$detail$id detail = _Translations$news$detail$id._(_root);
	@override late final _Translations$news$education$id education = _Translations$news$education$id._(_root);
}

// Path: newsCategories
class _Translations$newsCategories$id implements Translations$newsCategories$en {
	_Translations$newsCategories$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Berita';
	@override late final _Translations$newsCategories$fields$id fields = _Translations$newsCategories$fields$id._(_root);
	@override late final _Translations$newsCategories$parameters$id parameters = _Translations$newsCategories$parameters$id._(_root);
	@override late final _Translations$newsCategories$requestDetails$id requestDetails = _Translations$newsCategories$requestDetails$id._(_root);
	@override late final _Translations$newsCategories$results$id results = _Translations$newsCategories$results$id._(_root);
	@override late final _Translations$newsCategories$categoryDetail$id categoryDetail = _Translations$newsCategories$categoryDetail$id._(_root);
	@override late final _Translations$newsCategories$education$id education = _Translations$newsCategories$education$id._(_root);
}

// Path: dynamicTables
class _Translations$dynamicTables$id implements Translations$dynamicTables$en {
	_Translations$dynamicTables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Dinamis';
	@override late final _Translations$dynamicTables$parameters$id parameters = _Translations$dynamicTables$parameters$id._(_root);
	@override late final _Translations$dynamicTables$requestDetails$id requestDetails = _Translations$dynamicTables$requestDetails$id._(_root);
	@override late final _Translations$dynamicTables$results$id results = _Translations$dynamicTables$results$id._(_root);
	@override late final _Translations$dynamicTables$workflow$id workflow = _Translations$dynamicTables$workflow$id._(_root);
	@override late final _Translations$dynamicTables$states$id states = _Translations$dynamicTables$states$id._(_root);
}

// Path: pressReleases
class _Translations$pressReleases$id implements Translations$pressReleases$en {
	_Translations$pressReleases$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Siaran Pers';
	@override String get comingSoon => 'Halaman Siaran Pers - Segera Hadir';
	@override late final _Translations$pressReleases$detail$id detail = _Translations$pressReleases$detail$id._(_root);
	@override late final _Translations$pressReleases$fields$id fields = _Translations$pressReleases$fields$id._(_root);
	@override late final _Translations$pressReleases$parameters$id parameters = _Translations$pressReleases$parameters$id._(_root);
	@override late final _Translations$pressReleases$results$id results = _Translations$pressReleases$results$id._(_root);
	@override late final _Translations$pressReleases$actions$id actions = _Translations$pressReleases$actions$id._(_root);
}

// Path: staticTables
class _Translations$staticTables$id implements Translations$staticTables$en {
	_Translations$staticTables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Statis';
	@override String get description => 'Tabel statistik yang telah didefinisikan dengan data dalam format HTML dan Excel';
	@override String get noDataFound => 'Tidak ada tabel statis yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} tabel statis',
		other: 'Ditemukan ${n} tabel statis',
	);
	@override late final _Translations$staticTables$fields$id fields = _Translations$staticTables$fields$id._(_root);
	@override late final _Translations$staticTables$parameters$id parameters = _Translations$staticTables$parameters$id._(_root);
	@override late final _Translations$staticTables$actions$id actions = _Translations$staticTables$actions$id._(_root);
	@override late final _Translations$staticTables$detail$id detail = _Translations$staticTables$detail$id._(_root);
}

// Path: strategicIndicators
class _Translations$strategicIndicators$id implements Translations$strategicIndicators$en {
	_Translations$strategicIndicators$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator Strategis';
	@override late final _Translations$strategicIndicators$fields$id fields = _Translations$strategicIndicators$fields$id._(_root);
	@override late final _Translations$strategicIndicators$parameters$id parameters = _Translations$strategicIndicators$parameters$id._(_root);
	@override late final _Translations$strategicIndicators$results$id results = _Translations$strategicIndicators$results$id._(_root);
}

// Path: censusTopics
class _Translations$censusTopics$id implements Translations$censusTopics$en {
	_Translations$censusTopics$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Topik Sensus';
	@override late final _Translations$censusTopics$fields$id fields = _Translations$censusTopics$fields$id._(_root);
	@override late final _Translations$censusTopics$parameters$id parameters = _Translations$censusTopics$parameters$id._(_root);
	@override late final _Translations$censusTopics$results$id results = _Translations$censusTopics$results$id._(_root);
}

// Path: censusDatasets
class _Translations$censusDatasets$id implements Translations$censusDatasets$en {
	_Translations$censusDatasets$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dataset Sensus';
	@override late final _Translations$censusDatasets$fields$id fields = _Translations$censusDatasets$fields$id._(_root);
	@override late final _Translations$censusDatasets$parameters$id parameters = _Translations$censusDatasets$parameters$id._(_root);
	@override late final _Translations$censusDatasets$results$id results = _Translations$censusDatasets$results$id._(_root);
}

// Path: censusData
class _Translations$censusData$id implements Translations$censusData$en {
	_Translations$censusData$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Data Sensus';
	@override late final _Translations$censusData$fields$id fields = _Translations$censusData$fields$id._(_root);
	@override late final _Translations$censusData$parameters$id parameters = _Translations$censusData$parameters$id._(_root);
	@override late final _Translations$censusData$results$id results = _Translations$censusData$results$id._(_root);
}

// Path: censusAreas
class _Translations$censusAreas$id implements Translations$censusAreas$en {
	_Translations$censusAreas$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wilayah Sensus';
	@override String get description => 'Wilayah geografis yang tercakup dalam kegiatan sensus';
	@override late final _Translations$censusAreas$fields$id fields = _Translations$censusAreas$fields$id._(_root);
	@override late final _Translations$censusAreas$parameters$id parameters = _Translations$censusAreas$parameters$id._(_root);
	@override late final _Translations$censusAreas$results$id results = _Translations$censusAreas$results$id._(_root);
}

// Path: subjectCategories
class _Translations$subjectCategories$id implements Translations$subjectCategories$en {
	_Translations$subjectCategories$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Subjek';
	@override late final _Translations$subjectCategories$fields$id fields = _Translations$subjectCategories$fields$id._(_root);
	@override late final _Translations$subjectCategories$parameters$id parameters = _Translations$subjectCategories$parameters$id._(_root);
	@override late final _Translations$subjectCategories$results$id results = _Translations$subjectCategories$results$id._(_root);
}

// Path: subjects
class _Translations$subjects$id implements Translations$subjects$en {
	_Translations$subjects$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subjek';
	@override String get comingSoon => 'Halaman Subjek - Segera Hadir';
}

// Path: units
class _Translations$units$id implements Translations$units$en {
	_Translations$units$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unit';
	@override String get description => 'Unit pengukuran untuk data statistik';
	@override String get noDataFound => 'Tidak ada unit yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} unit',
		other: 'Ditemukan ${n} unit',
	);
	@override late final _Translations$units$fields$id fields = _Translations$units$fields$id._(_root);
	@override late final _Translations$units$parameters$id parameters = _Translations$units$parameters$id._(_root);
}

// Path: variables
class _Translations$variables$id implements Translations$variables$en {
	_Translations$variables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel';
	@override String get description => 'Variabel dan ukuran statistik';
	@override String get noDataFound => 'Tidak ada variabel yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} variabel',
		other: 'Ditemukan ${n} variabel',
	);
	@override late final _Translations$variables$fields$id fields = _Translations$variables$fields$id._(_root);
	@override late final _Translations$variables$parameters$id parameters = _Translations$variables$parameters$id._(_root);
}

// Path: verticalVariables
class _Translations$verticalVariables$id implements Translations$verticalVariables$en {
	_Translations$verticalVariables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel Vertikal';
	@override String get description => 'Dimensi kategorikal dan sistem klasifikasi';
	@override String get noDataFound => 'Tidak ada variabel vertikal yang ditemukan';
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} variabel vertikal',
		other: 'Ditemukan ${n} variabel vertikal',
	);
	@override late final _Translations$verticalVariables$fields$id fields = _Translations$verticalVariables$fields$id._(_root);
	@override late final _Translations$verticalVariables$parameters$id parameters = _Translations$verticalVariables$parameters$id._(_root);
}

// Path: shared
class _Translations$shared$id implements Translations$shared$en {
	_Translations$shared$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$shared$pagination$id pagination = _Translations$shared$pagination$id._(_root);
	@override late final _Translations$shared$codeSnippet$id codeSnippet = _Translations$shared$codeSnippet$id._(_root);
	@override late final _Translations$shared$errorWidget$id errorWidget = _Translations$shared$errorWidget$id._(_root);
	@override late final _Translations$shared$searchableDropdown$id searchableDropdown = _Translations$shared$searchableDropdown$id._(_root);
	@override late final _Translations$shared$requestDetails$id requestDetails = _Translations$shared$requestDetails$id._(_root);
}

// Path: validation
class _Translations$validation$id implements Translations$validation$en {
	_Translations$validation$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get domainRequired => 'Domain diperlukan';
}

// Path: categories
class _Translations$categories$id implements Translations$categories$en {
	_Translations$categories$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get imageNotAvailable => 'Gambar tidak tersedia';
	@override String get categoryId => 'ID Kategori';
	@override String get releaseDate => 'Tanggal Rilis';
	@override String get imageUrl => 'URL Gambar';
	@override String get tapToReadMore => 'Ketuk untuk baca lebih lanjut';
}

// Path: instructions
class _Translations$instructions$id implements Translations$instructions$en {
	_Translations$instructions$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get requestDetailsWillShow => 'Detail request akan ditampilkan di halaman hasil';
	@override String get onlyHandlesParameters => 'Halaman ini hanya menangani konfigurasi parameter. Klik "Cari Domain" untuk melihat detail request di halaman hasil.';
	@override String get enterParametersAndLoad => 'Masukkan parameter dan klik muat untuk melihat data';
	@override late final _Translations$instructions$languageLabels$id languageLabels = _Translations$instructions$languageLabels$id._(_root);
}

// Path: settings
class _Translations$settings$id implements Translations$settings$en {
	_Translations$settings$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pengaturan';
	@override String get language => 'Bahasa';
	@override String get theme => 'Tema';
	@override String get darkMode => 'Mode Gelap';
	@override String get about => 'Tentang';
}

// Path: statisticalClassifications
class _Translations$statisticalClassifications$id implements Translations$statisticalClassifications$en {
	_Translations$statisticalClassifications$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Klasifikasi Statistik';
	@override late final _Translations$statisticalClassifications$fields$id fields = _Translations$statisticalClassifications$fields$id._(_root);
	@override late final _Translations$statisticalClassifications$levels$id levels = _Translations$statisticalClassifications$levels$id._(_root);
	@override late final _Translations$statisticalClassifications$kbkiLevels$id kbkiLevels = _Translations$statisticalClassifications$kbkiLevels$id._(_root);
	@override late final _Translations$statisticalClassifications$parameters$id parameters = _Translations$statisticalClassifications$parameters$id._(_root);
	@override late final _Translations$statisticalClassifications$results$id results = _Translations$statisticalClassifications$results$id._(_root);
	@override late final _Translations$statisticalClassifications$detail$id detail = _Translations$statisticalClassifications$detail$id._(_root);
}

// Path: censusEvents
class _Translations$censusEvents$id implements Translations$censusEvents$en {
	_Translations$censusEvents$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kegiatan Sensus';
	@override late final _Translations$censusEvents$fields$id fields = _Translations$censusEvents$fields$id._(_root);
	@override String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('id'))(n,
		one: 'Ditemukan ${n} kegiatan sensus',
		other: 'Ditemukan ${n} kegiatan sensus',
	);
	@override String get initializing => 'Menginisialisasi...';
}

// Path: glossary
class _Translations$glossary$id implements Translations$glossary$en {
	_Translations$glossary$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Glosarium';
	@override late final _Translations$glossary$parameters$id parameters = _Translations$glossary$parameters$id._(_root);
	@override late final _Translations$glossary$results$id results = _Translations$glossary$results$id._(_root);
	@override late final _Translations$glossary$education$id education = _Translations$glossary$education$id._(_root);
}

// Path: sdgIndicators
class _Translations$sdgIndicators$id implements Translations$sdgIndicators$en {
	_Translations$sdgIndicators$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator SDG';
	@override late final _Translations$sdgIndicators$parameters$id parameters = _Translations$sdgIndicators$parameters$id._(_root);
	@override late final _Translations$sdgIndicators$results$id results = _Translations$sdgIndicators$results$id._(_root);
	@override late final _Translations$sdgIndicators$education$id education = _Translations$sdgIndicators$education$id._(_root);
}

// Path: home.features
class _Translations$home$features$id implements Translations$home$features$en {
	_Translations$home$features$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fitur';
}

// Path: home.aboutDemo
class _Translations$home$aboutDemo$id implements Translations$home$aboutDemo$en {
	_Translations$home$aboutDemo$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang Demo Ini';
	@override String get description => 'Contoh sederhana ini mendemonstrasikan fungsionalitas domain dari STADATA Flutter SDK. Klik pada kartu domain di atas untuk menjelajahi domain statistik dari BPS Indonesia.';
}

// Path: home.sections
class _Translations$home$sections$id implements Translations$home$sections$en {
	_Translations$home$sections$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$home$sections$listApi$id listApi = _Translations$home$sections$listApi$id._(_root);
	@override late final _Translations$home$sections$viewApi$id viewApi = _Translations$home$sections$viewApi$id._(_root);
	@override late final _Translations$home$sections$dynamicTables$id dynamicTables = _Translations$home$sections$dynamicTables$id._(_root);
	@override late final _Translations$home$sections$periods$id periods = _Translations$home$sections$periods$id._(_root);
}

// Path: listApi.sections
class _Translations$listApi$sections$id implements Translations$listApi$sections$en {
	_Translations$listApi$sections$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$listApi$sections$domains$id domains = _Translations$listApi$sections$domains$id._(_root);
	@override late final _Translations$listApi$sections$publications$id publications = _Translations$listApi$sections$publications$id._(_root);
	@override late final _Translations$listApi$sections$news$id news = _Translations$listApi$sections$news$id._(_root);
	@override late final _Translations$listApi$sections$pressReleases$id pressReleases = _Translations$listApi$sections$pressReleases$id._(_root);
	@override late final _Translations$listApi$sections$infographics$id infographics = _Translations$listApi$sections$infographics$id._(_root);
	@override late final _Translations$listApi$sections$newsCategories$id newsCategories = _Translations$listApi$sections$newsCategories$id._(_root);
	@override late final _Translations$listApi$sections$dynamicTables$id dynamicTables = _Translations$listApi$sections$dynamicTables$id._(_root);
	@override late final _Translations$listApi$sections$staticTables$id staticTables = _Translations$listApi$sections$staticTables$id._(_root);
	@override late final _Translations$listApi$sections$statisticalClassifications$id statisticalClassifications = _Translations$listApi$sections$statisticalClassifications$id._(_root);
	@override late final _Translations$listApi$sections$strategicIndicators$id strategicIndicators = _Translations$listApi$sections$strategicIndicators$id._(_root);
	@override late final _Translations$listApi$sections$subjectCategories$id subjectCategories = _Translations$listApi$sections$subjectCategories$id._(_root);
	@override late final _Translations$listApi$sections$subjects$id subjects = _Translations$listApi$sections$subjects$id._(_root);
	@override late final _Translations$listApi$sections$variables$id variables = _Translations$listApi$sections$variables$id._(_root);
	@override late final _Translations$listApi$sections$verticalVariables$id verticalVariables = _Translations$listApi$sections$verticalVariables$id._(_root);
	@override late final _Translations$listApi$sections$units$id units = _Translations$listApi$sections$units$id._(_root);
	@override late final _Translations$listApi$sections$periods$id periods = _Translations$listApi$sections$periods$id._(_root);
	@override late final _Translations$listApi$sections$derivedPeriods$id derivedPeriods = _Translations$listApi$sections$derivedPeriods$id._(_root);
	@override late final _Translations$listApi$sections$derivedVariables$id derivedVariables = _Translations$listApi$sections$derivedVariables$id._(_root);
	@override late final _Translations$listApi$sections$censusEvents$id censusEvents = _Translations$listApi$sections$censusEvents$id._(_root);
	@override late final _Translations$listApi$sections$censusTopics$id censusTopics = _Translations$listApi$sections$censusTopics$id._(_root);
	@override late final _Translations$listApi$sections$censusDatasets$id censusDatasets = _Translations$listApi$sections$censusDatasets$id._(_root);
	@override late final _Translations$listApi$sections$censusData$id censusData = _Translations$listApi$sections$censusData$id._(_root);
	@override late final _Translations$listApi$sections$censusAreas$id censusAreas = _Translations$listApi$sections$censusAreas$id._(_root);
	@override late final _Translations$listApi$sections$glossary$id glossary = _Translations$listApi$sections$glossary$id._(_root);
	@override late final _Translations$listApi$sections$sdgIndicators$id sdgIndicators = _Translations$listApi$sections$sdgIndicators$id._(_root);
}

// Path: viewApi.sections
class _Translations$viewApi$sections$id implements Translations$viewApi$sections$en {
	_Translations$viewApi$sections$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$viewApi$sections$publication$id publication = _Translations$viewApi$sections$publication$id._(_root);
	@override late final _Translations$viewApi$sections$news$id news = _Translations$viewApi$sections$news$id._(_root);
	@override late final _Translations$viewApi$sections$pressRelease$id pressRelease = _Translations$viewApi$sections$pressRelease$id._(_root);
	@override late final _Translations$viewApi$sections$staticTable$id staticTable = _Translations$viewApi$sections$staticTable$id._(_root);
}

// Path: domains.types
class _Translations$domains$types$id implements Translations$domains$types$en {
	_Translations$domains$types$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get province => 'Provinsi';
	@override String get regency => 'Kabupaten';
	@override String get regencyByProvince => 'Kabupaten by Provinsi';
	@override String get all => 'Semua Domain';
}

// Path: domains.fields
class _Translations$domains$fields$id implements Translations$domains$fields$en {
	_Translations$domains$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
	@override String get url => 'URL';
}

// Path: domains.parameters
class _Translations$domains$parameters$id implements Translations$domains$parameters$en {
	_Translations$domains$parameters$id._(this._root);

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
class _Translations$domains$requestDetails$id implements Translations$domains$requestDetails$en {
	_Translations$domains$requestDetails$id._(this._root);

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
class _Translations$domains$results$id implements Translations$domains$results$en {
	_Translations$domains$results$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Domain';
	@override String get found => 'Ditemukan {count} domain';
	@override String get empty => 'Tidak ada domain ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Pilih parameter dan klik "Muat Domain" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: domains.education
class _Translations$domains$education$id implements Translations$domains$education$en {
	_Translations$domains$education$id._(this._root);

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
class _Translations$infographics$fields$id implements Translations$infographics$fields$en {
	_Translations$infographics$fields$id._(this._root);

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
class _Translations$infographics$parameters$id implements Translations$infographics$parameters$en {
	_Translations$infographics$parameters$id._(this._root);

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
class _Translations$infographics$requestDetails$id implements Translations$infographics$requestDetails$en {
	_Translations$infographics$requestDetails$id._(this._root);

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
class _Translations$infographics$results$id implements Translations$infographics$results$en {
	_Translations$infographics$results$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil';
	@override String get found => 'Ditemukan {count} infografis';
	@override String get empty => 'Tidak ada infografis ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasikan parameter dan klik "Muat Infografis" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: infographics.education
class _Translations$infographics$education$id implements Translations$infographics$education$en {
	_Translations$infographics$education$id._(this._root);

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
class _Translations$publications$detail$id implements Translations$publications$detail$en {
	_Translations$publications$detail$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Publikasi';
}

// Path: publications.fields
class _Translations$publications$fields$id implements Translations$publications$fields$en {
	_Translations$publications$fields$id._(this._root);

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
class _Translations$publications$parameters$id implements Translations$publications$parameters$en {
	_Translations$publications$parameters$id._(this._root);

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
class _Translations$publications$requestDetails$id implements Translations$publications$requestDetails$en {
	_Translations$publications$requestDetails$id._(this._root);

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
class _Translations$publications$results$id implements Translations$publications$results$en {
	_Translations$publications$results$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Publikasi';
	@override String get found => 'Ditemukan {count} publikasi';
	@override String get empty => 'Tidak ada publikasi yang ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasi parameter dan klik "Muat Publikasi" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: publications.education
class _Translations$publications$education$id implements Translations$publications$education$en {
	_Translations$publications$education$id._(this._root);

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
class _Translations$news$fields$id implements Translations$news$fields$en {
	_Translations$news$fields$id._(this._root);

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
class _Translations$news$parameters$id implements Translations$news$parameters$en {
	_Translations$news$parameters$id._(this._root);

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
class _Translations$news$requestDetails$id implements Translations$news$requestDetails$en {
	_Translations$news$requestDetails$id._(this._root);

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
class _Translations$news$results$id implements Translations$news$results$en {
	_Translations$news$results$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Berita';
	@override String get found => 'Ditemukan {count} artikel berita';
	@override String get empty => 'Tidak ada berita ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasikan parameter dan klik "Muat Berita" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: news.detail
class _Translations$news$detail$id implements Translations$news$detail$en {
	_Translations$news$detail$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Berita';
	@override String get metadata => 'Informasi Berita';
	@override String get content => 'Konten Artikel';
}

// Path: news.education
class _Translations$news$education$id implements Translations$news$education$en {
	_Translations$news$education$id._(this._root);

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
class _Translations$newsCategories$fields$id implements Translations$newsCategories$fields$en {
	_Translations$newsCategories$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
}

// Path: newsCategories.parameters
class _Translations$newsCategories$parameters$id implements Translations$newsCategories$parameters$en {
	_Translations$newsCategories$parameters$id._(this._root);

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
class _Translations$newsCategories$requestDetails$id implements Translations$newsCategories$requestDetails$en {
	_Translations$newsCategories$requestDetails$id._(this._root);

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
class _Translations$newsCategories$results$id implements Translations$newsCategories$results$en {
	_Translations$newsCategories$results$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Kategori Berita';
	@override String get searchParameters => 'Parameter Pencarian';
	@override String get categoriesFound => 'kategori ditemukan';
	@override String get noDataFound => 'Tidak Ada Kategori Ditemukan';
	@override String get noDataDescription => 'Coba sesuaikan parameter pencarian atau periksa apakah domain tersebut ada.';
}

// Path: newsCategories.categoryDetail
class _Translations$newsCategories$categoryDetail$id implements Translations$newsCategories$categoryDetail$en {
	_Translations$newsCategories$categoryDetail$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Kategori';
	@override String get id => 'ID Kategori';
	@override String get name => 'Nama Kategori';
}

// Path: newsCategories.education
class _Translations$newsCategories$education$id implements Translations$newsCategories$education$en {
	_Translations$newsCategories$education$id._(this._root);

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
class _Translations$dynamicTables$parameters$id implements Translations$dynamicTables$parameters$en {
	_Translations$dynamicTables$parameters$id._(this._root);

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
class _Translations$dynamicTables$requestDetails$id implements Translations$dynamicTables$requestDetails$en {
	_Translations$dynamicTables$requestDetails$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Request';
	@override String get showDetails => 'Tampilkan Detail Request';
	@override String get hideDetails => 'Sembunyikan Detail Request';
	@override String get noRequest => 'Belum ada request dibuat';
}

// Path: dynamicTables.results
class _Translations$dynamicTables$results$id implements Translations$dynamicTables$results$en {
	_Translations$dynamicTables$results$id._(this._root);

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
class _Translations$dynamicTables$workflow$id implements Translations$dynamicTables$workflow$en {
	_Translations$dynamicTables$workflow$id._(this._root);

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
class _Translations$dynamicTables$states$id implements Translations$dynamicTables$states$en {
	_Translations$dynamicTables$states$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get initializing => 'Menginisialisasi...';
	@override String get unknown => 'Status tidak diketahui';
}

// Path: pressReleases.detail
class _Translations$pressReleases$detail$id implements Translations$pressReleases$detail$en {
	_Translations$pressReleases$detail$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Siaran Pers';
	@override String get forId => 'Detail Siaran Pers untuk ID: {id}';
}

// Path: pressReleases.fields
class _Translations$pressReleases$fields$id implements Translations$pressReleases$fields$en {
	_Translations$pressReleases$fields$id._(this._root);

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
class _Translations$pressReleases$parameters$id implements Translations$pressReleases$parameters$en {
	_Translations$pressReleases$parameters$id._(this._root);

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
class _Translations$pressReleases$results$id implements Translations$pressReleases$results$en {
	_Translations$pressReleases$results$id._(this._root);

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
class _Translations$pressReleases$actions$id implements Translations$pressReleases$actions$en {
	_Translations$pressReleases$actions$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get downloadPdf => 'Unduh PDF';
	@override String get viewDetails => 'Lihat Detail';
}

// Path: staticTables.fields
class _Translations$staticTables$fields$id implements Translations$staticTables$fields$en {
	_Translations$staticTables$fields$id._(this._root);

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
class _Translations$staticTables$parameters$id implements Translations$staticTables$parameters$en {
	_Translations$staticTables$parameters$id._(this._root);

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
class _Translations$staticTables$actions$id implements Translations$staticTables$actions$en {
	_Translations$staticTables$actions$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get viewTable => 'Lihat Tabel';
	@override String get downloadExcel => 'Unduh Excel';
}

// Path: staticTables.detail
class _Translations$staticTables$detail$id implements Translations$staticTables$detail$en {
	_Translations$staticTables$detail$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Tabel Statis';
	@override String get loading => 'Memuat tabel...';
	@override String get noTableData => 'Tidak ada data tabel yang tersedia';
	@override String get refresh => 'Segarkan';
	@override String get downloadExcel => 'Unduh Excel';
}

// Path: strategicIndicators.fields
class _Translations$strategicIndicators$fields$id implements Translations$strategicIndicators$fields$en {
	_Translations$strategicIndicators$fields$id._(this._root);

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
class _Translations$strategicIndicators$parameters$id implements Translations$strategicIndicators$parameters$en {
	_Translations$strategicIndicators$parameters$id._(this._root);

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
class _Translations$strategicIndicators$results$id implements Translations$strategicIndicators$results$en {
	_Translations$strategicIndicators$results$id._(this._root);

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
class _Translations$censusTopics$fields$id implements Translations$censusTopics$fields$en {
	_Translations$censusTopics$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get topic => 'Topik';
	@override String get eventID => 'ID Kegiatan';
	@override String get eventName => 'Nama Kegiatan';
}

// Path: censusTopics.parameters
class _Translations$censusTopics$parameters$id implements Translations$censusTopics$parameters$en {
	_Translations$censusTopics$parameters$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get censusEvent => 'Kegiatan Sensus *';
	@override String get censusEventHint => 'Pilih kegiatan sensus';
	@override String get loadButton => 'Muat Topik';
}

// Path: censusTopics.results
class _Translations$censusTopics$results$id implements Translations$censusTopics$results$en {
	_Translations$censusTopics$results$id._(this._root);

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
class _Translations$censusDatasets$fields$id implements Translations$censusDatasets$fields$en {
	_Translations$censusDatasets$fields$id._(this._root);

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
class _Translations$censusDatasets$parameters$id implements Translations$censusDatasets$parameters$en {
	_Translations$censusDatasets$parameters$id._(this._root);

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
class _Translations$censusDatasets$results$id implements Translations$censusDatasets$results$en {
	_Translations$censusDatasets$results$id._(this._root);

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
class _Translations$censusData$fields$id implements Translations$censusData$fields$en {
	_Translations$censusData$fields$id._(this._root);

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
class _Translations$censusData$parameters$id implements Translations$censusData$parameters$en {
	_Translations$censusData$parameters$id._(this._root);

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
class _Translations$censusData$results$id implements Translations$censusData$results$en {
	_Translations$censusData$results$id._(this._root);

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
class _Translations$censusAreas$fields$id implements Translations$censusAreas$fields$en {
	_Translations$censusAreas$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID Wilayah';
	@override String get name => 'Nama Wilayah';
	@override String get slug => 'Slug';
	@override String get mfdCode => 'Kode MFD';
}

// Path: censusAreas.parameters
class _Translations$censusAreas$parameters$id implements Translations$censusAreas$parameters$en {
	_Translations$censusAreas$parameters$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get censusEvent => 'Kegiatan Sensus *';
	@override String get censusEventHint => 'Pilih kegiatan sensus';
	@override String get loadButton => 'Muat Wilayah Sensus';
}

// Path: censusAreas.results
class _Translations$censusAreas$results$id implements Translations$censusAreas$results$en {
	_Translations$censusAreas$results$id._(this._root);

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
class _Translations$subjectCategories$fields$id implements Translations$subjectCategories$fields$en {
	_Translations$subjectCategories$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
}

// Path: subjectCategories.parameters
class _Translations$subjectCategories$parameters$id implements Translations$subjectCategories$parameters$en {
	_Translations$subjectCategories$parameters$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter';
	@override String get domain => 'Domain *';
	@override String get domainHint => 'contoh: 7200';
	@override String get language => 'Bahasa';
	@override String get loadButton => 'Muat Kategori Subjek';
}

// Path: subjectCategories.results
class _Translations$subjectCategories$results$id implements Translations$subjectCategories$results$en {
	_Translations$subjectCategories$results$id._(this._root);

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
class _Translations$units$fields$id implements Translations$units$fields$en {
	_Translations$units$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
}

// Path: units.parameters
class _Translations$units$parameters$id implements Translations$units$parameters$en {
	_Translations$units$parameters$id._(this._root);

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
class _Translations$variables$fields$id implements Translations$variables$fields$en {
	_Translations$variables$fields$id._(this._root);

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
class _Translations$variables$parameters$id implements Translations$variables$parameters$en {
	_Translations$variables$parameters$id._(this._root);

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
class _Translations$verticalVariables$fields$id implements Translations$verticalVariables$fields$en {
	_Translations$verticalVariables$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get title => 'Judul';
	@override String get itemID => 'ID Item';
	@override String get groupID => 'ID Grup';
	@override String get groupName => 'Nama Grup';
}

// Path: verticalVariables.parameters
class _Translations$verticalVariables$parameters$id implements Translations$verticalVariables$parameters$en {
	_Translations$verticalVariables$parameters$id._(this._root);

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
class _Translations$shared$pagination$id implements Translations$shared$pagination$en {
	_Translations$shared$pagination$id._(this._root);

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
class _Translations$shared$codeSnippet$id implements Translations$shared$codeSnippet$en {
	_Translations$shared$codeSnippet$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get copyToClipboard => 'Salin ke clipboard';
	@override String get codeCopied => 'Kode disalin ke clipboard';
}

// Path: shared.errorWidget
class _Translations$shared$errorWidget$id implements Translations$shared$errorWidget$en {
	_Translations$shared$errorWidget$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get tryAgain => 'Coba Lagi';
}

// Path: shared.searchableDropdown
class _Translations$shared$searchableDropdown$id implements Translations$shared$searchableDropdown$en {
	_Translations$shared$searchableDropdown$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get noItemsFound => 'Tidak ada item ditemukan';
	@override String get selectItem => 'Pilih item';
}

// Path: shared.requestDetails
class _Translations$shared$requestDetails$id implements Translations$shared$requestDetails$en {
	_Translations$shared$requestDetails$id._(this._root);

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
class _Translations$instructions$languageLabels$id implements Translations$instructions$languageLabels$en {
	_Translations$instructions$languageLabels$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get indonesian => 'Indonesia';
	@override String get english => 'Inggris';
}

// Path: statisticalClassifications.fields
class _Translations$statisticalClassifications$fields$id implements Translations$statisticalClassifications$fields$en {
	_Translations$statisticalClassifications$fields$id._(this._root);

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
class _Translations$statisticalClassifications$levels$id implements Translations$statisticalClassifications$levels$en {
	_Translations$statisticalClassifications$levels$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get category => 'Kategori';
	@override String get primaryGroup => 'Golongan Pokok';
	@override String get group => 'Golongan';
	@override String get subGroup => 'Sub-Golongan';
	@override String get cluster => 'Kelompok';
}

// Path: statisticalClassifications.kbkiLevels
class _Translations$statisticalClassifications$kbkiLevels$id implements Translations$statisticalClassifications$kbkiLevels$en {
	_Translations$statisticalClassifications$kbkiLevels$id._(this._root);

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
class _Translations$statisticalClassifications$parameters$id implements Translations$statisticalClassifications$parameters$en {
	_Translations$statisticalClassifications$parameters$id._(this._root);

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
class _Translations$statisticalClassifications$results$id implements Translations$statisticalClassifications$results$en {
	_Translations$statisticalClassifications$results$id._(this._root);

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
class _Translations$statisticalClassifications$detail$id implements Translations$statisticalClassifications$detail$en {
	_Translations$statisticalClassifications$detail$id._(this._root);

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
class _Translations$censusEvents$fields$id implements Translations$censusEvents$fields$en {
	_Translations$censusEvents$fields$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get id => 'ID';
	@override String get name => 'Nama';
	@override String get year => 'Tahun';
}

// Path: glossary.parameters
class _Translations$glossary$parameters$id implements Translations$glossary$parameters$en {
	_Translations$glossary$parameters$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'mis. 0000 untuk tingkat nasional';
	@override String get keyword => 'Kata kunci (opsional)';
	@override String get keywordHint => 'Filter berdasarkan kata kunci';
	@override String get prefix => 'Prefiks (opsional)';
	@override String get prefixHint => 'Pilih huruf A-Z';
	@override String get page => 'Halaman';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Diterapkan pada bahasa konten glosarium';
	@override String get searchGlossary => 'Cari Glosarium';
}

// Path: glossary.results
class _Translations$glossary$results$id implements Translations$glossary$results$en {
	_Translations$glossary$results$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Glosarium';
	@override String get found => 'Ditemukan {count} istilah';
	@override String get empty => 'Tidak ada istilah yang ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasikan parameter dan klik "Cari Glosarium" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: glossary.education
class _Translations$glossary$education$id implements Translations$glossary$education$en {
	_Translations$glossary$education$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang Glosarium';
	@override String get description => 'Jelajahi definisi istilah statistik BPS.';
	@override String get parameters => 'Parameter';
	@override String get parametersDescription => 'Filter berdasarkan kata kunci atau jelajahi berdasarkan alfabet (A-Z).';
	@override String get results => 'Hasil';
	@override String get resultsDescription => 'Setiap istilah menampilkan judul dan definisi lengkap.';
}

// Path: sdgIndicators.parameters
class _Translations$sdgIndicators$parameters$id implements Translations$sdgIndicators$parameters$en {
	_Translations$sdgIndicators$parameters$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parameter API';
	@override String get domain => 'Domain';
	@override String get domainHint => 'mis. 0000 untuk tingkat nasional';
	@override String get goal => 'Tujuan SDG (1-17)';
	@override String get goalHint => 'Pilih nomor tujuan';
	@override String get page => 'Halaman';
	@override String get language => 'Bahasa';
	@override String get languageNote => 'Diterapkan pada bahasa konten indikator';
	@override String get searchIndicators => 'Cari Indikator';
}

// Path: sdgIndicators.results
class _Translations$sdgIndicators$results$id implements Translations$sdgIndicators$results$en {
	_Translations$sdgIndicators$results$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hasil Indikator SDG';
	@override String get found => 'Ditemukan {count} indikator';
	@override String get empty => 'Tidak ada indikator yang ditemukan untuk kriteria yang dipilih';
	@override String get initial => 'Konfigurasikan parameter dan klik "Cari Indikator" untuk memulai';
	@override String get searchParameters => 'Parameter Pencarian';
}

// Path: sdgIndicators.education
class _Translations$sdgIndicators$education$id implements Translations$sdgIndicators$education$en {
	_Translations$sdgIndicators$education$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tentang Indikator SDG';
	@override String get description => 'Jelajahi variabel BPS yang dipetakan ke 17 Tujuan Pembangunan Berkelanjutan PBB.';
	@override String get parameters => 'Parameter';
	@override String get parametersDescription => 'Pilih nomor tujuan (1-17) untuk memfilter indikator.';
	@override String get results => 'Hasil';
	@override String get resultsDescription => 'Setiap indikator menampilkan judul, kode SDG, nama tujuan, dan satuan.';
}

// Path: home.sections.listApi
class _Translations$home$sections$listApi$id implements Translations$home$sections$listApi$en {
	_Translations$home$sections$listApi$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'List API';
	@override String get description => 'Jelajahi koleksi domain, publikasi, berita, dan lainnya';
}

// Path: home.sections.viewApi
class _Translations$home$sections$viewApi$id implements Translations$home$sections$viewApi$en {
	_Translations$home$sections$viewApi$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'View API';
	@override String get description => 'Dapatkan informasi detail tentang publikasi, berita, dan siaran pers tertentu';
}

// Path: home.sections.dynamicTables
class _Translations$home$sections$dynamicTables$id implements Translations$home$sections$dynamicTables$en {
	_Translations$home$sections$dynamicTables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Dinamis';
	@override String get description => 'Jelajahi tabel statistik dinamis dengan parameter yang dapat disesuaikan';
}

// Path: home.sections.periods
class _Translations$home$sections$periods$id implements Translations$home$sections$periods$en {
	_Translations$home$sections$periods$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Periode';
	@override String get description => 'Jelajahi periode waktu yang tersedia untuk data statistik';
}

// Path: listApi.sections.domains
class _Translations$listApi$sections$domains$id implements Translations$listApi$sections$domains$en {
	_Translations$listApi$sections$domains$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Domain';
	@override String get description => 'Domain dan wilayah statistik';
}

// Path: listApi.sections.publications
class _Translations$listApi$sections$publications$id implements Translations$listApi$sections$publications$en {
	_Translations$listApi$sections$publications$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Publikasi';
	@override String get description => 'Publikasi dan laporan statistik';
}

// Path: listApi.sections.news
class _Translations$listApi$sections$news$id implements Translations$listApi$sections$news$en {
	_Translations$listApi$sections$news$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Berita';
	@override String get description => 'Berita dan update statistik terbaru';
}

// Path: listApi.sections.pressReleases
class _Translations$listApi$sections$pressReleases$id implements Translations$listApi$sections$pressReleases$en {
	_Translations$listApi$sections$pressReleases$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Siaran Pers';
	@override String get description => 'Siaran pers resmi dari BPS';
}

// Path: listApi.sections.infographics
class _Translations$listApi$sections$infographics$id implements Translations$listApi$sections$infographics$en {
	_Translations$listApi$sections$infographics$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Infografis';
	@override String get description => 'Informasi statistik visual';
}

// Path: listApi.sections.newsCategories
class _Translations$listApi$sections$newsCategories$id implements Translations$listApi$sections$newsCategories$en {
	_Translations$listApi$sections$newsCategories$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Berita';
	@override String get description => 'Jelajahi klasifikasi kategori berita dari BPS';
}

// Path: listApi.sections.dynamicTables
class _Translations$listApi$sections$dynamicTables$id implements Translations$listApi$sections$dynamicTables$en {
	_Translations$listApi$sections$dynamicTables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Dinamis';
	@override String get description => 'Jelajahi data statistik multi-dimensi dengan integrasi periode';
}

// Path: listApi.sections.staticTables
class _Translations$listApi$sections$staticTables$id implements Translations$listApi$sections$staticTables$en {
	_Translations$listApi$sections$staticTables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Tabel Statis';
	@override String get description => 'Tabel statistik yang telah ditentukan';
}

// Path: listApi.sections.statisticalClassifications
class _Translations$listApi$sections$statisticalClassifications$id implements Translations$listApi$sections$statisticalClassifications$en {
	_Translations$listApi$sections$statisticalClassifications$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Klasifikasi Statistik';
	@override String get description => 'Jelajahi klasifikasi KBLI dan KBKI';
}

// Path: listApi.sections.strategicIndicators
class _Translations$listApi$sections$strategicIndicators$id implements Translations$listApi$sections$strategicIndicators$en {
	_Translations$listApi$sections$strategicIndicators$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator Strategis';
	@override String get description => 'Ukuran statistik kunci yang melacak pembangunan nasional';
}

// Path: listApi.sections.subjectCategories
class _Translations$listApi$sections$subjectCategories$id implements Translations$listApi$sections$subjectCategories$en {
	_Translations$listApi$sections$subjectCategories$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kategori Subjek';
	@override String get description => 'Jelajahi dan telusuri kategori subjek';
}

// Path: listApi.sections.subjects
class _Translations$listApi$sections$subjects$id implements Translations$listApi$sections$subjects$en {
	_Translations$listApi$sections$subjects$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Subjek';
	@override String get description => 'Kategori subjek statistik';
}

// Path: listApi.sections.variables
class _Translations$listApi$sections$variables$id implements Translations$listApi$sections$variables$en {
	_Translations$listApi$sections$variables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel';
	@override String get description => 'Variabel dan ukuran statistik';
}

// Path: listApi.sections.verticalVariables
class _Translations$listApi$sections$verticalVariables$id implements Translations$listApi$sections$verticalVariables$en {
	_Translations$listApi$sections$verticalVariables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel Vertikal';
	@override String get description => 'Dimensi kategorikal dan sistem klasifikasi';
}

// Path: listApi.sections.units
class _Translations$listApi$sections$units$id implements Translations$listApi$sections$units$en {
	_Translations$listApi$sections$units$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unit';
	@override String get description => 'Unit pengukuran untuk data statistik';
}

// Path: listApi.sections.periods
class _Translations$listApi$sections$periods$id implements Translations$listApi$sections$periods$en {
	_Translations$listApi$sections$periods$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Periode';
	@override String get description => 'Periode waktu untuk data statistik';
}

// Path: listApi.sections.derivedPeriods
class _Translations$listApi$sections$derivedPeriods$id implements Translations$listApi$sections$derivedPeriods$en {
	_Translations$listApi$sections$derivedPeriods$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Periode Turunan';
	@override String get description => 'Periode waktu yang dikelompokkan dan diagregasi';
}

// Path: listApi.sections.derivedVariables
class _Translations$listApi$sections$derivedVariables$id implements Translations$listApi$sections$derivedVariables$en {
	_Translations$listApi$sections$derivedVariables$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Variabel Turunan';
	@override String get description => 'Variabel statistik yang dihitung dan ditransformasi';
}

// Path: listApi.sections.censusEvents
class _Translations$listApi$sections$censusEvents$id implements Translations$listApi$sections$censusEvents$en {
	_Translations$listApi$sections$censusEvents$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kegiatan Sensus';
	@override String get description => 'Daftar kegiatan sensus utama';
}

// Path: listApi.sections.censusTopics
class _Translations$listApi$sections$censusTopics$id implements Translations$listApi$sections$censusTopics$en {
	_Translations$listApi$sections$censusTopics$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Topik Sensus';
	@override String get description => 'Topik dalam kegiatan sensus';
}

// Path: listApi.sections.censusDatasets
class _Translations$listApi$sections$censusDatasets$id implements Translations$listApi$sections$censusDatasets$en {
	_Translations$listApi$sections$censusDatasets$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dataset Sensus';
	@override String get description => 'Dataset yang tersedia untuk topik sensus';
}

// Path: listApi.sections.censusData
class _Translations$listApi$sections$censusData$id implements Translations$listApi$sections$censusData$en {
	_Translations$listApi$sections$censusData$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Data Sensus';
	@override String get description => 'Data statistik sensus aktual';
}

// Path: listApi.sections.censusAreas
class _Translations$listApi$sections$censusAreas$id implements Translations$listApi$sections$censusAreas$en {
	_Translations$listApi$sections$censusAreas$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wilayah Sensus';
	@override String get description => 'Wilayah geografis yang tercakup dalam kegiatan sensus';
}

// Path: listApi.sections.glossary
class _Translations$listApi$sections$glossary$id implements Translations$listApi$sections$glossary$en {
	_Translations$listApi$sections$glossary$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Glosarium';
	@override String get description => 'Definisi istilah statistik';
}

// Path: listApi.sections.sdgIndicators
class _Translations$listApi$sections$sdgIndicators$id implements Translations$listApi$sections$sdgIndicators$en {
	_Translations$listApi$sections$sdgIndicators$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Indikator SDG';
	@override String get description => 'Indikator Tujuan Pembangunan Berkelanjutan';
}

// Path: viewApi.sections.publication
class _Translations$viewApi$sections$publication$id implements Translations$viewApi$sections$publication$en {
	_Translations$viewApi$sections$publication$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Publikasi';
	@override String get description => 'Informasi publikasi detail';
}

// Path: viewApi.sections.news
class _Translations$viewApi$sections$news$id implements Translations$viewApi$sections$news$en {
	_Translations$viewApi$sections$news$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Berita';
	@override String get description => 'Artikel berita detail';
}

// Path: viewApi.sections.pressRelease
class _Translations$viewApi$sections$pressRelease$id implements Translations$viewApi$sections$pressRelease$en {
	_Translations$viewApi$sections$pressRelease$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Detail Siaran Pers';
	@override String get description => 'Siaran pers detail';
}

// Path: viewApi.sections.staticTable
class _Translations$viewApi$sections$staticTable$id implements Translations$viewApi$sections$staticTable$en {
	_Translations$viewApi$sections$staticTable$id._(this._root);

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
			'listApi.sections.glossary.title' => 'Glosarium',
			'listApi.sections.glossary.description' => 'Definisi istilah statistik',
			'listApi.sections.sdgIndicators.title' => 'Indikator SDG',
			'listApi.sections.sdgIndicators.description' => 'Indikator Tujuan Pembangunan Berkelanjutan',
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
			_ => null,
		} ?? switch (path) {
			'censusAreas.description' => 'Wilayah geografis yang tercakup dalam kegiatan sensus',
			'censusAreas.fields.id' => 'ID Wilayah',
			'censusAreas.fields.name' => 'Nama Wilayah',
			'censusAreas.fields.slug' => 'Slug',
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
			'glossary.title' => 'Glosarium',
			'glossary.parameters.title' => 'Parameter API',
			'glossary.parameters.domain' => 'Domain',
			'glossary.parameters.domainHint' => 'mis. 0000 untuk tingkat nasional',
			'glossary.parameters.keyword' => 'Kata kunci (opsional)',
			'glossary.parameters.keywordHint' => 'Filter berdasarkan kata kunci',
			'glossary.parameters.prefix' => 'Prefiks (opsional)',
			'glossary.parameters.prefixHint' => 'Pilih huruf A-Z',
			'glossary.parameters.page' => 'Halaman',
			'glossary.parameters.language' => 'Bahasa',
			'glossary.parameters.languageNote' => 'Diterapkan pada bahasa konten glosarium',
			'glossary.parameters.searchGlossary' => 'Cari Glosarium',
			'glossary.results.title' => 'Hasil Glosarium',
			'glossary.results.found' => 'Ditemukan {count} istilah',
			'glossary.results.empty' => 'Tidak ada istilah yang ditemukan untuk kriteria yang dipilih',
			'glossary.results.initial' => 'Konfigurasikan parameter dan klik "Cari Glosarium" untuk memulai',
			'glossary.results.searchParameters' => 'Parameter Pencarian',
			'glossary.education.title' => 'Tentang Glosarium',
			'glossary.education.description' => 'Jelajahi definisi istilah statistik BPS.',
			'glossary.education.parameters' => 'Parameter',
			'glossary.education.parametersDescription' => 'Filter berdasarkan kata kunci atau jelajahi berdasarkan alfabet (A-Z).',
			'glossary.education.results' => 'Hasil',
			'glossary.education.resultsDescription' => 'Setiap istilah menampilkan judul dan definisi lengkap.',
			'sdgIndicators.title' => 'Indikator SDG',
			'sdgIndicators.parameters.title' => 'Parameter API',
			'sdgIndicators.parameters.domain' => 'Domain',
			'sdgIndicators.parameters.domainHint' => 'mis. 0000 untuk tingkat nasional',
			'sdgIndicators.parameters.goal' => 'Tujuan SDG (1-17)',
			'sdgIndicators.parameters.goalHint' => 'Pilih nomor tujuan',
			'sdgIndicators.parameters.page' => 'Halaman',
			'sdgIndicators.parameters.language' => 'Bahasa',
			'sdgIndicators.parameters.languageNote' => 'Diterapkan pada bahasa konten indikator',
			'sdgIndicators.parameters.searchIndicators' => 'Cari Indikator',
			'sdgIndicators.results.title' => 'Hasil Indikator SDG',
			'sdgIndicators.results.found' => 'Ditemukan {count} indikator',
			'sdgIndicators.results.empty' => 'Tidak ada indikator yang ditemukan untuk kriteria yang dipilih',
			'sdgIndicators.results.initial' => 'Konfigurasikan parameter dan klik "Cari Indikator" untuk memulai',
			'sdgIndicators.results.searchParameters' => 'Parameter Pencarian',
			'sdgIndicators.education.title' => 'Tentang Indikator SDG',
			'sdgIndicators.education.description' => 'Jelajahi variabel BPS yang dipetakan ke 17 Tujuan Pembangunan Berkelanjutan PBB.',
			'sdgIndicators.education.parameters' => 'Parameter',
			'sdgIndicators.education.parametersDescription' => 'Pilih nomor tujuan (1-17) untuk memfilter indikator.',
			'sdgIndicators.education.results' => 'Hasil',
			'sdgIndicators.education.resultsDescription' => 'Setiap indikator menampilkan judul, kode SDG, nama tujuan, dan satuan.',
			_ => null,
		};
	}
}
