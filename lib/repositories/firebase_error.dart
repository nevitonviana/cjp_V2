class FirebaseError {
  static final Map<int, String> _error = {
    505284406: 'E-mail inválido \nou\n Não há nenhum usuario com essa conta',
    185768934: 'Senha incorreta',
    34618382: 'O endereço de e-mail já está sendo\n usado por outro usuario.',
    265778269: "Senha muito curto",
    360587416: "E-mail inválido",
  };

  static String? getDescription(int error) {
    return _error[error];
  }
}
