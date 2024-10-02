import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/presentation/bloc/news.dart';
import 'package:news_app/presentation/screens/news.dart';

import 'data/repositories/news.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => NewsBloc(NewsRepository()),
        child: const NewsScreen(),
      ),
    );
  }
}
