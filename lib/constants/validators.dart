String? emailValidator(String? email) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  if (email!.isEmpty) return 'Email Cannot be empty';
  if (!regex.hasMatch(email)) return 'Invalid Email';
  return null;
}

String? passwordValidator(String? password) {
  if (password!.isEmpty) return 'Password Cannot be empty';
  if (password.length < 6) {
    return 'Password should be greater than 6 characters';
  }
  return null;
}