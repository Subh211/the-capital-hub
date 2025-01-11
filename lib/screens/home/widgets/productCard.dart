import 'package:flutter/material.dart';
import 'package:the_capital_hub/data/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(product.imageUrl, height: 80),
                Column(
                  children: [
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    if (product.oldPrice != null)
                      // Text(
                      //   '\$${product.oldPrice}',
                      //   style: const TextStyle(
                      //       color: Colors.grey,
                      //       decoration: TextDecoration.lineThrough),
                      // ),
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
              ],
            ),
            Text(
              product.name,
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
            for (var feature in product.features)
              Text('* $feature', style: const TextStyle(color: Colors.white)),
            Spacer(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Icon(
            //       product.savedForLater ? Icons.favorite : Icons.favorite_border,
            //       color: product.savedForLater ? Colors.red : Colors.white,
            //     ),
            //     Text(
            //       '${product.rating.toStringAsFixed(1)} ★ | ${product.reviews} reviews',
            //       style: const TextStyle(color: Colors.orange),
            //     ),
            //   ],
            // )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children:
            //   [
            //     Row(
            //       children: [
            //         Icon(
            //           product.savedForLater ? Icons.favorite : Icons.favorite_border,
            //           color: product.savedForLater ? Colors.red : Colors.white, ),
            //           Text( 'Save for later',
            //             style: const TextStyle(color: Colors.orange),
            //           ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Row(
            //           children: List.generate(5, (index) {
            //             return Icon(
            //               index < product.rating ? Icons.star : Icons.star_border, color: Colors.orange,
            //               size: 15,
            //             );
            //           }),
            //         ),
            //         Text( '${product.reviews} reviews',
            //           style: const TextStyle(color: Colors.orange),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Icon(
                        product.savedForLater ? Icons.favorite : Icons.favorite_border,
                        color: product.savedForLater ? Colors.red : Colors.white,
                      ),
                      const SizedBox(width: 4), // Space between icon and text
                      Flexible(
                        child: Text(
                          'Save for later',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
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
                    Text(
                      '${product.reviews} reviews',
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
