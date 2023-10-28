class Interest {
  String capital,
      day,
      futureValue,
      interestRate,
      month,
      result,
      type,
      year,
      interestEarned,
      compoundAmount,
      title;

  Interest(
      {required this.capital,
      required this.day,
      required this.futureValue,
      required this.interestRate,
      required this.month,
      required this.result,
      required this.type,
      required this.year,
      required this.title,
      required this.compoundAmount,
      required this.interestEarned});

  factory Interest.fromJson(Map<String, dynamic> json) {
    return Interest(
      capital: json['capital'] ?? '',
      day: json['day'] ?? '',
      futureValue: json['futureValue'] ?? '',
      type: json['type'] ?? '',
      interestRate: json['interestRate'] ?? '',
      month: json['month'] ?? '',
      result: json['result'] ?? '',
      year: json['year'] ?? '',
      title: json['title'] ?? '',
      compoundAmount: json['compoundAmount'] ?? '',
      interestEarned: json['interestEarned'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'capital': capital,
      'day': day,
      'futureValue': futureValue,
      'type': type,
      'interestRate': interestRate,
      'month': month,
      'result': result,
      'year': year,
      'title': title,
      'compoundAmount': compoundAmount,
      'interestEarned': interestEarned,
    };
  }
}
