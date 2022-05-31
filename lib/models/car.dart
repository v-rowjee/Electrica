import 'package:flutter/material.dart';

class Car {
  final String image;
  final String model;
  final String plateNumber;
  final String color;
  final String price;
  final String owner;

  Car(
      {required this.image,
      required this.model,
      required this.plateNumber,
      required this.color,
      required this.price,
      required this.owner});
}
