import 'package:stadata_flutter_sdk/src/core/core.dart';

sealed class const Failure({required final String message}) extends BaseEntity {
  @override
  String toString() => message;

  @override
  List<Object?> get props => [message];
}

class const DomainFailure({super.message = 'Failed to load domain data!'})
    extends Failure;

class const DomainProvinceCodeMissingFailure({
  super.message = 'Province code is needed if type is rengecy by province!',
}) extends Failure;

class const PublicationFailure({
  super.message = 'Failed to load publication data!',
}) extends Failure;

class const InfographicFailure({
  super.message = 'Failed to load infographic data!',
}) extends Failure;

class const StaticTableFailure({
  super.message = 'Failed to load static table data!',
}) extends Failure;

class const NewsFailure({super.message = 'Failed to load news data!'})
    extends Failure;

class const NewsCategoryFailure({
  super.message = 'Failed to load news category data!',
}) extends Failure;

class const SubjectCategoryFailure({
  super.message = 'Failed to load subject category data!',
}) extends Failure;

class const SubjectFailure({super.message = 'Failed to load subject data!'})
    extends Failure;

class const PressReleaseFailure({
  super.message = 'Failed to load press release data!',
}) extends Failure;

class const StrategicIndicatorFailure({
  super.message = 'Failed to load strategic indicator data!',
}) extends Failure;

class const VariableFailure({
  super.message = 'Failed to load variable data!',
}) extends Failure;

class const VerticalVariableFailure({
  super.message = 'Failed to load vertical variable data!',
}) extends Failure;

class const UnitFailure({super.message = 'Failed to load unit data!'})
    extends Failure;

class const StatisticClassificationFailure({
  super.message = 'Failed to load statistic classification data!',
}) extends Failure;

class const DynamicTableFailure({
  super.message = 'Failed to load dynamic table data!',
}) extends Failure;

class const CensusDataFailure({
  super.message = 'Failed to load census data!',
}) extends Failure;

class const CensusTopicFailure({
  super.message = 'Failed to load census topic data!',
}) extends Failure;

class const CensusAreaFailure({
  super.message = 'Failed to load census area data!',
}) extends Failure;

class const CensusDatasetFailure({
  super.message = 'Failed to load census dataset data!',
}) extends Failure;

class const PeriodFailure({super.message = 'Failed to load period data!'})
    extends Failure;

class const DerivedPeriodFailure({
  super.message = 'Failed to load derived period data!',
}) extends Failure;

class const DerivedVariableFailure({
  super.message = 'Failed to load derived variable data!',
}) extends Failure;

class const TableFailure({super.message = 'Failed to load table metadata!'})
    extends Failure;

class const TradeFailure({super.message = 'Failed to load trade data!'})
    extends Failure;

class const GlossaryFailure({super.message = 'Failed to load glossary!'})
    extends Failure;

class const SdgFailure({
  super.message = 'Failed to load SDG Indicator data!',
}) extends Failure;
