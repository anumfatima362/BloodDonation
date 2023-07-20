import 'package:blooddonation/CustomWidgets/custom_text.dart';
import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:blooddonation/utils/colors..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Atuntication_Providers.dart';


class CustomButton extends StatelessWidget {
  String buttontxt;
  CustomButton({Key? key,required this.buttontxt}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final authProvider = Provider.of<AtunticationProvider>(context);

    return Container(
      height: 58.h(context),
      width: 260.w(context),
      decoration: BoxDecoration(
        color: Razzmatazz,
        borderRadius: BorderRadius.circular(10),
      ),
      child:authProvider.isloading? Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 1.5,
        ),
      ): Center(
        child: CustomText(
            text: buttontxt,
            fontWeight: FontWeight.w500,
            colors: Colors.white,
            fontsize: 20,
        ),
      ),
    );
  }
}
