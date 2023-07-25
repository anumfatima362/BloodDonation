import 'dart:io';
import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:blooddonation/screens/Atuntication_Screen/components/cutomContainer_btton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../CustomWidgets/Custom_button.dart';
import '../../CustomWidgets/custom_text.dart';
import '../../Helper/route_helper.dart';
import '../../Providers/Atuntication_Providers.dart';
import '../../utils/colors..dart';
import 'components/Text_Input_field.dart';
import 'package:image_picker/image_picker.dart';




class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


  class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 // String? uid = firebaseAuth.currentUser?.uid;

  File? image;
 final picker = ImagePicker();


      void showpicker(context){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 150.h(context),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.photo_camera,size: 30,),
              title: CustomText(
                text: "Camera",
                fontWeight: FontWeight.bold,
                colors: Colors.black26,
                fontsize: 18,
              ),
              onTap: (){
                imagefromcamera();
                Navigator.pop(context);
              },
            ),


            ListTile(
              leading: Icon(Icons.photo_library, size: 30,),
              title: CustomText(
                text: "Gallery",
                fontWeight: FontWeight.bold,
                colors: Colors.black26,
                fontsize: 18,
              ),
              onTap: (){
              imagefromGallery();
              Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    });
  }


    //Pick image from gallery
    Future  imagefromGallery() async{
      final pickedImage =  await picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 1000, maxWidth: 1000);
      setState(() {
       if(pickedImage != null){
        image = File(pickedImage.path) ;
       }else{
         print('No image is Selected');
       }
        });
           }


    //To Pick image from Camera
    Future  imagefromcamera() async{
    final pickedImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 1000, maxHeight: 1000);
     setState(() {
      if(pickedImage != null){
        image =  File(pickedImage.path);
      }
      else{
        print('No image is Selected');
      }
     });
     }


   // Function to upload the image to Firebase Storage
  Future uploadImageToFirebase() async {
    if (image == null) {
      print('No image selected');
      return;
    }
    try {
      // Create a reference to the image location in Firebase Storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("images")
          .child(DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");

      // Upload the file to Firebase Storage
      await ref.putFile(image!);

      // Get the download URL of the uploaded image
      String downloadURL = await ref.getDownloadURL();

      // Save the download URL to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .update({'profilePic': downloadURL});

      print('Image uploaded and URL saved successfully.');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }





  @override
  Widget build(BuildContext context) {

   final authProvider = Provider.of<AtunticationProvider>(context);
    return Scaffold(

      body:SafeArea(

        child: Form(
          key: formkey,

          child: SingleChildScrollView(


            child: Column(

              children:[

                80.height(context),



                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'BLOOD DONATION',
                    fontWeight: FontWeight.bold,
                    colors: Razzmatazz,
                    fontsize: 30,
                  ),
                ),

                10.height(context),

             //============================================================= Circular Avatar ==============================================================


                 Container(
                     height: 137.h(context),
                     width: 131.w(context),
                   decoration: BoxDecoration(
                     color: DeepCerise,
                     borderRadius: BorderRadius.circular(80)
                   ),

                 child: Stack(
                   children: [
                     Positioned(
                       top: 2.h(context),
                       left: 3.w(context),
                       child: image != null

                       ? CircleAvatar(
                         radius: 58,
                         backgroundImage: FileImage(image!),
                       )

                       : CircleAvatar(
                          radius: 58,
                         backgroundImage: NetworkImage('https://mcdn.wallpapersafari.com/medium/61/38/DTiehH.jpg'),
                       ),
                     ),

                  //================================================== Image Picker ==================================================================

                  Positioned(
                    right: 1,
                    top: 75,
                    child: GestureDetector(
                      onTap: () async {
                        showpicker(context);
                      },
                      child: Container(
                        height: 40.h(context),
                        width: 40.w(context),
                        decoration: BoxDecoration(
                            color: DeepCerise,
                        borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(Icons.add_a_photo_outlined, color: Colors.white,),
                      ),
                    ),
                  )
                   ],
                 ),

                ),

             //===========================================================================================================================================
                 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextInputField(
                    controller: authProvider.signup_username_controller,
                    icon: Icons.person,
                    labelText: "User Name",
                      keyboardType: TextInputType.name,
                ),
              ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: TextInputField(
                    controller:authProvider.signup_email_controller ,
                    icon: Icons.mail,
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: TextInputField(
                    controller: authProvider.signup_password_controller,
                    icon: Icons.lock,
                    labelText: "Password",
                    keyboardType:TextInputType.visiblePassword,
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: TextInputField(
                    controller: authProvider.signup_phone_no_controller,
                    icon: Icons.phone,
                    labelText: "Phone Number",
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),


                20.height(context),

                GestureDetector(
                    onTap: ()async{
                     authProvider.setstartLoading();
                     await Future.delayed(const Duration(seconds: 3));
                      if(formkey.currentState!.validate()){
                         await   authProvider.signUp(
                           authProvider.signup_username_controller.text,
                           authProvider.signup_email_controller.text,
                           authProvider.signup_password_controller.text,
                           authProvider.signup_phone_no_controller.text,
                           context);

                         uploadImageToFirebase();

                        }

                          authProvider.setstopLoading();
                       },
                        child: CustomButton(buttontxt: 'Login',)),

                68.height(context),


                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteHelper.loginscreen);
                  },
                  child: CustomContainer(
                      text:  "Already have a Account? Sign in",
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );

  }



}





























