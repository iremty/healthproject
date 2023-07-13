import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/pages/stress_nefes.dart';
import 'package:healthproject/pages/stress_yoga.dart';
import '../widgets/background_image.dart';
import "dart:async";

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
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25),
            Image.asset(
              "assets/image.png",
            ),
            SizedBox(
              height: 18,
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
      backgroundColor: Colors.blue[900],
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

class UykuScreen extends StatefulWidget {
  @override
  _UykuScreenState createState() => _UykuScreenState();
}

class _UykuScreenState extends State<UykuScreen> {
  int uykuBaslangic = 0;
  int uykuBitis = 0;

  String uykuBaslangicSaati = "";
  String uykuBitisSaati = "";

  Timer? timer;
  int dakika = 0;
  int saat = 0;
  int saniye = 0;
  bool uykuTamamlandi = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        saniye++;
        if (saniye == 60) {
          saniye = 0;
          dakika++;
          if (dakika == 60) {
            dakika = 0;
            saat++;
          }
        }
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      uykuBitis = DateTime.now().hour;
      uykuBitisSaati =
          "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";

      int toplamUykuDakikalari = (uykuBitis - uykuBaslangic) * 60;
      int toplamUykuSaniyeleri =
          ((uykuBitis - uykuBaslangic) * 3600) + (dakika * 60) + saniye;
      int toplamUykuSaatleri = toplamUykuSaniyeleri ~/ 3600;

      uykuTamamlandi = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    int toplamUykuDakikalari = (uykuBitis - uykuBaslangic) * 60;
    int toplamUykuSaniyeleri =
        ((uykuBitis - uykuBaslangic) * 3600) + (dakika * 60) + saniye;
    int toplamUykuSaatleri = toplamUykuSaniyeleri ~/ 3600;

    return Stack(
      children: [
        BackGroundImage8(),
        Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Uyku Başlangıcı: $uykuBaslangicSaati",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "        ${saat.toString().padLeft(2, '0')}:${dakika.toString().padLeft(2, '0')}:${saniye.toString().padLeft(2, '0')}",
                            style: TextStyle(color: Colors.white, fontSize: 36),
                          ),
                          SizedBox(height: 10),
                          if (uykuTamamlandi)
                            Column(
                              children: [
                                Text(
                                  "                  Toplam Uyku Süresi ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Text(
                                  "                   $toplamUykuSaatleri Saat $toplamUykuDakikalari Dakika $toplamUykuSaniyeleri Saniye ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Uyanma Zamanı: $uykuBitisSaati",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 40),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          setState(() {
                            uykuBaslangic = DateTime.now().hour;
                            uykuBaslangicSaati =
                                "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}";
                            dakika = 0;
                            saat = 0;
                            saniye = 0;
                            uykuTamamlandi = false;
                          });
                          startTimer();
                        },
                        child: Text(
                          "Uyku Başladı",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 40),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          setState(() {
                            stopTimer();
                          });
                        },
                        child: Text(
                          "Uyandı",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UykuScreen(),
  ));
}
