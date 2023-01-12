import 'package:flutter/material.dart';

import 'package:movies_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'providers/movies_provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/details": (context) => const DetailsScreen(),
      },
    );
  }
}
