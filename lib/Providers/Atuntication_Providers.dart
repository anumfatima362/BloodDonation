import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../utils/Snackbar.dart';




class AtunticationProvider extends ChangeNotifier{




  //====================================================== Textfield Controller ====================================================================
  //Login Controller
  final   TextEditingController  login_email_controller = TextEditingController();
  final   TextEditingController  login_password_controller = TextEditingController();


  //Signup Controller
  final TextEditingController signup_username_controller = TextEditingController();
  final TextEditingController signup_email_controller = TextEditingController();
  final TextEditingController signup_password_controller = TextEditingController();
  final TextEditingController  signup_phone_no_controller    =    TextEditingController();




  //===================================================================== validation Section ==============================================================
  //Username Validation Textfield
  usernameValidation(value){
    if (value == null || value.isEmpty) {
      return "Please enter username";
    } else if (value.length < 4) {
      return "At least 4 characters";
    } else if (value.length > 13) {
      return "Maximum characters is 13";
    }
    return null;
  }

  //Email Validation
  EmailValidation(value){
    if (value.isEmpty) {
      return "Invalid Email Address";
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") .hasMatch(value)) {
      return "Please enter valid email";
    }
    return null;
  }


  //Password Validation
  PasswordValidation(value){
    if (value == null || value.isEmpty) {
      return "Password must be 8 character or longer";
    } else if (value.length < 7) {
      return "at least enter 6 characters";
    } else if (value.length > 13) {
      return "maximum characters is 13";
    }
    return null;
  }


  //Phone Validation
  PhoneValidation(value){
    String pattern = r'^(?:[+0][1-9])?[0-9]{11}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Enter Your Phone Number";
    } else if (!regExp.hasMatch(value)) {
      return "Enter Valid Phone Number";
    }
  }


  //================================================================= Clear Textfield Section ==========================================================

  clearTextfiled(){
    login_email_controller.clear();
    login_password_controller.clear();
    signup_email_controller.clear();
    signup_password_controller.clear();
    signup_username_controller.clear();
    signup_phone_no_controller.clear();
  }

//========================================================== Firebase Atuntication Section ===============================================================

   final FirebaseAuth  firebaseAuth = FirebaseAuth.instance;

   //Signup
  signUp(String username ,String email ,  String password, String phoneno , BuildContext context) async {
      try{
      if(username.isNotEmpty && email.isNotEmpty && phoneno.isNotEmpty && password.isNotEmpty){
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password);


        }

      }on FirebaseAuthException catch(e){
        if(e.code == 'if email is already in use'){
          return InvalidRegistration(context);
        }

      }

   }











}