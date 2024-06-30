import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'package:test_bro/src/core/utils/analytics.dart';
import 'package:test_bro/src/feature/quize/bloc/quize_bloc.dart';

class FinalPageQuiz extends StatefulWidget {
  final String quizId;
  final String finalId;
  final String image;
  final String name;
  final String description;
  final int mostFrequentDigit;
  const FinalPageQuiz({
    required this.image,
    required this.name,
    required this.description,
    required this.mostFrequentDigit,
    required this.quizId,
    required this.finalId,
    super.key,
  });

  @override
  _FinalPageQuizState createState() => _FinalPageQuizState();
}

class _FinalPageQuizState extends State<FinalPageQuiz> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String photoLink = '';
    if (widget.image == 'og:img meta tag not found') {
      photoLink = 'default';
    } else if (widget.image.contains('https')) {
      photoLink = widget.image;
    } else if (!widget.image.contains('https') ||
        widget.image.contains('istock')) {
      photoLink =
          "https://pb-dev.testbroapp.ru/api/files/final_page/${widget.finalId}/${widget.image}";
    }
    return Scaffold(
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
                  photoLink,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 24),
            child: Text(
              widget.description,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: Text(
              "Поделитесь тестом с друзьями!",
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
                  'Поделиться',
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
                onPressed: () async {
                  await posthog.capture(
                    eventName: "quiz_share",
                    properties: {"quiz_id": widget.name},
                  );
                  await TelegramWebApp.instance.openTelegramLink(
                      'https://t.me/share/url?url=https://t.me/testquizebro_bot?start=${widget.quizId}');
                  await Clipboard.setData(
                    ClipboardData(
                      text:
                          '''Если хотите провести время с пользой и узнать что-то новое, проходите этот тест! Я уже попробовал(а), теперь ваша очередь!
                          https://t.me/testquizebro_bot?start=${widget.quizId}''',
                    ),
                  );
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Скопирована ссылка"),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text("Еще  тесты!"),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _initialize(BuildContext context) async {
    await posthog.capture(
      eventName: "quiz_complete",
      properties: {"quiz_id": widget.quizId},
    );

    //! По верх этиx if нужно делать проверку из shared preference
    if (!kDebugMode) {
      if (posthog.getFeatureFlag('ads').toString() == 'control') {
        js.context.callMethod('fullScreen');
      } else {
        js.context.callMethod('adsgram');
      }
    }
    context
        .read<QuizBloc>()
        .add(UpdateCompleteFieldEvent(quizId: widget.quizId));
  }

  Future<void> onPressed() async {
    await posthog.capture(
      eventName: "quiz_other_tests",
      properties: {"quiz_id": widget.quizId},
    );
    if (!mounted) return;
    context.go('/');

    context.read<QuizBloc>().add(ResetStateEvent());
  }
}
