import 'package:flutter/material.dart';

class MghNdicTextField extends StatelessWidget {
  String title;
  Icon ficon;
  TextEditingController con = TextEditingController();

  String keyborad;
  String validateor;
  MghNdicTextField(this.title, this.ficon, this.con, this.validateor,
      this.keyborad,
      {super.key});

  Map valT = {
    'titile': (String? value) {
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
    'discribtion': (value) {
      if (value!.isEmpty) {
        return 'discribtion cannot be empty.';
      }
      if (value.length < 20) {
        return 'discribtion must be at least 20 Words .';
      }
      return null;
    },
    // 'phone': (value) {
    //   if (value == null || value.isEmpty) {
    //     return 'Please enter your phone number';
    //   }
    //   final pattern = r'^(011|010|012|015)\d{8}$';
    //   final regex = RegExp(pattern);
    //   if (!regex.hasMatch(value)) {
    //     return 'Phone number must be 11 digits and start with 011, 010, 012, or 015';
    //   }
    //   if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
    //     return 'Enter a valid phone number';
    //   }

    //   return null;
    // },
  };

  Map<String, TextInputType> keyboradT = {
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
          // prefixIcon: ficon,
          prefixStyle: const TextStyle(),
          prefixIconColor: Colors.black,
          hintText: title,
          hintStyle: const TextStyle(fontSize: 17, color: Colors.black),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
             borderSide: const BorderSide(width: 2, color: Colors.black)
          ),
          
        ),
        maxLines: 10,
        minLines: 5,

      
        
      ),
    );
  }
}
