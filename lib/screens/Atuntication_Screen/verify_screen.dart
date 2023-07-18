import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/Custom_button.dart';
import '../../CustomWidgets/custom_text.dart';
import '../../Helper/route_helper.dart';
import '../../utils/colors..dart';
import 'components/Text_Input_field.dart';
import 'components/cutomContainer_btton.dart';



class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [





            350.height(context),

            CustomText(
              text: "Verify Your Email",
              fontWeight: FontWeight.bold,
              colors: DeepCerise,
              fontsize: 28,
            ),

            10.height(context),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(
                text:"Please confirm that you put correct email address by clicking on verify button",
                fontWeight: FontWeight.normal,
                colors: Colors.black,
                fontsize: 17,
              ),
            ),


            30.height(context),


            CustomButton(buttontxt: "Verify"),

            200.height(context),


            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteHelper.loginscreen);
                },
                child: CustomContainer(
                  text:  "Invalid Email? Use Other Email",
                )
            )

          ],
        ),
      ),






    );
  }
}
