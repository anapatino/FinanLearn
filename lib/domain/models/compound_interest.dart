import 'dart:math';

class CompoundInterest {
  double calculateFutureValue(Map<String, double> data, double time) {
    double capital = data['capital']!;
    double interestRate = data['interestRate']!;
    double decimalRate = interestRate / 100;
    num factor = pow(1 + decimalRate, time);
    return capital * factor;
  }

  double calculatePresentValue(Map<String, double> data, double time) {
    double futureValue = data['futureValue']!;
    double interestRate = data['interestRate']!;
    double decimalRate = interestRate / 100;
    num factor = pow(1 + decimalRate, time);
    return futureValue / factor;
  }

  double calculateInterestEarned(Map<String, double> data, double time) {
    double capital = data['capital']!;
    return calculateFutureValue(data, time) - capital;
  }

  double calculateInterestRate(Map<String, double> data, double time) {
    double capital = data['capital']!;
    double futureValue = data['futureValue']!;
    num factor = (pow(futureValue / capital, 1 / time) - 1) * 100;
    return futureValue / factor;
  }

  int calculateTime(Map<String, double> data, String showTime) {
    double capital = data['capital']!;
    double futureValue = data['futureValue']!;
    double interestRate = data['interestRate']!;
    double time = 0;

    if (interestRate != 0) {
      time = (log(futureValue / capital) / log(1 + interestRate / 100));
    }

    switch (showTime) {
      case "years":
        return time.floor();
      case "months":
        return (time * 12).floor();
      case "days":
        return (time * 365).floor();
      default:
        return 0;
    }
  }
}
