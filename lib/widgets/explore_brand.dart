import 'package:flutter/material.dart';

class ExploreBrand extends StatelessWidget {
  final String name;
  const ExploreBrand({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 80,
        child: Card(
          elevation: 0.1,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Center(
            child: ListTile(
              leading: Card(
                color: Color(0xffFFF5F3),
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Center(
                    child: Text(
                      name[0],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFF4D2D),
                      ),
                    ),
                  ),
                ),
              ),

              title: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: Color(0xffD1D5DB),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
