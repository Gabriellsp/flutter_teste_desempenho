import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonName;

  const ButtonMenu({Key? key, this.onPressed, this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed!,
        child: Text(buttonName!),
      ),
    );
  }
}
