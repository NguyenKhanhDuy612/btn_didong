import 'package:cloud_firestore/cloud_firestore.dart';

class Category{
  String content;
  int id;
  Category({
    required this.id,
    required this.content,
  });

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json['id'],
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'content' : content,
    };
  }
}

class CategorySnapshot{
  Category? category;
  DocumentReference? docRef;

  CategorySnapshot({required this.category, required this.docRef});

  factory CategorySnapshot.fromSnapshot(DocumentSnapshot docSnap){
    return CategorySnapshot(
      category: Category.fromJson(docSnap.data() as Map<String, dynamic>),
      docRef: docSnap.reference,
    );
  }

  Future<void> update(Category category) async {
    return docRef!.update(category.toJson());
  }

  Future<void> delete() async {
    return docRef!.delete();
  }

  static Future<DocumentReference> addNew(Category categery) async {
    return FirebaseFirestore.instance.collection('Category').add(categery.toJson());
  }


  static Stream<List<CategorySnapshot>> getAllLoaiHang(){
    Stream<QuerySnapshot> qs = FirebaseFirestore.instance.collection('Category').snapshots();
    Stream<List<DocumentSnapshot>> listDocSnap = qs.map((qSnap) => qSnap.docs);
    return listDocSnap.map((lds) => lds.map((docSnap) => CategorySnapshot.fromSnapshot(docSnap)).toList());
  }
}