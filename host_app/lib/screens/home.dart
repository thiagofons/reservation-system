import 'package:flutter/material.dart';
import 'package:host_app/styles/text.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: AppTextStyles.h2,
        ),
      ),
    );
  }
}
