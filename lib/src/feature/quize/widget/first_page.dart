import 'package:flutter/material.dart';

class FirstPageQuiz extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  const FirstPageQuiz({
    required this.image,
    required this.name,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(84, 52, 84, 25),
              child: SizedBox(
                width: 204,
                height: 225,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 53.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(201, 50),
                    backgroundColor: const Color.fromRGBO(0, 122, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Начать тест',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 17, color: Colors.black87),
              ),
            ),
          ],
        ),
      );
}
