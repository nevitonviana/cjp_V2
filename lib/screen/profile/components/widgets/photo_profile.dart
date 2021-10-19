import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/screen/profile/controller/profile_controller.dart';

class PhotoProfile extends StatelessWidget {
  final ProfileController profileController;
  final double height;

  const PhotoProfile({
    Key? key,
    required this.profileController,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: height * 0.03,
        top: height * 0.03,
      ),
      child: Observer(
        builder: (_) {
          return GestureDetector(
            onTap: profileController.getImageGallery,
            child: profileController.image.runtimeType != String
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(
                      profileController.image,
                    ),
                    child: const Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 35,
                    ),
                  )
                : profileController.image.isEmpty
                    ? const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 100,
                        child: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                          profileController.image,
                        ),
                        child: const Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
          );
        },
      ),
    );
  }
}
