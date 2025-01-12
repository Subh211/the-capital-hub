class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double? oldPrice;
  final List<String> features;
  final int reviews;
  final double rating;
  final bool savedForLater;
  final String decription;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
    required this.features,
    required this.reviews,
    required this.rating,
    required this.savedForLater,
    this.decription = "Discover our powerful vacuum cleaner designed for modern homes. With its sleek design, advanced suction technology, and easy maneuverability, it tackles dirt and dust with precision. Perfect for both carpets and hard floors, it's your ultimate solution for a cleaner, healthier living space. Get ready to enjoy  spotless results with minimal effort!"
  });
}