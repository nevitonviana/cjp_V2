import 'package:animated_card/animated_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/widgets.dart';
import '/model/occurrence/occurrence_model.dart';
import '../../../controller/home_controller.dart';

class CardCustom extends StatefulWidget {
  final OccurrenceModel occurrenceModel;
  final bool myOccurrence;

  const CardCustom({
    Key? key,
    required this.occurrenceModel,
    required this.myOccurrence,
  }) : super(key: key);

  @override
  State<CardCustom> createState() => _CardCustomState();
}

class _CardCustomState extends State<CardCustom> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    autorun((_) {
      if (_homeController.massageError != null) {
        ErrorDialog()
            .error(context: context, error: _homeController.massageError!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade400,
      shadowColor: widget.occurrenceModel.status ? Colors.green : Colors.red,
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
                          widget.occurrenceModel.listPhotos![0],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                AnimatedCard(
                  initOffset: const Offset(-200, 100),
                  initDelay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 200),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 9,
                        left: 8,
                      ),
                      height: 28,
                      width: 140,
                      color: widget.occurrenceModel.status
                          ? Colors.green
                          : Colors.red.withOpacity(0.7),
                      child: Row(
                        children: [
                          Icon(
                            widget.occurrenceModel.status
                                ? Icons.sentiment_satisfied_alt
                                : Icons.sentiment_dissatisfied_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            widget.occurrenceModel.status
                                ? "Respondido"
                                : "Não Respondido",
                            style: Fonts.fontsNotoSerif,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.myOccurrence)
                  GestureDetector(
                    onTap: () => DeleteDialog().delete(
                        context: context,
                        occurrenceModel: widget.occurrenceModel,
                        homeController: _homeController),
                    child: AnimatedCard(
                      initOffset: const Offset(200, 100),
                      initDelay: const Duration(seconds: 1),
                      duration: const Duration(milliseconds: 200),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 5,
                            left: 3,
                          ),
                          child: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                      widget.occurrenceModel.road.toString(),
                      style: Fonts.fontsRoboto,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      "Nome da ocorrência",
                      style: Fonts.fontsLato,
                    ),
                    subtitle: Text(
                      widget.occurrenceModel.nameOccurrence.toString(),
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
