String authErrorString(String? code) {
  switch (code) {
    case "INVALID_CREDENTIALS":
      return "Email e/ou senha invalidos";
    case "Invalid session token":
      return "Token invalido";
    default:
      return "Um erro indefinido ocorreu";
  }
}
