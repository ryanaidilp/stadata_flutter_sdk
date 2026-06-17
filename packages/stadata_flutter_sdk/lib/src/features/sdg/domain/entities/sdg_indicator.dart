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
class SdgIndicator extends BaseEntity {
  /// Creates a new [SdgIndicator] instance.
  const SdgIndicator({
    required this.id,
    required this.title,
    required this.goal,
    required this.goalName,
    required this.sdgsId,
    required this.subjectId,
    required this.subjectName,
    required this.unit,
    required this.definition,
    required this.notes,
    required this.verticalVariableId,
    required this.graphId,
    required this.graphName,
    this.metaActivity,
    this.metaVar,
  });

  /// Unique identifier for the statistical variable (`var_id`)
  final int id;

  /// Official title of the SDG indicator variable
  final String title;

  /// SDG goal code, e.g. `"sdgs_1"` (`sdgs_goal`)
  final String goal;

  /// Human-readable name of the SDG goal, e.g. `"1. Tanpa Kemiskinan"`
  /// (`sdgs_goal_name`)
  final String goalName;

  /// SDG indicator reference code, e.g. `"1.2.1*"` (`sdgs_id`)
  final String sdgsId;

  /// Identifier of the statistical subject this indicator belongs to
  /// (`sub_id`)
  final int subjectId;

  /// Name of the statistical subject (`sub_name`)
  final String subjectName;

  /// Unit of measurement for the indicator values
  final String unit;

  /// Definition or description of the indicator (`def`)
  final String definition;

  /// Methodological notes, may contain HTML content (`notes`)
  final String notes;

  /// Identifier linking to the associated vertical variable (`vertical`)
  final int verticalVariableId;

  /// Identifier for the chart/graph type (`graph_id`)
  final int graphId;

  /// Name of the chart/graph type, e.g. `"bar"` (`graph_name`)
  final String graphName;

  /// URL to the activity metadata in SIRUSA (`meta_activity`)
  final String? metaActivity;

  /// URL to the variable metadata in SIRUSA (`meta_var`)
  final String? metaVar;

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
