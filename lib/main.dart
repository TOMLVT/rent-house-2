import 'package:app_house_rent/model/home.dart';
import 'package:app_house_rent/page/Details_page.dart';
import 'package:app_house_rent/page/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
       visualDensity: VisualDensity.adaptivePlatformDensity,
       scaffoldBackgroundColor: const Color(0xffFAFAFA),
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),

      home: const MenuPage(),
      routes: {
        '/detail' : (context) {
           Home home = ModalRoute.of(context)!.settings.arguments as Home;
        return DetailPage(home: home);
        }
      },
    );
  }
}

