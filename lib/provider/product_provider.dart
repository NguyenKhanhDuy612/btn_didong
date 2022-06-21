// import 'package:btn_didong/models/product_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class ProductProvider with ChangeNotifier {
//   List<Truyen> truyenCuoiDS = [];
//   late Truyen t;
//
//   truyenCuoiData() async {
//     List<Truyen> newList = [];
//     QuerySnapshot value =
//         await FirebaseFirestore.instance.collection("TruyenCuoi").get();
//
//     value.docs.forEach((element) {
//       // print(element.data());
//       t = Truyen(
//         productName: element.get("productName"),
//         productImage: element.get("productImage"),
//       );
//       newList.add(t);
//     },);
//     truyenCuoiDS = newList;
//     notifyListeners();
//   }
//
//   List<Truyen> get gettruyenCuoiData{
//     return truyenCuoiDS;
//   }
// }
//
// ///////////////////////
//
