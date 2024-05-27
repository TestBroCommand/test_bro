import 'package:flutter/material.dart';

/// Widget for display quiz card in main screen
class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (context, constraints) {
        final double height = constraints.maxHeight;
        final double cardHeight = height * 0.3;
        return Card(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: cardHeight * 1),
                Row(
                  children: [
                    const Text('450'),
                    SizedBox(width: 5),
                    Icon(Icons.ads_click_rounded),
                  ],
                ),
                
              ],
            ),
          ),
        );
      },
    );
}
