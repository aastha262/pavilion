import 'package:TfLite/screens/body_detection.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:TfLite/screens/camera_screen.dart';
import 'package:TfLite/screens/all_models.dart';

class PageData {
  final String title;
  final String lottieImage;
  final Color bgColor;
  final Color textColor;
  final Color logoColor;
  final Color cardColor;
  final String screen;
  final String subtitle;

  PageData({
    this.title,
    this.lottieImage,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.logoColor,
    this.cardColor,
    this.screen,
    this.subtitle,
  });
}

Color _blue = Color(0xFF457b9d);
// Color _red = Color(0xFFe76f51);
Color _yellow = Color(0xFFfca311);
Color _white = Color(0xFFf1faee);
// Color _green = Color(0xFF2a9d8f);

class OnboardingExample extends StatelessWidget {
  static const String id = 'onboarding';
  final List<PageData> pages = [
    PageData(
        lottieImage: 'assets/leaf-animations.json',
        title: "Real-time Detection",
        textColor: Colors.white,
        bgColor: _yellow,
        logoColor: _yellow,
        cardColor: _white,
        screen: CameraScreen.id,
        subtitle:
            'Detect objects real time by pointing your camera towards the subject'),
    PageData(
        lottieImage: 'assets/capture_animation.json',
        title: "Click and Detect",
        textColor: Colors.grey[700],
        bgColor: _white,
        logoColor: _white,
        cardColor: _yellow,
        screen: AllModels.id,
        subtitle: 'Click a photo from your camera to detect objects.'),
    PageData(
        lottieImage: 'assets/uploading_animation.json',
        title: "Load and Detect",
        textColor: Colors.white,
        bgColor: _blue,
        logoColor: _blue,
        cardColor: _white,
        screen: AllModels.id,
        subtitle: 'Load images from your gallery to detect objects'),
    PageData(
        lottieImage: 'assets/body_detection.json',
        title: "Body Detection",
        textColor: Colors.black,
        bgColor: _white,
        logoColor: _yellow,
        cardColor: _blue,
        screen: BodyDetectionScreen.id,
        subtitle: 'Body pose & mask (selfie segmentation)'),
  ];

  List<Color> get colors => pages.map((p) => p.bgColor).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: colors,
        radius: 40,
        curve: Curves.ease,
        duration: Duration(seconds: 2),
        itemBuilder: (index) {
          PageData page = pages[index % pages.length];
          return Container(
            child: Theme(
              data: ThemeData(
                textTheme: TextTheme(
                  headline6: TextStyle(
                    color: page.textColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    letterSpacing: 0.0,
                    fontSize: 23,
                  ),
                  subtitle2: TextStyle(
                    color: page.textColor,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ),
              ),
              child: PageCard(page: page),
            ),
          );
        },
      ),
    );
  }
}

class PageCard extends StatelessWidget {
  final PageData page;

  PageCard({@required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 80),
          _buildText(context),
          SizedBox(height: 50),
          _buildPicture(context),
          SizedBox(height: 40),
          _buildSubtitile(context),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      page.title,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitile(BuildContext context) {
    return Text(
      page.subtitle,
      style: Theme.of(context).textTheme.subtitle2,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPicture(
    BuildContext context, {
    double size = 190,
    double iconSize = 120,
  }) {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, page.screen);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60.0)),
          color: page.cardColor,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Lottie.asset(page.lottieImage),
          ],
        ),
      ),
    );
  }
}
