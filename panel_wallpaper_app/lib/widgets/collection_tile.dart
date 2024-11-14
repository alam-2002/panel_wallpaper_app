import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final int index;
  final double extent;
  const CollectionTile({
    super.key,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: extent,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 25,
            right: 25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=cool_1$index',
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 5,
                    spreadRadius: -6,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=cool_2$index',
              ),
            ),
          ),
          Positioned.fill(
            bottom: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 5,
                    spreadRadius: -6,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=cool_3$index',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 45,
            right: 5,
            child: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
