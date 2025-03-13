import 'dart:convert';
import 'dart:io';

enum Fixture {
  census('census_list_fixture.json'),
  domains('domain_list_fixture.json'),
  error('error_fixture.json'),
  infographics('infographic_list_fixture.json'),
  listUnavailable('list_unavailable_fixture.json'),
  news('news_list_fixture.json'),
  newsCategory('news_category_list_fixture.json'),
  newsDetail('news_detail_fixture.json'),
  publications('publication_list_fixture.json'),
  publicationDetail('publication_detail_fixture.json'),
  pressReleases('press_release_list_fixture.json'),
  pressReleaseDetail('press_release_detail_fixture.json'),
  staticTables('static_table_list_fixture.json'),
  staticTableDetail('static_table_detail_fixture.json'),
  statisticClassification('statistic_classification_list_fixture.json'),
  statisticClassificationDetail('statistic_classification_detail_fixture.json'),
  strategicIndicators('strategic_indicator_list_fixture.json'),
  subjectCategories('subject_category_list_fixture.json'),
  subjects('subject_list_fixture.json'),
  unavailable('unavailable_fixture.json'),
  units('unit_list_fixture.json'),
  variables('variable_list_fixture.json'),
  verticalVariables('vertical_variable_list_fixture.json');

  const Fixture(this.value);

  final String value;
}

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

Map<String, dynamic> jsonFromFixture(Fixture name) {
  final jsonString = fixture(name.value);
  final data = jsonDecode(jsonString) as Map<String, dynamic>;

  return data;
}
