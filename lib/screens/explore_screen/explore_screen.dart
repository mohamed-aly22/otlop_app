import 'package:flutter/material.dart';
import 'package:otlop_app/models/explore_brand.dart';
import 'package:otlop_app/models/explore_category.dart';
import 'package:otlop_app/screens/filter_screen/filter_screen.dart';
import 'package:otlop_app/widgets/Explore_brand.dart';
import 'package:otlop_app/widgets/explore_category.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  final List<ExploreCategoryModel> categoryList = [
    ExploreCategoryModel(
      image: 'assets/images/Frabbachino.svg',
      name: 'Frappuccino',
      color: 0xffFFF0F0,
    ),
    ExploreCategoryModel(
      image: 'assets/images/latte.svg',
      name: 'Latte',
      color: 0xffFFF9E6,
    ),
    ExploreCategoryModel(
      image: 'assets/images/chocolate.svg',
      name: 'Mocha',
      color: 0xffF3F4F6,
    ),
    ExploreCategoryModel(
      image: 'assets/images/machiato.svg',
      name: 'Macchiato',
      color: 0xffF5F3FF,
    ),
    ExploreCategoryModel(
      image: 'assets/images/Frabbachino.svg',
      name: 'Frabbachino',
      color: 0xffECFDF5,
    ),
    ExploreCategoryModel(
      image: 'assets/images/chocolate.svg',
      name: 'Mocha',
      color: 0xffF3F4F6,
    ),
    ExploreCategoryModel(
      image: 'assets/images/machiato.svg',
      name: 'Macchiato',
      color: 0xffF5F3FF,
    ),
    ExploreCategoryModel(
      image: 'assets/images/Frabbachino.svg',
      name: 'Frabbachino',
      color: 0xffECFDF5,
    ),
  ];

  final List<ExploreBrandModel> brandList = [
    ExploreBrandModel(name: 'Starbucks'),
    ExploreBrandModel(name: 'Costa'),
    ExploreBrandModel(name: 'Cilantro'),
    ExploreBrandModel(name: 'TBS'),
  ];

  void openCategory(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProductFilterScreen(
            filterType: ProductFilterType.category,
            filterValue: category,
          );
        },
      ),
    );
  }

  void openBrand(BuildContext context, String brand) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProductFilterScreen(
            filterType: ProductFilterType.brand,
            filterValue: brand,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(height: 5),
              Text(
                'Browse by category or brand',
                style: TextStyle(color: Color(0xff9CA3AF), fontSize: 15),
              ),
              SizedBox(height: 24),
              Text(
                'CATEGORIES',
                style: TextStyle(
                  color: Color(0xff9CA3AF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: categoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    final category = categoryList[index];

                    return GestureDetector(
                      onTap: () {
                        openCategory(context, category.name);
                      },
                      child: ExploreCategory(
                        image: category.image,
                        name: category.name,
                        color: category.color,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                'BRANDS',
                style: TextStyle(
                  color: Color(0xff9CA3AF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: brandList.length,
                  itemBuilder: (context, index) {
                    final brand = brandList[index];

                    return GestureDetector(
                      onTap: () {
                        openBrand(context, brand.name);
                      },
                      child: ExploreBrand(name: brand.name),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}