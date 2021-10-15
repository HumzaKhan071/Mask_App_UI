import 'package:flutter/material.dart';


class ShoeModel {
  final String name;
  final String assetname;
  final String description;
  final double price;
  final Color color;

  ShoeModel(
      {this.name, this.assetname, this.price, this.description, this.color});
}

List<ShoeModel> profList1 = [
  ShoeModel(
    name: "Nike Jordans",
    description: "lorem ipsum",
    assetname: "assets/1.png",
    price: 8.0,
    color: Color(0xffbcdaac),
  ),
  ShoeModel(
    name: "Coughar ",
    description: "lorem ipsum",
    assetname: "assets/1.png",
    price: 8.0,
    color: Color(0xffeaaeaf),
  ),
  ShoeModel(
    name: "Nike Jordans",
    description: "lorem ipsum",
    assetname: "assets/2.png",
    price: 8.0,
    color: Color(0xffEFDBA9),
  ),
  ShoeModel(
    name: "Office Mask",
    description: "Coughar ",
    assetname: "assets/3.png",
    price: 8.0,
    color: Color(0xffA4afb0),
  ),
];

List<ShoeModel> designerList1 = [
  ShoeModel(
    name: "Coughar ",
    description: "lorem ipsum",
    assetname: "assets/1.png",
    price: 8.0,
    color: Color(0xffFFD0BB),
  ),
  ShoeModel(
    name: "Nike Joran Highs Retro",
    description: "lorem ipsum",
    assetname: "assets/2.png",
    price: 8.0,
    color: Color(0xffD9D9D9),
  ),
  ShoeModel(
    name: "Coughar ",
    description: "lorem ipsum",
    assetname: "assets/3.png",
    price: 8.0,
    color: Color(0xffC0EFA9),
  ),
  ShoeModel(
    name: "Nike Joran Highs Retro",
    description: "lorem ipsum",
    assetname: "assets/1.png",
    price: 8.0,
    color: Color(0xffE9C9F8),
  ),
];


List<String> shoes = [
  "assets/1.png",
  "assets/2.png",
  "assets/3.png",
  "assets/1.png",
  "assets/2.png",
  "assets/3.png",
  "assets/1.png",
  "assets/2.png",
 
 

];

