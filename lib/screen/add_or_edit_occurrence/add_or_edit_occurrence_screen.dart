import 'package:cjp_v2/screen/add_or_edit_occurrence/controller/add_or_edit.dart';
import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/widgets.dart';
import 'components/widgets/show_selected_image.dart';

class AddOrEditOccurrence extends StatefulWidget {
  const AddOrEditOccurrence({Key? key}) : super(key: key);

  @override
  State<AddOrEditOccurrence> createState() => _AddOrEditOccurrenceState();
}

class _AddOrEditOccurrenceState extends State<AddOrEditOccurrence> {
  final AddOrEditController _addOrEditController = AddOrEditController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Ocorrencia"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      margin:
                          const EdgeInsets.only(bottom: 30, left: 20, top: 50),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_photo_alternate_rounded,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Galeria",
                                    style: Fonts.fontsRoboto,
                                  ),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_a_photo_sharp,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Camera",
                                    style: Fonts.fontsRoboto,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const ShowSelectedImage(),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        TextFieldCustom(
                          onChanged: _addOrEditController.setDistrict,
                          errorText: _addOrEditController.discretionError,
                          label: "Bairro",
                        ),
                        TextFieldCustom(
                          onChanged: _addOrEditController.setRoad,
                          errorText: _addOrEditController.roadError,
                          label: "Av/Rua",
                        ),
                        TextFieldCustom(
                          onChanged: _addOrEditController.setNameOccurrence,
                          errorText: _addOrEditController.nameOccurrenceError,
                          label: "Nome da Ocorrencia",
                        ),
                        TextFieldCustom(
                          onChanged: _addOrEditController.setDistrict,
                          errorText: _addOrEditController.discretionError,
                          label: "Descrição",
                          maxLines: null,
                          minLines: 4,
                          keyboardType: TextInputType.multiline,
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: constraints.maxHeight * 0.04,
                    ),
                    ButtonAnimated(
                      controller: _addOrEditController,
                      width: constraints.maxWidth * 0.45,
                    ),
                    const Divider(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
