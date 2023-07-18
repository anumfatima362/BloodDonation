import 'package:blooddonation/CustomWidgets/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../../CustomWidgets/custom_text.dart';
import '../../../utils/colors..dart';


class CustomContainer extends StatelessWidget {
  final String text;
  const CustomContainer({Key? key , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h(context),
      width: MediaQuery.of(context).size.width,
      color: Razzmatazz,
      child: Center(
        child: CustomText(
            text: text,
            fontWeight: FontWeight.w500,
            colors: Colors.white,
            fontsize: 20
        ),
      ),
    );
  }
}
