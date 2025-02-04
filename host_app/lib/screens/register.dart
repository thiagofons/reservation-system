import 'package:flutter/material.dart';
import 'package:host_app/screens/home.dart';
import 'package:host_app/screens/login.dart';
import 'package:host_app/styles/text.dart';
import 'package:host_app/viewmodel/user.dart';
import 'package:host_app/widgets/text_input.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final controllers = {
      "name": TextEditingController(),
      "email": TextEditingController(),
      "password": TextEditingController(),
    };

    signUp() async {
      Provider.of<UserViewModel>(context, listen: false)
          .signUp(controllers["name"]!.text, controllers["email"]!.text,
              controllers["password"]!.text)
          .then((result) {
        if (result) {
          Navigator.pushReplacementNamed(
            context,
            HomeScreen.routeName,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Não foi possivel cadastrar o usuário"),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      });
    }

    signIn() async {
      Navigator.pushNamed(context, LoginScreen.routeName);
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
                    "Cadastrar",
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
              "Insira suas informações para se cadastrar",
              style: AppTextStyles.h4,
            ),
            SizedBox(height: 24),
            TextInput(
              controller: controllers["name"],
              label: "Nome",
              placeholder: "Insira o seu nome",
            ),
            SizedBox(height: 16),
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
                    onPressed: signIn,
                    child: Text(
                      "Fazer login",
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
