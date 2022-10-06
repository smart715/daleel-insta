import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:insta_daleel/screens/intro_slider/intro_slider_ui.dart';
import 'package:insta_daleel/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Insta Daleel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PoppinsRegular',
      ),
      home: const InstaDaleelApp(),
    ),
  ));
}

class InstaDaleelApp extends StatelessWidget {
  const InstaDaleelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IntroSlider();
  }
}
