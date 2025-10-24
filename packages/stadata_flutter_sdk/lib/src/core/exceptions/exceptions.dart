// Custom exception for handling API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() =>
      'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}

class StadataException implements Exception {
  const StadataException({required this.message});

  final String message;

  @override
  String toString() => 'StadataException - $message';
}

class ApiKeyNotFoundException extends StadataException {
  const ApiKeyNotFoundException({super.message = 'API Key not found!'});
}

class DomainException extends StadataException {
  const DomainException({
    super.message = 'There is something wrong with domain data!',
  });
}

class DomainNotAvailableException extends DomainException {
  const DomainNotAvailableException({super.message = 'Domain not available!'});
}

class DomainProvinceCodeException extends DomainException {
  const DomainProvinceCodeException({
    super.message =
        'Province code must be provided if type is regency by province!',
  });
}

class PublicationException extends StadataException {
  const PublicationException({
    super.message = 'There is something wrong with Publication data!',
  });
}

class PublicationNotAvailableException extends PublicationException {
  const PublicationNotAvailableException({
    super.message = 'Publication not available!',
  });
}

class InfographicException extends StadataException {
  const InfographicException({
    super.message = 'There is something wrong with infographic data!',
  });
}

class InfographicNotAvailableException extends InfographicException {
  const InfographicNotAvailableException({
    super.message = 'Infographic not available!',
  });
}

class StaticTableException extends StadataException {
  const StaticTableException({
    super.message = 'There is something wrong with Static Table data!',
  });
}

class StaticTableNotAvailableException extends StaticTableException {
  const StaticTableNotAvailableException({
    super.message = 'Static Table not available!',
  });
}

class NewsException extends StadataException {
  const NewsException({
    super.message = 'There is something wrong with News data!',
  });
}

class NewsNotAvailableException extends NewsException {
  const NewsNotAvailableException({super.message = 'News not available!'});
}

class NewsCategoryException extends StadataException {
  const NewsCategoryException({
    super.message = 'There is something wrong with News Category data!',
  });
}

class NewsCategoryNotAvailableException extends NewsCategoryException {
  const NewsCategoryNotAvailableException({
    super.message = 'News Category not available!',
  });
}

class SubjectCategoryException extends StadataException {
  const SubjectCategoryException({
    super.message = 'There is something wrong with Subject Category data!',
  });
}

class SubjectCategoryNotAvailableException extends SubjectCategoryException {
  const SubjectCategoryNotAvailableException({
    super.message = 'Subject Category not available!',
  });
}

class SubjectException extends StadataException {
  const SubjectException({
    super.message = 'There is something wrong with Subject data!',
  });
}

class SubjectNotAvailableException extends SubjectException {
  const SubjectNotAvailableException({
    super.message = 'Subject not available!',
  });
}

class PressReleaseException extends StadataException {
  const PressReleaseException({
    super.message = 'There is something wrong with Press Release data!',
  });
}

class PressReleaseNotAvailableException extends PressReleaseException {
  const PressReleaseNotAvailableException({
    super.message = 'Press Release not available!',
  });
}

class StrategicIndicatorException extends StadataException {
  const StrategicIndicatorException({
    super.message = 'There is something wrong with Strategic Indicator data!',
  });
}

class StrategicIndicatorNotAvailableException
    extends StrategicIndicatorException {
  const StrategicIndicatorNotAvailableException({
    super.message = 'Strategic Indicator not available!',
  });
}

class VariableException extends StadataException {
  const VariableException({
    super.message = 'There is something wrong with Variable data!',
  });
}

class VariableNotAvailableException extends VariableException {
  const VariableNotAvailableException({
    super.message = 'Variable not available!',
  });
}

class VerticalVariableException extends StadataException {
  const VerticalVariableException({
    super.message = 'There is something wrong with Vertical Variable data!',
  });
}

class VerticalVariableNotAvailableException extends VerticalVariableException {
  const VerticalVariableNotAvailableException({
    super.message = 'Vertical Variable not available!',
  });
}

class UnitException extends StadataException {
  const UnitException({
    super.message = 'There is something wrong with Unit data!',
  });
}

class UnitNotAvailableException extends UnitException {
  const UnitNotAvailableException({super.message = 'Unit not available!'});
}

class StatisticClassificationException extends StadataException {
  const StatisticClassificationException({
    super.message =
        'There is something wrong with Statistic Classification data!',
  });
}

class StatisticClassificationNotAvailableException
    extends StatisticClassificationException {
  const StatisticClassificationNotAvailableException({
    super.message = 'Statistic Classification not available!',
  });
}

class CensusDataException extends StadataException {
  const CensusDataException({
    super.message = 'There is something wrong with Census Data!',
  });
}

class CensusDataNotAvailableException extends CensusDataException {
  const CensusDataNotAvailableException({
    super.message = 'Census Data not available!',
  });
}

class CensusTopicException extends StadataException {
  const CensusTopicException({
    super.message = 'There is something wrong with Census Topic data!',
  });
}

class CensusTopicNotAvailableException extends CensusTopicException {
  const CensusTopicNotAvailableException({
    super.message = 'Census Topic not available!',
  });
}

class CensusAreaException extends StadataException {
  const CensusAreaException({
    super.message = 'There is something wrong with Census Area data!',
  });
}

class CensusAreaNotAvailableException extends CensusAreaException {
  const CensusAreaNotAvailableException({
    super.message = 'Census Area not available!',
  });
}

class CensusDatasetException extends StadataException {
  const CensusDatasetException({
    super.message = 'There is something wrong with Census Dataset data!',
  });
}

class CensusDatasetNotAvailableException extends CensusDatasetException {
  const CensusDatasetNotAvailableException({
    super.message = 'Census Dataset not available!',
  });
}

class PeriodException extends StadataException {
  const PeriodException({
    super.message = 'There is something wrong with Period data!',
  });
}

class PeriodNotAvailableException extends PeriodException {
  const PeriodNotAvailableException({
    super.message = 'Period not available!',
  });
}

class DerivedPeriodException extends StadataException {
  const DerivedPeriodException({
    super.message = 'There is something wrong with Derived Period data!',
  });
}

class DerivedPeriodNotAvailableException extends DerivedPeriodException {
  const DerivedPeriodNotAvailableException({
    super.message = 'Derived Period not available!',
  });
}

class DerivedVariableException extends StadataException {
  const DerivedVariableException({
    super.message = 'There is something wrong with Derived Variable data!',
  });
}

class DerivedVariableNotAvailableException extends DerivedVariableException {
  const DerivedVariableNotAvailableException({
    super.message = 'Derived Variable not available!',
  });
}
