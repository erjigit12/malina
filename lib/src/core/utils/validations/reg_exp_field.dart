class RegExpField {
  static final RegExp _emailRegExp =
      RegExp(r"^[\w!#%&'*+/=?`{|}~^.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$");

  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Введите почту';
    }
    if (!_emailRegExp.hasMatch(email)) {
      return 'Некорректная почта';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'Введите пароль';
    }
    if (password.length < 8) {
      return 'Пароль должен содержать не менее 8 символов';
    }
    return null;
  }
}
