import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing an SDG (Sustainable Development Goals) indicator
/// from the BPS Web API.
///
/// This class maps to the SDG indicators endpoint:
/// `https://webapi.bps.go.id/v1/api/list/model/sdgs`
///
/// Each indicator represents a measurable statistical variable associated
/// with one of the 17 United Nations Sustainable Development Goals as tracked
/// and reported by BPS Indonesia.
class const SdgIndicator({
  /// Unique identifier for the statistical variable (`var_id`)
  required final int id,

  /// Official title of the SDG indicator variable
  required final String title,

  /// SDG goal code, e.g. `"sdgs_1"` (`sdgs_goal`)
  required final String goal,

  /// Human-readable name of the SDG goal, e.g. `"1. Tanpa Kemiskinan"`
  /// (`sdgs_goal_name`)
  required final String goalName,

  /// SDG indicator reference code, e.g. `"1.2.1*"` (`sdgs_id`)
  required final String sdgsId,

  /// Identifier of the statistical subject this indicator belongs to
  /// (`sub_id`)
  required final int subjectId,

  /// Name of the statistical subject (`sub_name`)
  required final String subjectName,

  /// Unit of measurement for the indicator values
  required final String unit,

  /// Definition or description of the indicator (`def`)
  required final String definition,

  /// Methodological notes, may contain HTML content (`notes`)
  required final String notes,

  /// Identifier linking to the associated vertical variable (`vertical`)
  required final int verticalVariableId,

  /// Identifier for the chart/graph type (`graph_id`)
  required final int graphId,

  /// Name of the chart/graph type, e.g. `"bar"` (`graph_name`)
  required final String graphName,

  /// URL to the activity metadata in SIRUSA (`meta_activity`)
  final String? metaActivity,

  /// URL to the variable metadata in SIRUSA (`meta_var`)
  final String? metaVar,
}) extends BaseEntity {
  @override
  List<Object?> get props => [
    id,
    title,
    goal,
    goalName,
    sdgsId,
    subjectId,
    subjectName,
    unit,
    definition,
    notes,
    verticalVariableId,
    graphId,
    graphName,
    metaActivity,
    metaVar,
  ];
}
