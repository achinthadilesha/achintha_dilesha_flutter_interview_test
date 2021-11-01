import 'dart:convert';

Product welcomeFromJson(String str) => Product.fromJson(json.decode(str));

String welcomeToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.title,
    this.price,
    this.rating,
    this.description,
    this.images,
  });

  late String? id;
  late String? title;
  late String? price;
  late double? rating;
  late String? description;
  late String? images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        rating: json["rating"].toDouble(),
        description: json["description"],
        images: json["images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "rating": rating,
        "description": description,
        "images": images,
      };
}
