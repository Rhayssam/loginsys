import 'dart:convert';

class OrderPix {
  String image;
  String code;
  double totalValue;
  OrderPix({
    required this.image,
    required this.code,
    required this.totalValue,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'code': code,
      'totalValue': totalValue,
    };
  }

  factory OrderPix.fromMap(Map<String, dynamic> map) {
    return OrderPix(
      image: (map['image'] ?? '') as String,
      code: (map['code'] ?? '') as String,
      totalValue: (map['totalValue'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderPix.fromJson(String source) =>
      OrderPix.fromMap(json.decode(source) as Map<String, dynamic>);

  OrderPix copyWith({
    String? image,
    String? code,
    double? totalValue,
  }) {
    return OrderPix(
      image: image ?? this.image,
      code: code ?? this.code,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}
