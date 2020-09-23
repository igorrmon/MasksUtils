class DataValidator {
  static bool isDataNascimentoValid(String data) {
    if (data.length == 10) {
      final list = data.split('/');
      final int ano = int.tryParse(list[2]);
      final int mes = int.tryParse(list[1]);
      final int dia = int.tryParse(list[0]);
      if (dia != null && mes != null && ano != null) {
        if (ano > 1500 && ano < DateTime.now().year) {
          return (mes > 0 && mes <= 12) &&
              (dia > 0 && dia <= totalDiasMes(mes, bisexto: anoBisexto(ano)));
        }
      }
    }

    return false;
  }

  static bool isDataValid(String data) {
    final list = data.split('/');
    final int ano = int.tryParse(list[2]);
    final int mes = int.tryParse(list[1]);
    final int dia = int.tryParse(list[0]);
    if (dia != null && mes != null && ano != null) {
      return (mes > 0 && mes <= 12) &&
          (dia > 0 && dia <= totalDiasMes(mes, bisexto: anoBisexto(ano)));
    }

    return false;
  }

  static bool anoBisexto(int ano) {
    bool bissexto;
    if (ano % 400 == 0) {
      bissexto = true;
    } else if ((ano % 4 == 0) && (ano % 100 != 0)) {
      bissexto = true;
    } else {
      bissexto = false;
    }
    return bissexto;
  }

  static int totalDiasMes(int mes, {bool bisexto = false}) {
    switch (mes) {
      case 01:
        return 31;
        break;
      case 02:
        return bisexto ? 29 : 28;
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
