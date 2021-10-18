import 'package:cached_network_image/cached_network_image.dart';
import 'package:cjp_v2/components/widgets/widgets.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '/model/occurrence/occurrence_model.dart';
import '../../../controller/home_controller.dart';

class CardCustom extends StatelessWidget {
  final OccurrenceModel occurrenceModel;
  final bool myOccurrence;

  const CardCustom(
      {Key? key, required this.occurrenceModel, required this.myOccurrence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = HomeController();
    return Card(
      color: Colors.grey.shade400,
      shadowColor: occurrenceModel.status ? Colors.green : Colors.red,
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 8,
                    top: 8,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          occurrenceModel.listPhotos![0],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Entry.offset(
                  xOffset: -200,
                  yOffset: 100,
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 200),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 6,
                        left: 8,
                      ),
                      height: 28,
                      width: 140,
                      color: occurrenceModel.status
                          ? Colors.green
                          : Colors.red.withOpacity(0.7),
                      child: Row(
                        children: [
                          Icon(
                            occurrenceModel.status
                                ? Icons.sentiment_satisfied_alt
                                : Icons.sentiment_dissatisfied_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            occurrenceModel.status
                                ? "Respondida"
                                : "Não Respondida",
                            style: Fonts.fontsNotoSerif,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                myOccurrence
                    ? Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => DeleteDialog().delete(
                              context: context,
                              occurrenceModel: occurrenceModel,
                              homeController: _homeController),
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 6,
                              left: 11,
                            ),
                            child: const Entry.offset(
                              xOffset: 200,
                              yOffset: 100,
                              delay: Duration(seconds: 1),
                              duration: Duration(milliseconds: 200),
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Rua/Av",
                      style: Fonts.fontsLato,
                    ),
                    subtitle: Text(
                      occurrenceModel.road.toString(),
                      style: Fonts.fontsRoboto,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Nome da ocorrencia",
                      style: Fonts.fontsLato,
                    ),
                    subtitle: Text(
                      occurrenceModel.nameOccurrence.toString(),
                      style: Fonts.fontsRoboto,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
