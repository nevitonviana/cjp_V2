import 'package:flutter/material.dart';

class PictureDialog {
  fullPicture({required BuildContext context}) {
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
                  child: Image.network(
                      "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9jdXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"),
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
                  // setState(
                  //   () {
                  //     widget.ocorrencia ==
                  //             null
                  //         ? _listDeImages
                  //             .removeAt(
                  //                 index)
                  //         : _listDeUrl
                  //             .removeAt(
                  //                 index);
                  //     Navigator.pop(
                  //         context);
                  //   },
                  // );
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
