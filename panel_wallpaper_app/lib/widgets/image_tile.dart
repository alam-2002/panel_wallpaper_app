import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;

  const ImageTile({
    super.key,
    required this.imageSource,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showImageDetails(context, imageSource);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        height: extent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: imageSource,
              fit: BoxFit.cover,
            ),
            // Image.network(
            //   imageSource,
            //   fit: BoxFit.cover,
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Art $index',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImageDetails(BuildContext context, String imageSource) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      clipBehavior: Clip.antiAlias,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Column(
            children: [
              // image preview
              CachedNetworkImage(imageUrl: imageSource),
              // title
              Text(
                'Image Title',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Download Button
              MaterialButton(
                onPressed: () {},
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Get Wallpaper',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Author Details
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    // image
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        // thumbnail image
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            imageUrl: 'https://picsum.photos/50/50',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        // vertical badge
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.check),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),

                    // Name
                    Text(
                      'Samuel Elkins',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
