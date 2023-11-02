import 'package:finanlearn/domain/controllers/interest_controller.dart';
import 'package:finanlearn/domain/models/publicity.dart';
import 'package:finanlearn/ui/pages/calculator/compound_interest.dart';
import 'package:finanlearn/ui/pages/history/history.dart';
import 'package:finanlearn/ui/pages/pageTest/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/service/publicity_request.dart';
import '../../../domain/controllers/publicity_controller.dart';
import '../../../domain/controllers/user_controller.dart';
import '../../utils/Dimensions.dart';
import '../../widgets/Button.dart';
import '../../widgets/flash_card.dart';
import '../calculator/simple_interest.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserController userController = Get.find();
  PublicityController publicityController = Get.find();
  late Future<List<Publicity>> listPublicity = PublicityRequest.viewPublicity();
  InterestController historyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height20,
                child: Stack(
                  children: [
                    Positioned(
                      top: -70,
                      left: -90,
                      child: Container(
                        width: 280,
                        height: 280,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: Dimensions.height2,
                      left: Dimensions.screenWidth * 0.8,
                      child: IconButton(
                          onPressed: () {
                            Get.offAllNamed('/principal');
                          },
                          icon: const Icon(
                            Icons.login_outlined,
                            color: Colors.black,
                            size: 35,
                          )),
                    ),
                    Positioned(
                      top: Dimensions.screenHeight * 0.095,
                      left: Dimensions.screenWidth * 0.3,
                      child: Text("Hola,",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.08,
                              fontWeight: FontWeight.normal)),
                    ),
                    Positioned(
                      top: Dimensions.screenHeight * 0.135,
                      left: Dimensions.screenWidth * 0.3,
                      child: Text(
                          userController.lastName.isNotEmpty
                              ? userController.lastName
                              : 'Usuario',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: Dimensions.screenWidth * 0.1,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.screenWidth * 0.08,
                  top: Dimensions.screenHeight * 0.05,
                  right: Dimensions.screenWidth * 0.08,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          color: const Color.fromRGBO(51, 190, 91, 1),
                          onPressed: () {
                            Get.offAll(() => const SimpleInterest());
                          },
                          icon: Icons.calculate_rounded,
                          title: 'Interes simple',
                        ),
                        SizedBox(
                          width: Dimensions.screenWidth * 0.02,
                        ),
                        Button(
                          color: const Color.fromRGBO(255, 227, 179, 1),
                          onPressed: () {
                            Get.offAll(() => const CompoundInterest());
                          },
                          icon: Icons.calculate_rounded,
                          title: 'Interes compuesto',
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Dimensions.screenHeight * 0.02,
                          bottom: Dimensions.screenHeight * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            color: const Color.fromRGBO(100, 220, 185, 1),
                            onPressed: () async {
                              await historyController.viewPublicity();
                              Get.offAll(() => const History());
                            },
                            icon: Icons.format_align_left_rounded,
                            title: 'Historial',
                          ),
                          SizedBox(
                            width: Dimensions.screenWidth * 0.02,
                          ),
                          Button(
                            color: const Color.fromRGBO(11, 138, 47, 1),
                            onPressed: () {
                              Get.offAll(() => const Test());
                            },
                            icon: Icons.play_arrow_rounded,
                            title: 'Test',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.06,
                      child: Stack(
                        children: [
                          Positioned(
                            left: Dimensions.screenWidth * 0.002,
                            child: Text("Material Educativo",
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: Dimensions.screenWidth * 0.075,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: Dimensions.screenHeight * 0.3,
                  child: viewPublicity()),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewPublicity() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: publicityController.listPublicity?.isEmpty == true
          ? 0
          : publicityController.listPublicity!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return FutureBuilder<List<Publicity>>(
          future: listPublicity,
          builder: (context, position) {
            if (position.hasData) {
              return FlashCard(
                color: position.data![index].type.toString() == 'video'
                    ? const Color.fromRGBO(100, 220, 185, 1)
                    : const Color.fromRGBO(11, 138, 47, 1),
                icon: position.data![index].type.toString() == 'video'
                    ? Icons.movie_creation_rounded
                    : Icons.article_rounded,
                title: position.data![index].title.toString(),
                description: position.data![index].description.toString(),
                youtubeUrl: Uri.parse(position.data![index].link.toString()),
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
