String? validateEmail(String? email){
    String? pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = new RegExp(pattern);
    if(email!.length==0)
      return "Can't Be Empty";
    if(!regex.hasMatch(email))
      return "Invalid Email Adress";
    return null;
  }

String? validatePass(String? value) {
  return value!.isEmpty
      ? 'Password can not be empty'
      :(value.length<6)
      ? 'Password should be 6 or more characters long'
      :null;
}

String? validateName(String? value) {
  return value!.isEmpty
      ? 'Name can not be empty'
      :null;
}