import 'package:flutter/material.dart';
import '../model/food.dart';
import 'dart:math' as math;

final colors = [Colors.amberAccent, Colors.purple, Colors.green];

class BottomPageView extends StatefulWidget {
  final List<Food> foods;
  final PageController controller;
  final double deviceWidth;
  const BottomPageView({
    required this.foods,
    required this.controller,
    required this.deviceWidth,
  });

  @override
  _BottomPageViewState createState() => _BottomPageViewState();
}

class _BottomPageViewState extends State<BottomPageView> {
  late PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
    widget.controller.addListener(() {
      _pageController.jumpTo(
          widget.controller.page! * _pageController.position.viewportDimension);
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  double _getOpacity(double number) {
    final decimalLengh = 10000000000;

    /// This code is copid from here
    /// https://stackoverflow.com/a/59738706/10993985
    return (((number * decimalLengh).toInt() % decimalLengh) / decimalLengh);
  }

  Widget _buildImage({required String link, required int index}) {
    Widget child(Widget child, double opacity) => Transform.translate(
          offset: Offset(0, -100),
          child: Transform.scale(
            scale: 1.8,
            child: Transform.rotate(
              angle: _currentPage - index,
              child: Opacity(
                opacity: opacity,
                child: Opacity(
                  opacity: 0.8,
                  child: child,
                ),
              ),
            ),
          ),
        );

    if (index == _currentPage.floor() - 1) {
      return child(Image.asset(link), _getOpacity(_currentPage));
    } else if (index == _currentPage.floor() + 1 ||
        index == _currentPage.floor() + 2) {
      return child(
        Image.asset(link),
        _getOpacity(_currentPage),
      );
    } else if (index == _currentPage.floor()) {
      return child(
        Image.asset(link),
        1 - _getOpacity(_currentPage),
      );
    } else {
      return Container();
    }
  }

  Widget _buildText(String foodName, double foodPrice, int index) {
    final accentColor = Theme.of(context).accentColor;

    final textOpacity = (_getOpacity(_currentPage));

    Widget child(double opacity) => Opacity(
          opacity: opacity,
          child: Column(
            children: [
              Text(
                '$foodName',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 36),
              ),
              Text(
                '\$$foodPrice',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        );

    if (index == _currentPage.floor() - 1) {
      return child(
        textOpacity,
      );
    } else if (index == _currentPage.floor() + 1 ||
        index == _currentPage.floor() + 2) {
      return child(
        textOpacity,
      );
    } else if (index == _currentPage.floor()) {
      return child(
        1 - textOpacity,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final canvasColor = Theme.of(context).canvasColor;
    final foods = widget.foods;
    return Container(
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: SizedBox(
              width: deviceWidth,
              child: Transform.translate(
                offset: Offset(0, 40),
                child: Image.asset(
                  'assets/images/bottom_image.png',
                ),
              ),
            ),
          ),
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildImage(
                    index: index,
                    link: foods[index].imageLink,
                  ),
                  SizedBox(
                    height: 136,
                  ),
                  _buildText(foods[index].foodName, foods[index].price, index),
                  SizedBox(
                    height: 48,
                  ),
                ],
              );
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 350),
            color: canvasColor.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
