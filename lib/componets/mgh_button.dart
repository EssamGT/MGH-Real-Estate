import 'package:flutter/material.dart';

class MghButton extends StatelessWidget {
  String title;
  GestureTapCallback on_press;
  Color color = Colors.black;
  MghButton({super.key, 
    required this.color,
    required this.title, required this.on_press,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: MaterialButton(
          onPressed: on_press,
          color: color,
          minWidth: double.infinity,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
