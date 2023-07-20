import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:blooddonation/screens/Atuntication_Screen/components/cutomContainer_btton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../CustomWidgets/Custom_button.dart';
import '../../CustomWidgets/custom_text.dart';
import '../../Helper/route_helper.dart';
import '../../Providers/Atuntication_Providers.dart';
import '../../utils/colors..dart';
import 'components/Text_Input_field.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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


              Container(
                     height: 136.h(context),
                     width: 136.w(context),
                   decoration: BoxDecoration(
                     color: DeepCerise,
                     borderRadius: BorderRadius.circular(80)
                   ),
                // child: CircleAvatar(
                //  backgroundColor: Colors.grey,
                //   radius: 55,
                 child: Stack(
                   children: [
                     Positioned(
                       top: 3.h(context),
                       left: 3.w(context),
                       child: Container(
                       height: 130.h(context),
                        width: 130.w(context),
                       decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(60)
                    ),
                       ),
                     ),

                  Positioned(
                    right: 1,
                    top: 75,
                    child: Container(
                      height: 40.h(context),
                      width: 40.w(context),
                      decoration: BoxDecoration(
                          color: DeepCerise,
                      borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.picture_in_picture_alt, color: Colors.white,),
                    ),
                  )
                   ],
                 ),

                ),


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

