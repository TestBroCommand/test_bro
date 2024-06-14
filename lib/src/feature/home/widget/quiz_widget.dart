import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
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
        builder: (context, constraints) {
          final double height = constraints.maxHeight;
          final double cardHeight = height * 0.3;
          return GestureDetector(
            onTap: () async {
              await Posthog().capture(
                eventName: "quiz_start",
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
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
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
                  Row(
                    children: [
                      Text(currentQuiz.takers.toString()),
                      const SizedBox(width: 5),
                      const Icon(Icons.ads_click_rounded),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Text(
                    currentQuiz.title,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
      );
}
