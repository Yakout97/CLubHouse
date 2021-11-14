import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';

class userProfileImage extends StatelessWidget {
  final String imageURL;
  final double size;

  const userProfileImage({Key? key, required this.imageURL, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 10),
      child: Image.network(
        imageURL,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
