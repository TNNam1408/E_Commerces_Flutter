import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/widgets/changescreen.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/mytextformfield.dart';
import 'package:e_commerce/widgets/passwordtextformfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(pattern);
bool obserText = true;
String email;
String phoneNumber;
String password;
String userName;
bool isMale = true;

class _SignUpState extends State<SignUp> {
  void vaildation() async {
    final FormState _form = _formKey.currentState;
    if (!_form.validate()) {
      try {
        AuthResult result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
        Firestore.instance
            .collection("User")
            .document(result.user.uid)
            .setData({
          "UserName": userName,
          "UserId": result.user.uid,
          "UserEmail": email,
          "UserGender":isMale == true?"Male":"Female",
          "Phone Number":phoneNumber,
        });
      } on PlatformException catch (e) {
        print(e.message.toString());
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    } else {
      print("No Access");
    }
  }

  Widget _buildAllTextFormField() {
    return Expanded(
      flex: 1,
      child: Container(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTextFormField(
              onChanged: (value) {
                setState(() {
                  userName =  value;
                });
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill UserName";
                } else if (value.length < 6) {
                  return "UserName Is Too Short";
                }
                return "";
              },
              name: "UserName",
            ),
            MyTextFormField(
              onChanged: (value) {
                email = value;
                print(email);
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill Email";
                } else if (!regExp.hasMatch(value)) {
                  return "Email Is Invaild";
                }
                return "";
              },
              name: "Email",
            ),
            PasswordTextFormField(
              obserText: obserText,
              onChanged: (value) {
                password = value;
                print(password);
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill Password";
                } else if (value.length < 6) {
                  return "Password Is Too Short";
                }
                return "";
              },
              name: "Password",
              onTap: () {
                setState(() {
                  obserText = !obserText;
                });
                FocusScope.of(context).unfocus();
              },
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  isMale = !isMale;
                });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                ),
                child: Row(
                  children: [
                    Text(
                      isMale==true?"Male":"Female",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyTextFormField(
                onChanged: (value){
                  setState(() {
                    phoneNumber= value ;
                  });
                },
                validator: (value) {
                  if (value == "") {
                    return "Please Fill Phone Number";
                  } else if (value.length < 10) {
                    return "Phone Number Must Be 10";
                  }
                  return "";
                },
                name: "Phone Number",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtomPart() {
    return Container(
      height: 450,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAllTextFormField(),
          MyButton(
            name: "REGISTER",
            onPressed: () {
              vaildation();
              // Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (cxt) => HomePage()));
            },
          ),
          ChangeScreen(
            name: "SignIn",
            whichAccount: "I Have Already An Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (cxt) => Login()));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "REGISTER",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildButtomPart(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
