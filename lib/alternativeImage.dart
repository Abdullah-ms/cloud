import 'package:flutter/material.dart';

class ImageOrTextWidget extends StatelessWidget {
  final String imagePath;
  final String alternateText;

  const ImageOrTextWidget({super.key, required this.imagePath, required this.alternateText});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      errorBuilder: (context, error, stackTrace) {
        // If the image fails to load, display the alternate text as a replacement.
        return Text(alternateText);
      },
    );
  }
}
