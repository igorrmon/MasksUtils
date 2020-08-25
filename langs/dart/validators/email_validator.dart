/*
  -Português:
  Classe responsavel para validação de email e funções afins.

  -English:
  Responsible class for email validation and related functions.
*/

class ValidatorEmail {
/*
  -Português:
  A função verificar se o email esta no formato "exemplo@exemplo.com".

  -English:
  The function to check if the email is in the format "example@example.com".
*/
  static bool emailIsValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String emailObscure(String email) {
    if (email != null) {
      final index = email.lastIndexOf('@');
      String newString = '';
      for (var i = 0; i < email.length; i++) {
        if (i < 3 || i == index || email[i] == '.') {
          newString += email[i];
        } else {
          newString += '*';
        }
      }
      return newString;
    }
    return null;
  }
}
