import 'dart:async';
import 'package:blooddonation/CustomWidgets/custom_text.dart';
import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:blooddonation/screens/Atuntication_Screen/Login_screen.dart';
import 'package:blooddonation/screens/MenuScreen/menu_screen.dart';
import 'package:flutter/material.dart';

import '../Home_Screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
  super.initState();
  Timer(Duration(seconds: 3),() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.red,

       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         Center(
           child: Container(
              height: 200.h(context),
              width:200.w(context) ,
             decoration: BoxDecoration(
               image: DecorationImage(
                   image:AssetImage('assets/images/blood_drop.png'),
               )
             ),
           ),
         ),

         8.height(context),

           CustomText(
               text: "LifeLine",
               fontWeight:FontWeight.bold,
               colors:Colors.white,
               fontsize: 32)
      ],
      ),
    );
  }
}

