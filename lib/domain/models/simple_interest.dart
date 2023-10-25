class InterestSimple {
  static double calculateFutureValue({
    required Map<String, double> data,
    required double time,
    required bool isChecked,
  }) {
    double capital = data['capital']!;
    double interestRate = data['interestRate']! / 100;
    double newFutureValue;

    if (isChecked) {
      newFutureValue = capital * (1 + interestRate * time);
    } else {
      newFutureValue = capital * interestRate * time;
    }
    return newFutureValue;
  }

  static double calculateInterest({
    required Map<String, double> data,
    required double time,
  }) {
    double interestEarned = data['interestEarned']!;
    double interestRate = data['interestRate']!;
    double capital = (interestEarned / (interestRate * time)) * 100;
    return capital;
  }

  static double calculateCapital({
    required Map<String, double> data,
    required double time,
  }) {
    double interestEarned = data['interestEarned']!;
    double interestRate = data['interestRate']!;
    double capital = (interestEarned / (interestRate * time)) * 100;
    return capital;
  }

  static double calculateInterestRate({
    required Map<String, double> data,
    required double time,
  }) {
    double capital = data['capital']!;
    double interestEarned = data['interestEarned']!;
    double interestRate = (interestEarned / (capital * time)) * 100;
    return interestRate;
  }

  static Map<String, int> calculateTime({
    required Map<String, double> data,
    required String showTime,
  }) {
    double capital = data['capital']!;
    double interestEarned = data['interestEarned']!;
    double interestRate = data['interestRate']!;
    double time = (interestEarned / (capital * interestRate)) * 100;
    time = time * 360;

    int years = time ~/ 360;
    double remainingDays = time % 360;
    int months = remainingDays ~/ 30;
    int days = remainingDays.round() % 30;

    return {'years': years, 'months': months, 'days': days};
  }
}
