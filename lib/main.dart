import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:healthproject/pages/test.dart';
import "pages/login_page.dart";
import 'package:firebase_core/firebase_core.dart';
void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization=Firebase.initializeApp();
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
      home:FutureBuilder(
        future:_initialization,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(child: Text("hata"),);
          } else if(snapshot.hasData){
            return Test();
        }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}
