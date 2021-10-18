import 'package:cjp_v2/model/occurrence/occurrence_model.dart';
import 'package:flutter/material.dart';

import '/components/theme/font/fonts.dart';
import '/screen/home/controller/home_controller.dart';

class DeleteDialog {
  delete(
      {required BuildContext context,
      required OccurrenceModel occurrenceModel,
      required HomeController homeController}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text(
                  "Excluir",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Text.rich(
                  TextSpan(
                    text: "Você que quer Excluir \n\n",
                    style: const TextStyle(fontSize: 15),
                    children: [
                      TextSpan(
                        text: occurrenceModel.nameOccurrence,
                        style: Fonts.fontsRoboto,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.blueAccent,
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      homeController.deleteMyOccurrence(
                          occurrenceModel: occurrenceModel);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Excluir",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
