import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/widgets.dart';
import '/model/occurrence/occurrence_model.dart';
import '/route_generate.dart';
import 'components/widgets/button_camara_and_gallery.dart';
import 'controller/add_or_edit_controller.dart';

class AddOrEditOccurrence extends StatefulWidget {
  final OccurrenceModel? occurrenceModel;

  const AddOrEditOccurrence({Key? key, this.occurrenceModel}) : super(key: key);

  @override
  State<AddOrEditOccurrence> createState() => _AddOrEditOccurrenceState();
}

class _AddOrEditOccurrenceState extends State<AddOrEditOccurrence> {
  late final AddOrEditController _addOrEditController;

  @override
  void initState() {
    _addOrEditController =
        AddOrEditController(occurrenceModel: widget.occurrenceModel);
    super.initState();
    autorun((_) {
      if (_addOrEditController.loading) {
        SaveDialog().save(buildContext: context, msg: "Salvando ocorrĂȘncia");
      }
      if (_addOrEditController.massageError != null) {
        ErrorDialog()
            .error(context: context, error: _addOrEditController.massageError!);
        Navigator.of(context).pop();
      }
    });

    when((_) => _addOrEditController.save, () {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed(
        RouteGenerate.routeMyOccurrence,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.occurrenceModel == null
            ? "Adicionar OcorrĂȘncia"
            : "Editar OcorrĂȘncia"),
        leading: BackButton(
          onPressed: () async {
            if (_addOrEditController.imageModification) {
              await _addOrEditController.addOrEditOccurrence();
            }
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ButtonCamaraAndGallery(
                        addOrEditController: _addOrEditController),
                    Column(
                      children: [
                        Observer(
                          builder: (_) {
                            return _addOrEditController.city.isEmpty
                                ? TextFieldCustom(
                                    initialValue: _addOrEditController.city,
                                    onChanged: _addOrEditController.setCity,
                                    errorText: _addOrEditController.cityError,
                                    label: "Cidade",
                                  )
                                : Container();
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return TextFieldCustom(
                              initialValue: _addOrEditController.district,
                              onChanged: _addOrEditController.setDistrict,
                              errorText: _addOrEditController.districtError,
                              label: "Bairro",
                            );
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return TextFieldCustom(
                              initialValue: _addOrEditController.road,
                              onChanged: _addOrEditController.setRoad,
                              errorText: _addOrEditController.roadError,
                              label: "Av/Rua",
                            );
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return TextFieldCustom(
                              initialValue: _addOrEditController.nameOccurrence,
                              onChanged: _addOrEditController.setNameOccurrence,
                              errorText:
                                  _addOrEditController.nameOccurrenceError,
                              label: "Nome da Ocorrencia",
                            );
                          },
                        ),
                        Observer(
                          builder: (_) {
                            return TextFieldCustom(
                              initialValue: _addOrEditController.discretion,
                              onChanged: _addOrEditController.setDiscretion,
                              errorText: _addOrEditController.discretionError,
                              label: "DescriĂ§ĂŁo",
                              maxLines: null,
                              minLines: 4,
                              keyboardType: TextInputType.multiline,
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: constraints.maxHeight * 0.04,
                    ),
                    Observer(
                      builder: (_) {
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
                      },
                    ),
                    InkWell(
                      onTap: _addOrEditController.invalidSendPressed,
                      child: Observer(
                        builder: (_) {
                          return MaterialButton(
                            onPressed: _addOrEditController.addEditPressed,
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
                        },
                      ),
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
