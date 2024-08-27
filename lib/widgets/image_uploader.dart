import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';

class ImageUpload extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider<Object>? backgroundImage;
  const ImageUpload(this.onPressed, {this.backgroundImage, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100, // Set the width of the square container
            height: 100, // Set the height of the square container
            decoration: BoxDecoration(
              color: CustomColors.primaryColor.withOpacity(0.3),
              image: backgroundImage != null
                  ? DecorationImage(
                      image: backgroundImage!,
                      fit: BoxFit.cover,
                    )
                  : null, // Use the background image if provided
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: backgroundImage == null
                ? const Icon(
                    Icons.file_copy_sharp,
                    size: 50,
                    color: Colors.white,
                  )
                : null, // If there's no image, show the default icon
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.primaryColor,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
