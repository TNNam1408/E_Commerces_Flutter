
import 'dart:ffi';

import 'package:e_commerce/screens/checkout.dart';
import 'package:e_commerce/screens/detailscreen.dart';
import 'package:e_commerce/widgets/cartsingleproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

import 'homepage.dart';

class CartScreen extends StatefulWidget {
  // final double price;
  // final String name;
  // final String image;
  //
  // CartScreen({this.price, this.name, this.image});

  @override
  _CartScreenState createState() => _CartScreenState();
}
ProductProvider productProvider;

class _CartScreenState extends State<CartScreen> {
  // int count = 1;

  final TextStyle myStyle = TextStyle(fontSize: 20, color: Colors.white);


  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Color(0xff746bc9),
            child: Text("Continous", style: myStyle,),
            onPressed: () {

            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Checkout(
            //   image: widget.image,
            //   name: widget.name,
            //   price: widget.price,
            // )));
            },
            ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (ctx)=>DetailScreen()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.getCartModelListLength,
        itemBuilder: (ctx, index)=>CartSingleProduct(
          image: productProvider.getCartModelList[index].image,
          name: productProvider.getCartModelList[index].name,
          price: productProvider.getCartModelList[index].price,
          quentity: productProvider.getCartModelList[index].quentity,
        ),
      ),
    );
  }
}
