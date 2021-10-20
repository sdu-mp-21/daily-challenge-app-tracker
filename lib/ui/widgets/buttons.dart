import 'package:challenge_tracker/ui/widgets/color_custom.dart';
import 'package:flutter/material.dart';

abstract class Buttons {

  static Widget getAuthButton(String btnText, var onClick) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: ColorsCustom.orangeLightColors,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
}