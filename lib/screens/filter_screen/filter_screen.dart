import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otlop_app/managers/cart_manager.dart';
import 'package:otlop_app/screens/details_screen/details_screen.dart';
import 'package:otlop_app/widgets/product_card.dart';

enum ProductFilterType { category, brand }

class ProductFilterScreen extends StatefulWidget {
  final ProductFilterType filterType;
  final String filterValue;

  const ProductFilterScreen({
    super.key,
    required this.filterType,
    required this.filterValue,
  });

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
  List items = [];
  bool isLoading = true;

  Future getProducts() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(
        'https://talabat639.runasp.net/api/Products',
      );
      items = response.data['data'];
    } catch (e) {
      log('Error: $e');
    }
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  List get filteredProducts {
    return items.where((item) {
      final value = widget.filterType == ProductFilterType.category
          ? item['category']
          : item['brand'];

      return value.toString().toLowerCase() ==
          widget.filterValue.toLowerCase();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.filterValue,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : filtered.isEmpty
          ? Center(
              child: Text(
                'No products found',
                style: TextStyle(color: Color(0xff9CA3AF), fontSize: 16),
              ),
            )
          : GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: filtered.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final product = filtered[index];

                return ProductCard(
                  image: product['pictureUrl'] ?? '',
                  category: product['category'] ?? '',
                  restaurant: product['brand'] ?? '',
                  name: product['name'] ?? '',
                  price: product['price'].toString(),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(product: product);
                        },
                      ),
                    );
                  },

                  onAdd: () {
                    CartManager.instance.addFromMap(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${product['name']} added'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}