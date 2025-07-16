import 'package:arcpos/theme.dart';
import 'package:arcpos/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arc POS',
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomeView(),
      },
    );
  }
}
