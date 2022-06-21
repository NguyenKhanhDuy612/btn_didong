
import 'package:cloud_firestore/cloud_firestore.dart';

class theloai{
  String MaTL, TenTL, AnhTL;

  theloai({required this.MaTL, required this.TenTL, required  this.AnhTL});

  //loading
  factory theloai.fromJson(Map<String, dynamic> json){
    return theloai(
        MaTL: json['MaTL'],
        TenTL: json['TenTL'],
        AnhTL: json['AnhTL']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'MaTL' : MaTL,
      'TenTL' : TenTL,
      'AnhTL' : AnhTL,
    };
  }
}




