import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/pages/test.dart';
import 'package:healthproject/global.dart' as global;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthproject/widgets/background_image.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Medicine extends StatefulWidget {
  const Medicine({Key? key}) : super(key: key);

  @override
  _MedicineState createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  final _formKey = GlobalKey<FormState>();
  final CollectionReference medicineCollection =
      FirebaseFirestore.instance.collection('medicines');

  late String _medicineName;
  late int _medicineDose;
  TimeOfDay? _selectedTime;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones(); // Timezone'ları başlatın

    // Bildirimler için ayarları yapın
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> addMedicine() async {
    DocumentReference docRef = await medicineCollection.add({
      'name': _medicineName,
      'dose': _medicineDose,
      'time': _selectedTime!.format(context).toString(),
      'kullaniciAdi': global.kullaniciAdi,
    });

    if (_selectedTime != null) {
      var time = Time(_selectedTime!.hour, _selectedTime!.minute);
      var now = DateTime.now();
      var scheduleTime = tz.TZDateTime(tz.local, now.year, now.month, now.day,
          time.hour, time.minute); // Bildirim zamanını oluşturun
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        'channel_description',
        importance: Importance.max,
        priority: Priority.high,
      );
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
        docRef.id.hashCode,
        'İlaç Hatırlatıcısı',
        '$_medicineName adlı ilacı almanız gerekiyor.',
        scheduleTime,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'notification_payload',
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }

    print("İlaç Eklendi");
  }

  Future<void> deleteMedicine(String medicineId) async {
    // İlacı veritabanından silme işlemini gerçekleştirin
    await medicineCollection
        .doc(medicineId)
        .delete()
        .then((value) => print("İlaç Silindi"))
        .catchError((error) => print("İlaç silinemedi: $error"));

    // Bildirimi iptal etme
    await flutterLocalNotificationsPlugin.cancel(medicineId.hashCode);
  }

  Widget buildAddMedicineForm() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'İlaç İsmi',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bir ilaç adı giriniz.';
                    }
                    _medicineName = value;
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'İlaç Dozu',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen bir ilaç dozu girin.';
                    }
                    _medicineDose = int.parse(value);
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  readOnly: true,
                  onTap: _showTimePicker,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'İlaç Zamanı',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  validator: (value) {
                    if (_selectedTime == null) {
                      return 'Lütfen bir ilaç zamanı seçin.';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    text: _selectedTime != null
                        ? _selectedTime!.format(context)
                        : '',
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(200, 40),
                    backgroundColor: Colors.blue[900]),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('İlaç Kaydedildi')));
                    addMedicine();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Kaydet',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMedicineList() {
    return StreamBuilder<QuerySnapshot>(
      stream: medicineCollection
          .where('kullaniciAdi', isEqualTo: global.kullaniciAdi)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Bir hata oluştu');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Yükleniyor"));
        }

        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            final String medicineId = document.id;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: 24), // Kenar boşluklarını ayarlayın
              decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(
                //color: Colors.blue),
                borderRadius:
                    BorderRadius.circular(5), // Kenarlık köşelerini yuvarlayın
              ),
              child: ListTile(
                title: Text(
                  data['name'],
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'İlaç Dozu: ${data['dose']}',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text(
                      'Zamanı: ${data['time']}',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red[600]),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('İlaç Sil',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          content: Text(
                              'Bu ilacı silmek istediğinizden emin misiniz?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('İptal',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteMedicine(medicineId);
                                Navigator.of(context).pop();
                              },
                              child: Text('Sil',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text('İlaç Takibi',
                style: TextStyle(color: Colors.white, fontSize: 25)),
            elevation: 0,
          ),
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    child: buildMedicineList(),
                  ),
                ],
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: buildAddMedicineForm(),
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue[900],
        ),
      ],
    );
  }
}
