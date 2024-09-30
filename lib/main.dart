import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/provider/favorite_provider.dart';
import 'package:flutter_recipe_app/provider/quantity.dart';
import 'package:provider/provider.dart';

import 'App_main_screen.dart';
// Import your QuantityProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for web and mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCXefbBZ8PSXDbVwqtMdqwrY9QQrJ8LaMg",
        authDomain: "recipeapp-e23cc.firebaseapp.com",
        projectId: "recipeapp-e23cc",
        storageBucket: "recipeapp-e23cc.appspot.com",
        messagingSenderId: "960263434620",
        appId: "1:960263434620:web:eb94de8bcb62bc12d374f9",
        measurementId: "G-CM5C7YRPHD",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => QuantityProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Enable the debug banner
        title: 'RECIPE APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppMainScreen(),
      ),
    );
  }
}
