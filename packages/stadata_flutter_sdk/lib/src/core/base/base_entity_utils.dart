// Utility functions require dynamic calls for generic collection comparison
// ignore_for_file: avoid_dynamic_calls

part of 'base_entity.dart';

const DeepCollectionEquality _equality = DeepCollectionEquality();

bool _equals(List<dynamic>? list1, List<dynamic>? list2) {
  if (identical(list1, list2)) return true;
  if (list1 == null || list2 == null) return false;
  final length = list1.length;
  if (length != list2.length) return false;

  for (var i = 0; i < length; i++) {
    final dynamic unit1 = list1[i];
    final dynamic unit2 = list2[i];

    if (_isBaseEntity(unit1) && _isBaseEntity(unit2)) {
      if (unit1 != unit2) return false;
    } else if (unit1 is Iterable || unit1 is Map) {
      if (!_equality.equals(unit1, unit2)) return false;
    } else if (unit1?.runtimeType != unit2?.runtimeType) {
      return false;
    } else if (unit1 != unit2) {
      return false;
    }
  }
  return true;
}

bool _isBaseEntity(dynamic object) {
  return object is BaseEntity || object is BaseEntityMixin;
}

int _mapPropsToHashCode(Iterable<dynamic>? props) =>
    _finish(props == null ? 0 : props.fold(0, _combine));

int _finish(int hash) {
  var currentHash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  currentHash = currentHash ^ (currentHash >> 11);
  return 0x1fffffff & (currentHash + ((0x00003fff & currentHash) << 15));
}

int _combine(int hash, dynamic object) {
  var currentHash = hash;
  var currentObject = object;
  if (object is Map) {
    object.keys
        .sorted((dynamic a, dynamic b) => a.hashCode - b.hashCode)
        .forEach((dynamic key) {
          currentHash =
              currentHash ^ _combine(currentHash, <dynamic>[key, object[key]]);
        });
    return hash;
  }
  if (object is Set) {
    currentObject = (currentObject as Set).sorted(
      (dynamic a, dynamic b) => a.hashCode - b.hashCode,
    );
  }
  if (object is Iterable) {
    for (final value in object) {
      currentHash = currentHash ^ _combine(currentHash, value);
    }
    return currentHash ^ object.length;
  }

  currentHash = 0x1fffffff & (currentHash + currentObject.hashCode);
  currentHash = 0x1fffffff & (currentHash + ((0x0007ffff & currentHash) << 10));
  return currentHash ^ (currentHash >> 6);
}

/// Returns a string for [props].
String _mapPropsToString(Type runtimeType, List<Object?> props) =>
    '$runtimeType(${props.map((prop) => prop.toString()).join(', ')})';
