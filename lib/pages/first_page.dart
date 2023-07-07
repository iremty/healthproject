import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/pages/diseases.dart';
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
    Image.asset('assets/migren.jpeg')
  ];
  global.DrawerKullanici menu = global.DrawerKullanici();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage1(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text(
              'MediConn',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            )),
                      ],
                    ),
                  ),

                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
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
                                          BorderRadius.circular(20)),
                                      backgroundColor: Colors.white,
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Test()));
                                  },
                                  child: Icon(
                                    Icons.pending_actions,
                                    size: 70,
                                    color: Colors.blue[900],
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
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: Colors.white, width: 2.0)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.vaccines,
                                    size: 70,
                                    color: Colors.blue[900],
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
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Colors.white,
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.sports_gymnastics_outlined,
                                    size: 70,
                                    color: Colors.blue[900],
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
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Kronik()));
                                  },
                                  child: Icon(
                                    Icons.monitor_heart,
                                    size: 70,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                Text(
                                  '    Kronik\nHastalıklar',
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
                                          side: BorderSide(
                                              color: Colors.white, width: 2.0),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Stress()));
                                  },
                                  child: Icon(
                                    Icons.nature_people_rounded,
                                    size: 70,
                                    color: Colors.blue[900],
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
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: Colors.white, width: 2.0)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.ice_skating,
                                    size: 70,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                Text(
                                  'Test\n',
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
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
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
