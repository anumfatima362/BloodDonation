import 'package:blooddonation/screens/MenuScreen/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import '../screens/Home_Screen/home_screen.dart';
import '../screens/Splash_Screen/splash_screen.dart';



class RouteHelper{
  static const initial = "/";
  static const menuscreen = "/menuscreen";
  static const homescreen = "/homescreen";






  static Map<String, Widget Function(BuildContext context)> routes  =  {
    initial: (context) => const SplashScreen(),
    menuscreen: (context) => const MenuScreen(),
    homescreen: (context) => const HomeScreen(),
  };
}