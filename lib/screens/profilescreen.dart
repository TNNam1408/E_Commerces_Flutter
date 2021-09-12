import 'package:e_commerce/widgets/notification_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
            NotificationButton(),
        ],
      ),
      body: Column(
        children: [
          Text("Profile Screens"),
        ],
      ),
    );
  }
}
