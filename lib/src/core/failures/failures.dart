// ignore_for_file: public_member_api_docs

sealed class Failure {
  const Failure({required this.message});

  final String message;
}

class DomainFailure extends Failure {
  const DomainFailure({super.message = 'Failed to load domain data!'});
}

class DomainProvinceCodeMissingFailure extends Failure {
  const DomainProvinceCodeMissingFailure({
    super.message = 'Province code is needed if type is rengecy by province!',
  });
}

class PublicationFailure extends Failure {
  const PublicationFailure({
    super.message = 'Failed to load publication data!',
  });
}

class InfographicFailure extends Failure {
  const InfographicFailure({
    super.message = 'Failed to load infographic data!',
  });
}

class StaticTableFailure extends Failure {
  const StaticTableFailure({
    super.message = 'Failed to load static table data!',
  });
}

class NewsFailure extends Failure {
  const NewsFailure({super.message = 'Failed to load news data!'});
}
