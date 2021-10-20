import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/model/occurrence/occurrence_model.dart';
import 'image_dialog.dart';

class ListViewImage extends StatelessWidget {
  const ListViewImage({
    Key? key,
    required this.occurrenceModel,
  }) : super(key: key);

  final OccurrenceModel occurrenceModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: occurrenceModel.listPhotos!.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              ImageDialog().fullPicture(
                context: context,
                image: occurrenceModel.listPhotos![index],
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.05),
              padding: const EdgeInsets.only(right: 15),
              child: CachedNetworkImage(
                imageUrl: occurrenceModel.listPhotos![index],
                progressIndicatorBuilder: (_, __, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (_, __, ___) => const Icon(
                  Icons.error,
                  color: Colors.amber,
                  size: 100,
                  semanticLabel: "Falhar ao carregar imagem",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
