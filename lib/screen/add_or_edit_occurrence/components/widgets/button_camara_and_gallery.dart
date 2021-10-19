import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '../../controller/add_or_edit_controller.dart';
import 'show_selected_image.dart';

class ButtonCamaraAndGallery extends StatelessWidget {
  const ButtonCamaraAndGallery({
    Key? key,
    required AddOrEditController addOrEditController,
  })  : _addOrEditController = addOrEditController,
        super(key: key);

  final AddOrEditController _addOrEditController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 30, left: 20, top: 50),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: _addOrEditController.getImageGallery,
                  icon: const Icon(
                    Icons.add_photo_alternate_rounded,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Galeria",
                    style: Fonts.fontsRoboto,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _addOrEditController.getImageCamera,
                  icon: const Icon(
                    Icons.add_a_photo_sharp,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Camera",
                    style: Fonts.fontsRoboto,
                  ),
                ),
              ],
            ),
          ),
          ShowSelectedImage(
            addOrEditController: _addOrEditController,
          ),
        ],
      ),
    );
  }
}
