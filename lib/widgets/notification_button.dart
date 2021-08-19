import 'package:e_commerce/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
class NotificationButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Badge(
      position: BadgePosition(
        start: 25 , top: 8,
      ),
      badgeContent: Text(productProvider.getNotificationIndex.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications_none,
          color: Colors.black,
        ),
      ),
    );
  }
}
