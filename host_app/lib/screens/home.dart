import 'package:flutter/material.dart';
import 'package:host_app/screens/login.dart';
import 'package:host_app/styles/text.dart';
import 'package:host_app/viewmodel/user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home",
              style: AppTextStyles.h2,
            ),
            ElevatedButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .signOut()
                      .then((value) {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  });
                },
                child: Text("Sign out"))
          ],
        ),
      ),
    );
  }
}
