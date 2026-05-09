import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dezmo',
      debugShowCheckedModeBanner: false,

home: Placeholder(color: Colors.white,),
    );

  }
}
