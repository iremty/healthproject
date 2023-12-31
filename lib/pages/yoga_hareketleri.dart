import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthproject/widgets/background_image.dart';
import 'package:timer_count_down/timer_count_down.dart';

class YogaPage extends StatefulWidget {
  const YogaPage({super.key});

  @override
  State<YogaPage> createState() => _YogaPageState();
}

CountdownController _controller = CountdownController();
final player = AudioPlayer();

class _YogaPageState extends State<YogaPage> {
  bool yoga = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundImage1(),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                      textAlign: TextAlign.center,
                      "Süreyi Baslat ve\n Yoga Hareketlerini Uygulamaya Basla",
                      style: GoogleFonts.abhayaLibre(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Divider(
                  height: 15,
                  thickness: 3,
                  color: Colors.black12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider(
                        items: photo().items,
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: yoga,
                          autoPlayInterval: Duration(seconds: 15),
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        )),
                    //SizedBox(height: 5),
                    Container(
                      height: 150,
                      child: Expanded(
                        child: CarouselSlider(
                          items: yazi().items,
                          options: CarouselOptions(
                            aspectRatio: 4 / 2,
                            viewportFraction: 0.9,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            reverse: false,
                            autoPlay: yoga,
                            autoPlayInterval: Duration(seconds: 15),
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(bottom: 1.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Countdown(
                        seconds: 60,
                        controller: _controller,
                        build: (BuildContext context, double time) => Text(
                          time.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        interval: Duration(seconds: 1),
                        onFinished: () {
                          print('Süre bitti!');
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black54)),
                            onPressed: () {
                              player.play(
                                AssetSource('yogam.mp3'),
                              );

                              _controller.start!();
                              setState(() {
                                yoga = !yoga;
                              });
                            },
                            child: Icon(Icons.play_arrow),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black54)),
                            onPressed: () {
                              _controller.stop!();
                              player.stop();
                              setState(() {
                                yoga = !yoga;
                              });
                            },
                            child: Icon(Icons.pause),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Countdown extends StatefulWidget {
  final int seconds;
  final CountdownController controller;
  final Widget Function(BuildContext context, double time) build;
  final Duration interval;
  final VoidCallback onFinished;

  Countdown({
    required this.seconds,
    required this.build,
    required this.interval,
    required this.onFinished,
    required this.controller,
  });

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer _timer;
  int _currentSeconds = 0;

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.seconds;
    if (widget.controller != null) {
      widget.controller.start = start;
      widget.controller.stop = stop;
    }
  }

  void start() {
    _timer = Timer.periodic(widget.interval, (timer) {
      setState(() {
        if (_currentSeconds <= 0) {
          _timer.cancel();
          widget.onFinished();
        } else {
          _currentSeconds--;
        }
      });
    });
  }

  void stop() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context, _currentSeconds.toDouble());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class CountdownController {
  VoidCallback? start;
  VoidCallback? stop;
}

class photo {
  List<Widget> items = [
    Image.asset('assets/yoga1.png'),
    Image.asset('assets/yoga2.png'),
    Image.asset('assets/yoga3.png'),
    Image.asset('assets/yoga4.png'),
  ];
}

class yazi {
  List<Widget> items = [
    Text(
      textAlign: TextAlign.center,
      "Bağdaş kurarak oturun,Sırtınız düz bir şekilde sola dönün,\n sağ elinizi sol dizinize getirin ve sol elinizi arkanızdaki matın üzerine koyun.",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
    ),
    Text(
      textAlign: TextAlign.center,
      "Bağdaş kurarak oturun,Sırtınız düz bir şekilde sağa dönün,\n sol elinizi sağ dizinize getirin ve sağ elinizi arkanızdaki matın üzerine koyun.",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
    ),
    Text(
      textAlign: TextAlign.center,
      "Kalçanız topuklarınızın üzerinde olacak şekilde diz çökün.\n Öne doğru eğilin ve alnınızı mata doğru getirin.\n Elleriniz matın üzerinde yüzüstü olacak şekilde kollarınızı önünüzde gerin.",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
    ),
    Text(
      textAlign: TextAlign.center,
      "Elleriniz ve dizleriniz yerde olacak şekilde başlayın,\n dizlerinizi mattan kaldırın ve kalçanızın uç noktalarını yukarı doğru çekin.\n Kollarınızı düz bir şekilde itin ve topuklarınızı matın üzerine geri itin. \n Başınızı ellerinizin arasında tutmalısınız.",
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
    ),
  ];
}
