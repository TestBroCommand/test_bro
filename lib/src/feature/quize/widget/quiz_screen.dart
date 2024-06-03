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

class QuizScreen extends StatefulWidget {
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
              return const Center(child: Text("ferg"));
            } else if (state is QuizLoaded) {
              final StartEntity startEntity = state.props[0] as StartEntity;
              final FinalEntity finalEntity =
                  (state.props[1] as List<FinalEntity>)[0];
              final List<PageEntity> pageEntities =
                  state.props[2] as List<PageEntity>;
              return PreloadPageView(
                controller: _pageController,
                children: _buildPages(
                  context: context,
                  startEntity: startEntity,
                  pageEntities: pageEntities,
                  pageController: _pageController,
                  finalEntity: finalEntity,
                  answers: state.answers,
                ),
              );
            }
            return Container();
          },
        ),
      );

  void _loadData(BuildContext context) {
    context.read<QuizBloc>().add(
          LoadDataEvent(
            startPageId: widget.startPage,
            finalPageId: widget.resultPage,
            pagesId: widget.pages,
          ),
        );
  }

  List<Widget> _buildPages({
    required BuildContext context,
    required StartEntity startEntity,
    required List<PageEntity> pageEntities,
    required PreloadPageController pageController,
    required FinalEntity finalEntity,
    required Map<int, int> answers,
  }) {
    final List<Widget> pages = [];

    pages.add(
      FirstPageQuiz(
        description: startEntity.description,
        image:
            "https://testbro.pockethost.io/api/files/start_pages/${startEntity.id.toString()}/${startEntity.image}",
        name: startEntity.name,
        pageController: pageController,
      ),
    );
    for (int i = 0; i < pageEntities.length; i++) {
      if (i != pages.length) {}
      pages.add(
        QuestionPage(
          currentQuestion: i,
          sumQuestions: pageEntities.length,
          question: pageEntities[i].question,
          pathToImage:
              "https://testbro.pockethost.io/api/files/quiz_page/${pageEntities[i].id.toString()}/${pageEntities[i].image}",
          answers: Map<int, String>.from(
            pageEntities[i].answers.map(
                  (key, value) => MapEntry(
                    int.parse(key.toString()),
                    value.toString(),
                  ),
                ),
          ),
          pageController: pageController,
        ),
      );
    }

    pages.add(
      FinalPageQuiz(
        image: finalEntity.image,
        name: finalEntity.name,
        description: finalEntity.description,
        answers: answers,
      ),
    );
    return pages;
  }
}
