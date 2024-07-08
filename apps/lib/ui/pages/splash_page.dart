import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset('assets/images/logo.png')),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
