import 'package:flutter/material.dart';



class TextWidget extends StatelessWidget {
  const TextWidget(this.clickbut,{super.key});

  final void Function() clickbut;

  @override
  Widget build(context) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 200,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Learn flutter the fun way!',
                style: TextStyle(color:  Color.fromARGB(150, 255, 255, 255), fontSize: 20),
              ),
              const SizedBox(
                height: 24,
              ),
              OutlinedButton.icon(
                onPressed: clickbut,
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.arrow_right_alt,),
                label: const Text('Stat Quiz'),
              )
            ],
          );
  }
}