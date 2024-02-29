


class QuizQuestion {
 const QuizQuestion(this.text,this.answers);


  final String text;
  final List<String> answers;


  List<String> getShuffledAnswer() {
    final getShuffled = List.of(answers);
    getShuffled.shuffle();
    return getShuffled;
  }
}