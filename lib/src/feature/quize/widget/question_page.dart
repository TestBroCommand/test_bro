// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

class QuestionPage extends StatefulWidget {
  final int sumQuestions;
  final int currentQuestion;
  final String question;
  final String pathToImage;
  final Map<int, String> answers;
  final PreloadPageController pageController;

  QuestionPage({
    required this.question,
    required this.pathToImage,
    required this.answers,
    required this.currentQuestion,
    required this.sumQuestions,
    required this.pageController,
    super.key,
  });

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool answerChecker = false;

  // ignore: avoid_positional_boolean_parameters
  void updateAnswerChecker(bool value) {
    setState(() {
      answerChecker = value;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(85, 20, 74, 6),
              child: LinearProgressIndicator(
                value: 0.25,
                color: Color.fromRGBO(0, 122, 255, 1),
                backgroundColor: Colors.blueGrey,
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
                    widget.pathToImage,
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
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            QuestionPageCheckBox(
              answers: widget.answers,
              onAnswerSelected: updateAnswerChecker,
            ),
            const SizedBox(height: 20),
            if (answerChecker)
              ElevatedButton(
                onPressed: () => widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                child: const Text('Дальше'),
              )
            else
              Container(),
          ],
        ),
      );
}

class QuestionPageCheckBox extends StatefulWidget {
  final Map<int, String> answers;
  // ignore: inference_failure_on_function_return_type, avoid_positional_boolean_parameters
  final Function(bool) onAnswerSelected;

  const QuestionPageCheckBox({
    super.key,
    required this.answers,
    required this.onAnswerSelected,
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
    widget.onAnswerSelected(true);
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
                style: const TextStyle(
                  fontSize: 20,
                ),
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
