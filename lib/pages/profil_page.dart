import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:nonton_app/pages/sign_in_page.dart';
import 'package:nonton_app/theme.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightBlack,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(100),
              ),
            ),
          ),
          ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ClipOval(
                  child: SizedBox(
                    width: 140,
                    height: 140,
                    child: Image.asset(
                      "assets/images/default_avatar.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              // Text(
              //   "John Doe",
              //   style: whiteTextStyle.copyWith(
              //     fontWeight: FontWeight.w600,
              //     fontSize: 24,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()),
                            (route) => false);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: lightBlack,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 60,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                Icons.logout,
                                size: 35,
                                color: whiteColor.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Log Out",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
