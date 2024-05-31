import 'package:alenresturange/main.dart';
import 'package:alenresturange/services/auth/auth_gate.dart';
import 'package:alenresturange/services/auth/login_or_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:alenresturange/models/restaurant.dart';
import 'package:alenresturange/themes/theme_provider.dart';
import 'package:alenresturange/auth/login_or_register.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemProvider()),

        // restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

mixin currentPlatform {
}

mixin currentplatform {
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemProvider>(context).themeData,
    );
  }
}