/*
  -Português:
  Classe para validar nomes em geral.

  -English:
  Class for validating names in general.
*/
class ValidatorName {
/*
  -Português:
  A função verificar se o nome contém 3 caracteres, retornamdo a resposta em 
  boleano.

  -English:
  The function to check if the name contains 3 characters, returns the answer 
  in Boolean.
*/
  static bool nameIsValid(String name) {
    return name.length > 3;
  }
}
