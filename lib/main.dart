import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import "pages/login_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MediConn',
      theme: ThemeData(
        textTheme:
            GoogleFonts.abhayaLibreTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
