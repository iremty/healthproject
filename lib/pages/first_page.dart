import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/pages/diseases.dart';
import 'package:healthproject/pages/etkinlik_kullanici.dart';
import 'package:healthproject/pages/exercise.dart';
import 'package:healthproject/pages/medicine.dart';
import 'package:healthproject/pages/stress.dart';
import 'package:healthproject/pages/test.dart';
import 'package:healthproject/widgets/background_image.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Widget> items = [
    Image.asset('assets/tans.png'),
    Image.asset('assets/alerji.jpg'),

    Image.asset('assets/astm.png'),
  ];
  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: AppBar(

              iconTheme: IconThemeData(color: Colors.blue[900]),
              backgroundColor: Colors.white,
              title: Text(
                'MediConn',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
          body: Center(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 300),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),

                        ),
                        color: Colors.blue[900]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      backgroundColor: Colors.white,
                                      side: BorderSide(
                                          color: Color(0xffbf9f9f9),
                                          width: 2.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Test()));
                                  },
                                  child: Image.asset(
                                    "assets/25.png",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Text(
                                  'Anket',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Color(0xffbf5f5f5)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Medicine()));
                                  },
                                  child: Container(
                                    child: Image.asset(
                                      "assets/35.png",
                                      width: 75,
                                      height: 75,
                                    ),
                                  ),
                                ),
                                Text(
                                  'İlaç Takip',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: Color(0xffbececec),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Exercise()));
                                  },
                                  child: Image.asset(
                                    "assets/45.png",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Text(
                                  'Egzersiz',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      backgroundColor: Color(0xffbf8f8f8)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Kronik()));
                                  },
                                  child: Image.asset(
                                    "assets/65.png",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Text(
                                  '   Hastalıklar\n',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      backgroundColor: Color(0xffbefefef)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Stress()));
                                  },
                                  child: Image.asset(
                                    "assets/55.png",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Text(
                                  '    Stres\nYönetimi',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Color(0xffbececec)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                etkKullanici()));
                                  },
                                  child: Image.asset(
                                    "assets/75.png",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Text(
                                  'Etkinlikler\n',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(height: 300,color: Colors.blue[900],),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                            ),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CarouselSlider(
                                items: items,
                                options: CarouselOptions(
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 7),
                                  autoPlayAnimationDuration: Duration(seconds: 2),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  menu.buildHeader(context),
                  menu.buildMenuItems(context)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}