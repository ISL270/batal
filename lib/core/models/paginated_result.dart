import 'package:batal_core/core/constants/default.dart';

final class PaginatedResult<T> {
  final int page;
  final int pageSize;
  final List<T> result;
  final bool hasReachedMax;

  const PaginatedResult({
    this.page = 0,
    this.result = const [],
    this.hasReachedMax = false,
    this.pageSize = Default.pageSize,
  });

  PaginatedResult<T> copyWith({
    int? page,
    bool? hasReachedMax,
  }) {
    return PaginatedResult<T>(
      result: result,
      pageSize: pageSize,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  PaginatedResult<T> appendResult(Iterable<T> result, {required bool hasReachedMax}) {
    this.result.addAll(result);
    return copyWith(
      page: page + 1,
      hasReachedMax: hasReachedMax,
    );
  }
}
