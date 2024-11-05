import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({Key? key, required this.iconData, required this.onPress})
      : super(key: key);
  final IconData iconData;
  final void Function() onPress;
  final double baseSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: baseSize * 3,
      height: baseSize * 3,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.red.withAlpha(125),
            border: Border.all(
              color: Colors.black.withAlpha(125),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(baseSize * 4),
          ),
          child: Icon(
            iconData,
            size: baseSize * 1.4,
          ),
        ),
      ),
    );
  }
}
