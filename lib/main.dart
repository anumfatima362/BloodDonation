import 'package:blooddonation/utils/colors..dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Helper/provider_helper.dart';
import 'Helper/route_helper.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderHelper.provider,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // useMaterial3: true,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: DeepCerise,                              // change the color of textfield curdor
           ),
          ).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
            primary: DeepCerise,                                  //change the color of icon  when user select the textfield
          ),
        ),
        initialRoute: RouteHelper.initial,
        routes: RouteHelper.routes,
      ),
    );
  }
}




  //you can set the active color of the icon in ColorScheme.primary:

// theme: ThemeData().copyWith(
// colorScheme: ThemeData().colorScheme.copyWith(
// primary: Colors.green,
// ),
// ),