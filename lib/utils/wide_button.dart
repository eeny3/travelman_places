import 'package:flutter/material.dart';
import 'package:travelman/widgets/textStyles.dart';

import 'colors.dart';

// ignore: must_be_immutable
class WideButton extends StatelessWidget {
  final String text;
  final Color color;
  bool isBold = false;
  final GestureTapCallback onPressed;
  WideButton(this.text, this.onPressed, this.color);
  WideButton.bold(this.text, this.onPressed, this.isBold, this.color);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.92,
        height: 50,
        child: RaisedButton(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: isBold
              ? BoldText(text, 22.5, kwhite)
              : NormalText(text, kwhite, 22.5),
          onPressed: onPressed,
        ));
  }
}

class SquaredIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  SquaredIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => null,
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 5.0,
              spreadRadius: -2.0,
              offset: Offset(
                3.0,
                4.0,
              ),
            )
          ],
        ),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  size: 50,
                  color: kgreyDark,
                ),
                SizedBox(
                  height: 5,
                ),
                NormalText(text, kblack, 16.0)
              ],
            )),
      ),
    );
  }
}
