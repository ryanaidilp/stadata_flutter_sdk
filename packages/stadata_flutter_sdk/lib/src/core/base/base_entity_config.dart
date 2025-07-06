// Configuration class with only static members for BaseEntity setup
// Asserts without message are acceptable for internal configuration validation
// ignore_for_file: avoid_classes_with_only_static_members, prefer_asserts_with_message

part of 'base_entity.dart';

/// The default configurion for all [BaseEntity] instances.
///
/// Currently, this config class only supports setting a default value for
/// [stringify].
///
/// See also:
/// * [BaseEntityConfig.stringify]
class BaseEntityConfig {
  /// {@template stringify}
  /// Global [stringify] setting for all [BaseEntity] instances.
  ///
  /// If [stringify] is overridden for a particular [BaseEntity] instance,
  /// then the local [stringify] value takes precedence
  /// over [BaseEntityConfig.stringify].
  ///
  /// This value defaults to true in debug mode and false in release mode.
  /// {@endtemplate}
  static bool get stringify {
    if (_stringify == null) {
      assert(() {
        _stringify = true;
        return true;
      }());
    }
    return _stringify ??= false;
  }

  /// {@macro stringify}
  static set stringify(bool value) => _stringify = value;

  static bool? _stringify;
}
