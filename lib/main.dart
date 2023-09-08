import 'package:flutter/material.dart';
import 'package:news_app/provider/article_provider.dart';
import 'package:news_app/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticleProvider(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme:  AppBarTheme(
            backgroundColor: Colors.amber.shade100,
            elevation: 0
          )
        ),
        title: 'News App',
         home:const HomeScreen(),
      ),
    );
  }
}

