import 'dart:io';

import 'package:flutter/material.dart';

import '/screen/add_or_edit_occurrence/controller/add_or_edit_controller.dart';

class PictureDialog {
  fullPicture({
    required BuildContext context,
    required File image,
    AddOrEditController? addOrEditController,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        elevation: 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Image.file(
                    File(image.path),
                    fit: BoxFit.cover,
                  ),
                ),
                const Align(
                  child: CloseButton(color: Colors.white),
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
            Visibility(
              child: TextButton(
                onPressed: () {
                  addOrEditController!.listImage
                      .removeWhere((element) => element == image);
                  Navigator.pop(context);
                },
                child: const Text("Excluir"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
