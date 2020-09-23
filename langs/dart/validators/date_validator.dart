/*
  -Português:
  Essa classe é responssavel por validações e verificações de uma data no 
  formato Brasileiro.

  -English:
  This class is responsible for validating and verifying a date in Brazilian 
  format.
*/

class DateValidator {
/*
  -Português:
  A função dateOfBirthIsValidBR verificar se a data de nascimento e valida 
  no formato brasileiro.

  -English:
  The dateOfBirthIsValidBR function verifies that the date of birth is valid 
  in Brazilian format.
*/

  static bool dateOfBirthIsValidBR(String date) {
    if (date.length == 10) {
      final list = date.split('/');
      final int year = int.tryParse(list[2]);
      final int month = int.tryParse(list[1]);
      final int day = int.tryParse(list[0]);
      if (day != null && month != null && year != null) {
        if (year > 1500 && year < DateTime.now().year) {
          return (month > 0 && month <= 12) &&
              (day > 0 && day <= tatalDaysInMonth(month, leap: leapYear(year)));
        }
      }
    }

    return false;
  }

/*
  -Português:
  A função dateIsValidBr verificar se a data é valida no formato brasileiro.

  -English:
  The dateIsValidBr function checks whether the date is valid in the Brazilian 
  format.
*/

  static bool dateIsValidBR(String date) {
    final list = date.split('/');
    final int year = int.tryParse(list[2]);
    final int month = int.tryParse(list[1]);
    final int day = int.tryParse(list[0]);
    if (day != null && month != null && year != null) {
      return (month > 0 && month <= 12) &&
          (day > 0 && day <= tatalDaysInMonth(month, leap: leapYear(year)));
    }

    return false;
  }

/*
  -Português:
  A função verifica se o ano é bisexto.

  -English:
  The function checks whether the year is a leap year

*/

  static bool leapYear(int year) {
    bool leap;
    if (year % 400 == 0) {
      leap = true;
    } else if ((year % 4 == 0) && (year % 100 != 0)) {
      leap = true;
    } else {
      leap = false;
    }
    return leap;
  }

  /*
  -Português:
  A função verifica a quantidade de dia no mês.
    
  -English:
  The function checks the amount of day in the month.
 */

  static int tatalDaysInMonth(int month, {bool leap = false}) {
    switch (month) {
      case 01:
        return 31;
        break;
      case 02:
        return leap ? 29 : 28;
        break;
      case 03:
        return 31;
        break;
      case 04:
        return 30;
        break;
      case 05:
        return 31;
        break;
      case 06:
        return 30;
        break;
      case 07:
        return 31;
        break;
      case 08:
        return 31;
        break;
      case 09:
        return 30;
        break;
      case 10:
        return 31;
        break;
      case 11:
        return 30;
        break;
      case 12:
        return 31;
        break;
      default:
        return null;
    }
  }
}
