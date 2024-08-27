import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';

class Uploader extends StatelessWidget {
  final VoidCallback onPressed;
  final ImageProvider<Object>? backgroundImage;
  const Uploader(this.onPressed, {this.backgroundImage, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: CustomColors.primaryColor.withOpacity(0.3),
              backgroundImage:
                  backgroundImage, // Use the background image if provided
              child: backgroundImage == null
                  ? const Icon(
                      Icons.person,
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
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
