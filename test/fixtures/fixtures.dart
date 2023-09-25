import 'dart:convert';
import 'dart:io';

enum Fixture {
  domains('domain_list_fixture.json'),
  error('error_fixture.json'),
  infographics('infographic_list_fixture.json'),
  listUnavailable('list_unavailable_fixture.json'),
  news('news_list_fixture.json'),
  newsCategory('news_category_list_fixture.json'),
  newsDetail('news_detail_fixture.json'),
  publications('publication_list_fixture.json'),
  publicationDetail('publication_detail_fixture.json'),
  staticTables('static_table_list_fixture.json'),
  staticTableDetail('static_table_detail_fixture.json'),
  subjectCategories('subject_category_list_fixture.json'),
  subjects('subject_list_fixture.json'),
  unavailable('unavailable_fixture.json');

  const Fixture(this.value);

  final String value;
}

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

Map<String, dynamic> jsonFromFixture(String name) {
  final jsonString = fixture(name);
  final data = jsonDecode(jsonString) as Map<String, dynamic>;

  return data;
}
