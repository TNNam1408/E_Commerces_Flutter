import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/cartmodel.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> hometopproduct = [];
  Product hometopproductData;

  List<Product> homeachive = [];
  Product homeachiveData;

  List<Product> topproducts = [];
  Product topproductsData;

  List<Product> newachives = [];
  Product newachivesData;

  Future<void> getHomeTopProductData() async {
    List<Product> newList = [];
    QuerySnapshot hometopproductSnapShot =
        await Firestore.instance.collection("hometopproduct").getDocuments();
    hometopproductSnapShot.documents.forEach(
      (element) {
        hometopproductData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(hometopproductData);
      },
    );
    hometopproduct = newList;
    notifyListeners();
  }

  List<Product> get getHomeTopProductList {
    return hometopproduct;
  }

  Future<void> getHomeAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot homeachiveSnapShot =
        await Firestore.instance.collection("homeachives").getDocuments();
    homeachiveSnapShot.documents.forEach(
      (element) {
        homeachiveData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(homeachiveData);
      },
    );
    homeachive = newList;
    notifyListeners();
  }

  List<Product> get getHomeAchiveList {
    return homeachive;
  }

  Future<void> getTopProductsData() async {
    List<Product> newList = [];
    QuerySnapshot topproductsSnapShot = await Firestore.instance
        .collection("products")
        .document("NmosClmieY6PfadcS9Nl")
        .collection("topproducts")
        .getDocuments();
    topproductsSnapShot.documents.forEach(
      (element) {
        topproductsData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(topproductsData);
      },
    );
    topproducts = newList;
    notifyListeners();
  }

  List<Product> get getTopProductsList {
    return topproducts;
  }

  Future<void> getNewAchivesData() async {
    List<Product> newList = [];
    QuerySnapshot newachivesSnapShot = await Firestore.instance
        .collection("products")
        .document("NmosClmieY6PfadcS9Nl")
        .collection("newachives")
        .getDocuments();
    newachivesSnapShot.documents.forEach(
      (element) {
        newachivesData = Product(
            image: element.data["image"],
            name: element.data["name"],
            price: element.data["price"]);
        newList.add(newachivesData);
      },
    );
    newachives = newList;
    notifyListeners();
  }

  List<Product> get getNewAchivesList {
    return newachives;
  }

  List<CartModel> cartModelList = [];
  CartModel cartModel;

  List<CartModel> CheckOutModelList = [];
  CartModel checkOutModel;

  void getCheckOutData({
    int quentity,
    double price,
    String name,
    String image,
  }) {
    checkOutModel = CartModel(
      image: image,
      name: name,
      price: price,
      quentity: quentity,
    );
    CheckOutModelList.add(checkOutModel);
  }
  List<CartModel> get getCheckOutModelList {
    return List.from(CheckOutModelList);
  }
  int get getCheckOutModelListLength {
    return CheckOutModelList.length;
  }

  void addToCart(String name, String image, int quentity, double price) {
    // if (cartModelList.contains(name)) {
    //   var newCart =
    //       CartModel(image: image, name: name, price: price, quentity: quentity);
    //   cartModelList.add(newCart);
    // } else {
    //   throw Exception(',,,,,,');
    // }
    var newCart =
        CartModel(image: image, name: name, price: price, quentity: quentity);
    cartModelList.add(newCart);

    // (!cartModelList.contains(name))
    //     ? cartModelList.add(newCart)

    notifyListeners();
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }


  List<String> notificationList = [];
  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }
}
