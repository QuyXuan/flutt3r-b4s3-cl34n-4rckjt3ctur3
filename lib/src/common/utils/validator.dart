class Validator {
  Validator._();

  static const _emailRegExpString =
      r'^(?!.*\.\.)(?!^\.)([a-zA-Z0-9\+\.\_\%\-\+]{1,256})\@[a-zA-Z0-9]'
      r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+$';
  static final _emailRegex = RegExp(_emailRegExpString, caseSensitive: false);
  static bool isValidEmail(String email) => _emailRegex.hasMatch(email);
  static bool isEmptyEmail(String email) => email.isEmpty;

  static const _passwordRegExpString = r'^\S+$';
  static final _passwordRegex =
      RegExp(_passwordRegExpString, caseSensitive: false);
  static bool isValidPassword(String password) =>
      _passwordRegex.hasMatch(password);
  static bool isEmptyPassword(String password) => password.isEmpty;
  static bool isValidPasswordLength(String password) => password.length >= 8;
}
