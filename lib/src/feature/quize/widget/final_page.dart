import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';

class FinalPageQuiz extends StatefulWidget {
  final Map<int, int> answers;
  final String image;
  final String name;
  final String description;
  const FinalPageQuiz({
    required this.answers,
    required this.image,
    required this.name,
    required this.description,
    super.key,
  });

  @override
  _FinalPageQuizState createState() => _FinalPageQuizState();
}

class _FinalPageQuizState extends State<FinalPageQuiz> {
  @override
  Future<void> initState() async {
    if (kDebugMode) {
      js.context.callMethod('fullScreen');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 42, 21, 40),
              child: SizedBox(
                width: 204,
                height: 225,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                textAlign: TextAlign.center,
                widget.name,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 122, 255, 1),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 24),
              child: Text(
                description,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ), */
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                "Поделитесь результатами с друзьями!",
                style: TextStyle(
                  color: Color.fromRGBO(0, 122, 255, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(180, 50),
                    backgroundColor: const Color.fromRGBO(0, 122, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  label: const Text(
                    'Copy link',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(
                    Icons.copy_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await Posthog().capture(
                  eventName: "quiz_complete",
                  properties: {"quiz_id": widget.name},
                );
                context.push('/');
              }, // print('$name $description $image'),
              child: const Text("Главная"), //'Ответы'),
            ),
          ],
        ),
      );
}
