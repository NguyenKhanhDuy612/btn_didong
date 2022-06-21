

class ReviewCart{
  String? TenT, AnhT;
  ReviewCart({
    required this.TenT,
    this.AnhT,
  });

  Map<String, dynamic> toJson(){
    return {
      'TenT' : TenT,
      'AnhT' : AnhT
    };
  }
}