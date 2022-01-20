import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/painting.dart';
import 'package:nonton_app/pages/main_page.dart';
import 'package:nonton_app/pages/sign_up_page.dart';
import 'package:nonton_app/theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String _email;
  late String _password;
  bool isObsecure = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submitCommand() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _loginCommand();
    }
  }

  void _loginCommand() {
    // This is just a demo, so no actual login here.

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlack,
      key: scaffoldKey,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 110,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  color: whiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100000)),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    "nonton",
                    style: nontonTextStyle.copyWith(
                        color: whiteColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: formKey,
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Login",
                                    style: blackTextStyle.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Email",
                                    style: blackTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        color: Colors.black,
                                      ),
                                      hintText: "Enter your email",
                                    ),
                                    validator: (val) =>
                                        !EmailValidator.validate(val!, true)
                                            ? 'Not a valid email.'
                                            : null,
                                    onSaved: (val) => _email = val!,
                                    controller: emailController,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "Password",
                                    style: blackTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isObsecure = !isObsecure;
                                          });
                                        },
                                        child: Icon(
                                          isObsecure == true
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black,
                                        ),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.lock_outline,
                                        color: Colors.black,
                                      ),
                                      hintText: "Enter your password",
                                    ),
                                    onSaved: (val) => _password = val!,
                                    obscureText:
                                        isObsecure == false ? false : true,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: double.infinity,
                                    child: RaisedButton(
                                      color: backgroundColor,
                                      onPressed: (_submitCommand),
                                      child: Text(
                                        'LOGIN',
                                        style: whiteTextStyle,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      TextButton(
                                        child: Text(
                                          'Forgot Password?',
                                          style: blackTextStyle,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: lightBlack,
                                    thickness: 0,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                      "Don't have an account?",
                                      style: blackTextStyle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                    ),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    height: 40,
                                    width: double.infinity,
                                    child: RaisedButton(
                                      color: whiteColor,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const SignUpPage()));
                                      },
                                      child: Text(
                                        'Register Here',
                                        style: blackTextStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
