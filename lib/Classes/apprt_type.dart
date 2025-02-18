import 'package:flutter/material.dart';

class ApprtType {
  List<DropdownMenuItem<String>> type = const [
    DropdownMenuItem<String>(
      value: 'Apartment',
      child: Text('Apartment'),
    ),
    DropdownMenuItem<String>(
      value: 'Administrative apartment',
      child: Text('Administrative apartment'),
    ),
    DropdownMenuItem<String>(
      value: 'Duplex',
      child: Text('Duplex'),
    ),
    DropdownMenuItem<String>(
      value: 'Penthouse',
      child: Text('Penthouse'),
    ),
    DropdownMenuItem<String>(
      value: 'Studio',
      child: Text('Studio'),
    ),
    DropdownMenuItem<String>(
      value: 'Roof',
      child: Text('Roof'),
    ),
    DropdownMenuItem<String>(
      value: 'Vila',
      child: Text('Vila'),
    ),
    
    DropdownMenuItem<String>(
      value: 'Commercial ',
      child: Text('Commercial '),
    ),
  
  ];
  List<DropdownMenuItem<String>> finished = const [
    DropdownMenuItem<String>(
      value: 'Finished',
      child: Text('Finished'),
    ),
    DropdownMenuItem<String>(
      value: 'Semi  Finished',
      child: Text('Semi Finished'),
    ),
    DropdownMenuItem<String>(
      value: 'Not finished',
      child: Text('Not finished'),
    ),
  
  ];
  List<DropdownMenuItem<String>> furnished = const [
    DropdownMenuItem<String>(
      value: 'Furnished',
      child: Text('Furnished'),
    ),
  
    DropdownMenuItem<String>(
      value: 'Not Furnished',
      child: Text('Not Furnished'),
    ),
  
  ];
  List<DropdownMenuItem<String>> payment = const [
    DropdownMenuItem<String>(
      value: 'CASH',
      child: Text('CASH'),
    ),
    DropdownMenuItem<String>(
      value: 'CASH OR INSTALLMENT',
      child: Text('CASH OR INSTALLMENT'),
    ),
    DropdownMenuItem<String>(
      value: 'INSTALLMENT',
      child: Text('INSTALLMENT'),
    ),
  
  
  ];
  List<DropdownMenuItem<String>> state = const [
    DropdownMenuItem<String>(
      value: 'For Sale',
      child: Text('For Sale'),
    ),
    DropdownMenuItem<String>(
      value: 'For Rent',
      child: Text('For Rent'),
    ),
    
  
  
  ];
  
  List<DropdownMenuItem<String>> rooms = const [
    DropdownMenuItem<String>(
      value: '1',
      child: Text('1'),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text('2'),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text('3'),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Text('4'),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Text('5'),
    ),
    DropdownMenuItem<String>(
      value: '6',
      child: Text('6'),
    ),
    DropdownMenuItem<String>(
      value: '7',
      child: Text('7'),
    ),
    DropdownMenuItem<String>(
      value: '8+',
      child: Text('8+'),
    ),
  
  ];
  List<DropdownMenuItem<String>> level = const [
    DropdownMenuItem<String>(
      value: 'Ground',
      child: Text('Ground'),
    ),
    DropdownMenuItem<String>(
      value: '1',
      child: Text('1'),
    ),
    DropdownMenuItem<String>(
      value: '2',
      child: Text('2'),
    ),
    DropdownMenuItem<String>(
      value: '3',
      child: Text('3'),
    ),
    DropdownMenuItem<String>(
      value: '4',
      child: Text('4'),
    ),
    DropdownMenuItem<String>(
      value: '5',
      child: Text('5'),
    ),
    DropdownMenuItem<String>(
      value: '6',
      child: Text('6'),
    ),
    DropdownMenuItem<String>(
      value: '7',
      child: Text('7'),
    ),
    DropdownMenuItem<String>(
      value: '8',
      child: Text('8'),
    ),
    DropdownMenuItem<String>(
      value: '9',
      child: Text('9'),
    ),
    DropdownMenuItem<String>(
      value: '10',
      child: Text('10'),
    ),
    DropdownMenuItem<String>(
      value: 'High',
      child: Text('High'),
    ),
  
  ];
}