// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  String toString() => message;

  @override
  List<Object?> get props => [message];
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

class NewsCategoryFailure extends Failure {
  const NewsCategoryFailure({
    super.message = 'Failed to load news category data!',
  });
}

class SubjectCategoryFailure extends Failure {
  const SubjectCategoryFailure({
    super.message = 'Failed to load subject category data!',
  });
}

class SubjectFailure extends Failure {
  const SubjectFailure({
    super.message = 'Failed to load subject data!',
  });
}

class PressReleaseFailure extends Failure {
  const PressReleaseFailure({
    super.message = 'Failed to load press release data!',
  });
}
