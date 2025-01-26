import 'package:flutter/material.dart';
import 'package:host_app/screens/login.dart';
import 'package:host_app/service/property.dart';
import 'package:host_app/styles/text.dart';
import 'package:host_app/viewmodel/user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logout() {
      Provider.of<UserProvider>(context, listen: false).signOut();
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }

    getAllProperties() async {
      final id = Provider.of<UserProvider>(context).user!.id;

      PropertyService service = PropertyService();

      return service.getAllProperties(id);
    }

    addProperty() {}

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
                    "Olá, ${Provider.of<UserProvider>(context).user!.name}",
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
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data[index].name),
                              subtitle: Text(snapshot.data[index].address),
                            );
                          },
                        ),
                      ],
                    );
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
