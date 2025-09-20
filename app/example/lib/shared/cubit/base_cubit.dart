import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

// Base state classes
abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class InitialState extends BaseState {
  const InitialState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class LoadedState<T> extends BaseState {
  const LoadedState(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

class ErrorState extends BaseState {
  const ErrorState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

// Paginated state for lists
class PaginatedState<T> extends BaseState {
  const PaginatedState({
    required this.items,
    required this.hasMore,
    required this.isLoadingMore,
    this.currentPage = 1,
    this.totalPages = 0,
    this.totalItems = 0,
  });

  final List<T> items;
  final bool hasMore;
  final bool isLoadingMore;
  final int currentPage;
  final int totalPages;
  final int totalItems;

  @override
  List<Object?> get props => [
    items,
    hasMore,
    isLoadingMore,
    currentPage,
    totalPages,
    totalItems,
  ];

  PaginatedState<T> copyWith({
    List<T>? items,
    bool? hasMore,
    bool? isLoadingMore,
    int? currentPage,
    int? totalPages,
    int? totalItems,
  }) {
    return PaginatedState<T>(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

// Base cubit class
abstract class BaseCubit<T extends BaseState> extends Cubit<T> {
  BaseCubit(super.initialState);

  /// Handle API failures and convert them to error states
  void handleFailure(Failure failure) {
    emit(ErrorState(failure.message) as T);
  }

  /// Execute a function safely with error handling
  Future<void> safeExecute(Future<void> Function() function) async {
    try {
      await function();
    } catch (error) {
      emit(ErrorState(error.toString()) as T);
    }
  }
}

// List cubit base class for paginated data
abstract class BaseListCubit<T> extends Cubit<BaseState> {
  BaseListCubit() : super(const InitialState());

  List<T> _items = [];
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  List<T> get items => _items;
  int get currentPage => _currentPage;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;

  /// Load initial data
  Future<void> loadData({bool refresh = false}) async {
    if (refresh) {
      _reset();
    }

    if (state is LoadingState && !refresh) return;

    emit(const LoadingState());

    try {
      final result = await fetchData(page: 1);
      result.when(
        failure: (failure) => handleFailure(failure),
        success: (response) {
          _items = response.data;
          _currentPage = 1;
          _hasMore =
              response.pagination != null
                  ? response.data.length >= (response.pagination?.perPage ?? 10)
                  : false;

          emit(
            PaginatedState<T>(
              items: _items,
              hasMore: _hasMore,
              isLoadingMore: false,
              currentPage: _currentPage,
              totalPages: response.pagination?.pages ?? 1,
              totalItems: response.pagination?.total ?? response.data.length,
            ),
          );
        },
      );
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }

  /// Load more data for pagination
  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _emitCurrentState();

    try {
      final result = await fetchData(page: _currentPage + 1);
      result.when(
        failure: (failure) {
          _isLoadingMore = false;
          handleFailure(failure);
        },
        success: (response) {
          _items.addAll(response.data);
          _currentPage++;
          _hasMore =
              response.pagination != null
                  ? response.data.length >= (response.pagination?.perPage ?? 10)
                  : false;
          _isLoadingMore = false;

          emit(
            PaginatedState<T>(
              items: _items,
              hasMore: _hasMore,
              isLoadingMore: false,
              currentPage: _currentPage,
              totalPages: response.pagination?.pages ?? 1,
              totalItems: response.pagination?.total ?? _items.length,
            ),
          );
        },
      );
    } catch (error) {
      _isLoadingMore = false;
      emit(ErrorState(error.toString()));
    }
  }

  /// Refresh data
  Future<void> refresh() async {
    await loadData(refresh: true);
  }

  /// Reset internal state
  void _reset() {
    _items.clear();
    _currentPage = 1;
    _isLoadingMore = false;
    _hasMore = true;
  }

  /// Emit current state with updated loading status
  void _emitCurrentState() {
    if (state is PaginatedState<T>) {
      final currentState = state as PaginatedState<T>;
      emit(currentState.copyWith(isLoadingMore: _isLoadingMore));
    }
  }

  /// Handle API failures
  void handleFailure(Failure failure) {
    emit(ErrorState(failure.message));
  }

  /// Abstract method to fetch data - must be implemented by subclasses
  Future<Result<Failure, ListResult<T>>> fetchData({required int page});
}
