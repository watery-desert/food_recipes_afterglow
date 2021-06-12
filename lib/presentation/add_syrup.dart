import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'button.dart';
import 'my_order.dart';

TextStyle _textStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black.withOpacity(0.7),
);

class AddSyrup extends StatelessWidget {
  const AddSyrup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: deviceHeight - 600,
          color: Colors.transparent,
        ),
        Container(
          height: 600,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 4.0,
            )
          ]),
          child: Column(
            children: [
              SizedBox(
                height: 56,
              ),
              ListTile(
                leading: Image.asset('assets/images/syrup1.png'),
                title: Text(
                  'Pancake Syrup',
                  style: _textStyle,
                ),
                subtitle: Text('20g'),
                trailing: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    FontAwesomeIcons.plusCircle,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset('assets/images/syrup2.png'),
                title: Text(
                  'Strawberry Syrup',
                  style: _textStyle,
                ),
                subtitle: Text('10g'),
                trailing: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    FontAwesomeIcons.plusCircle,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
              ),
              ListTile(
                leading: Image.asset('assets/images/syrup1.png'),
                title: Text(
                  'Maple Syrup',
                  style: _textStyle,
                ),
                subtitle: Text('10g'),
                trailing: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    FontAwesomeIcons.plusCircle,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              CustomButton(
                title: 'Confirm',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => MyOrder()
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
