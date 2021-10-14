import 'package:cjp_v2/screen/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PhotoProfile extends StatelessWidget {
  final ProfileController profileController;
  double height;

  PhotoProfile({
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
            child: profileController.image != null
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
                : const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 100,
                    child: Icon(
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
// NetworkImage(),
