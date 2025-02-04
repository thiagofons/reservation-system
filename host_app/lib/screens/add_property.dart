import 'package:flutter/material.dart';
import 'package:host_app/model/address.dart';
import 'package:host_app/model/property.dart';
import 'package:host_app/service/search.dart';
import 'package:host_app/styles/text.dart';
import 'package:host_app/viewmodel/property.dart';
import 'package:host_app/viewmodel/user.dart';
import 'package:host_app/widgets/text_input.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

var logger = Logger();

class AddPropertyScreen extends StatefulWidget {
  static const String routeName = '/add-property';

  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Address? address;

  final controllers = {
    "title": TextEditingController(),
    "cep": TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    controllers["cep"]!.addListener(() async {
      if (controllers["cep"]!.text.length == 8) {
        // Query CEP autocomplete
        SearchService searchService = SearchService();

        address = await searchService.queryCEP(controllers["cep"]!.text);

        setState(() {});

        logger.d("Created address: ${address.toString()}");
      }
    });

    back() {
      Navigator.of(context).pop();
    }

    save() async {
      if (address != null) {
        final user = Provider.of<UserViewModel>(context, listen: false).user;
        final property = Property();

        Provider.of<PropertyViewModel>(context, listen: false)
            .createProperty(property, address!, user!.id!);
      }
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBar(
                automaticallyImplyLeading: true,
                leading: GestureDetector(
                  onTap: back,
                  child: InkWell(
                    child: Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.chevron_left,
                          size: 32,
                        )),
                  ),
                ),
                title: Text(
                  "Adicionar Propriedade",
                  style: AppTextStyles.h3
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                titleSpacing: 0,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ======================
                // Form area
                // ======================
                Column(
                  children: [
                    TextInput(
                      controller: controllers["title"],
                      label: "Título",
                      placeholder: "Título da propriedade",
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextInput(
                      controller: controllers["cep"],
                      label: "CEP",
                      placeholder: "Somente números",
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),

                // ======================
                // Generated address
                // ======================
                Builder(builder: (context) {
                  if (address != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Endereço gerado",
                              style: AppTextStyles.h4,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          address?.street ?? "",
                        ),
                        Text(address?.neighborhood ?? ""),
                        Text(address?.locality ?? ""),
                        Text(address?.uf ?? ""),
                        Text(address?.state ?? ""),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink(); // or return Container();
                  }
                }),

                // ======================
                // Images area
                // ======================

                // ======================
                // Button area
                // ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: save,
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primary)),
                        child: Text(
                          "Salvar",
                          style: AppTextStyles.button.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
