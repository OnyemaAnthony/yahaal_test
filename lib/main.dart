import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yahaal_test/blocs/recipe/recipe_bloc.dart';
import 'package:yahaal_test/di/injection.dart';
import 'package:yahaal_test/screens/bottom_navigation_bar_screen.dart';
import 'package:yahaal_test/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //String test = '789ea676e8264c9887a9e7fdc2c96ace';

  WidgetsFlutterBinding.ensureInitialized();
  Di.initialize();
  runApp(BlocProvider(
    create: (context) => RecipeBloc(),
    child: MyApp(),
  ));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),

      home: const BottomNavigationBarScreen(),
    );
  }
}