class Question {
  final int id;
  final String question;
  final List<String> options;
  final int correctOption;
  bool completed;

  Question(this.id, this.question, this.options, this.correctOption, this.completed);

  Map toJson() => {
        'id': id,
        'question': question,
        'options': options,
        'correctOption': correctOption,
        'completed': completed,
      };

  factory Question.fromJson(Map json) {
    return Question(
      json['id'],
      json['question'],
      (json['options'] as List).cast<String>(),
      json['correctOption'],
      json['completed'],
    );
  }
}