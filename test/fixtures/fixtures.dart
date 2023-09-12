import 'dart:convert';
import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

Map<String, dynamic> jsonFromFixture(String name) {
  final jsonString = fixture(name);
  final data = jsonDecode(jsonString) as Map<String, dynamic>;

  return data;
}
