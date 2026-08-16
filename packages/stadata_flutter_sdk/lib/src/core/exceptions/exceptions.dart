// Custom exception for handling API errors
class ApiException(final String message, [final int? statusCode])
    implements Exception {
  @override
  String toString() =>
      'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}

class const StadataException({required final String message})
    implements Exception {
  @override
  String toString() => 'StadataException - $message';
}

class const ApiKeyNotFoundException({super.message = 'API Key not found!'})
    extends StadataException;

class const DomainException({
  super.message = 'There is something wrong with domain data!',
}) extends StadataException;

class const DomainNotAvailableException({
  super.message = 'Domain not available!',
}) extends DomainException;

class const DomainProvinceCodeException({
  super.message =
      'Province code must be provided if type is regency by province!',
}) extends DomainException;

class const PublicationException({
  super.message = 'There is something wrong with Publication data!',
}) extends StadataException;

class const PublicationNotAvailableException({
  super.message = 'Publication not available!',
}) extends PublicationException;

class const InfographicException({
  super.message = 'There is something wrong with infographic data!',
}) extends StadataException;

class const InfographicNotAvailableException({
  super.message = 'Infographic not available!',
}) extends InfographicException;

class const StaticTableException({
  super.message = 'There is something wrong with Static Table data!',
}) extends StadataException;

class const StaticTableNotAvailableException({
  super.message = 'Static Table not available!',
}) extends StaticTableException;

class const NewsException({
  super.message = 'There is something wrong with News data!',
}) extends StadataException;

class const NewsNotAvailableException({super.message = 'News not available!'})
    extends NewsException;

class const NewsCategoryException({
  super.message = 'There is something wrong with News Category data!',
}) extends StadataException;

class const NewsCategoryNotAvailableException({
  super.message = 'News Category not available!',
}) extends NewsCategoryException;

class const SubjectCategoryException({
  super.message = 'There is something wrong with Subject Category data!',
}) extends StadataException;

class const SubjectCategoryNotAvailableException({
  super.message = 'Subject Category not available!',
}) extends SubjectCategoryException;

class const SubjectException({
  super.message = 'There is something wrong with Subject data!',
}) extends StadataException;

class const SubjectNotAvailableException({
  super.message = 'Subject not available!',
}) extends SubjectException;

class const PressReleaseException({
  super.message = 'There is something wrong with Press Release data!',
}) extends StadataException;

class const PressReleaseNotAvailableException({
  super.message = 'Press Release not available!',
}) extends PressReleaseException;

class const StrategicIndicatorException({
  super.message = 'There is something wrong with Strategic Indicator data!',
}) extends StadataException;

class const StrategicIndicatorNotAvailableException({
  super.message = 'Strategic Indicator not available!',
}) extends StrategicIndicatorException;

class const VariableException({
  super.message = 'There is something wrong with Variable data!',
}) extends StadataException;

class const VariableNotAvailableException({
  super.message = 'Variable not available!',
}) extends VariableException;

class const VerticalVariableException({
  super.message = 'There is something wrong with Vertical Variable data!',
}) extends StadataException;

class const VerticalVariableNotAvailableException({
  super.message = 'Vertical Variable not available!',
}) extends VerticalVariableException;

class const UnitException({
  super.message = 'There is something wrong with Unit data!',
}) extends StadataException;

class const UnitNotAvailableException({super.message = 'Unit not available!'})
    extends UnitException;

class const StatisticClassificationException({
  super.message =
      'There is something wrong with Statistic Classification data!',
}) extends StadataException;

class const StatisticClassificationNotAvailableException({
  super.message = 'Statistic Classification not available!',
}) extends StatisticClassificationException;

class const DynamicTableException({
  super.message = 'There is something wrong with Dynamic Table data!',
}) extends StadataException;

class const DynamicTableNotAvailableException({
  super.message = 'Dynamic Table not available!',
}) extends DynamicTableException;

class const CensusDataException({
  super.message = 'There is something wrong with Census Data!',
}) extends StadataException;

class const CensusDataNotAvailableException({
  super.message = 'Census Data not available!',
}) extends CensusDataException;

class const CensusTopicException({
  super.message = 'There is something wrong with Census Topic data!',
}) extends StadataException;

class const CensusTopicNotAvailableException({
  super.message = 'Census Topic not available!',
}) extends CensusTopicException;

class const CensusAreaException({
  super.message = 'There is something wrong with Census Area data!',
}) extends StadataException;

class const CensusAreaNotAvailableException({
  super.message = 'Census Area not available!',
}) extends CensusAreaException;

class const CensusDatasetException({
  super.message = 'There is something wrong with Census Dataset data!',
}) extends StadataException;

class const CensusDatasetNotAvailableException({
  super.message = 'Census Dataset not available!',
}) extends CensusDatasetException;

class const PeriodException({
  super.message = 'There is something wrong with Period data!',
}) extends StadataException;

class const PeriodNotAvailableException({
  super.message = 'Period not available!',
}) extends PeriodException;

class const DerivedPeriodException({
  super.message = 'There is something wrong with DerivedPeriod data!',
}) extends StadataException;

class const DerivedPeriodNotAvailableException({
  super.message = 'DerivedPeriod not available!',
}) extends DerivedPeriodException;

class const DerivedVariableException({
  super.message = 'There is something wrong with DerivedVariable data!',
}) extends StadataException;

class const DerivedVariableNotAvailableException({
  super.message = 'DerivedVariable not available!',
}) extends DerivedVariableException;

class const TableException({
  super.message = 'There is something wrong with Table data!',
}) extends StadataException;

class const TableNotAvailableException({
  super.message = 'Table not available!',
}) extends TableException;

class const TableNotFoundException({
  super.message = 'Table not found in any endpoint!',
}) extends TableException;

class const TradeException({
  super.message = 'There is something wrong with Trade data!',
}) extends StadataException;

class const TradeNotAvailableException({
  super.message = 'Trade data not available!',
}) extends TradeException;

class const GlossaryException({
  super.message = 'There is something wrong with Glossary data!',
}) extends StadataException;

class const GlossaryNotAvailableException({
  super.message = 'Glossary not available!',
}) extends GlossaryException;

class const SdgException({
  super.message = 'There is something wrong with SDG Indicator data!',
}) extends StadataException;

class const SdgNotAvailableException({
  super.message = 'SDG Indicator not available!',
}) extends SdgException;
