import 'package:injectable/injectable.dart';
import 'package:stadata_example/config/env.dart';
import 'package:stadata_example/core/utils/debouncer.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_example/shared/data/models/request_details.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

// Custom state to handle category loading updates
class NewsState extends BaseState {
  const NewsState({required this.baseState, this.stateVersion = 0});

  final BaseState baseState;
  final int stateVersion;

  @override
  List<Object?> get props => [baseState, stateVersion];
}

@injectable
class NewsCubit extends BaseCubit<BaseState> {
  NewsCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;
  String _currentDomain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  String? _keyword;
  String? _newsCategoryID;
  int? _month;
  int? _year;
  RequestDetails? _lastRequestDetails;
  final Debouncer _debouncer = Debouncer(
    delay: const Duration(milliseconds: 800),
  );

  // News categories state
  List<NewsCategory> _newsCategories = [];
  bool _categoriesLoading = false;
  String? _categoriesError;

  // State change counter to force rebuilds
  int _stateVersion = 0;

  String get currentDomain => _currentDomain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  String? get keyword => _keyword;
  String? get newsCategoryID => _newsCategoryID;
  int? get month => _month;
  int? get year => _year;
  RequestDetails? get lastRequestDetails => _lastRequestDetails;

  // News categories getters
  List<NewsCategory> get newsCategories => _newsCategories;
  bool get categoriesLoading => _categoriesLoading;
  String? get categoriesError => _categoriesError;

  /// Check if all required parameters are valid
  bool get canLoadData {
    return _currentDomain.trim().isNotEmpty &&
        _currentDomain.trim().length >= 4;
  }

  /// Get validation error message
  String? get validationError {
    if (_currentDomain.trim().isEmpty) {
      // Note: For simplicity, we're using a hardcoded message here
      // In a production app, you'd want to inject a translation service
      return 'Domain is required';
    }
    if (_currentDomain.trim().length < 4) {
      return 'Domain must be at least 4 characters';
    }
    return null;
  }

  void initialize() {
    // Don't auto-load data anymore, let user manually trigger it
    // This makes the UI more educational and deliberate
    // Load news categories for the dropdown
    loadNewsCategories();
  }

  void changeDomain(String domain) {
    _currentDomain = domain;
    // Reset pagination when domain changes
    _currentPage = 1;
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
    // Reload categories for new domain with debounce
    _debouncer.run(loadNewsCategories);
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    // Reset pagination when language changes
    _currentPage = 1;
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
    // Reload categories for new language with debounce
    _debouncer.run(loadNewsCategories);
  }

  void setKeyword(String? keyword) {
    _keyword = keyword?.trim().isEmpty ?? false ? null : keyword?.trim();
    // Reset pagination when keyword changes
    _currentPage = 1;
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setNewsCategoryID(String? categoryID) {
    _newsCategoryID =
        categoryID?.trim().isEmpty ?? false ? null : categoryID?.trim();
    // Reset pagination when category changes
    _currentPage = 1;
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setMonth(int? month) {
    _month = month;
    // Reset pagination when month changes
    _currentPage = 1;
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setYear(int? year) {
    _year = year;
    // Reset pagination when year changes
    _currentPage = 1;
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void setPage(int page) {
    _currentPage = page;
    // This method only updates the page parameter without triggering data load
    // Used for parameter panel text field changes
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  Future<void> loadData() async {
    if (!canLoadData) {
      return;
    }

    emit(const LoadingState());

    final stopwatch = Stopwatch()..start();

    try {
      // Build request details for tracking
      final parameters = <String, dynamic>{
        'domain': _currentDomain,
        'lang': _currentLanguage.value,
        'page': _currentPage,
        if (_keyword != null) 'keyword': _keyword,
        if (_newsCategoryID != null) 'newsCategoryID': _newsCategoryID,
        if (_month != null) 'month': _month,
        if (_year != null) 'year': _year,
        'key': Env.apiKey,
      };

      const baseUrl = 'https://webapi.bps.go.id/v1/api/list/news';
      final queryParams = parameters.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      final fullUrl = '$baseUrl?$queryParams';

      final result = await _stadataFlutter.list.news(
        domain: _currentDomain,
        lang: _currentLanguage,
        page: _currentPage,
        keyword: _keyword,
        newsCategoryID: _newsCategoryID,
        month: _month,
        year: _year,
      );

      stopwatch.stop();

      // Store request details
      _lastRequestDetails = RequestDetails(
        url: fullUrl,
        method: 'GET',
        parameters: parameters,
        responseTime: stopwatch.elapsed,
      );

      emit(LoadedState<List<News>>(result.data));
    } catch (error) {
      stopwatch.stop();
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> refresh() async {
    await loadData();
  }

  /// Navigate to next page and trigger data loading
  /// Should only be used for explicit navigation actions (e.g., pagination buttons in results)
  void nextPage() {
    _currentPage = _currentPage + 1;
    loadData(); // Explicit load when user clicks next
  }

  /// Navigate to previous page and trigger data loading
  /// Should only be used for explicit navigation actions (e.g., pagination buttons in results)
  void previousPage() {
    if (_currentPage > 1) {
      _currentPage = _currentPage - 1;
      loadData(); // Explicit load when user clicks previous
    }
  }

  // Helper method to extract base state from NewsState or return as is
  BaseState _extractBaseState(BaseState state) {
    if (state is NewsState) {
      return state.baseState;
    }
    return state;
  }

  Future<void> loadNewsCategories() async {
    _categoriesLoading = true;
    _categoriesError = null;
    _stateVersion++;

    // Emit NewsState with updated version to force rebuild
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );

    try {
      final result = await _stadataFlutter.list.newsCategories(
        domain: _currentDomain,
        lang: _currentLanguage,
      );
      _newsCategories = result.data;
      _categoriesLoading = false;
      _categoriesError = null;
    } catch (error) {
      _categoriesLoading = false;
      _categoriesError = error.toString();
      _newsCategories = [];
    }

    _stateVersion++;
    // Emit NewsState with updated version to force rebuild
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  void clearFilters() {
    _keyword = null;
    _newsCategoryID = null;
    _month = null;
    _year = null;
    _currentPage = 1;
    _stateVersion++;
    emit(
      NewsState(
        baseState: _extractBaseState(state),
        stateVersion: _stateVersion,
      ),
    );
  }

  @override
  Future<void> close() {
    _debouncer.dispose();
    return super.close();
  }
}
