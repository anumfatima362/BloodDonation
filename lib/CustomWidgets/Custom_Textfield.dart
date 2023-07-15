import 'package:flutter/material.dart';


class CustomTextfield extends StatelessWidget {
  const CustomTextfield({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(20)

      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          //reduce the size of height in search field
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            prefixIcon: Icon(
              Icons.search_rounded,size: 30,
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400 ,
              color: Colors.grey ,
              fontStyle: FontStyle.normal,
            ),
            //suffixIcon: Icon(Icons.mic),
            fillColor: Color.fromRGBO(255, 255, 255, 0.3),
        ),
      ),
    );
  }
}



