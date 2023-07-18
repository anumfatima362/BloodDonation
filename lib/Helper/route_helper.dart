import 'package:blooddonation/screens/Atuntication_Screen/Forgot_Password_Screen.dart';
import 'package:blooddonation/screens/Atuntication_Screen/Login_screen.dart';
import 'package:blooddonation/screens/Atuntication_Screen/Signup_screen.dart';
import 'package:blooddonation/screens/Atuntication_Screen/verify_screen.dart';
import 'package:blooddonation/screens/MenuScreen/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import '../screens/Home_Screen/home_screen.dart';
import '../screens/Splash_Screen/splash_screen.dart';



class RouteHelper{
  static const initial = "/";
  static const loginscreen = "/loginscreen";
  static const registration_screen = "/registrationscreen";
  static const forgot_password_screen = "/forgot_password_screen";
  static const verify_screen = "/verify_screen";



  static const menuscreen = "/menuscreen";
  static const homescreen = "/homescreen";






  static Map<String, Widget Function(BuildContext context)> routes  =  {
    initial: (context) => const SplashScreen(),
    loginscreen: (context) => const LoginScreen(),
    registration_screen: (context) => const SignupScreen(),
    menuscreen: (context) => const MenuScreen(),
    homescreen: (context) => const HomeScreen(),
    forgot_password_screen: (context) => const ForgotPassword(),
    verify_screen: (context) => const VerifyScreen(),

  };
}