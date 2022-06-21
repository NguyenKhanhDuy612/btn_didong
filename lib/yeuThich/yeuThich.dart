
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'class_yeu_thich.dart';

class ReviewCartProvider extends ChangeNotifier{

  List<ReviewCart> _listCart = [];

  ReviewCart? reviewCart;


  List<ReviewCart> get getListCart{
    return _listCart;
  }



  void addReviewCart({
    String? TenT, AnhT
  })async{
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc("$TenT")
        .set({
      'TenT': TenT,
      'AnhT' : AnhT,
    });
  }

  void fetchReviewCartData() async{
    List<ReviewCart> newListCart = [];
    QuerySnapshot value = await FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .get();

    value.docs.forEach((element) {
      reviewCart = ReviewCart(
          TenT: element.get("TenT"),

          AnhT: element.get("AnhT"),
      );
      newListCart.add(reviewCart!);
    });
    _listCart = newListCart;
    notifyListeners();
  }


  deleteViewCart(String TenT){
    FirebaseFirestore.instance.collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc("$TenT")
        .delete();
    notifyListeners();
  }

  // deleteAllViewCart(String id){
  //   FirebaseFirestore.instance.collection("ReviewCart")
  //       .doc(id)
  //       .collection("YourReviewCart")
  //       .get().then((snapshot) {
  //     for (DocumentSnapshot ds in snapshot.docs){
  //       ds.reference.delete();
  //     }
  //   });
  //   notifyListeners();
  // }


  // updataReviewCart(ReviewCart reviewCart ){
  //   FirebaseFirestore.instance.collection("ReviewCart")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection("YourReviewCart")
  //       .doc("${reviewCart.id}")
  //       .update(reviewCart.toJson());
  // }



}