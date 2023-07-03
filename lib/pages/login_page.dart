import 'package:flutter/material.dart';
import 'package:healthproject/colors.dart';
import 'package:healthproject/pages/first_page.dart';
import "../widgets/widgets.dart";
import '../widgets/check_box.dart';
import '/widgets/text_input.dart';
import '/widgets/password_input.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                      "Hoş geldiniz!",
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
                      Column(
                        children: [
                          TextInput(
                            icon: Icons.account_circle,
                            hint: "Kullanıcı Adı",
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                          ),

                          PasswordInput(
                            icon: Icons.lock,
                            hint: "Şifre",
                            inputAction: TextInputAction.done,
                          ),
                        ],
                      ),
                      Container(
                      height: 113,

                      child: CheckBox_(),
                      ),
                      //Column(children: [CheckBox_()],),
                      Column(
                        children: [
                          SizedBox(height: 35),
                          Container(
                            width: double.infinity,
                            decoration:BoxDecoration(
                                color: Colors.black,
                                borderRadius:BorderRadius.circular(16)),
                            child:TextButton(
                              onPressed: (){
                                  },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text("Giriş Yap",style: kBodyText,),
                              ),
                            ),
                          ),
                          //Column(children: [CheckBox_()],)

                        ],
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