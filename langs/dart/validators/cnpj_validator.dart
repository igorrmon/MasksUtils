import 'dart:math';

class CNPJValidator {
  static const List<String> blackList = [
    '00000000000000',
    '11111111111111',
    '22222222222222',
    '33333333333333',
    '44444444444444',
    '55555555555555',
    '66666666666666',
    '77777777777777',
    '88888888888888',
    '99999999999999'
  ];

  static const stripRegex = r'[^\d]';

  // Compute the Verifier Digit (or "Dígito Verificador (DV)" in PT-BR).
  // You can learn more about the algorithm on [wikipedia (pt-br)](https://pt.wikipedia.org/wiki/D%C3%ADgito_verificador)
  static int _verifierDigit(String cnpj) {
    int index = 2;

    final List<int> reverse =
        cnpj.split('').map((s) => int.parse(s)).toList().reversed.toList();

    int sum = 0;

    for (final int number in reverse) {
      sum += number * index;
      index = index == 9 ? 2 : index + 1;
    }

    final int mod = sum % 11;

    return mod < 2 ? 0 : 11 - mod;
  }

  static String format(String cnpj) {
    final RegExp regExp = RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$');

    return strip(cnpj).replaceAllMapped(
        regExp, (m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}');
  }

  static String strip(String cnpj) {
    final RegExp regex = RegExp(stripRegex);

    return (cnpj ?? '').replaceAll(regex, '');
  }

  static bool isValid(String cnpj, {bool stripBeforeValidation = true}) {
    var _cnpj = cnpj;
    if (stripBeforeValidation) {
      final String value = cnpj;
      _cnpj = strip(value);
    }

    // cnpj must be defined
    if (_cnpj == null || _cnpj.isEmpty) {
      return false;
    }

    // cnpj must have 14 chars
    if (_cnpj.length != 14) {
      return false;
    }

    // cnpj can't be ed
    if (blackList.contains(_cnpj)) {
      return false;
    }

    String numbers = _cnpj.substring(0, 12);
    numbers += _verifierDigit(numbers).toString();
    numbers += _verifierDigit(numbers).toString();

    return numbers.substring(numbers.length - 2) ==
        _cnpj.substring(cnpj.length - 2);
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
