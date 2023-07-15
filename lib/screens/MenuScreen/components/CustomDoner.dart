import "package:blooddonation/CustomWidgets/sizedbox.dart";
import "package:flutter/material.dart";

import "../../../CustomWidgets/custom_text.dart";
class CustomDoner extends StatefulWidget {
 final String doner;
 final String imagePath;

 const CustomDoner({Key? key, required this.doner, required this.imagePath,}) : super(key: key);

  @override
  State<CustomDoner> createState() => _CustomDonerState();
}

class _CustomDonerState extends State<CustomDoner> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.h(context),
        width: 150.w(context),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Image.asset( widget.imagePath,width: 200),

            ),

            CustomText(
                text: widget.doner,
                fontWeight: FontWeight.bold,
                colors: Colors.white,
                fontsize: 20),


          ],
        )
    );
  }
}
