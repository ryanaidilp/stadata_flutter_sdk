// ignore_for_file: public_member_api_docs

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
  const NewsNotAvailableException({
    super.message = 'News not available!',
  });
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

class SubjectNotAvailableException extends SubjectCategoryException {
  const SubjectNotAvailableException({
    super.message = 'Subject not available!',
  });
}

class PressReleaseException extends StadataException {
  const PressReleaseException({
    super.message = 'There is something wrong with Press Release data!',
  });
}

class PressReleaseNotAvailableException extends SubjectCategoryException {
  const PressReleaseNotAvailableException({
    super.message = 'Press Release not available!',
  });
}
