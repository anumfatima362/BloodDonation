import "package:blooddonation/CustomWidgets/custom_bar.dart";
import "package:blooddonation/CustomWidgets/sizedbox.dart";
import "package:blooddonation/Helper/route_helper.dart";
import "package:blooddonation/screens/MenuScreen/components/CustomDoner.dart";
import "package:flutter/material.dart";

import "../../CustomWidgets/custom_text.dart";

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
        height: 100.h(context),
        child: SafeArea(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Icon(Icons.menu, color: Colors.white,),

                CustomText(
                    text: 'Menu',
                    fontWeight:FontWeight.bold,
                    colors: Colors.white,
                    fontsize: 20
                 ),

                CircleAvatar(
                  backgroundColor: Colors.cyanAccent,
                ),

              ],
            ),
          ),
        ),
        
      ),


      body: Container(
         height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backgroundImage.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Stack(
          children: [

              Positioned (
               top: 100.h(context),
               left: 30.h(context),
               child: GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, RouteHelper.homescreen);
                 },
                 child: CustomDoner(
                     doner: 'Become Doner',
                     imagePath: 'assets/images/pngwing.com.png'
                 )
               ),
            ),

              Positioned (
              top: 100.h(context),
              left: 210.h(context),
                child:CustomDoner(
                  doner: 'Search Doner',
                  imagePath: 'assets/images/blood-type.png'   ,
                ),
            ),

            Positioned (
              top: 280.h(context),
              left: 130.h(context),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, RouteHelper.homescreen);
                },
                child: CustomDoner(
                    doner: 'Blood Bank',
                    imagePath: 'assets/images/blood-bank.png'      ,
                )
              ),
            )

          ],
        ),
      ),
    );
  }
}
