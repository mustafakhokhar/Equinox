import 'package:flutter/material.dart';
import 'package:temp_store/Widgets/FormVerification.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/views/onBoardingScreens/SignUp.dart';

const headingStyle = TextStyle(
  fontSize: (28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Text(
                  "Register Account",
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Complete your details\nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SignForm(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Divider(
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Divider(
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialCard(icon: Image.asset(icFacebook), press: () {}),
                      SocialCard(icon: Image.asset(icGoogle), press: () {}),
                      SocialCard(icon: Image.asset(icApple), press: () {}),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  late String name = '', phone = '', email = '', password = '';

  bool firstSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          buildMobileNumberFormField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          buildEmailFormField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          buildPasswordFormField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          // buildConfirmPasswordFormField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Sign Up", style: TextStyle(color: Colors.white)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print(
                    "SignedUp Success: Name: $name, Phone: $phone,Email: $email, Password: $password");
                // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
              firstSubmit = true;
            },
          ),
        ],
      ),
    );
  }

  // TextFormField buildConfirmPasswordFormField() {
  //   return TextFormField(
  //     onSaved: (newConfirmPassword) => confirmPassword = newConfirmPassword!,
  //     onChanged: (password) {
  //       if (firstSubmit) _formKey.currentState!.validate();
  //     },
  //     validator: (password) {
  //       if (password != this.password) {
  //         return kMatchPassError;
  //       }

  //       return null;
  //     },
  //     decoration: const InputDecoration(
  //       labelText: "Confirm Password",
  //       hintText: "Re-enter your password",
  //       suffixIcon: Icon(Icons.lock_outline_rounded),
  //       border: OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(20))),
  //     ),
  //     obscureText: true,
  //   );
  // }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newPassword) => password = newPassword!,
      onChanged: (password) {
        if (firstSubmit) _formKey.currentState!.validate();
      },
      validator: (password) {
        if (password!.isEmpty) {
          return kPassNullError;
        } else if (password.isNotEmpty && password.length <= 7) {
          return kShortPassError;
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: Icon(Icons.lock_outline_rounded),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      obscureText: true,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newEmail) => email = newEmail!,
      onChanged: (email) {
        if (firstSubmit) _formKey.currentState!.validate();
      },
      validator: (email) {
        if (email!.isEmpty) {
          return kEmailNullError;
        } else if (email.isNotEmpty && !emailValidatorRegExp.hasMatch(email)) {
          return kInvalidEmailError;
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        suffixIcon: Icon(Icons.mail_outline_rounded),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newName) => name = newName!,
      onChanged: (name) {
        if (firstSubmit) _formKey.currentState!.validate();
      },
      validator: (name) {
        if (name!.isEmpty) {
          return kNameNullError;
        } else if (name.isNotEmpty && !nameValidationRegExp.hasMatch(name)) {
          return kInvalidNameError;
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your Full Name",
        suffixIcon: Icon(Icons.mail_outline_rounded),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      keyboardType: TextInputType.name,
    );
  }

  TextFormField buildMobileNumberFormField() {
    return TextFormField(
      onSaved: (newNumber) => phone = newNumber!,
      onChanged: (number) {
        if (firstSubmit) _formKey.currentState!.validate();
      },
      validator: (number) {
        if (number!.isEmpty) {
          return kPhoneNullError;
        } else if (number.isNotEmpty &&
            !phoneValidationRegExp.hasMatch(number)) {
          return kPhoneInvalidError;
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Mobile Number",
        hintText: "Enter your Mobile Number",
        suffixIcon: Icon(Icons.mail_outline_rounded),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      keyboardType: TextInputType.phone,
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
            child: const Text(
              "Sign Up",
              style: TextStyle(color: primary),
            ),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const SignUpScreen();
              // }));
            }),
      ],
    );
  }
}

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final Image icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: (10)),
        padding: const EdgeInsets.symmetric(vertical: 9),
        height: (50),
        width: (50),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
