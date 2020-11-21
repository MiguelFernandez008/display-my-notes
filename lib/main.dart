import 'dart:async';
import 'package:display_my_notes/database/database.dart';
import 'package:display_my_notes/providers/notes.dart';
import 'package:display_my_notes/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseController db = DatabaseController();
  await db.createDatabase();
  runApp(ChangeNotifierProvider(
    create: (context) => NotesProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final String appName = "Display My Notes";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        fontFamily: 'Dosis',
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeWidget(
        title: appName,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
