class Questions {
  String questions;
  List<String> answers;

  Questions(this.questions, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
