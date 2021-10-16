import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/components/theme/font/fonts.dart';
import '/components/widgets/widgets.dart';
import '/screen/feedback/controller/feedback_controller.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final FeedBackController _feedBackController = FeedBackController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text("FeedBack"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth * 0.1,
                        top: constraints.maxHeight * 0.1),
                    child: Text.rich(
                      TextSpan(
                        style: Fonts.fontsAlfaslabOne,
                        children: const [
                          TextSpan(text: "Caro amigos(as)\n"),
                          TextSpan(
                              text:
                                  "Obrigado por fazer parte desse teste 'BETA'\n"),
                          TextSpan(
                              text: "Use os Campos a baixor para enviar  \n"),
                          TextSpan(
                              text: "A sua opinião, critica e elogio,  \n"),
                          TextSpan(
                              text:
                                  "de grande importancia para que nos podemos evoluir,\n"),
                          TextSpan(
                              text:
                                  "De tal forma que possamos lhe atender melhor... \n"),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 20),
                  Column(
                    children: [
                      Observer(builder: (_) {
                        return TextFieldCustom(
                          onChanged: _feedBackController.setFaultName,
                          errorText: _feedBackController.faultNameError,
                          label: "Onde deu a falhar",
                          hintText: "EX: na tela de perfil",
                        );
                      }),
                      Observer(builder: (_) {
                        return TextFieldCustom(
                          onChanged: _feedBackController.setDescription,
                          errorText: _feedBackController.descriptionError,
                          label: "Descreva a Falhar",
                          hintText: "EX: a tela de perfil não abril",
                        );
                      }),
                      Divider(
                        height: constraints.maxHeight * 0.04,
                      ),
                      ButtonAnimated(
                        controller: _feedBackController,
                        width: constraints.maxWidth * 0.4,
                      ),
                      const Divider(height: 15),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
