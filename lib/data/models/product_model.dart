class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      price: data['price'],
      imageUrl: data['imageUrl'],
    );
  }
}
