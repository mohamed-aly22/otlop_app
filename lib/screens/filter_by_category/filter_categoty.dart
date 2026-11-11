import 'package:flutter/material.dart';
import 'package:otlop_app/widgets/product_card.dart';
import 'package:otlop_app/screens/details_screen/details_screen.dart';

class FilterScreen extends StatelessWidget {
  final List<dynamic> items;
  final String filterValue;
  final bool isCategory;

  const FilterScreen({
    super.key,
    required this.items,
    required this.filterValue,
    required this.isCategory,
  });

  @override
  Widget build(BuildContext context) {
    final filteredItems = items.where((item) {
      if (isCategory) {
        return item['category'].toString().toLowerCase() ==
            filterValue.toLowerCase();
      }

      return item['brand'].toString().toLowerCase() ==
          filterValue.toLowerCase();
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          filterValue,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: filteredItems.isEmpty
            ? Center(child: Text('No products found'))
            : GridView.builder(
                itemCount: filteredItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index) {
                  final product = filteredItems[index];

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
                  );
                },
              ),
      ),
    );
  }
}
