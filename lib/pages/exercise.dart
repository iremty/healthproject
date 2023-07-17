import 'package:flutter/material.dart';
import 'package:healthproject/pages/exercise_plan.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900],
        title: const Text("Egzersiz"),
      ),
      body: Stack(
        children: [ExerciseHomePage()],
      ),
      backgroundColor: Colors.blue[900],
    );
  }
}

class ExerciseHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExercisePlanPage(title: '18 - 25 Yaş Aralığı', plans: [
                      'Sabahları 30 dakika koşu yapın. \nÖğleden sonra yoga veya pilates yapın. \nAkşamları spor salonuna gidip kardiyo ve ağırlık antrenmanları yapın.',
                      'Pazartesi: 1 saat voleybol, 15 dakika esneme\nSalı: 30 dakika koşu, 20 dakika ağırlık antrenmanı\nÇarşamba: 45 dakika pilates, 15 dakika esneme\nPerşembe: 30 dakika yüzme, 20 dakika yoga\nCuma: 45 dakika dans, 15 dakika esneme\nCumartesi: Dinlenme\nPazar: 1 saat futbol, 15 dakika esneme',
                      'Pazartesi: 30 dakika bisiklet sürme, 20 dakika ağırlık antrenmanı\nSalı: 1 saat dans, 15 dakika esneme\nÇarşamba: 45 dakika koşu, 15 dakika esneme\nPerşembe: 45 dakika yoga, 20 dakika pilates\nCuma: 30 dakika interval antrenmanı, 15 dakika esneme\nCumartesi: Dinlenme\nPazar: 1 saat basketbol, 15 dakika esneme',
                    ], imagePaths: [
                      'assets/plan_image_0.png',
                      'assets/plan_image_1.png',
                      'assets/plan_image_2.png'
                    ]),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/youngexercise.png',
            title: '   18 - 25 Yaş Aralığı',
            description: '\n      Egzersiz Planları',
          ),
        ),
        SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExercisePlanPage(
                  title: '25 - 35 Yaş Aralığı',
                  plans: [
                    'Haftada 3 kez 45 dakikalık yürüyüş yapın.\nHer gün 15 dakika esneme egzersizleri yapın.\nPazartesi, Çarşamba ve Cuma günleri kardiyo antrenmanları yapın.\nSalı ve Perşembe günleri direnç egzersizleri yapın.',
                    'Pazartesi: 1 saat voleybol, 15 dakika esneme\nSalı: 45 dakika koşu, 20 dakika ağırlık antrenmanı\nÇarşamba: 30 dakika yürüyüş, 15 dakika esneme\nPerşembe: 45 dakika pilates, 20 dakika yoga\nCuma: 30 dakika interval antrenmanı, 15 dakika esneme\nCumartesi: Dinlenme\nPazar: 1 saat basketbol, 15 dakika esneme',
                    'Pazartesi: 45 dakika yoga, 20 dakika ağırlık antrenmanı\nSalı: 30 dakika koşu, 15 dakika esneme\nÇarşamba: 1 saat dans, 15 dakika esneme\Perşembe: 45 dakika yürüyüş, 20 dakika pilates\nCuma: 30 dakika bisiklet sürme, 15 dakika esneme\nCumartesi: Dinlenme\nPazar: 1 saat futbol, 15 dakika esneme',
                  ],
                  imagePaths: [
                    'assets/plan_image_3.png',
                    'assets/plan_image_4.png',
                    'assets/plan_image_5.png'
                  ],
                ),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/midexercise.png',
            title: '   25 - 35 Yaş Aralığı',
            description: '\n      Egzersiz Planları',
          ),
        ),
        SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExercisePlanPage(
                  title: '35 - 50 Yaş Aralığı',
                  plans: [
                    'Haftada 3-4 kez 30 dakikalık tempolu yürüyüş yapın.\nYoga veya tai chi gibi esneme ve denge egzersizlerine katılın.\nPazartesi, Çarşamba ve Cuma günleri hafif kardiyo egzersizleri yapın.\nSalı ve Perşembe günleri kas güçlendirme egzersizleri yapın.',
                    'Pazartesi: 1 saat yürüyüş, 20 dakika esneme\nSalı: 30 dakika yoga, 15 dakika denge egzersizleri\nÇarşamba: 45 dakika pilates, 15 dakika esneme\nPerşembe: 30 dakika yüzme, 20 dakika esneme\nCuma: 45 dakika hafif kardiyo, 15 dakika esneme\nCumartesi: Dinlenme\nPazar: 1 saat voleybol, 15 dakika esneme',
                    'Pazartesi: 45 dakika yoga, 20 dakika esneme\nSalı: 1 saat yürüyüş, 15 dakika denge egzersizleri\nÇarşamba: 30 dakika pilates, 15 dakika esneme\nPerşembe: 45 dakika yüzme, 20 dakika esneme\nCuma: 30 dakika bisiklet sürme, 15 dakika esneme\nCumartesi: Dinlenme\nPazar: 45 dakika hafif kardiyo, 15 dakika esneme',
                  ],
                  imagePaths: [
                    'assets/plan_image_6.png',
                    'assets/plan_image_7.png',
                    'assets/plan_image_8.png'
                  ],
                ),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/oldexercise.png',
            title: '   35 - 50 Yaş Aralığı',
            description: '\n      Egzersiz Planları',
          ),
        ),
        SizedBox(height: 16.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExercisePlanPage(
                  title: '50 - 65 Yaş Aralığı',
                  plans: [
                    'Haftada 4-5 kez 20 dakikalık yürüyüş yapın.\nEsneme ve esneklik egzersizlerine özel önem verin.\nPazartesi, Çarşamba ve Cuma günleri hafif kardiyo egzersizleri yapın.\nSalı ve Perşembe günleri denge ve koordinasyon egzersizleri yapın.',
                    'Pazartesi: 45 dakika yürüyüş, 15 dakika denge egzersizleri\nSalı: 30 dakika esneme, 20 dakika hafif kardiyo\nÇarşamba: 1 saat yoga, 15 dakika esneme\nPerşembe: 30 dakika bisiklet sürme, 15 dakika denge egzersizleri\nCuma: 45 dakika hafif kardiyo, 20 dakika esneme\nCumartesi: Dinlenme\nPazar: 30 dakika yüzme, 15 dakika esneme',
                    'Pazartesi: 30 dakika yürüyüş, 15 dakika denge egzersizleri\nSalı: 45 dakika esneme, 20 dakika hafif kardiyo\nÇarşamba: 1 saat yoga, 15 dakika esneme\nPerşembe: 30 dakika bisiklet sürme, 15 dakika denge egzersizleri\nCuma: 45 dakika hafif kardiyo, 20 dakika esneme\nCumartesi: Dinlenme\nPazar: 30 dakika yüzme, 15 dakika esneme',
                  ],
                  imagePaths: [
                    'assets/plan_image_9.png',
                    'assets/plan_image_10.png',
                    'assets/plan_image_11.png'
                  ],
                ),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/veryoldexercise.png',
            title: '   50 - 65 Yaş Aralığı',
            description: '\n      Egzersiz Planları',
          ),
        ),
      ],
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const ExerciseCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 180.0,
            height: 120.0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
