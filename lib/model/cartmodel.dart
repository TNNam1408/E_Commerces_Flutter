import 'package:flutter/material.dart';

class CartModel {
  final String image;
  final String name;
  final double price;
  final int quentity;

  CartModel({
    @required this.image,
    @required this.name,
    @required this.price,
    @required this.quentity,
  });
}
