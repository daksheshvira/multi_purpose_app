class Strings {
  static final Strings instance = Strings._internal();

  factory Strings() {
    return instance;
  }

  Strings._internal();

  final login = 'Login';
  final emailId = 'Email ID';
  final password = 'Password';
  final continueText = 'Continue';
}
