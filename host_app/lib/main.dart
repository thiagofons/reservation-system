import 'package:flutter/material.dart';
import 'package:host_app/screens/home.dart';
import 'package:host_app/screens/login.dart';
import 'package:host_app/screens/property.dart';
import 'package:host_app/screens/property_detail.dart';
import 'package:host_app/screens/register.dart';
import 'package:host_app/screens/search.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PlusJakartaSans",
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF3A3A3A), // Dark Gray for primary elements
          secondary:
              const Color(0xFFE5E5E5), // Light Gray for secondary elements
          surface: const Color(0xFFFFFFFF), // White for cards and surfaces
          error: const Color(0xFFFF6B6B), // Red for error messages
          onPrimary: const Color(0xFFFFFFFF), // White text on primary elements
          onSecondary:
              const Color(0xFF3A3A3A), // Dark text on secondary elements
          onSurface: const Color(0xFF3A3A3A), // Dark text on surfaces
          onError: const Color(0xFFFFFFFF), // White text on error elements
        ),
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        PropertyScreen.routeName: (context) => PropertyScreen(),
        PropertyDetailScreen.routeName: (context) => PropertyDetailScreen(),
      },
    );
  }
}
