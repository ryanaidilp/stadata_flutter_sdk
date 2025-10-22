/// A mixin that helps implement equality

part of 'base_entity.dart';

mixin BaseEntityMixin {
  /// {@macro equatable_props}
  List<Object?> get props;

  /// {@macro equatable_stringify}
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
        return BaseEntityConfig.stringify
            ? _mapPropsToString(runtimeType, props)
            : '$runtimeType';
    }
  }
}
