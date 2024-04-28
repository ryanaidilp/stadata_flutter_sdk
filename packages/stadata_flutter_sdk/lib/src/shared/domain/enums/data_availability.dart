// ignore_for_file: public_member_api_docs

enum DataAvailability {
  available,
  notAvailable,
  listNotAvailable;

  String get value => switch (this) {
        available => 'available',
        notAvailable => 'not-available',
        listNotAvailable => 'list-not-available',
      };
}
