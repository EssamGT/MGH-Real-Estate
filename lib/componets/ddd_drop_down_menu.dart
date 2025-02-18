import 'package:flutter/material.dart';

class DDDropDownMenu extends StatefulWidget {
  final List<DropdownMenuItem<String>> menu;
  final String hint;
  final TextEditingController lastVal;
  final String selectedVal; // Allow passing an initial value

  const DDDropDownMenu({
    required this.menu,
    required this.hint,
    required this.lastVal,
    required this.selectedVal, // Added selectedVal parameter
    super.key,
  });

  @override
  State<DDDropDownMenu> createState() => _DDDropDownMenuState();
}

class _DDDropDownMenuState extends State<DDDropDownMenu> {
  late String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedVal.isNotEmpty ? widget.selectedVal : null;
    widget.lastVal.text = _selectedValue ?? ''; // Sync with controller
  }

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
              hint: Text(widget.hint), // Show hint if nothing is selected
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
                  widget.lastVal.text = newValue; // Sync with controller
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
