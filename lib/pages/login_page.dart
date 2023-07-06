import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/global.dart' as global;
import 'package:healthproject/pages/first_page.dart';

import '../widgets/check_box.dart';
import "../widgets/widgets.dart";

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _name;
  var _password;
  void updateName(val) {
    setState(() {
      _name = val;
    });
  }

  void updatePassword(val) {
    setState(() {
      _password = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 35),
                  height: 120,
                  child: Center(
                    child: Text(
                      "MediConn",
                      style: kHeading,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16)),
                          child: TextFormField(
                            onChanged: (val) {
                              updateName(val);
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Kullanıcı Adı',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Icon(
                                    Icons.account_circle,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                hintStyle: kBodyText),
                            style: kBodyText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16)),
                          child: TextFormField(
                            onChanged: (val) {
                              updatePassword(val);
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Şifre',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                hintStyle: kBodyText),
                            obscureText: true,
                            style: kBodyText,
                          ),
                        ),
                      ),

                      Container(
                        height: 113,
                        child: CheckBox_(),
                      ),
                      //Column(children: [CheckBox_()],),
                      SizedBox(height: 35),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16)),
                        child: TextButton(
                          onPressed: () async {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            CollectionReference testCollectionRef =
                                FirebaseFirestore.instance
                                    .collection('kullanicilar');

                            var respons = await testCollectionRef.get();
                            var list = respons.docs;
                            int control=0;
                            for (int i = 0; i < list.length; i++) {
                              var map = list[i].data() as Map<String, dynamic>;
                              // var x = map['test'];
                              var k_adi = map['kullaniciAdi'];
                              var sifre = map['sifre'];

                              if (_name == k_adi && _password == sifre) {
                                control=1;
                                if (global.durum == true &&
                                    global.durum2 == true ) {

                                  var k_tipi = map['kullaniciTipi'];
                                  if (k_tipi) {
                                    print('Giriş Başarılı');
                                    global.kullaniciAdi = k_adi;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FirstPage()),
                                    );

                                  } else {
                                    print('yönetici değil');
                                  }
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                    Text('Aydınlatma metni ve Açık rıza beyanını onaylayınız! '),
                                  ),
                                );}
                              }
                            }
                            if (control==0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                            content:
                            Text('Yanlış kullanıcı adı veya şifre'),
                            ),
                            );
                            }

                            // testCollectionRef.add({"kerem": 55});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Giriş Yap",
                              style: kBodyText,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
