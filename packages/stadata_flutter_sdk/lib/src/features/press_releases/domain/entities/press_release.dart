import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// A class representing a Press Release entity.
///
/// A Press Release contains information about a specific press release,
/// including its ID, name, subject, title, abstract, release date, PDF URL,
/// size, cover image URL, and slides URL.
///
/// [docs]: https://webapi.bps.go.id/documentation/#press-release
class PressRelease extends BaseEntity {
  /// Creates a [PressRelease] instance.
  ///
  /// [id] is the unique identifier of the press release.

  /// [subject] is the associated subject of the press release.
  /// [title] is the title of the press release.
  /// [abstract] is a brief summary or abstract of the press release.
  /// [releaseDate] is the date when the press release was released.
  /// [pdf] is the URL to the PDF document of the press release.
  /// [size] is the size of the PDF document.
  /// [cover] is the URL to the cover image of the press release.
  /// [slide] is the URL to the slides related to the press release.
  /// [updatedAt] is the optional date when the press release was last updated.
  const PressRelease({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.pdf,
    required this.size,
    required this.cover,
    required this.slide,
    this.abstract,
    this.subject,
    this.updatedAt,
  });

  /// The unique identifier of the press release.
  final int id;

  /// The associated subject of the press release.
  final Subject? subject;

  /// The title of the press release.
  final String title;

  /// A brief summary or abstract of the press release.
  final String? abstract;

  /// The date when the press release was released.
  final DateTime releaseDate;

  /// The date when the press release was last updated (optional).
  final DateTime? updatedAt;

  /// The URL to the PDF document of the press release.
  final String pdf;

  /// The size of the PDF document.
  final String size;

  /// The URL to the cover image of the press release.
  final String cover;

  /// The URL to the slides related to the press release.
  final String slide;

  @override
  List<Object?> get props => [
        id,
        subject,
        title,
        abstract,
        releaseDate,
        updatedAt,
        pdf,
        size,
        cover,
        slide,
      ];
}
