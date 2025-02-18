import 'package:flutter/material.dart';

class InkM extends StatelessWidget {
  String title;
  GestureTapCallback on_tap;
  Alignment al;
  InkM(this.title, this.al, this.on_tap, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: 
        on_tap
      ,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: al,
        child: Text(
          title,
          style: TextStyle(color: Colors.blue[900]),
        ),
      ),
    );
  }
}
