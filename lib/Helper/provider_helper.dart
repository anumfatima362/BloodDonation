import 'package:blooddonation/Providers/Atuntication_Providers.dart';
import 'package:provider/provider.dart';




class ProviderHelper{
  static List<ChangeNotifierProvider> provider =[

    ChangeNotifierProvider<AtunticationProvider>(create: (context)=> AtunticationProvider()),
  ];
}