import 'package:local_auth/local_auth.dart';

/*
  -Português:
  Importar a pacote local_auth

  -English:
  Import the local_auth package
*/

class BiometricsValidator {
/*
  -Português:
  Afunção verificar se há bioetria no celular retornando um boleano.

  -English:
  The function is to check if there is biography in the cell phone returning a boolean.

*/
  static Future<bool> checkBiometric() async {
    final localAuth = LocalAuthentication();

    return localAuth.canCheckBiometrics;
  }
}
