String authErrorString(String? code) {
  switch (code) {
    case "INVALID_CREDENTIALS":
      return "Email e/ou senha invalidos";

    case "Invalid session token":
      return "Token invalido";

    case "INVALID_FULLNAME":
      return "Ocorreu um erro ao cadastrar o usuário: Nome Inválido";

    case "INVALID_PHONE":
      return "Ocorreu um erro ao cadastrar o usuário: Celular Inválido";

    case "INVALID_CPF":
      return "Ocorreu um erro ao cadastrar o usuário: CPF Inválido";

    default:
      return "Um erro indefinido ocorreu";
  }
}
