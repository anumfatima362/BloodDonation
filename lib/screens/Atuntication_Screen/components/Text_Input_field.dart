import 'package:blooddonation/screens/Atuntication_Screen/Login_screen.dart';
import 'package:blooddonation/utils/colors..dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../Providers/Atuntication_Providers.dart';


class TextInputField extends StatelessWidget {
  final  TextEditingController? controller;

  final String labelText;
  final IconData  icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;


  TextInputField({Key? key ,  this.controller ,required this.icon ,  required this.labelText, required this.keyboardType, this.inputFormatters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AtunticationProvider>(context);




    return TextFormField(


      autofocus: false,

      // autovalidateMode: controller.text.isNotEmpty? AutovalidateMode.always : AutovalidateMode.onUserInteraction,

      controller: controller ,

      //if the controller of the TextFormField is equal to either authProvider.signInPasswordController or authProvider.signUpPasswordController.
      // If the condition is true, it sets obscureText to true, indicating that the entered text should be obscured (e.g., for password fields). If the condition is false,
      // it sets obscureText to false, indicating that the entered text should be visible (e.g., for non-password fields).
      obscureText: controller == authProvider.signup_password_controller || controller == authProvider.login_password_controller ? true : false ,
      keyboardType: keyboardType ,
      inputFormatters: inputFormatters,
      // Action button of the keyboard =>  controller of the text field is related to password then the button will be  done  be otherwise the type will be next
      textInputAction: controller == authProvider.signup_password_controller|| controller == authProvider.login_email_controller? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(color: DeepCerise),
        labelText: labelText,
        prefixIcon: Icon(icon, size: 30, ),
        labelStyle: TextStyle(fontSize: 20) ,
        contentPadding: EdgeInsets.symmetric(vertical: 18),


         errorStyle: TextStyle(
            fontSize: 15,
            color:  Colors.redAccent
          ),


        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(

            color: DeepCerise,
          ),
         ),


          //active formfield
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
           borderSide: BorderSide(color:DeepCerise,width: 2),
           ),


        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(width: 2),       when you want to active the color of textfield.
        // ),

          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: DeepCerise),
           ),


        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: (value){
        if(controller == authProvider.signup_username_controller){
          return authProvider.usernameValidation(value);
        }
        else if (controller == authProvider.signup_email_controller || controller == authProvider.login_email_controller){
          return authProvider.EmailValidation(value);
        }
        else if (controller == authProvider.signup_password_controller|| controller == authProvider.login_password_controller){
          return authProvider.PasswordValidation(value);
        }
       else if (controller== authProvider.signup_phone_no_controller) {
         return authProvider.PhoneValidation(value);
        }

      },
    );
  }
}
