import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:test_bro/src/feature/quize/bloc/quize_bloc.dart';
import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';
import 'package:test_bro/src/feature/quize/widget/first_page.dart';
import 'package:test_bro/src/feature/quize/widget/question_page.dart';

class QuizScreen extends StatelessWidget {
  final String startPage;
  final List<String> resultPage;
  final List<String> pages;
  const QuizScreen({
    required this.startPage,
    required this.pages,
    required this.resultPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          final PreloadPageController _pageController = PreloadPageController();
          //    logger.info(startPage + " Quiz result");
          //   context.read<QuizBloc>().add(ResetStateEvent());

          context.read<QuizBloc>().add(
                LoadDataEvent(
                  startPageId: startPage,
                  finalPageId: resultPage,
                  pagesId: pages,
                ),
              );
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizFailure) {
            return const Center(child: Text("ferg"));
          } else if (state is QuizLoaded) {
            final StartEntity startEntity = state.props[0] as StartEntity;
            final FinalEntity finalEntity =
                (state.props[1] as List<FinalEntity>)[0];
            final List<PageEntity> pageEntities =
                state.props[2] as List<PageEntity>;
            List<Widget> pages() {
              final List<Widget> _pages = [];
              _pages.add(
                FirstPageQuiz(
                  description: startEntity.description,
                  image:
                      "https://testbro.pockethost.io/api/files/start_pages/" +
                          "${startEntity.id.toString()}/${startEntity.image}",
                  name: startEntity.name,
                ),
              );
              for (int i = 0; i < pageEntities.length; i++) {
                _pages.add(
                  QuestionPage(
                    question: pageEntities[i].question,
                    pathToImage:
                        "https://testbro.pockethost.io/api/files/quiz_page/" +
                            "${pageEntities[i].id.toString()}/${pageEntities[i].image}",
                    answers: Map<int, String>.from(
                      pageEntities[i].answers.map(
                            (key, value) => MapEntry(
                              int.parse(key.toString()),
                              value.toString(),
                            ),
                          ),
                    ),
                  ),
                );
              }

              return _pages;
            }

            return PreloadPageView(
              controller: _pageController,
              children: pages(),
            );
          }
          return Container();
        },
      );
}
