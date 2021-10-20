import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '/model/occurrence/occurrence_model.dart';
import 'components/widgets/list_view_image.dart';

class OccurrenceDetailScreen extends StatelessWidget {
  final OccurrenceModel occurrenceModel;

  const OccurrenceDetailScreen({Key? key, required this.occurrenceModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          // backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            title: const Text("Detalhe Da Ocorrencia"),
            centerTitle: true,
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListViewImage(occurrenceModel: occurrenceModel),
                  Divider(height: constraints.maxHeight * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Cidade",
                            style: Fonts.fontsMostSerrat,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            occurrenceModel.city.toString(),
                            textAlign: TextAlign.center,
                            style: Fonts.fontsRoboto,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Bairro",
                            style: Fonts.fontsMostSerrat,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            occurrenceModel.district.toString(),
                            textAlign: TextAlign.center,
                            style: Fonts.fontsRoboto,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Rua/Av",
                            style: Fonts.fontsMostSerrat,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(occurrenceModel.road.toString(),
                              textAlign: TextAlign.center,
                              style: Fonts.fontsRoboto),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Nome",
                            style: Fonts.fontsMostSerrat,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            occurrenceModel.nameOccurrence.toString(),
                            style: Fonts.fontsRoboto,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      "Descrição",
                      style: Fonts.fontsMostSerrat,
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      occurrenceModel.description.toString(),
                      textAlign: TextAlign.center,
                      style: Fonts.fontsRoboto,
                    ),
                  ),
                  Divider(height: constraints.maxHeight * 0.06),
                  occurrenceModel.status
                      ? ListTile(
                          title: Text(
                            "Feedback",
                            style: Fonts.fontsMostSerrat,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(occurrenceModel.feedback.toString(),
                              textAlign: TextAlign.center,
                              style: Fonts.fontsRoboto),
                        )
                      : const Text("Sem resposta"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
