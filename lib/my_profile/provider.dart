// import 'package:btn_didong/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'class_the_loai.dart';
import 'class_truyen.dart';

class ProductProvider with ChangeNotifier {
  List<theloai> _TLDS = [];
  List<truyen> _truyenDS =[];
  theloai? tl;
  truyen? tr;

  List<theloai> get getTLtruyen{
    return _TLDS;
  }

  List<truyen> get getDStruyen{
    return _truyenDS;
  }

  TLData() async {
    List<theloai> newListTL = [];
    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("TLTruyen").get();

    value.docs.forEach((element) {
      // print(element.data());
          tl = theloai(
      MaTL: element.get("MaTL") as String,
      TenTL: element.get("TenTL") as String,
      AnhTL: element.get("AnhTL") as String
      );
          newListTL.add(tl!);
    },);
    _TLDS = newListTL;
    notifyListeners();
  }






  ////

  TruyenData() async {
    List<truyen> newListT = [];
    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("DSTruyen").get();

    value.docs.forEach((element) {
      // print(element.data());
      tr = truyen(
          MaTL: element.get("MaTL") as String,
          TenT: element.get("TenT") as String,
          AnhT: element.get("AnhT") as String,
        NdT: element.get("NdT") as String
      );
      newListT.add(tr!);
    },);
    _truyenDS = newListT;
    notifyListeners();
  }



}

///////////////////////

