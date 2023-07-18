import 'package:blooddonation/CustomWidgets/Custom_button.dart';
import 'package:blooddonation/CustomWidgets/custom_text.dart';
import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:blooddonation/screens/Atuntication_Screen/components/cutomContainer_btton.dart';
import 'package:blooddonation/utils/colors..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Helper/route_helper.dart';
import '../../Providers/Atuntication_Providers.dart';
import 'components/Text_Input_field.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {

    final  authProvider = Provider.of<AtunticationProvider>(context);


    return Scaffold(

      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [





         280.height(context),

          CustomText(
              text: "Reset Your Password",
              fontWeight: FontWeight.bold,
              colors: DeepCerise,
              fontsize: 28,
            ),

            10.height(context),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(
                text: "Enter the Email Address Associated with Account to reset the password",
                fontWeight: FontWeight.normal,
                colors: Colors.black,
                fontsize: 17,
              ),
            ),

            10.height(context),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19,vertical: 12),
              child: TextInputField(
                icon: Icons.mail,
                labelText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            50.height(context),




            
            CustomButton(buttontxt: "Reset"),

            160.height(context),


            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteHelper.loginscreen);
              },
              child: CustomContainer(
                  text:  "Sign in with new Password",
              )
            )

          ],
        ),
      ),

    );
  }
}
