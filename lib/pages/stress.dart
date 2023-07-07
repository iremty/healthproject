import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/global.dart' as global;
import '../widgets/background_image.dart';

class Stress extends StatefulWidget {
  const Stress({super.key});

  @override
  _StressState createState() => _StressState();
}

class _StressState extends State<Stress> {
  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Stres Yönetimi"),
      ),
      body: Stack(
        children: [
          BackGroundImage1(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 25),
                Image.asset(
                  "assets/asd.png",
                ),
                SizedBox(height: 45,),
                buildCard(
                  "Nefes Egzersizi",
                  "Doğru Nefes Alış-Veriş",
                  "assets/indir.jpg",
                ),
                buildCard(
                  "Yoga",
                  "Zihin ve Beden Dengesi",
                  "assets/unnamed.jpg",
                ),
                buildCard(
                  "Uyku",
                  "Uyku Düzeni",
                  "assets/uyku1.jpg",
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              menu.buildHeader(context),
              menu.buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(String baslik, String altbaslik, String imagePath) {
    return Card(

      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 48.0,
          height: 48.0,
        ),
        title: Text(
          baslik,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          altbaslik,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          padding: EdgeInsets.only(bottom: 15),
          icon: Icon(Icons.arrow_right,size: 50,),
          onPressed: () {
            // IconButton'a tıklanınca yapılacak işlemler
          },
        ),
      ),
    );
  }
}
