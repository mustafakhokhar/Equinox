import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp_store/Widgets/FormVerification.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/constants/iconPath.dart';
import 'package:temp_store/controllers/authController.dart';
import 'package:temp_store/views/onBoardingScreens/SignUp.dart';

const headingStyle = TextStyle(
  fontSize: (28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

AuthController authController = Get.find();

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key, String? title})
      : mainHeading = title,
        super(key: key);
  String? mainHeading;
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
                Text(
                  mainHeading ?? "Welcome Back",
                  style: headingStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sign in with your email and password\nor continue with social media",
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width * 0.75,
                          MediaQuery.of(context).size.height * 0.065)),
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors.appBackgroundColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black),
                      )),
                    ),
                    child: const Text("Sign In with Mobile Number",
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialCard(icon: Image.asset(icFacebook), press: () {}),
                      SocialCard(
                          icon: Image.asset(icGoogle),
                          press: () {
                            authController.signInWithGoogle();
                          }),
                      SocialCard(icon: Image.asset(icApple), press: () {}),
                    ],
                  ),
                ),
                const NoAccountText()
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

  late String email, password;

  bool firstSubmit = false;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          buildPasswordFormField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: primary,
                onChanged: (value) => setState(() => remember = value!),
              ),
              const Text("Remember me"),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password",
                ),
              ),
            ],
          ),
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
            child: const Text("Log In", style: TextStyle(color: Colors.white)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print("Login Successful: Email: $email ,Password: $password");
                authController.signInWithEmail(email, password);
              }
              firstSubmit = true;
            },
          ),
        ],
      ),
    );
  }

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
              Get.to(SignUpScreen());
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
