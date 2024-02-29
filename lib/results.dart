
import 'package:adv_basic/model/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/question_sum.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswer,this.reStart,{super.key});
  
  final List<String> choosenAnswer;
  final void Function() reStart;

  List<Map<String, Object>>getSummarry() {
    List<Map<String, Object>> summary = [];

    for (var i=0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  
  @override
  Widget build(context) {
    final summaryDatas = getSummarry();
    final totalNumberOfQuestion = questions.length;
    final numberOfCorrectQuestion = summaryDatas.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Text('You answered $numberOfCorrectQuestion out of $totalNumberOfQuestion correctly',
         style: const TextStyle(
                color:  Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,),
         const SizedBox(height: 20),
         QuestionsSummary(summaryDatas),
         //const SizedBox(height: 20),
         TextButton(onPressed: reStart, child: const Text('return'),)
        ],
      );
  }

}