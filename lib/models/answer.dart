class Answer {
  final int questionId;
  final int selectedOption;
  final bool isCorrect;

  Answer(this.questionId, this.selectedOption, this.isCorrect);

  Map toJson() => {
        'questionId': questionId,
        'selectedOption': selectedOption,
        'isCorrect': isCorrect,
      };

  factory Answer.fromJson(Map json) {
    return Answer(
      json['questionId'],
      json['selectedOption'],
      json['isCorrect'],
    );
  }
}