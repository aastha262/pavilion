import 'package:TfLite/screens/animation.dart';
import 'package:TfLite/screens/body_detection.dart';
import 'package:TfLite/screens/camera_screen.dart';
import 'package:TfLite/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:TfLite/screens/all_models.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.white, // navigation bar color
  //   statusBarColor: Colors.white, // status bar color
  // ));
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Machine learning',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF457b9d),
            secondary: Colors.white,
          ),
          primaryColor: const Color(0xFF457b9d),
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xffA0766E),
          )),
      initialRoute: OnboardingExample.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CameraScreen.id: (context) => CameraScreen(),
        AllModels.id: (context) => AllModels(),
        BodyDetectionScreen.id: (context) => BodyDetectionScreen(),
        OnboardingExample.id: (context) => OnboardingExample(),
      },
    );
  }
}
