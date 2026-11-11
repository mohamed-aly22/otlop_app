
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String catImage;
  final String name;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.catImage,
    required this.name,
    this.onTap,
  });

  factory CategoryCard.fromjson(Map<String, dynamic> json) {
    return CategoryCard(
      catImage: json['pictureUrl'] ?? '',
      name: json['category'] ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 50,
                  width: 70,
                  child: Image.network(catImage, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
