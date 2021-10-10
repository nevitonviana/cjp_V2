// ignore_for_file: file_names
class FirebaseError {
  static final Map<int, String> _error = {
    505284406: 'E-mail inválido',
    185768934: 'Senha incorreta',
    34618382: 'O endereço de e-mail já está sendo usado por outro usuario.',
    265778269: "Senha muito curto",
    360587416: "E-mail invalido"
  };

  static String? getDescription(int error) {
    return _error[error];
  }
}
