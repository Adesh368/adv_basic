import 'package:flutter/material.dart';
import 'package:adv_basic/questionstyle.dart';
import 'package:adv_basic/model/questions.dart';

class QuestionNier extends StatefulWidget {
  const QuestionNier(this.onSelectAnswer,{super.key});

  final void Function(String answers) onSelectAnswer;

  @override
  State<QuestionNier> createState() {
    return _QuestionNier();
  }
}

class _QuestionNier extends State<QuestionNier> {
  var changedQuestion = 0;
  
  void currentQuestion(String answers) {
    widget.onSelectAnswer(answers);
    setState(() {
      changedQuestion++;
    });
  }

  @override
  Widget build(context) {
    final activeQuestion = questions[changedQuestion];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            activeQuestion.text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...activeQuestion.getShuffledAnswer().map((item) {
            return QuestionStyle(item, (){
              currentQuestion(item);
            });
          }),
        ],
      ),
    );
  }
//  final activeQuestion = questions[0];
//  @override
//  Widget build(context) {
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      children: [
//         Text(
//          activeQuestion.text,
//          style: const TextStyle(
//           fontSize: 20,
//            color: Colors.white,
//          ),
//        ),
//        const SizedBox(
//          height: 30,
//        ),
//        QuestionStyle(
//          activeQuestion.answers[0],
//          () {},
//        ),
//        QuestionStyle(
//         activeQuestion.answers[1],
//          () {},
//        ),
//        QuestionStyle(
//          activeQuestion.answers[2],
//          () {},
//        ),
//        QuestionStyle(
//          activeQuestion.answers[3],
//          () {},
//        ),
//      ],
//    );
//  }
}
