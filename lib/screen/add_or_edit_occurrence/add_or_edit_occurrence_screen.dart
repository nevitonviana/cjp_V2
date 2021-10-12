import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/widgets.dart';
import 'components/widgets/show_selected_image.dart';
import 'controller/add_or_edit_controller.dart';

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
                                  onPressed:
                                      _addOrEditController.getImageGallery,
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
                                  onPressed:
                                      _addOrEditController.getImageCamera,
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
                          ShowSelectedImage(
                            addOrEditController: _addOrEditController,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Observer(builder: (_) {
                          return TextFieldCustom(
                            onChanged: _addOrEditController.setDistrict,
                            errorText: _addOrEditController.districtError,
                            label: "Bairro",
                          );
                        }),
                        Observer(builder: (_) {
                          return TextFieldCustom(
                            onChanged: _addOrEditController.setRoad,
                            errorText: _addOrEditController.roadError,
                            label: "Av/Rua",
                          );
                        }),
                        Observer(builder: (_) {
                          return TextFieldCustom(
                            onChanged: _addOrEditController.setNameOccurrence,
                            errorText: _addOrEditController.nameOccurrenceError,
                            label: "Nome da Ocorrencia",
                          );
                        }),
                        Observer(builder: (_) {
                          return TextFieldCustom(
                            onChanged: _addOrEditController.setDiscretion,
                            errorText: _addOrEditController.discretionError,
                            label: "Descrição",
                            maxLines: null,
                            minLines: 4,
                            keyboardType: TextInputType.multiline,
                          );
                        }),
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: constraints.maxHeight * 0.04,
                    ),
                    Observer(builder: (_) {
                      return _addOrEditController.imageError != null
                          ? Container(
                              margin: EdgeInsets.only(
                                  bottom: constraints.maxHeight * 0.03),
                              child: Text(
                                _addOrEditController.imageError!,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 15),
                              ),
                            )
                          : Container();
                    }),
                    InkWell(
                      onTap: _addOrEditController.invalidSendPressed,
                      child: Observer(builder: (_) {
                        return MaterialButton(
                          onPressed: _addOrEditController.loginPressed,
                          child: Text(
                            "Enviar",
                            style: Fonts.fontsRoboto,
                          ),
                          color: Colors.blueGrey,
                          elevation: 6,
                          minWidth: constraints.maxWidth * 0.45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          disabledColor: Colors.grey,
                          disabledElevation: 1,
                        );
                      }),
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
