import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_recipes_afterglow/presentation/button.dart';

import 'custom_app_bar.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'My Order',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BuildTile(
                imageLink: 'assets/images/pancakes.png',
                title: 'Pancakes',
                subtitle: '\$24.50',
              ),
              BuildTile(
                imageLink: 'assets/images/pasta.png',
                title: 'Pasta With Egg',
                subtitle: '\$14.50',
              ),
              BuildTile(
                imageLink: 'assets/images/plate_of_fruit.png',
                title: 'A Plate Of Fruit',
                subtitle: '\$12.50',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$51.50',
                      style: TextStyle(
                        fontSize: 18,

                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 56,
              ),
              CustomButton(
                title: 'Checkout',
              ),
            ],
          ),
          CustomAppBar(),
        ],
      ),
    );
  }
}

class BuildTile extends StatelessWidget {
  final String imageLink;
  final String title;
  final String subtitle;

  const BuildTile(
      {required this.imageLink, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 75,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Transform.scale(
                scale: 2,
                child: Image.asset(
                  imageLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Icon(FontAwesomeIcons.minusCircle)
        ],
      ),
    );
  }
}
