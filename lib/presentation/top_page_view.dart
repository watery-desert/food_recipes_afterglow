import 'package:flutter/material.dart';
import '../model/food.dart';
import 'button.dart';
import 'add_syrup.dart';

class TopPageView extends StatefulWidget {
  final PageController pageController;
  final List<Food> foods;
  const TopPageView({required this.foods, required this.pageController});

  @override
  _TopPageViewState createState() => _TopPageViewState();
}

class _TopPageViewState extends State<TopPageView>
    with SingleTickerProviderStateMixin {
  double _currentPage = 0.0;
  late AnimationController _animationController;
  late Animation<Offset> _sheetOffset;
  double _maxSlide = 600;
  late Animation<double> _containerHeight;

  @override
  void initState() {
    super.initState();
    final controller = widget.pageController;
    controller.addListener(() {
      setState(() {
        _currentPage = controller.page!;
      });
    });

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _sheetOffset = Tween<Offset>(begin: Offset(0, 600), end: Offset.zero)
        .animate(_animationController);

    _containerHeight =
        Tween<double>(begin: 148, end: 300).animate(_animationController);
  }

  Widget _buildImage(String link) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Image.asset(link),
    );
  }

  void _onDragUpdate(DragUpdateDetails details) {
    double delta = details.primaryDelta! / _maxSlide;
    _animationController.value -= delta;
  }

  void _onDragEnd(DragEndDetails details) {
    double _kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }

    if (details.velocity.pixelsPerSecond.dy.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dy /
          (MediaQuery.of(context).size.height);

      _animationController.fling(velocity: -visualVelocity);
    } else if (_sheetOffset.value.dy < 300)
      _animationController.reverse();
    else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final foods = widget.foods;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: widget.pageController,
                physics: ClampingScrollPhysics(),
                itemCount: foods.length,
                itemBuilder: (context, index) {
                  if (index == _currentPage.floor() - 1) {
                    // left
                    return Transform.translate(
                      offset: Offset(
                        0.0,
                        100 * (_currentPage - index),
                      ),
                      child: Transform.rotate(
                        angle: _currentPage - index,
                        child: _buildImage(foods[index].imageLink),
                      ),
                    );
                  } else if (index == _currentPage.floor() + 1 ||
                      index == _currentPage.floor() + 2) {
                    // right
                    return Transform.translate(
                      offset: Offset(
                        0.0,
                        100 * (index - _currentPage),
                      ),
                      child: Transform.rotate(
                        angle: _currentPage - index,
                        child: _buildImage(foods[index].imageLink),
                      ),
                    );
                  } else if (index == _currentPage.floor()) {
                    // middle
                    return Transform.translate(
                      offset: Offset(
                        0.0,
                        100 * (_currentPage - index),
                      ),
                      child: Transform.rotate(
                        angle: _currentPage - index,
                        child: _buildImage(foods[index].imageLink),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) => Container(
                color: Colors.transparent,
                alignment: Alignment.topCenter,
                height: _containerHeight.value,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              title: 'Add To Cart',
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              color: Colors.transparent,
              height: 140,
              alignment: Alignment.topCenter,
              child: Text(
                'Swipe To See Recipe',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onVerticalDragUpdate: _onDragUpdate,
          onVerticalDragEnd: _onDragEnd,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (_, __) => Transform.translate(
                offset: _sheetOffset.value, child: AddSyrup()),
          ),
        ),
      ],
    );
  }
}
