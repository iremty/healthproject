import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/admin_pages/test_sonuc.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  List<Widget> items = [
    //  Image.asset('assets/m.jpg'),
    Image.asset('assets/login.jpeg'),
    Image.asset('assets/grip.jpg'),
    Image.asset('assets/803.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(
          'MediConn',
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
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
                color: Colors.indigo[900],
                child: Column(
                  children: [
                    SizedBox(
                      height: 85,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SonucClass()));
                              },
                              child: Icon(
                                Icons.pending_actions,
                                size: 70,
                                color: Colors.indigo[900],
                              ),
                            ),
                            Text(
                              'Test Sonuçları',
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  backgroundColor: Colors.white),
                              onPressed: () {},
                              child: Icon(
                                Icons.vaccines,
                                size: 70,
                                color: Colors.indigo[900],
                              ),
                            ),
                            Text(
                              'İlaç Takip',
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
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
                                color: Colors.indigo[900],
                              ),
                            ),
                            Text(
                              'Egzersiz',
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.indigo[900],
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [buildHeader(context), buildMenuItems(context)],
          ),
        ),
      ),
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
        title: const Text('Test Sonuçları'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SonucClass()));
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
