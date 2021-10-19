import 'dart:io';

import 'package:flutter/material.dart';

import '/screen/add_or_edit_occurrence/controller/add_or_edit_controller.dart';

class PictureDialog {
  fullPicture({
    required BuildContext context,
    required AddOrEditController addOrEditController,
    required int index,
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
                  child:
                      addOrEditController.listImage[index].runtimeType != String
                          ? Image.file(
                              File(addOrEditController.listImage[index].path),
                              fit: BoxFit.cover,
                            )
                          : Image.network(addOrEditController.listImage[index]),
                ),
                const Align(
                  child: CloseButton(color: Colors.white),
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
            Visibility(
              child: TextButton(
                onPressed: () async {
                  if (addOrEditController.listImage[index].runtimeType ==
                      String) {
                    await addOrEditController.deleteImageInFirebase(
                        index: index);
                  }
                  addOrEditController.listImage.removeAt(index);

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
