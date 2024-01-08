import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tarongoelectronics/Dashboard/DueCustomers.dart';
import 'package:tarongoelectronics/Dashboard/HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async{


  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyBcQNjy4CzCJ_hwnwGqJuqkb5PITNadPug", appId: "1:282479122364:android:69b54e66a56915a3433db9", messagingSenderId: "282479122364", projectId: "tarongoelectronics")
    ,);




  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarongo Electronics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.aleo().fontFamily,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

