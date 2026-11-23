import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final VoidCallback onAddToCart;

  const ProductDetailsScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE6FF),

      appBar: AppBar(
        title: Text(
          'product_details'.tr(),
          style: const TextStyle(
            color: Color(0xFF352450),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFEDE6FF),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF352450)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    color: Colors.white,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 60,
                        color: Color(0xFF8B5CF6),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // Product Name
            Text(
              name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF352450),
              ),
            ),

            const SizedBox(height: 10),

            // Product Price
            Text(
              price,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B5CF6),
              ),
            ),

            const SizedBox(height: 20),

            // Description
            Text(
              'product_description'.tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF352450),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'description_text'.tr(),
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Color(0xFF6B5A85),
              ),
            ),

            const SizedBox(height: 35),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  onAddToCart();

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('added_to_cart'.tr())));
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                label: Text(
                  'add_to_cart'.tr(),
                  style: const TextStyle(fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B5CF6),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
