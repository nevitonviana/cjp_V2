import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDialog {
  fullPicture({
    required BuildContext context,
    required String image,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  alignment: Alignment.center,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (_, __, ___) => const Icon(
                    Icons.error,
                    color: Colors.amber,
                    size: 100,
                    semanticLabel: "Falhar ao carregar imagem",
                  ),
                ),
                const Align(
                  child: CloseButton(color: Colors.white),
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
