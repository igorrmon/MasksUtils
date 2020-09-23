import 'package:local_auth/local_auth.dart';

class BiometriaValidator {
  static Future<bool> verificarBiometria() async {
    final localAuth = LocalAuthentication();

    return localAuth.canCheckBiometrics;
  }
}
