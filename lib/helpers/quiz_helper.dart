import '../models/quiz.dart';

class QuizHelper {
  int responseCode;
  List<Quiz> results;

  QuizHelper({this.responseCode, this.results});

  QuizHelper.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = new List<Quiz>();
      json['results'].forEach((v) {
        results.add(new Quiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


