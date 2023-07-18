import 'package:blooddonation/CustomWidgets/custom_text.dart';
import 'package:flutter/material.dart';


    void InvalidRegistration(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red.shade400,
      content:CustomText(
          text: "The email address is already in use by another account",
          fontWeight: FontWeight.normal,
          colors: Colors.white,
          fontsize: 15,
      ) ,
    ));
   }



   void RegistrationSucessfull(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content:CustomText(
      text: "Email Sent Successfully",
      fontWeight: FontWeight.normal,
      colors: Colors.white,
      fontsize: 15,
    ) ,
  ));
}


