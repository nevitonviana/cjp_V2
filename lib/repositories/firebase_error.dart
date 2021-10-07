// ignore_for_file: file_names
class FirebaseError {
  static final Map<int, String> _error = {
    505284406: 'E-mail inválido',
    185768934: 'Senha incorreta',
  };

  static String? getDescription(int error) {
    return _error[error];
  }
}
