import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'product_details_screen.dart';
import 'settings_screen.dart';
import 'favorites_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>> _favoriteProducts = [];
  List<Map<String, dynamic>> _cartProducts = [];

  final List<String> categories = [
    'makeup',
    'skincare',
    'fashion',
    'accessories',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Beauty Cream',
      'nameKey': 'beauty_cream',
      'price': '\$25.00',
      'image':
          'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=500',
    },
    {
      'name': 'Face Serum',
      'nameKey': 'face_serum',
      'price': '\$18.00',
      'image':
          'https://images.unsplash.com/photo-1620916566398-39f1143ab7be?w=500',
    },
    {
      'name': 'Makeup Set',
      'nameKey': 'makeup_set',
      'price': '\$35.00',
      'image':
          'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=500',
    },
    {
      'name': 'Skin Care',
      'nameKey': 'skin_care',
      'price': '\$22.00',
      'image':
          'https://images.unsplash.com/photo-1556229010-6c3f2c9ca5f8?w=500',
    },
  ];

  // Add or remove favorite products
  void _toggleFavorite(Map<String, dynamic> product) {
    setState(() {
      final isFavorite = _favoriteProducts.any(
        (item) => item['name'] == product['name'],
      );

      if (isFavorite) {
        _favoriteProducts.removeWhere(
          (item) => item['name'] == product['name'],
        );
      } else {
        _favoriteProducts.add(product);
      }
    });
  }

  // Add product to cart
  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      _cartProducts.add(product);
    });
  }

  // Remove product from cart
  void _removeFromCart(Map<String, dynamic> product) {
    setState(() {
      _cartProducts.remove(product);
    });
  }

  // Open product details
  void _openProductDetails(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          name: product['nameKey'].toString().tr(),
          price: product['price'],
          image: product['image'],
          onAddToCart: () {
            _addToCart(product);
          },
        ),
      ),
    );
  }

  // Open settings
  void _openSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'welcome'.tr(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6B5A85),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Luna Store 🌙',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF352450),
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Color(0xFF8B5CF6),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'search'.tr(),
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Promotional Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B5CF6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'discover_style'.tr(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'find_products'.tr(),
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Categories
              Text(
                'categories'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF352450),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        categories[index].tr(),
                        style: const TextStyle(
                          color: Color(0xFF8B5CF6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              // Products Title
              Text(
                'popular_products'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF352450),
                ),
              ),

              const SizedBox(height: 15),

              // Products Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  final isFavorite = _favoriteProducts.any(
                    (item) => item['name'] == product['name'],
                  );

                  return GestureDetector(
                    onTap: () {
                      _openProductDetails(product);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(18),
                                  ),
                                  child: Image.network(
                                    product['image'],
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                // Favorite Button
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: IconButton(
                                    onPressed: () {
                                      _toggleFavorite(product);
                                    },
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['nameKey'].toString().tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF352450),
                                  ),
                                ),
                                const SizedBox(height: 5),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesScreen(
                  favoriteProducts: _favoriteProducts,
                  onRemove: _toggleFavorite,
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(
                  cartProducts: _cartProducts,
                  onRemove: _removeFromCart,
                ),
              ),
            );
          } else if (index == 3) {
            _openSettings();
          }
        },
        selectedItemColor: const Color(0xFF8B5CF6),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            label: 'favorites'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            label: 'cart'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            label: 'settings'.tr(),
          ),
        ],
      ),
    );
  }
}
