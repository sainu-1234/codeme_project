class Product {
  bool isfavorite;
  String name;
  String image;
  int quantity;
  double price;
  String description;

  Product({
    required this.isfavorite,
    required this.name,
    required this.image,
    this.price = 0,
    this.quantity = 0,
    this.description = "",
  });
}

// class CategoryItem {
//   String name;
//   String image;
//   int quantity;
//   double price;

//   CategoryItem({
//     required this.name,
//     required this.image,
//     required this.price,
//     this.quantity = 0,
//   });
// }
