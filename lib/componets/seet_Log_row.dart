import 'package:flutter/material.dart';

class SeetLogRow extends StatelessWidget {
  SeetLogRow(
      {required this.title,
      
      required this.icon,
      required this.onTap,
      super.key});
  String title;
  
  IconData icon;
  GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 10
      ),
      child: Container(
        decoration:  BoxDecoration(
         border: Border.all(width: 2)),
        child: ListTile(
          onTap: onTap,
          leading: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
