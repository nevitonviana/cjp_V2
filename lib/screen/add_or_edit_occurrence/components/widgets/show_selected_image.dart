import 'package:flutter/material.dart';

import '/components/widgets/widgets.dart';

class ShowSelectedImage extends StatelessWidget {
  const ShowSelectedImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        child: FormField<List>(
          // initialValue: _listDeImages,
          validator: (value) {
            // if (widget.ocorrencia == null) {
            //   if (value!.length == 0) {
            //     return _mensagemErro;
            //   }
            // }
            return null;
          },
          builder: (_) {
            return ListView.builder(
              padding: const EdgeInsets.only(left: 5, right: 10),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => PictureDialog().fullPicture(context: context),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9jdXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"),
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
          },
        ),
      ),
    );
  }
}
