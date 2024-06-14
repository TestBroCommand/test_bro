import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bro/src/core/utils/layout/layout.dart';
import 'package:test_bro/src/feature/home/bloc/home_bloc.dart';
import 'package:test_bro/src/feature/home/widget/quiz_widget.dart';

/// {@template home_screen}
/// HomeScreen is a simple screen that displays a grid of items.
/// {@endtemplate}
class HomeScreen extends StatefulWidget {
  /// {@macro home_screen}
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textController;
  String _searchText = '';

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeFailure) {
              return Center(child: Text(state.error.toString()));
            } else if (state is HomeLoaded) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final windowSize = constraints.materialBreakpoint;
                  final allQuizzes = state.quizzes;
                  final filteredQuizzes = allQuizzes.where((quiz) {
                    final quizTitleWords = quiz.title.toLowerCase().split(' ');
                    return quizTitleWords
                        .any((word) => word.startsWith(_searchText));
                  }).toList();
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              labelText: 'Search',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => setState(() {
                              _searchText = _textController.text.toLowerCase();
                            }),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: HorizontalSpacing.centered(windowWidth),
                        sliver: SliverGrid.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            crossAxisCount: switch (windowSize) {
                              WindowSize.compact => 2,
                              <= WindowSize.expanded => 3,
                              _ => 4,
                            },
                          ),
                          itemCount: filteredQuizzes.length,
                          itemBuilder: (context, index) {
                            final currentQuiz = filteredQuizzes[index];
                            return QuizWidget(
                              currentQuiz: currentQuiz,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
