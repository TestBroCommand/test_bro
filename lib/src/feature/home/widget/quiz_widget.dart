import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_bro/src/core/utils/analytics.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';

/// Widget for display quiz card in main screen
class QuizWidget extends StatelessWidget {
  final QuizEntity currentQuiz;
  const QuizWidget({
    required this.currentQuiz,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String photoLink = '';
    if (currentQuiz.image == 'og:img meta tag not found') {
      photoLink = 'default';
    } else if (currentQuiz.image.contains('https')) {
      photoLink = currentQuiz.image;
    } else if (!currentQuiz.image.contains('https') ||
        currentQuiz.image.contains('istock')) {
      photoLink = "https://pb-dev.testbroapp.ru/api/files/quizes/" +
          "${currentQuiz.id.toString()}/${currentQuiz.image}";
    }
    return GestureDetector(
      onTap: () async {
        await posthog.capture(
          eventName: "quiz_start",
          properties: {"quiz_id": currentQuiz.id.toString()},
        );
        context.pushNamed(
          "quiz",
          pathParameters: {
            "id": currentQuiz.id,
            "isUquiz": currentQuiz.isUquiz ? 'true' : 'false',
          },
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: cardHeight * 1),
            if (photoLink == 'default')
              Expanded(
                  child: Container(
                height: 105,
                width: double.infinity,
                color: getRandomColor(),
              ),)
            else
              Expanded(
                  child: Image.network(
                height: 105,
                width: double.infinity,
                fit: BoxFit.fill,
                photoLink,
              ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentQuiz.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  //    const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(currentQuiz.takers.toString()),
                      const SizedBox(width: 5),
                      const Icon(Icons.check_circle_outline_rounded),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
