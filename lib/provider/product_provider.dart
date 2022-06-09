import 'package:btn_didong/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> truyenCuoiDS = [];
  late ProductModel productModel;

  truyenCuoiData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("TruyenCuoi").get();

    value.docs.forEach((element) {
      // print(element.data());
      productModel = ProductModel(
        productName: element.get("productName"),
        productImage: element.get("productImage"),
      );
      newList.add(productModel);
    },);
    truyenCuoiDS = newList;
    notifyListeners();
  }

  List<ProductModel> get gettruyenCuoiData{
    return truyenCuoiDS;
  }
}
