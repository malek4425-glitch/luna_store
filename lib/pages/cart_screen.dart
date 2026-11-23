import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartProducts;
  final Function(Map<String, dynamic>) onRemove;

  const CartScreen({
    super.key,
    required this.cartProducts,
    required this.onRemove,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE6FF),
      appBar: AppBar(
        title: Text('cart'.tr()),
        backgroundColor: const Color(0xFF8B5CF6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: widget.cartProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart_outlined,
                    size: 85,
                    color: Color(0xFF8B5CF6),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'cart'.tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF352450),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your shopping cart is empty.',
                    style: TextStyle(fontSize: 15, color: Color(0xFF6B5A85)),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: widget.cartProducts.length,
              itemBuilder: (context, index) {
                final product = widget.cartProducts[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product['image'],
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: 90,
                              height: 90,
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['nameKey'].toString().tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF352450),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['price'],
                              style: const TextStyle(
                                color: Color(0xFF8B5CF6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.onRemove(product);
                          });
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
