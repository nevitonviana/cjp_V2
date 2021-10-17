import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '/model/occurrence/occurrence_model.dart';

class OccurrenceDetailScreen extends StatelessWidget {
  final OccurrenceModel occurrenceModel;

  const OccurrenceDetailScreen({Key? key, required this.occurrenceModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            title: const Text("Detalhe Da Ocorrencia"),
            centerTitle: true,
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: constraints.minHeight * 0.3,
                      width: constraints.minWidth * 0.95,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: occurrenceModel.listPhotos!.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              // _imageFull(widget.ocorrencia.fotos![index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: constraints.minHeight * 0.05),
                              padding: const EdgeInsets.only(right: 15),
                              child: Image.network(
                                occurrenceModel.listPhotos![index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: constraints.maxHeight * 0.06,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text("Cidade", style: Fonts.fontsMostSerrat),
                            subtitle: Text(occurrenceModel.city.toString(),
                                style: Fonts.fontsRoboto),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("Bairro", style: Fonts.fontsMostSerrat),
                            subtitle: Text(occurrenceModel.district.toString(),
                                style: Fonts.fontsRoboto),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text("Rua/Av", style: Fonts.fontsMostSerrat),
                            subtitle: Text(occurrenceModel.road.toString(),
                                style: Fonts.fontsRoboto),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("Nome", style: Fonts.fontsMostSerrat),
                            subtitle: Text(
                                occurrenceModel.nameOccurrence.toString(),
                                style: Fonts.fontsRoboto),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text("Descrição", style: Fonts.fontsMostSerrat),
                      subtitle: Text(occurrenceModel.description.toString(),
                          style: Fonts.fontsRoboto),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: constraints.maxHeight * 0.06,
                    ),
                    occurrenceModel.status
                        ? ListTile(
                            title:
                                Text("Feedback", style: Fonts.fontsMostSerrat),
                            subtitle: Text(occurrenceModel.feedback.toString(),
                                style: Fonts.fontsRoboto),
                          )
                        : const Text("Sem resposta"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
