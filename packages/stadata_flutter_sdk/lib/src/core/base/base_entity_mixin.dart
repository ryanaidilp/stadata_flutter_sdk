/// A mixin that helps implement equality
/// without needing to explicitly override [operator ==] and [hashCode].
///
/// Like with extending [BaseEntity], the [BaseEntityMixin] overrides the
/// [operator ==] as well as the [hashCode] based on the provided [props].

part of 'base_entity.dart';

mixin BaseEntityMixin {
  /// {@macro equatable_props}
  List<Object?> get props;

  /// {@macro equatable_stringify}
  // ignore: avoid_returning_null
  bool? get stringify => null;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is BaseEntityMixin &&
            runtimeType == other.runtimeType &&
            _equals(props, other.props);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ _mapPropsToHashCode(props);

  @override
  String toString() {
    switch (stringify) {
      case true:
        return _mapPropsToString(runtimeType, props);
      case false:
        return '$runtimeType';
      default:
        return BaseEntityConfig.stringify == true
            ? _mapPropsToString(runtimeType, props)
            : '$runtimeType';
    }
  }
}
