// class ProductModel{
//   String productName;
//   String productImage;
//   ProductModel({required this.productName,required this.productImage});
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class Truyen {
  String? productName, productImage;

  Truyen({
    required this.productName,
    this.productImage});

  factory Truyen.fromJson(Map<String, dynamic> json){
    return Truyen(

        productName: json['productName'] as String,
        productImage: json['anh']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'productName' : productName,
      'productImage' : productImage
    };
  }
}

class TruyenSnapshot{
  Truyen? truyen;
  DocumentReference? docRef;

  TruyenSnapshot({required this.truyen, required this.docRef});

  factory TruyenSnapshot.fromSnapshot(DocumentSnapshot docSnap){
    return TruyenSnapshot(
      truyen: Truyen.fromJson(docSnap.data() as Map<String, dynamic>),
      docRef: docSnap.reference,
    );
  }

  Future<void> update(Truyen tr) async {
    return docRef!.update(tr.toJson());
  }

  Future<void> delete() async {
    return docRef!.delete();
  }

  static Future<DocumentReference> addNew(Truyen tr) async {
    return FirebaseFirestore.instance.collection('Truyen').add(tr.toJson());
  }


  static Stream<List<TruyenSnapshot>> getAllTruyen(){
    Stream<QuerySnapshot> qs = FirebaseFirestore.instance.collection('Truyen').snapshots();
    Stream<List<DocumentSnapshot>> listDocSnap = qs.map((qSnap) => qSnap.docs);
    return listDocSnap.map((lds) => lds.map((docSnap) => TruyenSnapshot.fromSnapshot(docSnap)).toList());
  }
}