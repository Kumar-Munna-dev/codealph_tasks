import 'package:flutter/material.dart';
import 'package:shopitem/product_details/product_details.dart';

class ProductCard extends StatelessWidget {
  final String imgUrl;
  final String productTitle;
  final String productCategory;
  final String productPrice;
  final String productDiscountPrice;

  const ProductCard({
    super.key,
    required this.imgUrl,
    required this.productTitle,
    required this.productCategory,
    required this.productPrice,
    required this.productDiscountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              imgUrl: imgUrl,
              productTitle: productTitle,
              productCategory: productCategory,
              productPrice: productPrice,
              productDiscountPrice: productDiscountPrice,
            ),
          ),
        );
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imgUrl,
                height: MediaQuery.of(context).size.height * 0.12,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 5),

            /// Category
            Text(
              productCategory,
              style: const TextStyle(color: Colors.grey, fontSize: 8),
            ),

            const SizedBox(height: 5),

            /// Title
            Text(
              productTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),

            const SizedBox(height: 4),

            /// Price Row
            Row(
              children: [
                Text(
                  productDiscountPrice,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(width: 5),

                Text(
                  productPrice,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
