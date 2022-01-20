import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/painting.dart';
import 'package:nonton_app/pages/main_page.dart';
import 'package:nonton_app/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String _email;
  late String _password;
  late String _fullName;
  bool isObsecure1 = true;
  bool isObsecure2 = false;
  var confirmPass;
  var appBarHeight = AppBar().preferredSize.height;

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "nonton",
                style: nontonTextStyle.copyWith(
                    color: whiteColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Container(
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
                              "Register",
                              style: blackTextStyle.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.bold),
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
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Full Name",
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
                                hintText: "Enter full name",
                              ),
                              onSaved: (val) => _fullName = val!,
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
                              validator: (String? value) {
                                confirmPass = value;
                                if (value!.isEmpty) {
                                  return "Please Enter New Password";
                                } else if (value.length < 8) {
                                  return "Password must be atleast 8 characters long";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (val) => _password = val!,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObsecure1 = !isObsecure1;
                                    });
                                  },
                                  child: Icon(
                                    isObsecure1 == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                hintText: "********",
                              ),
                              obscureText: isObsecure1 == false ? false : true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            //

                            Text(
                              "Confirm Password",
                              style: blackTextStyle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please Re-Enter New Password";
                                } else if (value.length < 8) {
                                  return "Password must be atleast 8 characters long";
                                } else if (value != confirmPass) {
                                  return "Password must be same as above";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObsecure2 = !isObsecure2;
                                    });
                                  },
                                  child: Icon(
                                    isObsecure2 != true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                                hintText: "********",
                              ),
                              obscureText: isObsecure2 == true ? false : true,
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
                                  "REGISTER ",
                                  style: whiteTextStyle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: TextButton(
                                child: Text(
                                  "Back to Sign In",
                                  style: blackTextStyle,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
