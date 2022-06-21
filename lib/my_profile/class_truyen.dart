
import 'package:cloud_firestore/cloud_firestore.dart';

class truyen{
  String? TenT, AnhT, NdT, MaTL;

  truyen({this.TenT, this.AnhT,  this.NdT, this.MaTL});

  //loading
  factory truyen.fromJson(Map<String, dynamic> json){
    return truyen(
        TenT: json['TenT'],
        AnhT: json['AnhT'],
        NdT: json['NdT'],
      MaTL: json['MaTL']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'TenT' : TenT,
      'AnhT' : AnhT,
      'NdT' : NdT,
      'MaTL' : MaTL
    };
  }
}




