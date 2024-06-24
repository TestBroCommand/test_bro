import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:test_bro/src/feature/quize/bloc/quize_bloc.dart';

class FirstPageQuiz extends StatelessWidget {
  final String image;
  final String name;
  final String id;
  final String description;
  final PreloadPageController pageController;
  const FirstPageQuiz({
    required this.image,
    required this.name,
    required this.description,
    required this.pageController,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     print("FirstPage ${image}");
    String photoLink = '';
    if (image == 'og:img meta tag not found') {
      photoLink = 'default';
    } else if (image.contains('https')) {
      photoLink = image;
    } else if (!image.contains('https') || image.contains('istock')) {
      photoLink =
          "https://pb-dev.testbroapp.ru/api/files/start_pages/$id/$image";
    }

    return Scaffold(
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) =>
            context.read<QuizBloc>().add(ResetStateEvent()),
        child: ListView(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () => context.go('/'),
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(84, 52, 84, 25),
              child: SizedBox(
                width: 204,
                height: 225,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    photoLink,
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
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
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
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
