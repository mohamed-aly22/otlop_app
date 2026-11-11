import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreCategory extends StatelessWidget {
  final String image;
  final String name;
  final int color;
  const ExploreCategory({
    super.key,
    required this.image,
    required this.name,
    required this.color,
  });

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        elevation: 0,
        color: Color(color),
        child: Row(
          mainAxisAlignment: .start,
          children: [
            SizedBox(width: 20),
            SvgPicture.network(image, height: 30),
            SizedBox(width: 20),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
