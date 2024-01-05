import 'package:care_to_day/View/donate_item.dart';
import 'package:care_to_day/View/login.dart';
import 'package:care_to_day/View/profile_page.dart';
import 'package:care_to_day/View/user.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: DonateItemScreen(),
     home: ProfilePage(),
      //home: LoginScreen(),
      //home: SignUpScreen(),
    );
  }
}
