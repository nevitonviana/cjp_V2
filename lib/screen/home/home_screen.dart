import 'dart:async';

import 'package:animated_card/animated_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/components/controller/user_controller.dart';
import '/components/theme/font/fonts.dart';
import '/model/occurrence/occurrence_model.dart';
import '../../route_generate.dart';
import 'components/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final bool myOccurrence;

  const HomeScreen({Key? key, this.myOccurrence = false}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controllerStream = StreamController<QuerySnapshot>.broadcast();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final UserController _userController = GetIt.I<UserController>();

  Future<Stream<QuerySnapshot>> _getOccurrence() async {
    Query query = _db.collection("ocorrencias");
    if (widget.myOccurrence) {
      query = query.where("idUser", isEqualTo: _userController.user!.id);
    }

    Stream<QuerySnapshot> stream = query.snapshots();
    stream.listen((event) {
      _controllerStream.add(event);
    });
    return _controllerStream.stream;
  }

  _aaa() {
    List b = [1111, 222, 1];
    List c = [4444, 555, 1];
    List v = [];
    print(999999999999);
    print(b);
    print(c);
    v.addAll(b);
    b.removeAt(2);
    b.addAll(v);
    print("tttttt");
    print(b);
  }

  @override
  void initState() {
    _aaa();
    super.initState();
    _getOccurrence();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.myOccurrence ? null : const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "CJP",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: StreamBuilder(
                stream: _controllerStream.stream,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              "Carregando as Ocorrencias",
                              style: Fonts.fontsAlfaslabOne,
                            ),
                            const CircularProgressIndicator(),
                          ],
                        ),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      QuerySnapshot? querySnapshot =
                          snapshot.requireData as QuerySnapshot?;
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Erro ao carregar as ocorrencias"),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            semanticChildCount: 3,
                            itemCount: querySnapshot!.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    mainAxisSpacing: 6,
                                    crossAxisSpacing: 6,
                                    mainAxisExtent: 300,
                                    maxCrossAxisExtent: 406),
                            itemBuilder: (context, index) {
                              List<DocumentSnapshot> occurrences =
                                  querySnapshot.docs.toList();
                              DocumentSnapshot dados = occurrences[index];
                              OccurrenceModel occurrence =
                                  OccurrenceModel.fromDocumentSnapshot(dados);
                              return AnimatedCard(
                                child: GestureDetector(
                                  onTap: () => widget.myOccurrence
                                      ? Navigator.pushNamed(context,
                                          RouteGenerate.routeEditOccurrence,
                                          arguments: occurrence)
                                      : Navigator.pushNamed(context,
                                          RouteGenerate.routeOccurrenceDetail,
                                          arguments: occurrence),
                                  child: CardCustom(
                                      occurrenceModel: occurrence,
                                      myOccurrence: widget.myOccurrence),
                                ),
                              );
                            },
                          );
                        } else {
                          const Center(
                            child: Text("nao há nenhum  registro"),
                          );
                        }
                      }
                      break;
                  }
                  return Container();
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
