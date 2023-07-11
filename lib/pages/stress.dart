import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/pages/stress_nefes.dart';
import 'package:healthproject/pages/stress_yoga.dart';
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
                SizedBox(
                  height: 45,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NefesEgzersizi()),
                    );
                  },
                  child: buildCard(
                    "Nefes Egzersizi",
                    "Doğru Nefes Alış-Veriş",
                    "assets/indir.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Yoga()),
                    );
                  },
                  child: buildCard(
                    "Yoga",
                    "Zihin ve Beden Dengesi",
                    "assets/unnamed.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UykuScreen()),
                    );
                  },
                  child: buildCard(
                    "Uyku",
                    "Uyku Düzeni",
                    "assets/uyku1.jpg",
                  ),
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
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}

class UykuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uyku"),
      ),
      body: Center(
        child: Text("Uyku Sayfası"),
      ),
    );
  }
}
