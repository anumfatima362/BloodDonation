import 'package:blooddonation/CustomWidgets/Custom_button.dart';
import 'package:blooddonation/CustomWidgets/custom_text.dart';
import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:blooddonation/Helper/route_helper.dart';
import 'package:blooddonation/screens/Atuntication_Screen/components/Text_Input_field.dart';
import 'package:blooddonation/screens/Atuntication_Screen/components/cutomContainer_btton.dart';
import 'package:blooddonation/utils/colors..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/Atuntication_Providers.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AtunticationProvider>(context);
    return Scaffold(

      body:SafeArea(

        child: Form(
          key: formkey,

          child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children:[

                240.height(context),

                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'BLOOD DONATION',
                    fontWeight: FontWeight.bold,
                    colors: Razzmatazz,
                    fontsize: 30,
                  ),
                ),

                15.height(context),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: TextInputField(
                    controller:authProvider.login_email_controller ,
                    icon: Icons.mail,
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: TextInputField(
                    controller: authProvider.login_password_controller,
                    icon: Icons.lock,
                    labelText: "Password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),



                15.height(context),

                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouteHelper.forgot_password_screen);
                        },
                      child: CustomText(
                        text: "Forgot Password?",
                        fontWeight: FontWeight.bold,
                        colors: Razzmatazz,
                        fontsize: 15,
                      ),
                    ),
                  ),
                ),


                60.height(context),

                GestureDetector(
                  onTap: (){
                    if(formkey.currentState!.validate()){
                      authProvider.login_email_controller.text.isNotEmpty.toString();
                      authProvider.login_email_controller.text.isNotEmpty.toString();
                    }
                  },

                    child: CustomButton(buttontxt: 'Login',)),

                120.height(context),


                GestureDetector(
                  onTap: () {
                 Navigator.pushNamed(context, RouteHelper.registration_screen);
                  },
                  child: CustomContainer(
                      text: "Don't have a Account ? Sign up"
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
