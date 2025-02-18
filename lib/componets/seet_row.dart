import 'package:flutter/material.dart';


class SeetRow extends StatelessWidget {
   SeetRow({ required this.title,required this.subTilte, required this.icon,required this.onTap, super.key});
  String title;
  String subTilte;
  IconData icon;
GestureTapCallback  onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        decoration:  BoxDecoration(
        
            border: Border.all(width: 2)),
        child:  ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
          title,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            subTilte,
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
