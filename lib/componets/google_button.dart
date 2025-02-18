import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  String title;
  GestureTapCallback on_press;
  
  GoogleButton(this.title, this.on_press, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: MaterialButton(
          
          onPressed: on_press,
          color: Colors.black,
          minWidth: double.infinity,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Icon(Icons.g_mobiledata,color: Colors.white,),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
