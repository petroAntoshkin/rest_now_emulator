import 'dart:core';

import 'package:flutter/material.dart';
import 'package:rest_now_emulator/elements/my_icon_button.dart';

// ignore: must_be_immutable
class ConfirmCancelButtons extends StatelessWidget {
  void Function() confirmCallback;
  void Function() cancelCallback;

  ConfirmCancelButtons({Key? key, required this.confirmCallback, required this.cancelCallback}) : super(key: key);

  // BuildContext _context;

  @override
  Widget build(BuildContext context) {
    // _context = context;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyIconButton(iconData: Icons.clear_rounded, onPress: cancelCallback),
          MyIconButton(iconData: Icons.check, onPress: confirmCallback),
        ],
      ),
    );
  }
}
