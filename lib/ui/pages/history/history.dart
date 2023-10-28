import 'package:finanlearn/ui/utils/dimensions.dart';
import 'package:finanlearn/ui/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/service/interest_history_request.dart';
import '../../../domain/controllers/interest_controller.dart';
import '../../../domain/models/interest.dart';
import '../dashboard/Dashboard.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  InterestController historyController = Get.find();
  late Future<List<Interest>> listHistory = InterestRequest.viewListHistory();
  int length = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width5, vertical: Dimensions.height5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.offAll(() => const Dashboard());
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 32,
                  )),
              SizedBox(
                height: Dimensions.screenHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.screenWidth * 0.03,
                    bottom: Dimensions.screenHeight * 0.013),
                child: Text('Historial de ejercicios',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: Dimensions.screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                  height: Dimensions.screenHeight * 0.75,
                  child: viewListHistory()),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewListHistory() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: historyController.listHistory?.isEmpty == true
          ? 0
          : historyController.listHistory!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Interest>>(
          future: listHistory,
          builder: (context, position) {
            if (position.hasData) {
              String date = position.data![index].year.isNotEmpty
                  ? '${position.data![index].year} año '
                  : '';
              date += position.data![index].month.isNotEmpty
                  ? '${position.data![index].month} meses '
                  : '';

              date += position.data![index].day.isNotEmpty
                  ? '${position.data![index].day} dias '
                  : '';

              return CardHistory(
                color: position.data![index].type.toString() == 'simple'
                    ? const Color.fromRGBO(100, 220, 185, 1)
                    : const Color.fromRGBO(11, 138, 47, 1),
                result: position.data![index].result.toString(),
                title: position.data![index].title.toString(),
                interest: position.data![index].interestEarned.isNotEmpty
                    ? position.data![index].interestEarned.toString()
                    : null,
                rate: position.data![index].interestRate.isNotEmpty
                    ? position.data![index].interestRate.toString()
                    : null,
                futureValue: position.data![index].futureValue.isNotEmpty
                    ? position.data![index].futureValue.toString()
                    : null,
                capital: position.data![index].capital.isNotEmpty
                    ? position.data![index].capital.toString()
                    : null,
                compoundAmount: position.data![index].compoundAmount.isNotEmpty
                    ? position.data![index].compoundAmount.toString()
                    : null,
                time: date.isEmpty ? null : date,
              );
            } else if (position.hasError) {
              return Text('${position.error}');
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
