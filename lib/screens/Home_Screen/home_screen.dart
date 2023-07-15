import "package:blooddonation/CustomWidgets/Custom_Textfield.dart";
import "package:blooddonation/CustomWidgets/custom_bar.dart";
import "package:blooddonation/CustomWidgets/custom_text.dart";
import "package:blooddonation/CustomWidgets/sizedbox.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> stringList = ['A+', 'B-', 'B+', 'O-', 'O+', 'AB+', 'AB-',];
    List<String> listnames = ['JohnMichel', 'Emma', 'Ava', 'James', 'William', 'Sophia', 'Mia',];
    List<String> listaddress = ['4319, wakefield Street', '3251 Irving Place', '6789 Cedar Lane', '2435 Sampson Street', '567 Hill Lane', '4319, wakefield Street', '4319, wakefield Street',];
    List<String> Listimages = ['assets/images/BoyIimage1.png', 'assets/images/girlimage.jpg', 'assets/images/GirlImage1.jpg', 'assets/images/Boyimage2.jpg',
                               'assets/images/BoyIimage1.png', 'assets/images/GirlImage2.jpg', 'assets/images/GirlImage1.jpg',];


    return Scaffold(

      appBar:CustomAppBar(
        height: 170.h(context),
        child: SafeArea(
          child: Column(
           children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: [

                  Icon(Icons.arrow_back_outlined, color: Colors.white,),

                  120.width(context),

                  CustomText(
                   text: 'Home',
                   fontWeight:FontWeight.bold,
                   colors: Colors.white,
                   fontsize: 20,
                 ),

                ],
              ),
            ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: CustomTextfield(),
           ),
           ],
          ),
        ),
      ),



    //================================================== Body ===================================================================================================
      body: Column(
       children: [
         5.height(context),
         Container(
           height: 55,
           width: double.infinity,
          // color: Colors.blue,
           child: ListView.builder(
               itemCount: stringList.length,
               scrollDirection: Axis.horizontal,
               itemBuilder:(context,  int index){
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                   child: Container(
                     width: 41,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       color: Colors.red,
                     ),
                     child: Center(
                       child: CustomText(
                           text: stringList[index],
                           fontWeight: FontWeight.w400,
                           colors: Colors.white,
                           fontsize: 15,
                       ),
                     ),
                   ),
                  ),
                );
               }
           ),
         ),


       10.height(context),

       Expanded(
         child: Container(
          // height: 55,
          width: double.infinity,
          // color: Colors.blue,
           child:  ListView.builder(
                itemCount: listnames.length,
               shrinkWrap: false,
               scrollDirection: Axis.vertical,
                 itemBuilder: (context, int index){
                   return Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       width: 80,
                       height: 120,
                       decoration: BoxDecoration(
                         color: Colors.red.shade100,
                         borderRadius:  BorderRadius.circular(8),
                       ),
                       child: Row(
                         children: [
                           15.width(context),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(Listimages[index],),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                           15.width(context),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               25.height(context),
                               CustomText(
                                   text:listnames[index],
                                   fontWeight: FontWeight.bold,
                                   colors: Colors.black,
                                   fontsize: 18,
                               ),


                               CustomText(
                                 text:listaddress[index],
                                 fontWeight: FontWeight.w400,
                                 colors: Colors.grey.shade700,
                                 fontsize: 15,
                               ),




                               CustomText(
                                 text:stringList[index],
                                 fontWeight: FontWeight.bold,
                                 colors: Colors.red.shade800,
                                 fontsize: 22,
                               ),
                               



                             ],
                           )
                         ],

                     ),
                     ),
                   );
                 }
             ),
         ),
       ),
       ],
        ),
    );
  }
}
