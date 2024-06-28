import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:test_bro/src/feature/quize/bloc/quize_bloc.dart';
import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';
import 'package:test_bro/src/feature/quize/widget/final_page.dart';
import 'package:test_bro/src/feature/quize/widget/first_page.dart';
import 'package:test_bro/src/feature/quize/widget/question_page.dart';

// ignore: public_member_api_docs
class QuizScreen extends StatefulWidget {
  // ignore: public_member_api_docs
  final String id;
  // ignore: public_member_api_docs
  final String isUquiz;
  // ignore: public_member_api_docs
  const QuizScreen({
    required this.id,
    required this.isUquiz,
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    _loadData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            final PreloadPageController _pageController =
                PreloadPageController();
            //    logger.info(startPage + " Quiz result");
            //   context.read<QuizBloc>().add(ResetStateEvent());
            if (state is QuizLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizFailure) {
              return Center(child: Text(state.error.toString()));
            } else if (state is QuizLoaded) {
              final StartEntity startEntity = state.props[0] as StartEntity;
              final List<FinalEntity> finalEntites =
                  state.props[1] as List<FinalEntity>;
              final List<PageEntity> pageEntities =
                  state.props[2] as List<PageEntity>;
              return PreloadPageView(
                controller: _pageController,
                onPageChanged: (index) {
                  if (index - 1 == pageEntities.length) {
                    context.read<QuizBloc>().add(QuizCompletedEvent());
                  }
                },
                children: _buildPages(
                  context: context,
                  startEntity: startEntity,
                  pageEntities: pageEntities,
                  pageController: _pageController,
                  finalEntities: finalEntites,
                  answers: state.answers,
                ),
              );
            } else if (state is QuizCompleted) {
              final finalPage = state.finalpage;
              return FinalPageQuiz(
                quizId: widget.id,
                finalId: finalPage.id,
                image: finalPage.image,
                name: finalPage.name,
                description: finalPage.description,
                mostFrequentDigit: finalPage.mostFrequentDigit,
              );
            }
            return Container();
          },
        ),
      );

  Future<void> _loadData(BuildContext context) async {
    context.read<QuizBloc>().add(
          LoadDataEvent(
            id: widget.id,
            isUQuiz: widget.isUquiz,
          ),
        );
  }

  List<Widget> _buildPages({
    required BuildContext context,
    required StartEntity startEntity,
    required List<PageEntity> pageEntities,
    required PreloadPageController pageController,
    required List<FinalEntity> finalEntities,
    required Map<int, int> answers,
  }) {
    final List<Widget> pages = [];

    pages.add(
      FirstPageQuiz(
        id: startEntity.id,
        description: startEntity.description,
        image: startEntity.image,
        name: startEntity.name,
        pageController: pageController,
      ),
    );

    for (int i = 0; i < pageEntities.length; i++) {
      pages.add(
        QuestionPage(
          questionId: pageEntities[i].id,
          currentQuestion: i,
          sumQuestions: pageEntities.length,
          question: pageEntities[i].question,
          pathToImage: pageEntities[i].image,
          answers: pageEntities[i].answers as Map<int, dynamic>,
          /* Map<int, dynamic>.from(
            pageEntities[i].answers.map(
                  (key, value) => MapEntry(
                    int.parse(key.toString()),
                    value.toString(),
                  ),
                  
                ),
*/

          pageController: pageController,
          id: widget.id,
        ),
      );
    }

    // pages.add(
    //   FinalPageQuiz(
    //     image: finalPage.image,
    //     name: finalPage.name,
    //     description: finalPage.description,
    //     mostFrequentDigit: finalPage.mostFrequentDigit,
    //   ),
    // );
    return pages;
  }
}
