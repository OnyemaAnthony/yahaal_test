import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yahaal_test/blocs/recipe/recipe_bloc.dart';
import 'package:yahaal_test/di/injection.dart';
import 'package:yahaal_test/screens/bottom_navigation_bar_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Di.initialize();
  runApp(BlocProvider(
    create: (context) => RecipeBloc(),
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
          )
        ),

        primarySwatch: Colors.yellow,
      ),

      home: const BottomNavigationBarScreen(),
    );
  }
}