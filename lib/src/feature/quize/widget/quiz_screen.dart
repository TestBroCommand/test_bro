import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bro/src/feature/quize/bloc/quize_bloc.dart';
import 'package:test_bro/src/feature/quize/model/enities/page_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/result_enity.dart';
import 'package:test_bro/src/feature/quize/model/enities/start_enity.dart';
import 'package:test_bro/src/feature/quize/widget/first_page.dart';

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
          //    logger.info(startPage + " Quiz result");
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
            return FirstPageQuiz(
              image: startEntity.name,
              name: startEntity.name,
              description: startEntity.description,
            );
          }
          return Container();
        },
      );
}
