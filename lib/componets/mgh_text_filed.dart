import 'package:flutter/material.dart';

class MghTextFiled extends StatelessWidget {
  String title;
  Icon ficon;
  TextEditingController con = TextEditingController();
  bool sec;

  String keyborad;
  String validateor;
  MghTextFiled(
      this.title, this.ficon, this.sec, this.con, this.validateor, this.keyborad,
      {super.key});

  Map valT = {
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
    },
    'phone': ( value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    const pattern = r'^(011|010|012|015)\d{8}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Phone number must be 11 digits and start with 011, 010, 012, or 015';
    }
    if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
        return 'Enter a valid phone number';
      }
    
    return null; 
  },
      'title': (String? value) {
      if (value!.isEmpty) {
        return 'Title cannot be empty.';
      }
      if (value.length < 5) {
        return 'Title must be at least 5 characters long.';
      }
      if (!RegExp(r"^[A-Za-z\s]+$").hasMatch(value)) {
        return '"Title should only contain alphabets and spaces."';
      }
      return null;
    },
    'subtitle': (String? value) {
      if (value!.isEmpty) {
        return 'subtitle address cannot be empty.';
      }
      if (!RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
          .hasMatch(value)) {
        return "Please enter a valid subtitle ";
      }
      return null;
    },
    'price': (value) {
      if (value!.isEmpty) {
        return 'Price cannot be empty.';
      }
      if (value.length < 6) {
        return 'Price must be at least 6 Numbers .';
      }
      return null;
    },
    'area': (value) {
      if (value!.isEmpty) {
        return 'Area cannot be empty.';
      }
      if (value.length < 2) {
        return 'Area must be at least 6 Numbers .';
      }
      return null;
    },
    'discribtion': (value) {
      if (value!.isEmpty) {
        return 'discribtion cannot be empty.';
      }
      if (value.length < 20) {
        return 'discribtion must be at least 20 Words .';
      }
      return null;
    },
    'location': (value) {
      if (value!.isEmpty) {
        return 'location cannot be empty.';
      }
      return null;
    },
    
  };

  Map<String,TextInputType> keyboradT = {
    'email':TextInputType.emailAddress,
    'password':TextInputType.text,
    'name':TextInputType.name,
    'phone': TextInputType.phone,
    'text': TextInputType.text,
    'int': TextInputType.number,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: valT[validateor],
        controller: con,
        keyboardType: keyboradT[keyborad],
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.lightBlue.shade900, width: 2),
          ),
          prefixIcon: ficon,
          prefixIconColor: Colors.black,
          hintText: title,
          hintStyle: const TextStyle(fontSize: 17, color: Colors.black),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        obscureText: sec,
      ),
    );
  }
}
