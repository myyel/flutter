import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  const MyRaisedButton(
      {Key? key,
      required this.color,
      required this.onPressed,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 300,
          child: RaisedButton(
            color: color,
            onPressed: onPressed,
            child: child,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
