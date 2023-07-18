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
                builder: (context) => ExercisePlanPage(
                  title: '18 - 25 Yaş Aralığı',
                  plans: [
                    'Ellerinizi omuz genişliğinde yerleştirin ve ayaklarınızı birbirinden ayrı tutun.\nVücudunuzu düz bir çizgi halinde tutarak yavaşça göğsünüzü yere doğru indirin ve sonra başlangıç pozisyonuna geri yükselin.\nBaşlangıçta dizlerinizi yere koyarak veya duvara dayanarak yapabilirsiniz, daha sonra zorluk seviyesini artırabilirsiniz.',
                    'Ayaklarınız omuz genişliğinde açık olmalı, ellerinizi göğsünüzde tutabilir veya düz tutabilirsiniz.\nKalçanızı geriye doğru çekerek ve dizlerinizi hafifçe bükerek çömelin.\nDizlerinizin ayak parmaklarınızın ötesine uzanmasına dikkat edin ve başlangıç pozisyonuna geri dönün.',
                    'Sırt üstü yere uzanın, dizleriniz bükülü olsun ve ellerinizi başınızın arkasına yerleştirin.\nKarın kaslarınızı kullanarak omuzlarınızı yere doğru kaldırın ve tekrar yavaşça yere indirin.',
                    'Bir sandalyeye, koltuk kenarına veya evdeki başka bir yükseltilmiş yüzeye sırtınızı dönün.\nEllerinizi vücudunuzun yanlarında yerleştirin ve kollarınızı bükmeden aşağı doğru inin, sonra kollarınızı düzleştirin.',
                    'Ön kollarınız ve ayak parmaklarınız üzerinde düz bir çizgi oluşturacak şekilde yere uzanın.\nKarın kaslarınızı sıkın ve vücudunuzu düz bir çizgide tutun, sırtınızı veya kalçanızı düşürmeyin.',
                    'Her egzersizden sonra 1-2 dakikalık dinlenme süresi vermek uygun olacaktır.\n\nHer egzersiz için 3 set ve 10-12 tekrar hedefleyebilirsiniz. Eğer tekrar sayıları sizin için çok kolaysa, ağırlığı artırarak zorluk seviyesini yükseltebilirsiniz.\n\nBir sağlık uzmanına danışmak her zaman önemlidir.'
                  ],
                  imagePaths: [
                    'assets/plany1.jpg',
                    'assets/plany2.jpg',
                    'assets/plany3.jpg',
                    'assets/plany4.jpg',
                    'assets/plany5.jpg',
                    'assets/careful.jpg'
                  ],
                  planTitles: [
                    'Push-up \n(Şınav)',
                    'Squat \n(Çömelme)',
                    'Crunches \n(Mekik)',
                    'Dips \n(Triceps Dips)',
                    'Plank',
                    'Öneri'
                  ],
                ),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/youngexercise.png',
            title: '18 - 25 Yaş Aralığı',
            description: '\n     Egzersiz Planları',
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
                    'Sırt üstü yere uzanın ve dambıl veya ağırlık şişesini her elinizde tutun.\nDizleriniz bükülü olsun ve ayaklarınız yere sağlam basın.\nDambılları yavaşça indirin ve tekrar yukarı doğru kaldırın. Göğsünüzü tam olarak indirecek kadar bükülme yapın ve omuzlarınızı yerden kaldırmayın.',
                    'Ayaklarınızı omuz genişliğinde açın ve bir adım atacak kadar ileriye doğru adım atın.\nÖne doğru bükülerek, ön dizinizin arkasını neredeyse yere kadar indirin ve ardından başlangıç pozisyonuna geri dönün.\nHer bacak için tekrarlayın.',
                    'Dambılları her elinizde tutun ve belinizi hafifçe bükerek gövdenizi öne doğru eğin.\nSırtınızı düz tutun ve dambılları vücudunuza doğru çekin, dirseklerinizi geriye doğru bükün.\nDambılları kontrol ederek başlangıç pozisyonuna geri bırakın.',
                    'Klasik plank pozisyonunda ellerinizi omuz genişliğinde yerleştirin.\nSırayla sağ elinizi sol omzunuza dokunacak şekilde kaldırın ve tekrar başlangıç pozisyonuna geri dönün. Ardından sol elinizi sağ omzunuza dokunacak şekilde kaldırın.',
                    'Sırt üstü yere uzanın, dizleriniz bükülü ve ayaklarınız yere sağlam basın.\nKalçanızı yavaşça yukarı doğru kaldırın ve sıkın, sonra tekrar yere indirin.',
                    'Her egzersizden sonra 1-2 dakikalık dinlenme süresi vermek uygun olacaktır\n\nBaşlangıç olarak her egzersiz için 3 set ve 10-12 tekrar hedefleyebilirsiniz. Eğer tekrar sayıları sizin için çok kolaysa, ağırlığı artırarak zorluk seviyesini yükseltebilirsiniz.\n\nBir sağlık uzmanına danışmak her zaman önemlidir.'
                  ],
                  imagePaths: [
                    'assets/planm1.jpg',
                    'assets/planm2.jpg',
                    'assets/planm3.jpg',
                    'assets/planm4.jpg',
                    'assets/planm5.jpg',
                    'assets/careful.jpg'
                  ],
                  planTitles: [
                    'Floor Press \n(Yerde Dambıl Presi)',
                    'Lunges \n(Hamle)',
                    'Bent-Over Dumbbell Rows \n(Eğilerek Karına Çekiş)',
                    'Plank with Shoulder Taps \n(Omuz Vuruşlu Plank)',
                    'Glute Bridges \n(Glute Köprüsü)',
                    'Öneri'
                  ],
                ),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/midexercise.png',
            title: '25 - 35 Yaş Aralığı',
            description: '\n     Egzersiz Planları',
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
                    'Bir sandalyenin önünde durun ve ayaklarınız omuz genişliğinde açık olsun.\nKalçanızı geriye doğru çekerek ve dizlerinizi bükerek yavaşça çömelin.\nSandalyeye hafifçe oturun ve tekrar yukarı doğru kalkın.',
                    'Dambılları omuzlarınızın yanında kulağınıza doğru kaldırın ve ardından tekrar başlangıç pozisyonuna indirin.\nOmuzları dik tutmaya özen gösterin ve kontrollü bir şekilde çalışın.',
                    'Sırt üstü yere uzanın, dizleriniz bükülü ve ayaklarınız yere sağlam basın.\nKalçanızı yukarı kaldırın ve sonra sağ ve sol dizinizi sırayla göğsünüze doğru çekin.',
                    'Sandalyeye otururken yapabileceğiniz çeşitli yoga pozları vardır. Örneğin, el ve kol hareketleri, omurga esnetme, ayak bileği ve bacak hareketleri gibi birçok farklı poz yapılabilir.',
                    'Elleriniz ve dizleriniz yerde olacak şekilde dört ayak üzerine gelin.\nSağ kolunuzu ileri doğru uzatırken aynı anda sol bacağınızı arkaya doğru uzatın.\nSırtınızı düz tutun ve kollarınızı, bacaklarınızı sıkarak çalışın. Sonra diğer tarafa geçin.',
                    'Her egzersizden sonra 1-2 dakikalık dinlenme süresi vermek uygun olacaktır.\n\nBaşlangıç olarak her egzersiz için 3 set ve 10-12 tekrar hedefleyebilirsiniz. Eğer tekrar sayıları sizin için çok kolaysa, ağırlığı artırarak zorluk seviyesini yükseltebilirsiniz.\n\nBir sağlık uzmanına danışmak her zaman önemlidir.'
                  ],
                  imagePaths: [
                    'assets/plano1.jpg',
                    'assets/plano2.jpg',
                    'assets/plano3.jpg',
                    'assets/plano4.jpg',
                    'assets/plano5.jpg',
                    'assets/careful.jpg'
                  ],
                  planTitles: [
                    'Squat to Chair \n(Sandalyede Çömelme)',
                    'Dumbbell Shoulder Press \n(Dambıl Omuz Presi)',
                    'Glute Bridge March \n(Glute Köprüsü Yürüyüşü)',
                    'Chair Yoga \n(Sandalyede Yoga)',
                    'Bird-Dog \n(Av Köpeği Duruşu',
                    'Öneri'
                  ],
                ),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/oldexercise.png',
            title: '35 - 50 Yaş Aralığı',
            description: '\n     Egzersiz Planları',
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
                    'Sandalyenin önünde durun ve ayaklarınız omuz genişliğinde açık olsun.\nKalçanızı geriye doğru çekerek ve dizlerinizi bükerek yavaşça çömelin.\nSandalyenin kenarına hafifçe oturun ve tekrar yukarı doğru kalkın.\nBu egzersizi güçlenene kadar bir sandalye veya tabure kullanarak yapabilirsiniz.',
                    'Ellerinizi duvara göğsünüz hizasında ve omuz genişliğinde yerleştirin.\nAyaklarınızı bir adım geriye alın ve vücudunuzu duvardan uzaklaştıracak şekilde itin.\nDuvardan uzaklaşırken göğsünüzü duvara doğru eğin ve tekrar başlangıç pozisyonuna dönün.',
                    'Ayaklarınızı omuz genişliğinde açın ve ellerinizi belinizde tutun.\nYavaşça yüksek diz kaldırmaya başlayın, teker teker sağ ve sol bacaklarınızı yukarı doğru kaldırın.\nBu egzersizi düşük yoğunlukta, kardiyo aktivitesi olarak yapabilirsiniz.',
                    'Sandalyeye oturun ve sırtınızı düz tutun.\nDizlerinizi hafifçe bükün ve bacaklarınızı yavaşça yukarı doğru kaldırın, sonra tekrar indirin.\nBacaklarınızı aynı anda kaldırmak zor gelirse, teker teker kaldırabilirsiniz.',
                    'Ayaklarınızı omuz genişliğinde açın ve ellerinizi belinizde tutun veya bir yüzeye tutunun.\nAyaklarınızın ön kısmına ağırlığınızı aktararak ayak parmaklarınıza kalkın ve topuklarınızı yere bastırın.\nBirkaç saniye yukarıda kalın ve yavaşça geri dönün.\nTek bacakla da tekrarlayabilirsiniz.',
                    'Her egzersizden sonra kısa bir dinlenme süresi vermek uygun olacaktır.\n\nHer egzersiz için 2-3 set ve 8-10 tekrar hedefleyebilirsiniz. Eğer tekrar sayıları sizin için çok kolaysa, ağırlığı artırarak zorluk seviyesini yükseltebilirsiniz.\n\nBir sağlık uzmanına danışmak her zaman önemlidir.'
                  ],
                  imagePaths: [
                    'assets/planvo1.jpg',
                    'assets/planvo2.jpg',
                    'assets/planvo3.jpg',
                    'assets/planvo4.jpg',
                    'assets/planvo5.jpg',
                    'assets/careful.jpg'
                  ],
                  planTitles: [
                    'Chair Squats \n(Sandalyede Çömelme)',
                    'Wall Push-Ups \n(Duvarda Şınav)',
                    'Marching in Place \n(Yerinde Yürüme)',
                    'Seated Leg Raises \n(Oturarak Bacak Kaldırma)',
                    'Calf Raises \n(Ayak Parmağında Kalkma)',
                    'Öneri'
                  ],
                ),
              ),
            );
          },
          child: ExerciseCard(
            imagePath: 'assets/veryoldexercise.png',
            title: '50 - 65 Yaş Aralığı',
            description: '\n     Egzersiz Planları',
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
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
