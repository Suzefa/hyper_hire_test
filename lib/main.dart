import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_hyer_test/firebase_options.dart';

import 'screens/dashboard_screen.dart';
import 'utilities/system_ui_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlay.changeUiOverLay();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "/" : (context)=> const DashboardScreen(),
      },
      initialRoute: "/",
    );
  }
}

