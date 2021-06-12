import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/food_bloc.dart';
import 'presentation/home_page.dart';
import 'repository/food_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Recipes',
      theme: ThemeData(
        accentColor: Color(0xFFFE597A),
        primaryColor: Colors.white,
        canvasColor: Color(0xFFF3F7F8),
        appBarTheme: AppBarTheme(elevation: 0.0),
      ),
      home: BlocProvider(
        create: (context) => FoodBloc(
          foodReop: FoodRepo(),
        )..add(LoadFoods()),
        child: HomePage(),
      ),
    );
  }
}
