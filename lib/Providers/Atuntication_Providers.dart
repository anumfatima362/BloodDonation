
import 'package:blooddonation/Helper/route_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/Snackbar.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;



class AtunticationProvider extends ChangeNotifier{


  //Loader
  bool isloading  = false;

    setstartLoading() {
      isloading = true;
      notifyListeners();
    }
    setstopLoading(){
      isloading = false;
      notifyListeners();
    }


  //====================================================== Textfield Controller ==========================================================================================
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

        // Step 1: Register the user using Firebase Authentication
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password);


        // Step 2: Get the Firebase User ID (UID) of the registered user
        String userId = userCredential.user!.uid;


        // Step 3: Upload the image to Firebase Storage and get the download URL



        // Check if the registration is successful, and the user is new or already existed.
        // If the account is new, you can proceed to the verification screen.
        // If the account already existed, you can handle it accordingly.
        if(userCredential.additionalUserInfo!.isNewUser ==  true){
         Navigator.pushNamed(context, RouteHelper.verify_screen);
        }
        }
      }on FirebaseAuthException catch(e){
        // Handle the case where the user account already existed.
        return InvalidRegistration(context);

        // if (e.code == 'user-not-found') {
        //   print('No user found for that email.');
        // } else if (e.code == 'wrong-password') {
        //   print('Wrong password provided for that user.');
      }

   }





  















}