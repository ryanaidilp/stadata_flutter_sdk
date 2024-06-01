// ignore_for_file: avoid_dynamic_calls

import 'package:collection/collection.dart';

import 'package:flutter/foundation.dart';

part 'base_entity_config.dart';
part 'base_entity_mixin.dart';
part 'base_entity_utils.dart';

@immutable
abstract class BaseEntity {
  /// {@macro entity}
  const BaseEntity();

  /// {@template entity_props}
  /// The list of properties that will be used to determine whether
  /// two instances are equal
  /// {@endtemplate}
  List<Object?> get props;

  /// {@template entity_stringify}
  /// If set to `true`, the [toString] method will be overridden to output
  /// this instance's [props].
  ///
  /// A global default value for [stringify] can be set using
  /// `BaseEntityConfig.stringify`.
  ///
  /// If this instance's [stringify] is set to null, the value of
  /// `BaseEntityConfig.stringify` will be used instead. This defaults to
  /// `false`.
  /// {@endtemplate}
  // ignore: avoid_returning_null
  bool? get stringify => null;

  @override
  int get hashCode => runtimeType.hashCode ^ _mapPropsToHashCode(props);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseEntity &&
          runtimeType == other.runtimeType &&
          _equals(props, other.props);
}
