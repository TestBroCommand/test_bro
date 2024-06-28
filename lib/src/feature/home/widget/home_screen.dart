import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bro/src/core/utils/analytics.dart';
import 'package:test_bro/src/core/utils/layout/layout.dart';
import 'package:test_bro/src/feature/home/bloc/home_bloc.dart';
import 'package:test_bro/src/feature/home/model/entities/quiz_entity.dart';
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
    context.read<HomeBloc>().add(LoadDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  List<QuizEntity> filteredQuizzes = [];
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
            } else if (state is HomeTagLoading) {
              final List<String> tags = state.tags.map((e) => e.name!).toList();
              final _tagsQuizes = state.tags.map((e) => e.quizes!).toList();
              final List<Widget> chips = [];

              for (int i = 0; i < tags.length; i++) {
                chips.add(
                  FilterChip(
                    backgroundColor: Colors.transparent,
                    label: Text(tags[i]),
                    onSelected: (value) async {
                      await posthog.capture(
                        eventName: "tag_click",
                        properties: {"tag": tags[i]},
                      );
                      context.read<HomeBloc>().add(
                            LoadTagEvent(ids: _tagsQuizes[i]),
                          );
                    },
                  ),
                );
                chips.add(const SizedBox(width: 10));
              }
              return LayoutBuilder(
                builder: (context, constraints) => CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: 'Поиск',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchText =
                                  _textController.text.toLowerCase().trim();
                            });
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: chips,
                          ),
                        ),
                      ),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is HomeLoaded) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final List<String> tags =
                      state.tags.map((e) => e.name!).toList();
                  final _tagsQuizes = state.tags.map((e) => e.quizes!).toList();
                  final List<Widget> chips = [];
                  for (int i = 0; i < tags.length; i++) {
                    chips.add(
                      FilterChip(
                        backgroundColor: Colors.transparent,
                        label: Text(tags[i]),
                        onSelected: (value) => {
                          context.read<HomeBloc>().add(
                                LoadTagEvent(
                                  ids: _tagsQuizes[i],
                                ),
                              ),
                        },
                      ),
                    );
                    chips.add(
                      const SizedBox(
                        width: 10,
                      ),
                    );
                  }
                  final windowSize = constraints.materialBreakpoint;
                  final allQuizzes = state.quizzes;

                  final filteredQuizzes = allQuizzes.where((quiz) {
                    final searchWords = _searchText.split(' ');
                    return searchWords.every(
                      (word) =>
                          quiz.title.toLowerCase().contains(word.toLowerCase()),
                    );
                  }).toList();
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              hintText: 'Поиск',
                            ),
                            onChanged: (value) {
                              setState(() {
                                _searchText =
                                    _textController.text.toLowerCase().trim();
                                posthog.capture(
                                  eventName: "quiz_search",
                                  properties: {"search": _searchText},
                                );
                              });
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: chips,
                            ),
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
            } else if (state is HomeLoadTag) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final List<String> tags =
                      state.tags.map((e) => e.name!).toList();
                  final _tagsQuizes = state.tags.map((e) => e.quizes!).toList();
                  final List<Widget> chips = [];
                  for (int i = 0; i < tags.length; i++) {
                    chips.add(
                      FilterChip(
                        label: Text(tags[i]),
                        onSelected: (value) => {
                          context.read<HomeBloc>().add(
                                LoadTagEvent(
                                  ids: _tagsQuizes[i],
                                ),
                              ),
                        },
                      ),
                    );
                    chips.add(
                      const SizedBox(
                        width: 10,
                      ),
                    );
                  }
                  final windowSize = constraints.materialBreakpoint;
                  final allQuizzes = state.quizzes;

                  filteredQuizzes = allQuizzes.where((quiz) {
                    final quizTitleWords = quiz.title.toLowerCase().split(' ');
                    return quizTitleWords
                        .any((word) => word.contains(_searchText));
                  }).toList();
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              hintText: 'Поиск',
                            ),
                            onChanged: (value) => setState(() {
                              _searchText = _textController.text.toLowerCase();
                            }),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: chips,
                            ),
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
