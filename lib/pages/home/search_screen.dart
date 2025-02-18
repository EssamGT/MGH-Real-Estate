import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  List Search = [];

  @override
  Widget build(BuildContext context) {
    return  Column( 
      children: [
          const Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,
                hintText: 'Search',
                hintStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: Color(0xFF81B4FF),
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                        color: Colors.black,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid,
                        width: 2))),
          ),
        ),
        Search.isEmpty?
        const Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Search Result Found'),
              ],
            ),
          ),
        )
         :const SingleChildScrollView(
              child: Column(
                children: [
                  
                Text('tt')
                
                  
              
                ],
              ),
            ),
      ],
    );
    
  }
}
