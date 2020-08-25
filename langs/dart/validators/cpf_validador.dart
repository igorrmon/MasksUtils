import 'dart:math';

class CPFValidator {
  static const List<String> blackList = [
    '00000000000',
    '11111111111',
    '22222222222',
    '33333333333',
    '44444444444',
    '55555555555',
    '66666666666',
    '77777777777',
    '88888888888',
    '99999999999',
    '12345678909'
  ];

  static const stripRegex = r'[^\d]';

  // Compute the Verifier Digit (or 'Dígito Verificador (DV)' in PT-BR).
  // You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  static int _verifierDigit(String cpf) {
    final List<int> numbers =
        cpf.split('').map((number) => int.parse(number, radix: 10)).toList();

    final modulus = numbers.length + 1;

    final List<int> multiplied = [];

    for (var i = 0; i < numbers.length; i++) {
      multiplied.add(numbers[i] * (modulus - i));
    }

    final mod = multiplied.reduce((buffer, number) => buffer + number) % 11;

    return mod < 2 ? 0 : 11 - mod;
  }

  static String format(String cpf) {
    final RegExp regExp = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');

    return strip(cpf).replaceAllMapped(
        regExp, (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}');
  }

  static String strip(String cpf) {
    final RegExp regExp = RegExp(stripRegex);

    return (cpf ?? '').replaceAll(regExp, '');
  }

  static bool isValid(String cpf, {bool stripBeforeValidation = true}) {
    var _cpf = cpf;

    if (stripBeforeValidation) {
      _cpf = strip(cpf);
    }

    // CPF must be defined
    if (_cpf == null || _cpf.isEmpty) {
      return false;
    }

    // CPF must have 11 chars
    if (_cpf.length != 11) {
      return false;
    }

    // CPF can't be blacklisted
    if (blackList.contains(_cpf)) {
      return false;
    }

    String numbers = _cpf.substring(0, 9);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        _cpf.substring(_cpf.length - 2);
  }

  static String generate({bool useFormat = false}) {
    final StringBuffer numbers = StringBuffer();

    for (var i = 0; i < 9; i += 1) {
      numbers.write(Random().nextInt(9).toString());
    }

    numbers.write(_verifierDigit(numbers.toString()).toString());
    numbers.write(_verifierDigit(numbers.toString()).toString());

    return useFormat ? format(numbers.toString()) : numbers.toString();
  }
}
