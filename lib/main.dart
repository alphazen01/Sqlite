import 'package:flutter/material.dart';
import 'package:sqlite/home.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    )
  );
}

