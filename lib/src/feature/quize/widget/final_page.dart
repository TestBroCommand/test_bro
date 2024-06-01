import 'package:flutter/material.dart';

class FinalPageQuiz extends StatelessWidget {
  const FinalPageQuiz({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(21, 42, 21, 40),
          child: SizedBox(
            width: 204,
            height: 225,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "",
                  fit: BoxFit.fill,
                ),),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            textAlign: TextAlign.center,
            "wfwef",
            style: TextStyle(
                color: Color.fromRGBO(0, 122, 255, 1),
                fontSize: 40,
                fontWeight: FontWeight.bold,),
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 24),
            child: Text(
              "",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: Text("Поделитесь результатами с друзьями!",
                style: TextStyle(
                    color: Color.fromRGBO(0, 122, 255, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(180, 50),
                  backgroundColor: const Color.fromRGBO(0, 122, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                label: const Text('Copy link',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,),),
                iconAlignment: IconAlignment.end,
                icon: const Icon(
                  Icons.copy_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},),
          ),
        ),
      ],),
    );
}
