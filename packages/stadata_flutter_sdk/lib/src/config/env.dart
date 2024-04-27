// ignore_for_file: constant_identifier_names, public_member_api_docs

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  obfuscate: true,
  useConstantCase: true,
)
class Env {
  @EnviedField()
  static final String apiBaseUrl = _Env.apiBaseUrl;
}
