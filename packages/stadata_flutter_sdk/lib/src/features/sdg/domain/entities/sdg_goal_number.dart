import 'package:stadata_flutter_sdk/src/features/sdg/domain/entities/sdg_indicator.dart';

/// The 17 United Nations Sustainable Development Goals, as used to filter
/// [SdgIndicator]s via `sdgs_goal` on the BPS Web API.
///
/// Each member's [value] is the goal number (1-17) the API expects; use the
/// enum instead of a raw `int` so the mapping between a goal number and its
/// official title doesn't need to be memorized or looked up separately.
enum SdgGoalNumber(this.value) {
  /// Goal 1: No Poverty.
  noPoverty(1),

  /// Goal 2: Zero Hunger.
  zeroHunger(2),

  /// Goal 3: Good Health and Well-being.
  goodHealth(3),

  /// Goal 4: Quality Education.
  qualityEducation(4),

  /// Goal 5: Gender Equality.
  genderEquality(5),

  /// Goal 6: Clean Water and Sanitation.
  cleanWater(6),

  /// Goal 7: Affordable and Clean Energy.
  affordableEnergy(7),

  /// Goal 8: Decent Work and Economic Growth.
  decentWork(8),

  /// Goal 9: Industry, Innovation and Infrastructure.
  industry(9),

  /// Goal 10: Reduced Inequalities.
  reducedInequalities(10),

  /// Goal 11: Sustainable Cities and Communities.
  sustainableCities(11),

  /// Goal 12: Responsible Consumption and Production.
  responsibleConsumption(12),

  /// Goal 13: Climate Action.
  climateAction(13),

  /// Goal 14: Life Below Water.
  lifeBelowWater(14),

  /// Goal 15: Life on Land.
  lifeOnLand(15),

  /// Goal 16: Peace, Justice and Strong Institutions.
  peace(16),

  /// Goal 17: Partnerships for the Goals.
  partnerships(17);

  /// The SDG goal number (1-17) sent to the BPS API as `sdgs_goal`.
  final int value;
}
