import 'package:flutter/material.dart';

class MghPassTextFiled extends StatefulWidget {
  String title;
  Icon ficon;
  TextEditingController con = TextEditingController();
  bool sec;

  String validateor;
  MghPassTextFiled(this.title, this.ficon, this.sec, this.con, this.validateor,
      {super.key});

  @override
  State<MghPassTextFiled> createState() => _MghPassTextFiledState();
}

class _MghPassTextFiledState extends State<MghPassTextFiled> {
  Map chval = {
    'name': (String? value) {
      if (value!.isEmpty) {
        return 'Name cannot be empty.';
      }
      if (value.length < 5) {
        return 'Name must be at least 5 characters long.';
      }
      if (!RegExp(r"^[A-Za-z\s]+$").hasMatch(value)) {
        return '"Name should only contain alphabets and spaces."';
      }
      return null;
    },
    'email': (String? value) {
      if (value!.isEmpty) {
        return 'Email address cannot be empty.';
      }
      if (!RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
          .hasMatch(value)) {
        return "Please enter a valid email address (e.g., user@example.com).";
      }
      return null;
    },
    'password': (String? value) {
      if (value!.isEmpty) {
        return 'Password cannot be empty.';
      }
      if (value.length < 8) {
        return 'Password must be at least 8 characters long.';
      }
      return null;
    }
  };
bool pass =true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: chval[widget.validateor],
        controller: widget.con,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.lightBlue.shade900, width: 2),
          ),
          prefixIcon: widget.ficon,
          prefixIconColor: Colors.black,
          hintText: widget.title,
          hintStyle: const TextStyle(fontSize: 17, color: Colors.black),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
           suffixIcon: IconButton(
        onPressed: () {
          pass = !pass;
          setState(() {
            
          });
        },
        icon: pass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility))
        ),
        obscureText:pass ,
      ),
    );
  }
}
