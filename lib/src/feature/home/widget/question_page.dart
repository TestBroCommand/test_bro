import 'package:flutter/material.dart';
import 'package:test_bro/src/feature/home/widget/consts.dart';

class QuestionPage extends StatelessWidget{
  const QuestionPage({super.key});
  
  @override
  Widget build(BuildContext context)=> Scaffold(
    body: ListView(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(85, 20, 74, 6),
          child: LinearProgressIndicator(
            value: 0.25,
            color:  Color.fromRGBO(0, 122, 255, 1), 
            backgroundColor: Colors.blueGrey,
          ),
        ),
        const Center(
          child: Text(
            '1/27',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding:const EdgeInsets.fromLTRB(18, 15, 18, 30),
          child: SizedBox(
            width: 326,
            height: 217,
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                pathToImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 25), 
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(0, 122, 255, 1),
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const QuestionPageChekBox(),
      ],
    ),
  );
}

class QuestionPageChekBox extends StatefulWidget {
  const QuestionPageChekBox({super.key});
  
  @override
  _QuestionPageChekBoxState createState() => _QuestionPageChekBoxState();
}

class _QuestionPageChekBoxState extends State<QuestionPageChekBox> {
  int? setFlag;
  void settingFlag(int newFlag) {
    setState(() {
      setFlag = newFlag;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: const Color.fromRGBO(0, 122, 255, 1),
        title: Text(
          '${possibleAnswers[1]}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        value: setFlag == 1,
        onChanged: (value) {
          settingFlag(1);
        },
      ),
      
      const Divider(
        height: 5,
        thickness: 3,
        color: Colors.black,
        indent: 20,
        endIndent: 20,
      ),
      
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: const Color.fromRGBO(0, 122, 255, 1),
        title: Text(
          '${possibleAnswers[2]}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        value: setFlag == 2,
        onChanged: (value) {
          settingFlag(2);
        },
      ),
      
      const Divider(
        height: 5,
        thickness: 3,
        color: Colors.black,
        indent: 20,
        endIndent: 20,
      ),
      
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: const Color.fromRGBO(0, 122, 255, 1),
        title: Text(
          '${possibleAnswers[3]}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        value: setFlag == 3,
        onChanged: (value) {
          settingFlag(3);
        },
      ),
      
      const Divider(
        height: 5,
        thickness: 3,
        color: Colors.black,
        indent: 20,
        endIndent: 20,
      ),
      
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor:  const Color.fromRGBO(0, 122, 255, 1),
        title: Text(
          '${possibleAnswers[4]}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        value: setFlag == 4,
        onChanged: (value) {
          settingFlag(4);
        },
      ),
    ],
  );
}
