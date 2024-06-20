// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:test_bro/src/feature/quize/bloc/quize_bloc.dart';
import 'package:test_bro/src/feature/quize/widget/custom_progress_bar.dart';

class QuestionPage extends StatefulWidget {
  final int sumQuestions;
  final String id;
  final String questionId;
  final int currentQuestion;
  final String question;
  final String pathToImage;
  final Map<int, String> answers;
  final PreloadPageController pageController;

  const QuestionPage({
    required this.question,
    required this.pathToImage,
    required this.answers,
    required this.currentQuestion,
    required this.sumQuestions,
    required this.pageController,
    required this.id,
    required this.questionId,
    super.key,
  });

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool answerChecker = false;
  int? selectedAnswer;

  void updateAnswerChecker(bool value, int answerIndex) {
    setState(() {
      answerChecker = value;
      selectedAnswer = answerIndex;
      nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final progressValue = (widget.currentQuestion / widget.sumQuestions) * 100;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(85, 20, 74, 6),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: AnimatedLinearProgressIndicator(
                value: progressValue,
                color: const Color.fromRGBO(0, 122, 255, 1),
                duration: 1500,
                height: 10,
                radius: 20,
                padding: 2,
              ),
            ),
          ),
          Center(
            child: Text(
              '${widget.currentQuestion}/${widget.sumQuestions}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 30),
            child: SizedBox(
              width: 326,
              height: 217,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://pb.testbroapp.ru/api/files/quiz_page/${widget.questionId}/${widget.pathToImage}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 25),
            child: Text(
              widget.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromRGBO(0, 122, 255, 1),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          QuestionPageCheckBox(
            answers: widget.answers,
            onAnswerSelected: (isSelected, answerIndex) {
              updateAnswerChecker(isSelected, answerIndex);
            },
          ),
          const SizedBox(height: 20),
          if (answerChecker)
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: nextPage,
                child: const Text('Дальше'),
              ),
            )
          else
            Container(),
        ],
      ),
    );
  }

  void nextPage() {
    widget.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    context.read<QuizBloc>().add(
          AnswerSelected(
            widget.currentQuestion,
            selectedAnswer! + 1,
          ),
        );
  }
}

class QuestionPageCheckBox extends StatefulWidget {
  final Map<int, String> answers;
  final Function(bool, int) onAnswerSelected;

  const QuestionPageCheckBox({
    required this.answers,
    required this.onAnswerSelected,
    super.key,
  });

  @override
  _QuestionPageCheckBoxState createState() => _QuestionPageCheckBoxState();
}

class _QuestionPageCheckBoxState extends State<QuestionPageCheckBox> {
  int? setFlag;

  void settingFlag(int newFlag) {
    setState(() {
      setFlag = newFlag;
    });
    widget.onAnswerSelected(true, newFlag);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          for (int i = 0; i < widget.answers.length; i++) ...[
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: const Color.fromRGBO(0, 122, 255, 1),
              title: Text(
                '${widget.answers[i]}',
              ),
              value: setFlag == i,
              onChanged: (value) {
                settingFlag(i);
              },
            ),
            const Divider(
              height: 5,
              thickness: 3,
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ],
      );
}
