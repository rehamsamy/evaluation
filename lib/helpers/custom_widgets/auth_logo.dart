import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/icons/logo.png",
        width: MediaQuery.of(context).size.width * .5,
      ),
    );

  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/icons/logo.png",
        width: MediaQuery.of(context).size.width * .5,
      ),
    );
  }
}

class LanguagesLogo extends StatelessWidget {
  const LanguagesLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .45,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Center(
            child: Hero(
              tag: "auth_logo",
              child: Image.asset(
                "assets/icons/logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ));
  }
}
