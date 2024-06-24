import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
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
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () async {
            await posthog.capture(
              eventName: "quiz_start_from_home",
              properties: {"quiz_id": currentQuiz.id.toString()},
            );
            context.pushNamed(
              "quiz",
              pathParameters: {
                "id": currentQuiz.id,
              },
            );
          },
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: cardHeight * 1),
                Image.network(
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  "https://pb.testbroapp.ru/api/files/quizes/" +
                      "${currentQuiz.id.toString()}/${currentQuiz.image}",
                ),
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
                      const SizedBox(height: 17),
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
        ),
      );
}
