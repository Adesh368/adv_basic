import 'package:flutter/material.dart';

class QuestionStyle extends StatelessWidget {
  const QuestionStyle(this.answertext, this.onTap, {super.key});

  final String answertext;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 14, 2, 37),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),),
      child: Text(answertext),
    );
  }
}
