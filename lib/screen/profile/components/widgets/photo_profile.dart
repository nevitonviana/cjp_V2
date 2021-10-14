import 'package:flutter/material.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: constraints.maxHeight * 0.03,
        top: constraints.maxHeight * 0.03,
      ),
      child: _imagePerfil != null
          ? CircleAvatar(
              radius: 100,
              backgroundImage: FileImage(_imagePerfil),
              child: GestureDetector(
                child: const Icon(
                  Icons.add_photo_alternate,
                  color: Colors.white,
                  size: 35,
                ),
                onTap: _selecionarImagemGaleria,
              ),
            )
          : _usuario.fotoURL != ""
              ? CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    _usuario.fotoURL,
                  ),
                  child: GestureDetector(
                    child: const Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 35,
                    ),
                    onTap: _selecionarImagemGaleria,
                  ),
                )
              : CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 100,
                  child: GestureDetector(
                    child: const Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 35,
                    ),
                    onTap: _selecionarImagemGaleria,
                  ),
                ),
    );
  }
}
