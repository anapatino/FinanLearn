import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/Dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class FlashCard extends StatelessWidget {
  final Uri youtubeUrl;
  final Color color;
  final String title;
  final IconData icon;
  final String description;

  const FlashCard({
    required this.youtubeUrl,
    required this.color,
    required this.title,
    required this.icon,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchYouTubeVideo(youtubeUrl);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: Dimensions.screenWidth * 0.58,
        height: Dimensions.screenHeight * 0.4,
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.screenWidth * 0.03,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Dimensions.screenHeight * 0.16,
              width: Dimensions.screenWidth * 0.65,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(
                    (Radius.circular(20)),
                  )),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: Colors.white,
                    size: 50,
                  )),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.01,
            ),
            SizedBox(
              width: Dimensions.screenWidth * 0.69,
              child: Text(title,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.01,
            ),
            SizedBox(
              width: Dimensions.screenWidth * 0.69,
              child: Text(description,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _launchYouTubeVideo(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'No se pudo abrir el enlace: $url';
      }
    } catch (e) {
      print('Error al abrir el enlace: $e');
    }
  }
}
