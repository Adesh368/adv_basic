import 'package:adv_basic/model/questions.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/text_widget.dart';
import 'package:adv_basic/questionaire.dart';
import 'package:adv_basic/results.dart';
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var activeScreen = 'initial';
  List<String> result = [];

  // @override
  //void initState() {
  //   activeWidget = TextWidget(activeWidgetState);
  //   super.initState();
  // }
  void chooseAnswer(String answers) {
    result.add(answers);

    if (result.length == questions.length) {
      setState(() {
        
        activeScreen = 'Result_answered';
      });
    }
  }

  void activeWidgetState() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void restartQuestion() {
    setState(() {
      result = [];
      activeScreen = 'question';
    });
  }



  @override
  Widget build(context) {
    Widget screenDisplay = TextWidget(activeWidgetState);
    
    if (activeScreen == 'question') {
      screenDisplay = QuestionNier(chooseAnswer);
    }

    if (activeScreen=='Result_answered') {
      screenDisplay =  ResultScreen(result,restartQuestion);
    }

    
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 26, 2, 80),
                Color.fromARGB(255, 45, 7, 98),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Center(
              child: screenDisplay,
            )),
      ),
    );
  }
}
