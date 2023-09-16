import 'dart:convert';
import 'dart:io';

enum Fixture {
  domains('domain_fixture_available.json'),
  error('fixture_error.json'),
  infographics('infographic_fixture_available.json'),
  listUnavailable('fixture_list_unavailable.json'),
  news('news_fixture_available.json'),
  newsDetail('news_detail_fixture.json'),
  publications('publication_fixture_available.json'),
  publicationDetail('publication_detail_fixture.json'),
  staticTables('static_table_fixture_available.json'),
  staticTableDetail('static_table_detail_fixture.json'),
  unavailable('fixture_unavailable.json');

  const Fixture(this.value);

  final String value;
}

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

Map<String, dynamic> jsonFromFixture(String name) {
  final jsonString = fixture(name);
  final data = jsonDecode(jsonString) as Map<String, dynamic>;

  return data;
}
