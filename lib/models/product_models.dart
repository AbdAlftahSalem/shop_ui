class ProductModels {
  String id, title, des, image, price, size;

  ProductModels({
    required this.id,
    required this.title,
    required this.des,
    required this.image,
    required this.price,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'des': this.des,
      'image': this.image,
      'price': this.price,
      'size': this.size,
    };
  }

  factory ProductModels.fromMap(Map<String, dynamic> map) {
    return ProductModels(
      id: map['id'] as String,
      title: map['title'] as String,
      des: map['des'] as String,
      image: map['image'] as String,
      price: map['price'] as String,
      size: map['size'] as String,
    );
  }
}
