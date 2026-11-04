class Validator {

  static String? validateName(String? value){
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 letters';
    }
    return null;
  }
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your email';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your password ';
    }
    final passwordRegex = RegExp(
      r'^(?=.*?)(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$', // with no capital letter
      // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$' <-with capital letter
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least 8 chars, one uppercase, one lowercase, one number,one special character';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value ,String? password) {
    if (value == null || value.trim().isEmpty) {
      return 'Confirm your password ';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;

  }

  static String? validatePhoneNumber(String? value) {
    if (value == null) {
      return 'Enter your phone number';
    } else if (int.tryParse(value.trim()) == null) {
      return 'enter numbers only';
    } else if (value.trim().length != 11) {
      return 'enter value must equal 11 digit';
    } else {
      return null;
    }
  }
}
