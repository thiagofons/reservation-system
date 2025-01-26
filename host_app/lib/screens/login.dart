import 'package:flutter/material.dart';
import 'package:host_app/screens/home.dart';
import 'package:host_app/screens/register.dart';
import 'package:host_app/styles/text.dart';
import 'package:host_app/viewmodel/user.dart';
import 'package:host_app/widgets/text_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controllers = {
      "email": TextEditingController(),
      "password": TextEditingController(),
    };

    signIn() async {
      Provider.of<UserProvider>(context, listen: false)
          .signIn(controllers["email"]!.text, controllers["password"]!.text)
          .then((result) {
        if (result) {
          Navigator.pushReplacementNamed(
            context,
            HomeScreen.routeName,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("E-mail ou senha inválidos"),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      });
    }

    signUp() async {
      Navigator.pushNamed(context, RegisterScreen.routeName);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: 16),
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  title: Text(
                    "Login",
                    style: AppTextStyles.h1
                        .copyWith(color: Theme.of(context).colorScheme.surface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Text(
              "Insira suas informações para fazer login",
              style: AppTextStyles.h4,
            ),
            SizedBox(height: 24),
            TextInput(
              controller: controllers["email"],
              label: "E-mail",
              placeholder: "Insira o seu e-mail",
            ),
            SizedBox(height: 16),
            TextInput(
              controller: controllers["password"],
              label: "Senha",
              placeholder: "Insira a sua senha",
              isPassword: true,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                      fixedSize:
                          WidgetStatePropertyAll(Size(double.infinity, 48)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: signIn,
                    child: Text(
                      "Login",
                      style: AppTextStyles.button.copyWith(
                          color: Theme.of(context).colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.onSurface),
                      fixedSize:
                          WidgetStatePropertyAll(Size(double.infinity, 48)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: signUp,
                    child: Text(
                      "Cadastrar",
                      style: AppTextStyles.button.copyWith(
                          color: Theme.of(context).colorScheme.surface),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
