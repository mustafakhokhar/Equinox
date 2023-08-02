// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp nameValidationRegExp =
    RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
final RegExp phoneValidationRegExp =
    RegExp(r"^((\+92)?(0092)?(92)?(0)?)(3)([0-9]{9})$");

const String kPhoneNullError = "Please Enter your phone number";
const String kPhoneInvalidError = "Please Enter Valid phone number";
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short, at least 8 chars";
const String kMatchPassError = "Passwords don't match";
const String kInvalidNameError = "Please Enter Valid Name";
const String kNameNullError = "Please Enter Name";
const String kFirstNamelNullError = "Please Enter your first name";
const String kLastNamelNullError = "Please Enter your last name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
