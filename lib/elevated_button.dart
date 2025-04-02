import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(this.buttonName, this.onTap, {super.key});

  String buttonName;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
