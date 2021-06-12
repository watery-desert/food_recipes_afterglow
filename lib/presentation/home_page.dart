import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes_afterglow/presentation/bottom_page_view.dart';
import '/bloc/food_bloc.dart';

import 'custom_app_bar.dart';
import 'top_page_view.dart';
import 'loading_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  Widget child(Color color) {
    return Container(
      margin: EdgeInsets.all(4),
      // width: 300,
      // height: 300,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       
        body: BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodsLoading) {
          return LoadingWidget();
        } else if (state is FoodsLoaded) {
          return Stack(
            children: [
              BottomPageView(
                controller: _pageController,
                foods: state.foods,
                deviceWidth: MediaQuery.of(context).size.width,
              ),
              TopPageView(
                pageController: _pageController,
                foods: state.foods,
              ),
              CustomAppBar(),
            ],
          );
        } else {
          return LoadingWidget();
        }
      },
    ));
  }
}
