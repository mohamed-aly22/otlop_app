import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String category;
  final String restaurant;
  final String name;
  final String price;
  final VoidCallback? onAdd;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.image,
    required this.category,
    required this.restaurant,
    required this.name,
    required this.price,
    this.onAdd,
    this.onTap,
  });

  factory ProductCard.fromjson(Map<String, dynamic> json) {
    return ProductCard(
      image: json['pictureUrl']??'',
      category: json['category']??'',
      restaurant: json['brand']??'',
      name: json['name']??'',
      price: json['price']??'',
    );
  }

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: SizedBox(
                      height: 164,
                      width: double.infinity,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                size: 35,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xCC292929),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.restaurant,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFFF4F3A),
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        widget.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF242424),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Text(
                            widget.price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 5),

                          const Text(
                            'EGP',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),

                          const Spacer(),

                          SizedBox(
                            width: 34,
                            height: 34,
                            child: IconButton(
                              onPressed: widget.onAdd,
                              padding: EdgeInsets.zero,
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFFF573F),
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.add, size: 24),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
