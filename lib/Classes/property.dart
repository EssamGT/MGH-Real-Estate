import 'dart:io';

import 'package:uuid/v4.dart';

class Property {
  String unitId =  UuidV4().generate();
  late List<String> imagesUrl;
  late String title;
  late int price;
  late int area;
  late String location;
  late String state;
  late String type;
  late String bedrooms;
  late String bathrooms;
  late String level;
  late String finishin;
  late String paymentOption;
  late String description;
  late String furnished;
}
