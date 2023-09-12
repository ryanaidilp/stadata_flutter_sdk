// ignore_for_file: public_member_api_docs

sealed class StadataException implements Exception {
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
    super.message = 'Tehre is something wrong with domain data!',
  });
}

class DomainNotAvailableException extends StadataException {
  const DomainNotAvailableException({super.message = 'Domain not available!'});
}

class DomainProvinceCodeException extends StadataException {
  const DomainProvinceCodeException({
    super.message =
        'Province code must be provided if type is regency by province!',
  });
}
