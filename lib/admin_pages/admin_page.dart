import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/admin_pages/etkinlik.dart';
import 'package:healthproject/admin_pages/hastalik_sonuc.dart';
import 'package:healthproject/admin_pages/test_sonuc.dart';

import '../widgets/background_image.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  List<Widget> items = [
    Image.asset('assets/tans.png'),
    Image.asset('assets/alerji.jpg'),
    Image.asset('assets/astm.png'),
  ];

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
                                            builder: (context) =>
                                                SonucClass()));
                                  },
                                  child: Image.asset(
                                    "assets/25.png",
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Text(
                                  '     Anket \n Sonuçları',
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
                                      backgroundColor: Color(0xffbf8f8f8)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Hastalik()));
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Color(0xffbececec)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Etkinlik()));
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        color: Colors.blue[900],
                      ),
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
                                  autoPlayAnimationDuration:
                                      Duration(seconds: 2),
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
                children: [buildHeader(context), buildMenuItems(context)],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.indigo[900],
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/m.jpg'),
              radius: 80,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Column(
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Anasayfa'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminMenu()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.pending_actions),
            title: const Text('Anket Sonuçları'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SonucClass()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.monitor_heart),
            title: const Text('Hastalıklar'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Hastalik()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.celebration),
            title: const Text('Etkinlikler'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Etkinlik()));
            },
          ),
          buildDivider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Çıkış'),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          buildDivider(),
        ],
      );

  Divider buildDivider() {
    return Divider(
      height: 10,
      thickness: 1,
    );
  }
}
