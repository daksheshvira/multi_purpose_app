class EmailFieldValidator {
  static String? validate(String? value) {
    if (value == null) {
      return 'Email required';
    }
    value = value.trim();
    var pattern =
        r"^[-!#$%&'*+\/0-9=?A-Z^_a-z`{|}~](\.?[-!#$%&'*+\/0-9=?A-Z^_a-z`{|}~])*@[a-zA-Z0-9](-*\.?[a-zA-Z0-9])*\.[a-zA-Z](-?[a-zA-Z0-9])+$";
    var regex = RegExp(pattern);
    return (regex.hasMatch(value)) ? null : 'Check your email address';
  }
}

class PasswordFieldValidator {
  static String? validate(String? value) {
    if (value == null) {
      return 'Password required';
    }
    value = value.trim();
    var pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,50}$';
    var regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      return (regex.hasMatch(value))
          ? null
          : 'Should be at least 8 characters'
              ' long, must include an upper-case letter, one digit & one of these'
              ' @\$!%*?&#';
    }
  }
}
