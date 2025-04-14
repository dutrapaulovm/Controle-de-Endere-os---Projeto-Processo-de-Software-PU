bool emailValidator(String email) {
  RegExp emailExp = RegExp(
      r"^[a-zA-Z0-9](?!.*[._@]{2})[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z])?)*$");

  bool isValid = true;
  if (email.isEmpty || !emailExp.hasMatch(email)) {
    isValid = false;
  }

  return isValid;
}

bool isValidLogin(String login) {
  /*
    ^[a-zA-Z]: Indica que o nome de usuário deve começar com uma letra, seja minúscula (a-z) ou maiúscula (A-Z).
    (?!.*[._@]{2}): Negative Lookahead para garantir que não há dois caracteres especiais consecutivos.
    [a-zA-Z0-9._@-]{2,23}: Permite letras, números e caracteres especiais por 2 a 23 caracteres.
    [a-zA-Z0-9]$: Garante que o nome de usuário termine com uma letra ou número.
  */
  const regexString =
      r'^[a-zA-Z](?!.*[._\-@]{2})[a-zA-Z0-9._\-@]{2,23}[a-zA-Z0-9]$';
  final regex = RegExp(regexString);

  bool isValid = true;
  if (login.isEmpty || !regex.hasMatch(login)) {
    isValid = false;
  }

  return isValid;
}
