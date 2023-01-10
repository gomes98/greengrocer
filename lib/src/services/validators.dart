import 'package:get/get.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Digite seu email";
  }

  if (!value.isEmail) return "Digite um email válido";

  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Digite sua senha";
  }

  if (value.length < 7) {
    return "Digite uma senha com pelo menos 7 carateres";
  }

  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Digite um nome";
  }

  final names = value.split(" ");
  if (names.length == 1) {
    return "Digite seu nome completo";
  }

  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Digite um celular";
  }

  if (!value.isPhoneNumber) return "Digite um numero válido";

  return null;
}

String? cpfValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Digite um CPF";
  }

  if (!value.isCpf) return "Digite um CPF válido";

  return null;
}
