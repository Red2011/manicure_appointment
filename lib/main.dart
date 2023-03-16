import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manicure_appointment/pages/home_page.dart';
import 'package:manicure_appointment/pages/master_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Evolventa',
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.grey[700],
        ),
        titleTextStyle: TextStyle(
          color: Colors.grey[700],
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Evolventa'
        )
      ),

    ),

    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/master': (context) => MasterPage('')
    },
  ));
}
