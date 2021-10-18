import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/widgets/widgets.dart';
import '../../controller/add_or_edit_controller.dart';

class ShowSelectedImage extends StatelessWidget {
  final AddOrEditController addOrEditController;

  const ShowSelectedImage({Key? key, required this.addOrEditController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: Observer(builder: (_) {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 5, right: 10),
            itemCount: addOrEditController.listImage.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => PictureDialog().fullPicture(
                  context: context,
                  image: addOrEditController.listImage[index],
                  addOrEditController: addOrEditController,
                  id: addOrEditController.occurrence.id,
                  imageReference:
                      addOrEditController.occurrence.photoReference?[index],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        addOrEditController.listImage[index].runtimeType ==
                                String
                            ? NetworkImage(addOrEditController.listImage[index])
                                as ImageProvider
                            : FileImage(
                                File(
                                  addOrEditController.listImage[index].path,
                                ),
                              ),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      child: const Icon(
                        Icons.delete_forever_sharp,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
