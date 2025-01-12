import 'package:flutter/material.dart';
import '../../../data/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(product.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(product.imageUrl),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    product.name,
                    style: const TextStyle( fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 8,),
                    if (product.oldPrice != null)
                      Text.rich(
                        TextSpan(
                          text: '\$${product.oldPrice}',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Features:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    for (var feature in product.features) Text('- $feature', style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < product.rating ? Icons.star : Icons.star_border,
                              color: Colors.orange,
                              size: 15,
                            );
                          }),
                        ),
                        Text('Rating: ${product.rating}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Text('Reviews: ${product.reviews}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
               Padding(
                 padding: const EdgeInsets.only(left: 8.0,top: 10),
                 child: Text('Description:',
                     style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                     )),
               ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.decription,
                  style: const TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}