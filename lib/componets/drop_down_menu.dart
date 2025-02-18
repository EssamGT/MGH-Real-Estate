import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  List<DropdownMenuItem<String>> menu;
  String hint;
  TextEditingController lastVal;
  DropDownMenu(
      {required this.menu,
      required this.hint,
      required this.lastVal,
      super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? _selectedValue; // Manage selected value inside the state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hint,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(width: 2, color: Colors.black),
            ),
            child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black),
              underline: const SizedBox(),
              hint: Text(widget.hint), // Use the hint properly
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              style: const TextStyle(color: Colors.black, fontSize: 20),
              isExpanded: true,
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(15),
              value: _selectedValue,
              items: widget.menu,
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue!;
                  widget.lastVal.text = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
