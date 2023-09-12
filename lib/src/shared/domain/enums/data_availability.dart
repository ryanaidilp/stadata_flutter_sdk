// ignore_for_file: public_member_api_docs

enum DataAvailability {
  available,
  listNotAvailable;

  String get value => switch (this) {
        available => 'available',
        listNotAvailable => 'list-not-available',
      };
}
