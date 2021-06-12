import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Center(
        child: Icon(
          FontAwesomeIcons.utensils,
          color: Colors.white,
          size: 56,
        ),
      ),
    );
  }
}
