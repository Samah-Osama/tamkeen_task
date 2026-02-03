class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'Enter your email address.';
    } else if (!emailRegex.hasMatch(val)) {
      return 'This Email is not valid (e.g., example@example.com).';
    } else {
      return null;
    }
  }

  static String? validateEmpty(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }
    final trimmedVal = val.trim();
    if (int.tryParse(trimmedVal) == null) {
      return 'Enter numbers only';
    }
    if (trimmedVal.length != 11) {
      return 'Phone number must be exactly 11 digits';
    }
    if (!trimmedVal.startsWith('01')) {
      return 'Phone number must start with 01';
    }

    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val.length < 8) {
      return 'Password must be at least 8 characters long and include at least one uppercase letter and one number';
    }

    return null;
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'this field is required';
    } else if (val != password) {
      return "password doesn't match";
    } else {
      return null;
    }
  }
}
