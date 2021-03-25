import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final Function onClick;
  final Color buttonColor;

  const Buttons(
      {@required this.buttonText,
      @required this.onClick,
      @required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          child: MaterialButton(
            onPressed: onClick,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            color: buttonColor,
          ),
        ),
      ),
    );
  }
}
