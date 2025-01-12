import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_capital_hub/screens/products/ui/product-details.dart';
import '../../../data/product.dart';
import '../widgets/productCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final RxList<Product> products = <Product>[
    Product(
      name: 'Samsung SC6573',
      imageUrl: 'assets/images/vaccum1.png',
      price: 75,
      features: ['dry clean', 'cyclone filter', 'convenient cord storage'],
      reviews: 19,
      rating: 5,
      savedForLater: false,
    ),
    Product(
      name: 'LG VK69462N',
      imageUrl: 'assets/images/vaccum2.png',
      price: 88,
      oldPrice: 98,
      features: ['dry clean', 'cyclone filter', 'low energy consumption'],
      reviews: 15,
      rating: 4,
      savedForLater: false,
    ),
    Product(
      name: 'Thomas TWIN Panther',
      imageUrl: 'assets/images/vaccum3.png',
      price: 88,
      features: ['dry clean', 'cyclone filter', 'easy to clean'],
      reviews: 10,
      rating: 3,
      savedForLater: true,
    ),
    Product(
      name: 'Samsung SC4520',
      imageUrl: 'assets/images/vaccum4.png',
      price: 88,
      features: ['dry clean', 'cyclone filter'],
      reviews: 8,
      rating: 4,
      savedForLater: false,
    ),
  ].obs;

  final RxList<Product> filteredProducts = <Product>[].obs;

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.assignAll(
        products.where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    filterProducts('');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: searchController,
            onChanged: filterProducts,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            cursorColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() => filteredProducts.isEmpty
          ? const Center(
        child: Text(
          'No products found',
          style: TextStyle(color: Colors.white),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Get.to(ProductDetailsPage(product: filteredProducts[index],));
              },
              child: ProductCard(product: filteredProducts[index])
          );
        },
      )),
    );
  }
}