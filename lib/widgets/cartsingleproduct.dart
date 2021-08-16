import 'package:flutter/material.dart';
class CartSingleProduct extends StatefulWidget {
  final String name;
  final String image;
  final int quentity;
  final double price;

  CartSingleProduct({this.name, this.image, this.quentity, this.price});

  @override
  _CartSingleProductState createState() => _CartSingleProductState();
}
int count;
class _CartSingleProductState extends State<CartSingleProduct> {
  @override
  Widget build(BuildContext context) {
    count = widget.quentity;
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
                        image: NetworkImage(widget.image),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 140,
                  width: 200,
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
                          width: 120,
                          // decoration: BoxDecoration(
                          //   color: Colors.grey[300],
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          color: Color(0xfff2f2f2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (count > 1) {
                                      count--;
                                    }
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
}
