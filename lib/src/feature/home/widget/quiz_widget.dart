import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_bro/src/core/utils/logger.dart';
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
            onTap: () {
              logger.info("${currentQuiz.startPage} Router");
              context.pushNamed(
                "quiz",
                pathParameters: {
                  "startPage": currentQuiz.startPage[0],
                  "pages": currentQuiz.pages.join(":"),
                  "resultPage": currentQuiz.finalPage.join(":"),
                },
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: cardHeight * 1),
                    Image.network(
                      height: 80,
                      width: 100,
                      fit: BoxFit.fill,
                      "http://testbroapp.ru/api/files/quizes/" +
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
            ),
          );
        },
      );
}
