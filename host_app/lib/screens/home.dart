import 'package:flutter/material.dart';
import 'package:host_app/screens/add_property.dart';
import 'package:host_app/screens/login.dart';
import 'package:host_app/styles/text.dart';
import 'package:host_app/viewmodel/property.dart';
import 'package:host_app/viewmodel/user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logout() {
      Provider.of<UserViewModel>(context, listen: false).signOut();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }

    getAllProperties() async {
      final id = Provider.of<UserViewModel>(context).user!.id;

      if (id != null) {
        Provider.of<PropertyViewModel>(context, listen: false)
            .getAllProperties(id);

        return Provider.of<PropertyViewModel>(context).properties;
      }
    }

    addProperty() {
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddPropertyScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ));
    }

    final properties = Provider.of<PropertyViewModel>(context).properties;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                "Home",
                style: AppTextStyles.h1
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: logout,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProperty,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greet the user
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Olá, ${Provider.of<UserViewModel>(context).user!.name}",
                    style: AppTextStyles.h2,
                  ),
                  Text("Bem-vindo ao sistema de reservas",
                      style: AppTextStyles.body1),
                ],
              ),
              SizedBox(height: 24),
              // My properties
              Text("Minhas propriedades", style: AppTextStyles.h3),
              SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: getAllProperties(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text("Erro ao carregar propriedades");
                  }

                  if (snapshot.hasData) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(properties[index].title!),
                      );
                    });
                  }

                  return Text("Nenhuma propriedade encontrada");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
