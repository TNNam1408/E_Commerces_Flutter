import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/cartscreen.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/cardcheckoutproduct.dart';
import 'package:e_commerce/widgets/cartsingleproduct.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  final double price;
  final String name;
  final String image;
  final int quentity;

  Checkout({this.quentity, this.price, this.name, this.image});
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextStyle myStyle = TextStyle(fontSize: 20, color: Colors.black);
  // ProductProvider productProvider;

  Widget _buildSingleCartProduct() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 140,
                  width: 180,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Performance",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "\$ ${widget.price.toString()} ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff9b96d6),
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 35,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Quentity"),
                              Text("1"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottonDetail({String startName, String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: myStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // productProvider = Provider.of<ProductProvider>(context);
    print('LENGTH 1: ${productProvider.getCartModelListLength}');
    print('PRICE 1: ${widget.price}');
    print('NAME 1: ${widget.name}');
    print('IMAGE 1: ${widget.image}');
    print('QUENLITY 1: ${widget.quentity}');
    double subTotal = 0;
    double discount =3;
    double discountRupees;
    double shipping = 60;
    double total;
    productProvider.getCheckOutModelList.forEach((element) {
      subTotal =subTotal + element.price * element.quentity;
    });
    print({subTotal});

    discountRupees = discount/100*subTotal;
    print({discountRupees});

    total = subTotal+shipping - discountRupees;
    print({total});

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "CheckOut Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
        elevation: 0.0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pushReplacement(
        //         MaterialPageRoute(builder: (ctx) => HomePage()));
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          NotificationButton(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: Color(0xff746bc9),
          child: Text(
            "Buy",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
        ),
      ),
      body: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemCount: productProvider.getCheckOutModelListLength,
                itemBuilder: (ctx, index) => CardCheckoutProduct(
                  image: productProvider.getCheckOutModelList[index].image,
                  name: productProvider.getCheckOutModelList[index].name,
                  price: productProvider.getCheckOutModelList[index].price,
                  quentity: productProvider.getCheckOutModelList[index].quentity,
                ),
              ),
            ),
            Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottonDetail(
                      startName: "Your Price", endName: "\$ ${subTotal.toStringAsFixed(2)}"),
                  _buildBottonDetail(startName: "Discount", endName: "${discountRupees.toStringAsFixed(2)}"),
                  _buildBottonDetail(
                      startName: "Shipping", endName: "\$ ${shipping.toStringAsFixed(2)}"),
                  _buildBottonDetail(startName: "Total", endName: "\$ ${total.toStringAsFixed(2)}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
