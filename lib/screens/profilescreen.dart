import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget _BuildSingleContainer({String startText, String endText}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 30,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black45,
              ),
            ),
            Text(
              endText,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _BuildSingleTextFormField({String name}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  bool edit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              )
            : IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
            });
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          edit == false
              ? NotificationButton()
              : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check,
                    color: Colors.green,
                  )),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 130,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 65,
                        backgroundImage: AssetImage("images/yamahar1.jpg"),
                      ),
                    ],
                  ),
                ),
                edit == true
                    ? Padding(
                        padding: const EdgeInsets.only(left: 180, top: 90),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 300,
                    child: edit == true
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _BuildSingleTextFormField(
                                name: "Sabir Baloch",
                              ),
                              _BuildSingleTextFormField(
                                name: "SabirBaloch@gmail.com",
                              ),
                              _BuildSingleTextFormField(
                                name: "Male",
                              ),
                              _BuildSingleTextFormField(
                                name: "0123456789",
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _BuildSingleContainer(
                                startText: "Name",
                                endText: "Sabir Baloch",
                              ),
                              _BuildSingleContainer(
                                startText: "Email",
                                endText: "SabirBaloch@gmail.com",
                              ),
                              _BuildSingleContainer(
                                startText: "Gender",
                                endText: "Male",
                              ),
                              _BuildSingleContainer(
                                startText: "Phone Number",
                                endText: "0123456789",
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 250,
                child: edit == false
                    ? MyButton(
                        name: "Edit Profile",
                        onPressed: () {
                          setState(() {
                            edit = true;
                          });
                        },
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
