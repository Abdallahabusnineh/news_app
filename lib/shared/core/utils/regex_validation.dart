class RegexValidation {
  /*
bool validateEmailRegex({required String email}) {
  return RegExp(
    //email format validation
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

*/

 static bool userNameValidation({required String name}) {
    return RegExp(
      //username validation
        r'^[a-zA-Z0-9._@]+$').hasMatch(name);
  }

 static bool isValidEmail({required String email}) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

/*
bool validatePasswordRegex({required String password}) {
  return RegExp(
  this password must have at least 6 characters and must contain at least one uppercase letter, one lowercase letter, one number, and one special character.
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
      .hasMatch(password);
}*/
/*bool validatePasswordRegex({required String password}) {
  return RegExp(
      //this password must have at least 6 characters and must contain at least one uppercase letter, one lowercase letter, one number, and one special character.
      r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(password);
}*/
 static bool validatePasswordRegex({required String password}) {
    return RegExp(

      /*

     Explanation of the regex pattern:
     (?=.*[A-Za-z]): Ensures there is at least one letter (uppercase or lowercase).
     (?=.*[!@#$%^&*(),.?":{}|<>]): Ensures there is at least one special character.
      .{6,}: Ensures the total length of the password is at least 6 characters.


    * */

        r'^(?=.*[A-Za-z])(?=.*[!@#$%^&*(),.?":{}|<>]).{6,}$').hasMatch(password);
  }

/*bool validatePasswordRegex({required String password}) {
  return RegExp(
      //this password must have at least 8 digits this is same flutter firebase .
      r'\d{6,}')
      .hasMatch(password);
}*/

}