import 'package:injectable/injectable.dart';
import 'package:stadata_example/core/validators/validators.dart';
import 'package:stadata_example/shared/cubit/base_cubit.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

@injectable
class VariablesCubit extends BaseCubit<BaseState> {
  VariablesCubit(this._stadataFlutter) : super(const InitialState());

  final StadataFlutter _stadataFlutter;

  String? _domain = '7200';
  DataLanguage _currentLanguage = DataLanguage.id;
  int _currentPage = 1;
  int _totalPages = 1;
  bool _showExistingVariables = false;
  int? _year;
  int? _subjectID;
  List<Variable> _variables = [];
  List<Subject> _subjects = [];

  String? get domain => _domain;
  DataLanguage get currentLanguage => _currentLanguage;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get showExistingVariables => _showExistingVariables;
  int? get year => _year;
  int? get subjectID => _subjectID;
  List<Variable> get variables => _variables;
  List<Subject> get subjects => _subjects;

  bool get canLoadData {
    return DomainValidator.isValid(_domain);
  }

  String? get validationError {
    return DomainValidator.validate(_domain);
  }

  bool get hasNextPage {
    return _currentPage < _totalPages;
  }

  bool get hasPreviousPage {
    return _currentPage > 1;
  }

  void initialize() {
    // Load subjects for default domain
    loadSubjects();
  }

  void setDomain(String? domain) {
    _domain = domain;
    _currentPage = 1;
    _totalPages = 1;
    _variables = [];
    _subjects = [];
    _subjectID = null;

    // Load subjects when domain is valid
    if (DomainValidator.isValid(domain)) {
      // Don't emit here, let loadSubjects handle it
      loadSubjects();
    } else {
      emit(const InitialState());
    }
  }

  void changeLanguage(DataLanguage language) {
    _currentLanguage = language;
    _currentPage = 1;
    emit(const InitialState());
  }

  void setShowExistingVariables(bool value) {
    _showExistingVariables = value;
    emit(const InitialState());
  }

  void setYear(int? year) {
    _year = year;
    emit(const InitialState());
  }

  void setSubjectID(int? subjectID) {
    _subjectID = subjectID;
    emit(const InitialState());
  }

  Future<void> loadData({int? page}) async {
    if (!canLoadData) {
      return;
    }

    final targetPage = page ?? _currentPage;
    emit(const LoadingState());

    try {
      final result = await _stadataFlutter.list.variables(
        domain: _domain!,
        lang: _currentLanguage,
        page: targetPage,
        showExistingVariables: _showExistingVariables,
        year: _year,
        subjectID: _subjectID,
      );

      _variables = result.data;
      _totalPages = result.pagination?.pages ?? 1;
      _currentPage = targetPage;

      emit(LoadedState<List<Variable>>(_variables));
    } on Exception catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  Future<void> nextPage() async {
    if (hasNextPage) {
      await loadData(page: _currentPage + 1);
    }
  }

  Future<void> previousPage() async {
    if (hasPreviousPage) {
      await loadData(page: _currentPage - 1);
    }
  }

  Future<void> refresh() async {
    await loadData(page: _currentPage);
  }

  Future<void> loadSubjects() async {
    // ignore: avoid_print
    print('=== loadSubjects called ===');
    // ignore: avoid_print
    print('Domain: $_domain');
    // ignore: avoid_print
    print('Is valid: ${DomainValidator.isValid(_domain)}');

    if (!DomainValidator.isValid(_domain)) {
      // ignore: avoid_print
      print('Domain validation failed, not loading subjects');
      return;
    }

    try {
      // ignore: avoid_print
      print(
        'Calling subjects API with domain: $_domain, lang: $_currentLanguage',
      );

      final result = await _stadataFlutter.list.subjects(
        domain: _domain!,
        lang: _currentLanguage,
      );

      // ignore: avoid_print
      print('Subjects API response: ${result.data.length} subjects loaded');
      // ignore: avoid_print
      print(
        'First 3 subjects: ${result.data.take(3).map((s) => s.name).toList()}',
      );

      _subjects = result.data;
      emit(const InitialState());

      // ignore: avoid_print
      print('Subjects stored and state emitted');
    } catch (error, stackTrace) {
      // Log error for debugging but don't fail the form
      // ignore: avoid_print
      print('!!! Error loading subjects: $error');
      // ignore: avoid_print
      print('Stack trace: $stackTrace');
      _subjects = [];
      emit(const InitialState());
    }
  }
}
