import 'package:flutter/material.dart';
import 'package:host_app/screens/home.dart';
import 'package:host_app/screens/login.dart';
import 'package:host_app/screens/property.dart';
import 'package:host_app/screens/property_detail.dart';
import 'package:host_app/screens/register.dart';
import 'package:host_app/screens/search.dart';
import 'package:host_app/service/user.dart';
import 'package:host_app/viewmodel/user.dart';
import 'package:provider/provider.dart';

void main() {
  UserService userService = UserService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(userService)),
      ],
      child: const MainApp(),
    ),
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
          primary: const Color(0xFFFD5C63), // Airbnb Red for primary elements
          secondary:
              const Color(0xFF00A699), // Airbnb Green for secondary elements
          surface: const Color(0xFFFFFFFF), // White for cards and surfaces
          error: const Color(0xFFE12D39), // Bright Red for error messages
          onPrimary: const Color(0xFFFFFFFF), // White text on primary elements
          onSecondary:
              const Color(0xFFFFFFFF), // White text on secondary elements
          onSurface: const Color(0xFF484848), // Dark Grey text on surfaces
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
