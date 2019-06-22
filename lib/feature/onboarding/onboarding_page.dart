import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  static const String routeName = "/onboarding";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Onboarding"),
      ),
      body: Text("Onboarding"),
    );
  }
}
