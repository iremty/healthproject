import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/widgets/background_image.dart';
import 'stress.dart';

class NefesEgzersizi extends StatefulWidget {
  const NefesEgzersizi({super.key});

  @override
  State<NefesEgzersizi> createState() => _NefesEgzersiziState();
}

class _NefesEgzersiziState extends State<NefesEgzersizi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
       title: Text("Nefes Egzersizi"),
       elevation: 0,
      ),
      body: Stack(
        children: [
          BackGroundImage2(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, right: 100, left: 5),
                padding: EdgeInsets.only(left: 10),
                width: 200,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Colors.pink,
                ),
                child: Center(
                  child: Text(
                    "Nefes egzersizleri, stresi azaltmak, zihni sakinleştirmek ve genel yaşam kalitesini iyileştirmek için etkili bir yöntemdir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 5, left: 100),
                padding: EdgeInsets.only(left: 10),
                width: 200,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "Düzenli olarak yapılan nefes egzersizleri, beden ve zihin arasındaki dengeyi sağlamaya yardımcı olur",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 100, left: 5),
                padding: EdgeInsets.only(left: 10),
                width: 200,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Colors.indigo,
                ),
                child: Center(
                  child: Text(
                    "Nefesinizi bilinçli olarak kontrol etmek, sakinlik ve huzur hissi yaratırken, zihinsel ve fiziksel stresi azaltır",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 5, left: 100),
                padding: EdgeInsets.only(left: 10),
                width: 200,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Colors.yellow,
                ),
                child: Center(
                  child: Text(
                    "Bu egzersizler, oksijen alımını artırarak enerji seviyelerini yükseltir, konsantrasyonu artırır ve zihni daha odaklanmış hale getirir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 100, left: 5),
                padding: EdgeInsets.only(left: 10),
                width: 200,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    "Aynı zamanda, düşük solunum hızı, kalp atış hızını düşürür ve vücudu rahatlatır",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 5, left: 100),
                padding: EdgeInsets.only(left: 13),
                width: 200,
                height: 75,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(16),
                  color: Colors.purpleAccent,
                ),
                child: Center(
                  child: Text(
                    "Nefes egzersizlerini düzenli olarak uygulamak, kaygı ve stresle başa çıkmak, uykusuzluğu azaltmak ve genel olarak zihinsel ve fiziksel sağlığı iyileştirmek için etkili bir yöntemdir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NefesAlma()),
                    );
                  },
                  icon: Icon(
                    Icons.not_started,
                    size: 50,
                    color: Colors.black45,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

class NefesAlma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Nefes Egzersizi"),
      ),
      body: Stack(
        children: [

          BackGroundImage6(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, left: 5),
                  padding: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      "NEFES EGZERSİZİ İÇİN HAZIR MISIN?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 100, left: 5),
                  padding: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: Colors.blue[300],
                  ),
                  child: Center(
                    child: Text(
                      "Rahat Bir Pozisyon Al",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 5, left: 100),
                  padding: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: Colors.blue[500],
                  ),
                  child: Center(
                    child: Text(
                      "4 Saniye Derin Nefes Al",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 100, left: 5),
                  padding: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: Colors.blue[700],
                  ),
                  child: Center(
                    child: Text(
                      "4 Saniye Yavaşça Nefesini Ver",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 5, left: 100),
                  padding: EdgeInsets.only(left: 10),
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.circular(16),
                    color: Colors.blue[900],
                  ),
                  child: Center(
                    child: Text(
                      "Bu Döngüyü 5-10 Kez Tekrarla",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Stress()),
                      );
                    },
                    icon: Icon(
                      Icons.done_outline_rounded,
                      size: 50,
                      color: Colors.black45,
                    ))
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
