import 'dart:math';
import 'dart:typed_data';

import 'package:finanlearn/domain/controllers/interest_controller.dart';

class InterestCompound {
  static double calculateFutureValue(
    Map<String, double> data,
    double time,
  ) {
    double capital = data['capital']!;
    double interestRate = data['interestRate']!;
    double decimalRate = interestRate / 100;
    num factor = pow(1 + decimalRate, time);

    return capital * factor;
  }

  static double calculatePresentValue(Map<String, double> data, double time) {
    double compoundAmount = data['compoundAmount']!;
    double interestRate = data['interestRate']!;
    double decimalRate = interestRate / 100;
    num factor = pow(1 + decimalRate, time);
    return compoundAmount / factor;
  }

  static double calculateInterestRate(Map<String, double> data, double time) {
    double capital = data['capital']!;
    double compoundAmount = data['compoundAmount']!;
    double factor = pow(compoundAmount / capital, 1 / time) - 1;
    return factor;
  }

  static double calculateTime(Map<String, double> data, String showTime) {
    double capital = data['capital']!;
    double compoundAmount = data['compoundAmount']!;
    double interestRate = data['interestRate']!;
    double time = 0;

    time = (log(compoundAmount) - log(capital)) / log(1 + interestRate / 100);
    switch (showTime) {
      case "years":
        return time;
      case "months":
        return (time * 12);
      case "days":
        return (time * 365);
      default:
        return 0;
    }
  }
}
