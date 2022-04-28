import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/movieLists_provider.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MovieListsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bai Tap 2',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.blueGrey[300],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
